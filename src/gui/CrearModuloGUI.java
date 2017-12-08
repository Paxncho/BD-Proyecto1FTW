package gui;

import controllers.CrearModuloController;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.stage.Stage;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Pencho
 * @version 1.1, Last modification: 07-12-2017
 */

public class CrearModuloGUI extends Stage{
    private ComboBox diasModulo;
    private ComboBox bloquesModulo;
    private ComboBox salasModulo;
    
    public CrearModuloGUI(ModulosGUI gui){
        try {
            //Get the fxml from the file.
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/VentanaEmergenteModulo.fxml"));
            
            //Load the fxml
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            this.diasModulo = (ComboBox) scene.lookup("#diasModulo");
            this.bloquesModulo = (ComboBox) scene.lookup("#bloquesModulo");
            this.salasModulo = (ComboBox) scene.lookup("#salasModulo");
            
            this.fillDias();
            this.fillBloques();
            this.fillSalas();
            
            super.setScene(scene);
            
            //Set the ModulosGUI to refresh the list after the adding
            ((CrearModuloController) fxml.getController()).setModulosGUI(gui);
        } catch (IOException ex) {
            Logger.getLogger(ModuloDetailsGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void fillDias() {
        ObservableList<String> data = FXCollections.observableArrayList();
        
        data.addAll("Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo");
        
        this.diasModulo.setItems(data);
        this.diasModulo.getSelectionModel().selectFirst();
    }

    private void fillBloques() {
        ObservableList<DataComboBox> data = FXCollections.observableArrayList();
        
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.BLOQUE);
            
            if (!result.isBeforeFirst()){
                data.add(new DataComboBox(-1, "No hay bloques disponibles."));
                this.bloquesModulo.setItems(data);
                this.bloquesModulo.getSelectionModel().selectFirst();
                return;
            }
            
            while(result.next()){
                int id = result.getInt("IdBloque");
                String descripcion = result.getInt("IdBloque") + ". " + result.getTime("HoraInicio") + " - " + result.getTime("HoraTermino");
                data.add(new DataComboBox(id, descripcion));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            data.clear();
            data.add(new DataComboBox(-2, "Error al leer los horarios de la base de datos."));
        } finally {
            this.bloquesModulo.setItems(data);
            this.bloquesModulo.getSelectionModel().selectFirst();
        }   
    }

    private void fillSalas() {
        ObservableList<DataComboBox> data = FXCollections.observableArrayList();
        
        try {
            //Query especifica para obtener la descripción de las salas
            String query = "select * from " + Tables.SALA.getDatabaseName() + " join " + Tables.TIPO_SALA.getDatabaseName() +
                    " on " + Tables.SALA.getDatabaseName() + "." + Tables.TIPO_SALA.getId() + " = " + Tables.TIPO_SALA.getDatabaseName() + "." + Tables.TIPO_SALA.getId() +
                    " order by " + Tables.SALA.getDatabaseName() + "." + Tables.TIPO_SALA.getId();
            
            System.out.println(query);
            
            ResultSet result = DatabaseConector.getInstance().executeQuery(query);
            
            if (!result.isBeforeFirst()){
                data.add(new DataComboBox(-1, "No hay salas disponibles."));
                this.salasModulo.setItems(data);
                this.salasModulo.getSelectionModel().selectFirst();
                return;
            }
            
            while(result.next()){
                int id = result.getInt(Tables.SALA.getId());
                String descripcion = result.getString("NombreSala") + ", Capacidad: " + result.getInt("Capacidad") + " - " + result.getString("Descripcion");
                data.add(new DataComboBox(id, descripcion));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            data.clear();
            data.add(new DataComboBox(-2, "Error al leer las salas de la base de datos."));
        } finally {
            this.salasModulo.setItems(data);
            this.salasModulo.getSelectionModel().selectFirst();
        }
    }
    
    public class DataComboBox{
        private final int id;
        private final String descripcion;

        public DataComboBox(int id, String descripcion) {
            this.id = id;
            this.descripcion = descripcion;
        }

        public int getId() {
            return id;
        }

        public String getDescripcion() {
            return descripcion;
        }
        
        @Override
        public String toString(){
            return descripcion;
        }
    }
}
