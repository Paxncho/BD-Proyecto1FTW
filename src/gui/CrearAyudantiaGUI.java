package gui;

import controllers.CrearAyudantiaController;
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
 * @version 1.1, Last modification: 08-12-2017
 */

public class CrearAyudantiaGUI extends Stage{
    private ComboBox horariosAyudantia;
    private ComboBox diasAyudantia;
    private ComboBox salasAyudantia;
    
    
    public CrearAyudantiaGUI (ModuloDetailsGUI gui){
        try {
            //Buscar el FXML
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/VentanaEmergenteAyudantia.fxml"));
            
            //Cargarlo
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            this.horariosAyudantia = (ComboBox) scene.lookup("#horariosAyudantia");
            this.diasAyudantia = (ComboBox) scene.lookup("#diasAyudantia");
            this.salasAyudantia = (ComboBox) scene.lookup("#salasAyudantia");
            
            this.fillHorarios();
            this.fillDias();
            this.fillSalas();
            
            super.setScene(scene);
            
            //Settear el gui para refrescar la gui
            ((CrearAyudantiaController) fxml.getController()).setGUI(gui);
            
        } catch (IOException ex) {
            Logger.getLogger(CrearAyudantiaGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void fillHorarios() {
        ObservableList<DataComboBox> data = FXCollections.observableArrayList();
        
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.BLOQUE);
            
            if (!result.isBeforeFirst()){
                data.add(new DataComboBox(-1, "No hay bloques disponibles."));
                this.horariosAyudantia.setItems(data);
                this.horariosAyudantia.getSelectionModel().selectFirst();
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
            this.horariosAyudantia.setItems(data);
            this.horariosAyudantia.getSelectionModel().selectFirst();
        }   
    }

    private void fillDias() {
        ObservableList<String> data = FXCollections.observableArrayList();
        
        data.addAll("Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo");
        
        this.diasAyudantia.setItems(data);
        this.diasAyudantia.getSelectionModel().selectFirst();
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
                this.salasAyudantia.setItems(data);
                this.salasAyudantia.getSelectionModel().selectFirst();
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
            this.salasAyudantia.setItems(data);
            this.salasAyudantia.getSelectionModel().selectFirst();
        }
    }

}
