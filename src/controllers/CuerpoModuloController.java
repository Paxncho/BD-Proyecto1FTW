package controllers;

import java.net.URL;
import java.sql.ResultSet;
import java.util.ResourceBundle;
import java.util.Scanner;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TableView;
import javafx.stage.Stage;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Fernanda, Pencho
 * @version 1.1, Last modification: 04-12-2017
 */

public class CuerpoModuloController implements Initializable  {
    
//    @FXML private ListView informacion;
//    @FXML private ScrollBar barra;
    @FXML private ListView profileList;
    @FXML private TableView informacionModulos;
    @FXML private Button closeButton;
    

    @FXML
    private void createModuloAction(ActionEvent event) {
        //For now, do it by console
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Ingrese el Nombre del modulo: ");
        String nombre = scanner.nextLine();
        System.out.print("Ingrese el semestre al que corresponde: ");
        int semestre = Integer.parseInt(scanner.nextLine());
        
        int idModulo;
        
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.MODULO);
            result.last();
            idModulo = result.getRow();
        } catch (Exception e){
            idModulo = 0;
        }
        
        int idProfesor;
        
        try {
            ResultSet result = DatabaseConector.getInstance().getTable(Tables.PROFESOR, "RutProfesor = " + DatabaseConector.rutConnected);
            
            if (result.isBeforeFirst()){
                result.next();
                idProfesor = result.getInt("IdProfesor");
            }
        } catch (Exception e){
            idProfesor = 0;
        }
        
        String values = idModulo + ", " + semestre + ", \"" + nombre + "\"";
        
        if (DatabaseConector.getInstance().putInTable(Tables.MODULO, values)){
            System.out.println("Modulo creado correctamente");
            refreshList(event);
        } else {
            System.out.println("Error al crear el modulo");
        }
    }
    
    @FXML
    private void closeWindow(ActionEvent event){
        Stage stage = (Stage) this.closeButton.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void refreshList(ActionEvent event){
        this.informacionModulos.refresh();
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }
    
}
