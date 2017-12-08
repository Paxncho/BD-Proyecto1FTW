package gui;

import controllers.CrearEvaluacionController;
import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.stage.Stage;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Pencho
 * @version 1.1, Last modification: 08-12-2017
 */

public class CrearEvaluacionGUI extends Stage {
    
    private ComboBox tipoEvaluacion;
    private DatePicker fechaEvaluacion;
    
    public CrearEvaluacionGUI (ModuloDetailsGUI gui){
        try {
            //Buscar el FXML
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/VentanaEmergenteEvaluacion.fxml"));
            
            //Cargarlo
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            this.tipoEvaluacion = (ComboBox) scene.lookup("#tipoEvaluacion");
            this.fechaEvaluacion = (DatePicker) scene.lookup("#fechaEvaluacion");
            
            this.fillTipoEvaluacion();
            this.fechaEvaluacion.setValue(LocalDate.now());
            
            super.setScene(scene);
            
            //Settear el gui para refrescar la gui
            ((CrearEvaluacionController) fxml.getController()).setGUI(gui);
            
        } catch (IOException ex) {
            Logger.getLogger(CrearAyudantiaGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void fillTipoEvaluacion() {
        ObservableList<DataComboBox> data = FXCollections.observableArrayList();
        
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.TIPO_EVALUACION);

            
            if (!result.isBeforeFirst()){
                data.add(new DataComboBox(-1, "No hay Tipos de Evaluaciones disponibles."));
                this.tipoEvaluacion.setItems(data);
                this.tipoEvaluacion.getSelectionModel().selectFirst();
                return;
            }
            
            while(result.next()){
                int id = result.getInt(Tables.TIPO_EVALUACION.getId());
                String descripcion = result.getString("Descripcion");
                data.add(new DataComboBox(id, descripcion));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            data.clear();
            data.add(new DataComboBox(-2, "Error al leer los tipos de evaluaciones de la base de datos."));
        } finally {
            this.tipoEvaluacion.setItems(data);
            this.tipoEvaluacion.getSelectionModel().selectFirst();
        }   
    }
}
