package controllers;

import gui.CrearModuloGUI;
import gui.ModuloDetailsGUI;
import gui.ModulosGUI;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

/**
 * @author Fernanda, Pencho
 * @version 1.1, Last modification: 07-12-2017
 */

public class ModulosController implements Initializable, EventHandler  {
    
//    @FXML private ListView informacion;
//    @FXML private ScrollBar barra;
    @FXML private ListView profileList;
    @FXML private TableView informacionModulos;
    @FXML private Button closeButton;
    
    private ModulosGUI gui;

    @FXML
    private void createModuloAction(ActionEvent event) {
        CrearModuloGUI crearModulo = new CrearModuloGUI(gui);
        crearModulo.show();
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
    }

    
    
    public void setGUI(ModulosGUI gui) {
        this.gui = gui;
    }

    @Override
    public void handle(Event event) {
        if (event.getEventType() == MouseEvent.MOUSE_CLICKED){
            MouseEvent me = (MouseEvent) event;
            
            if (me.getClickCount() > 1){
                System.out.println("DOUBLE CLICK");
                loadModuloDetails();
            }
        }
    }

    private void loadModuloDetails() {
        ObservableList list = this.informacionModulos.getSelectionModel().getSelectedItems();
        
        if (list == null){
            return;
        } else if (list.get(0) == null)
            return;
        
        
        String nombreModulo = (String) ((ObservableList)list.get(0)).get(0);
        
        ModuloDetailsGUI details = new ModuloDetailsGUI();
        details.show();
        closeWindow(null);
    }
    
}
