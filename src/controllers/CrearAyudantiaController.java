package controllers;

import gui.DataComboBox;
import gui.ModuloDetailsGUI;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Pencho
 * @version 1.1, Last modification: 08-12-2017
 */

public class CrearAyudantiaController implements Initializable {

    private ModuloDetailsGUI detailsGui;
    
    @FXML private Label errorLabel;
    @FXML private TextField nombreAyudantia;
    @FXML private TextField rutAyudante;
    @FXML private ComboBox horariosAyudantia;
    @FXML private ComboBox diasAyudantia;
    @FXML private ComboBox salasAyudantia;
    
    @FXML private void crearAyudantia(ActionEvent event){
        errorLabel.setVisible(false);
        
        //Revisar si no hay errores
        switch(checkData()){
            case -1: //Nombre vacio
                errorLabel.setText("El nombre de la ayudantia no puede ser vacio.");
                errorLabel.setVisible(true);
                return;
            case -2: //Rut No numero
                errorLabel.setText("El Rut debe ser un número");
                errorLabel.setVisible(true);
                return;
            case -3: //Rut no encontrado
                errorLabel.setText("El rut ingresado no ha sido encontrado");
                errorLabel.setVisible(true);
                return;
            case -4: //Error con los horarios
                errorLabel.setText("Error al leer el horario. No se puede crear la ayudantia.");
                errorLabel.setVisible(true);
                return;
            case -5: //Error con las salas
                errorLabel.setText("Error al leer las salas. No se puede crear la ayudantia.");
                errorLabel.setVisible(true);
                return;
        }
        
        String nombre = nombreAyudantia.getText();
        int rut = Integer.parseInt(this.rutAyudante.getText());
        
        String dia = (String) diasAyudantia.getSelectionModel().getSelectedItem();
        int idBloque = ((DataComboBox) horariosAyudantia.getSelectionModel().getSelectedItem()).getId();
        int idSala = ((DataComboBox) salasAyudantia.getSelectionModel().getSelectedItem()).getId();
        
        //Pedir los Id
        int idModulo = detailsGui.getIdModulo();
        
        int idSeccion;
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.SECCION);
            result.last();
            idSeccion = result.getRow();
        } catch (Exception e){
            idSeccion = 0;
        }
        
        int idAyudantia;
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.AYUDANTIA);
            result.last();
            idAyudantia = result.getRow();
        } catch (Exception e){
            idAyudantia = 0;
        }
        
        int idHorario;
        try{
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.HORARIO);
            result.last();
            idHorario = result.getRow();
        } catch (Exception e){
            idHorario = 0;
        }
        
        //Actualizar base de datos
        String ayudantiaValues = idAyudantia + ", " + idModulo;
        DatabaseConector.getInstance().putInTable(Tables.AYUDANTIA, ayudantiaValues);
        
        String ayudanteACargoValues = idAyudantia + ", " + rut;
        DatabaseConector.getInstance().putInTable(Tables.AYUDANTE_A_CARGO, ayudanteACargoValues);
        
        String seccionValues = idSeccion + ", " + idAyudantia + ", \"" + nombre + "\"";
        DatabaseConector.getInstance().putInTable(Tables.SECCION, seccionValues);
        
        String horarioValues = idHorario + ", " + idSala + ", " + idModulo + ", " + idSeccion + ", \"" + dia + "\"";
        DatabaseConector.getInstance().putInTable(Tables.HORARIO, horarioValues);
        
        String horarioBloqueValues = idHorario + ", " + idBloque;
        DatabaseConector.getInstance().putInTable(Tables.HORARIO_BLOQUE, horarioBloqueValues);
        
        detailsGui.fillAyudantias();
        this.close(event);
    }
    
    private int checkData(){
        
        String nombre = nombreAyudantia.getText();
        if (nombre.length() < 1)
            return -1;

        String rut = rutAyudante.getText();
        if (!rut.matches("[0-9]+") || rut.length() < 1)
            return -2;

        int rutInt = Integer.parseInt(rut);
        try {    
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.AYUDANTE, Tables.AYUDANTE.getId() + " = " + rutInt);
            if (!result.isBeforeFirst()){
                return -3;
            }            
        } catch (SQLException ex) {
            Logger.getLogger(CrearAyudantiaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        int id = ((DataComboBox) horariosAyudantia.getSelectionModel().getSelectedItem()).getId();
        if (id < 0)
            return -4;
        
        id = ((DataComboBox) salasAyudantia.getSelectionModel().getSelectedItem()).getId();
        if (id < 0)
            return -5;
        
        return 0;
    }
    
    @FXML private void close(ActionEvent event){
        Stage stage = (Stage) this.nombreAyudantia.getScene().getWindow();
        stage.close();
    }
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        errorLabel.setVisible(false);
    }
    
    public void setGUI(ModuloDetailsGUI gui){
        this.detailsGui = gui;
    }
    
}
