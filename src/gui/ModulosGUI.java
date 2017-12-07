package gui;
import controllers.ModulosController;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventTarget;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.input.PickResult;
import javafx.stage.Stage;
import javafx.util.Callback;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Fernanda, Pencho
 * @version 1.1, Last modification: 04-12-2017
 */

public class ModulosGUI extends Stage {
    
    private ObservableList<ObservableList> data;
    private ObservableList<String> profileData;
    private TableView informacionModulos;
    private ListView profileList;
    
    public ModulosGUI(){
        try {
            //Get the fxml from the file.
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/VentanaModulos.fxml"));
                       
            //Load the fxml
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            this.informacionModulos = (TableView) scene.lookup("#informacionModulos");
            this.profileList = (ListView) scene.lookup("#profileList");
            this.fillList();
            this.fillProfileData();
            
            super.setScene(scene);
            
            //Set the GUI reference.
            ((ModulosController) fxml.getController()).setGUI(this);
            this.informacionModulos.addEventHandler(MouseEvent.MOUSE_CLICKED, (ModulosController) fxml.getController());
        } catch (IOException ex) {
            Logger.getLogger(ModulosGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public final void fillList(){
        this.data = FXCollections.observableArrayList();
        
        try {
            //Query especifica para obtener todos los datos en una sola tabla.
            String query = "select m.NombreModulo, pa.NombreProfesor, pa.ApellidoProfesor from "
                    + Tables.MODULO.getDatabaseName() + " m inner join ("
                    + "select p.NombreProfesor, p.ApellidoProfesor, a.IdModulo from "
                    + Tables.PROFESOR.getDatabaseName() + " p inner join " + Tables.PROFESOR_A_CARGO.getDatabaseName() + " a "
                    + "on p.RutProfesor = a.RutProfesor) as pa "
                    + "on m.IdModulo = pa.IdModulo";
                        
            ResultSet result = DatabaseConector.getInstance().executeQuery(query);
            
            //Recrear Columnas
            this.informacionModulos.getColumns().clear();
            TableColumn colM = new TableColumn("Modulo");
                colM.setCellValueFactory(new Callback<CellDataFeatures<ObservableList,String>,ObservableValue<String>>(){
                    public ObservableValue<String> call(CellDataFeatures<ObservableList, String> param) {                                                                               
                        return new SimpleStringProperty(param.getValue().get(0).toString()); 
                    }                    
                });
                
            TableColumn colP = new TableColumn("Profesor-Asistente");
                colP.setCellValueFactory(new Callback<CellDataFeatures<ObservableList,String>,ObservableValue<String>>(){
                    public ObservableValue<String> call(CellDataFeatures<ObservableList, String> param) {                                                                               
                        return new SimpleStringProperty(param.getValue().get(1).toString());
                    }                    
                });
            this.informacionModulos.getColumns().addAll(colM, colP);
            
            //Si no hay datos, cancelar el relleno de la tabla
            if (!result.isBeforeFirst()){
                return;
            }
            
            //Añadir iterativamente todos los modulos
            while(result.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                
                row.add(result.getString("NombreModulo"));
                row.add(result.getString("NombreProfesor") + " " + result.getString("ApellidoProfesor"));
                
                System.out.println(row);
                
                this.data.add(row);
            }
            
            //Settear la lista al TableView
            this.informacionModulos.setItems(this.data);
        } catch (Exception e){
            System.out.println("Error while reading the database data.");
            e.printStackTrace();
        }
    }
    
    private void fillProfileData(){
        this.profileData = FXCollections.observableArrayList();
        
        try {
            ResultSet profile;
            String sufijo;
            
            switch(DatabaseConector.typeConnected){
                case 0: //Profesor
                    profile = DatabaseConector.getInstance().getTable(Tables.PROFESOR, "RutProfesor = " + DatabaseConector.rutConnected);
                    sufijo = "Profesor";
                    break; 
                case 1: //Ayudante
                    profile = DatabaseConector.getInstance().getTable(Tables.AYUDANTE, "RutAyudante = " + DatabaseConector.rutConnected);
                    sufijo = "Ayudante";
                    break;
                case 2: //Tutor
                    profile = DatabaseConector.getInstance().getTable(Tables.TUTOR, "RutTutor = " + DatabaseConector.rutConnected);
                    sufijo = "Tutor";
                    break;
                default:
                    return;
            }

            //Está vacio?
            if (!profile.isBeforeFirst()){
                return;
            }
            
            profile.next();
            String title = sufijo;
            String nombre = profile.getString("Nombre" + sufijo);
            String apellido = profile.getString("Apellido" + sufijo);
            String correo = profile.getString("Correo" + sufijo);
            
            this.profileData = FXCollections.observableArrayList(title, nombre, apellido, correo);
            this.profileList.setItems(this.profileData);
        } catch (Exception e) {
        
        }
        
    }    
}
