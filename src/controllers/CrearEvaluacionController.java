package controllers;

import gui.DataComboBox;
import gui.ModuloDetailsGUI;
import java.net.URL;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Pencho
 * @version 1.1, Last modification: 08-12-2017
 */

public class CrearEvaluacionController implements Initializable {

    private ModuloDetailsGUI detailsGui;
    
    @FXML private Label errorLabel;
    @FXML private DatePicker fechaEvaluacion;
    @FXML private ComboBox tipoEvaluacion;
    @FXML private TextArea contenidoEvaluacion;
    
    @FXML private void crearEvaluacion(ActionEvent event){
        errorLabel.setVisible(false);
        
        //Checkear si todo está en orden
        switch(checkData()){
            case -2: //Carga erronea de tipo de evaluaciones
                errorLabel.setText("Error al cargar el tipo de evaluaciones.\n  La Evaluación no pudo ser creada");
                errorLabel.setVisible(true);
                return;
        }
        
        LocalDate fecha = fechaEvaluacion.getValue();
        int idTipoEvaluacion = ((DataComboBox) tipoEvaluacion.getSelectionModel().getSelectedItem()).getId();
        int idModulo = detailsGui.getIdModulo();
        String contenido = contenidoEvaluacion.getText();
        
        //Conseguir los ids
        int idEvaluacion;
        try{
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.EVALUACION);
            result.last();
            idEvaluacion = result.getRow();
        } catch (Exception e) {
            idEvaluacion = 0;
        }
        
        //Actualizar la base de datos
        String evaluacionValues = idEvaluacion + ", " + idTipoEvaluacion + ", " + idModulo + ", \"" + fecha + "\", \"" + contenido + "\"";
        DatabaseConector.getInstance().putInTable(Tables.EVALUACION, evaluacionValues);
        
        detailsGui.fillEvaluaciones();
        this.close(event);
    }
    
    private int checkData(){
        int id = ((DataComboBox) tipoEvaluacion.getSelectionModel().getSelectedItem()).getId();
        if (id < 0)
            return -2;
        
        return 0;
    }
    
    @FXML private void close(ActionEvent event){
        Stage stage = (Stage) this.tipoEvaluacion.getScene().getWindow();
        stage.close();
    }
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        errorLabel.setVisible(false);
    }

    public void setGUI(ModuloDetailsGUI gui) {
        this.detailsGui = gui;
    }

    
}
