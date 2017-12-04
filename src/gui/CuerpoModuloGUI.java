package gui;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import javafx.stage.Stage;
import javafx.util.Callback;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Fernanda, Pencho
 * @version 1.1, Last modification: 04-12-2017
 */

public class CuerpoModuloGUI extends Stage {
    
    private ObservableList<ObservableList> data;
    private TableView informacionModulos;
    
    public CuerpoModuloGUI(){
        try {
            //Get the fxml from the file.
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/VentanaCuerpoModulo.fxml"));
            
            //Load the fxml
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            this.informacionModulos = (TableView) scene.lookup("#informacionModulos");
            this.fillList();
            
            
            super.setScene(scene);
        } catch (IOException ex) {
            Logger.getLogger(CuerpoModuloGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void fillList(){
        this.data = FXCollections.observableArrayList();
        
        try {
            String query = "select m.NombreModulo, pe.NombreProfesor from "
                    + Tables.MODULO.getDatabaseName() + " m inner join ("
                    + "select p.NombreProfesor, e.IdModulo from "
                    + Tables.PROFESOR.getDatabaseName() + " p inner join " + Tables.EVALUACIONES.getDatabaseName() + " e "
                    + "on p.IdProfesor = e.IdProfesor) as pe "
                    + "on m.IdModulo = pe.IdModulo";
                        
            ResultSet result = DatabaseConector.getInstance().executeQuery(query);

            if (!result.isBeforeFirst()){
                System.out.println("No hay modulos");
                return;
            }
            
            //Recreate Columns
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
            
            while(result.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                
//                row.addAll(result.getString("NombreModulo"), result.getString("NombreProfesor"));
                row.add(result.getString("NombreModulo"));
                row.add(result.getString("NombreProfesor"));
                
                System.out.println(row);
                
                this.data.add(row);
            }
            
            this.informacionModulos.setItems(this.data);
            System.out.println(informacionModulos.getItems());
        } catch (Exception e){
            System.out.println("Error while reading the database data.");
            e.printStackTrace();
        }
    }
    
}
