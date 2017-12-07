package controllers;

import gui.CrearModuloGUI;
import gui.ModulosGUI;
import java.net.URL;
import java.sql.ResultSet;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Pencho
 * @version 1.1, Last modification: 07-12-2017
 */

//TODO
//REVISAR LA TABLA DE HORARIO Y DIA

public class CrearModuloController implements Initializable {

    @FXML private TextField nombreModulo;
    @FXML private TextField semestreModulo;
    @FXML private ComboBox horariosModulo;
    @FXML private ComboBox bloquesModulo;
    @FXML private ComboBox salasModulo;
    
    private ModulosGUI modulosGui;
    
    @FXML private void addModulo(ActionEvent event){
        
        //Mostrar los errores en pantalla
        switch (checkData()){
            case -1: //Nombre vacio
                return;
            case -2: //Semestre no numero
                return;
            case -3: //Horario No Valido
                return;
            case -4: //Bloque no Valido
                return;
            case -5: //Sala no Valida
                return;
        }
        
        String nombre = nombreModulo.getText();
        int semestre = Integer.parseInt(semestreModulo.getText());
        
        int horarioId = ((CrearModuloGUI.DataComboBox) horariosModulo.getSelectionModel().getSelectedItem()).getId();
        int bloquesId = ((CrearModuloGUI.DataComboBox) bloquesModulo.getSelectionModel().getSelectedItem()).getId();
        int salasId = ((CrearModuloGUI.DataComboBox) salasModulo.getSelectionModel().getSelectedItem()).getId();
        
        int idModulo;
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.MODULO);
            result.last();
            idModulo = result.getRow();
        } catch (Exception e) {
            idModulo = 0;
        }
        
        int idProfesor;
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.PROFESOR, "RutProfesor = " + DatabaseConector.rutConnected);
            if (result.isBeforeFirst()){
                result.next();
                idProfesor = result.getInt(Tables.PROFESOR.getId());
            } else {
                idProfesor = 0;
            }
        } catch (Exception e){
            idProfesor = 0;
        }
        
        int idHorario;
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.HORARIO);
            result.last();
            idHorario = result.getRow();
        } catch (Exception e){
            idHorario = 0;
        }
        
        //Actualizando la base de datos.
        String moduloValues = idModulo + ", \"" + nombre + "\", " + semestre;
        DatabaseConector.getInstance().putInTable(Tables.MODULO, moduloValues);
        
        String horarioValues = idHorario + ", " + salasId + ", " + idModulo + ", NULL, DIA";
        DatabaseConector.getInstance().putInTable(Tables.HORARIO, horarioValues);
        
        String profesorACargoValues = idProfesor + ", " + idModulo;
        DatabaseConector.getInstance().putInTable(Tables.PROFESOR_A_CARGO, profesorACargoValues);
        
        String horarioBloqueValues = idHorario + ", " + bloquesId;
        DatabaseConector.getInstance().putInTable(Tables.HORARIO_BLOQUE, horarioBloqueValues);
        
        modulosGui.fillList();
        this.close(event);
    }
    
    private int checkData(){
        String nombre = nombreModulo.getText();
        if (nombre.length() < 1)
            return -1;
        
        String semestre = semestreModulo.getText();       
        if (!semestre.matches("[0-9]+") || semestre.length() < 1)
            return -2;
        
        int id = ((CrearModuloGUI.DataComboBox) horariosModulo.getSelectionModel().getSelectedItem()).getId();
        if (id < 0)
            return -3;
        
        id = ((CrearModuloGUI.DataComboBox) bloquesModulo.getSelectionModel().getSelectedItem()).getId();
        if (id < 0)
            return -4;
        
        id = ((CrearModuloGUI.DataComboBox) salasModulo.getSelectionModel().getSelectedItem()).getId();
        if (id < 0)
            return -5;
    
        return 0;
    }
    
    @FXML private void close(ActionEvent event){       
        Stage stage = (Stage) this.nombreModulo.getScene().getWindow();
        stage.close();
    }
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // TODO
    }

    public void setModulosGUI(ModulosGUI gui) {
        this.modulosGui = gui;
    }

}
