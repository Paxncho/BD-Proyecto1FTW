package controllers;

import gui.CuerpoModuloGUI;
import java.net.URL;
import java.sql.ResultSet;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Fernanda, Pencho
 * @version 1.1, Last modification: 04-12-2017
 */

public class MainLoginController implements Initializable  {
    
    @FXML private TextField userField;
    @FXML private PasswordField passwordField;
    @FXML private Label label;
    @FXML private Button button;
    
    
    @FXML
    private void loginAction(ActionEvent event) {
        if (!CheckUser()){
            label.setVisible(true);
            label.setText("Error al ingresar los datos, intente nuevamente.");
        } else {
            System.out.println("LOGIN");
                        
            CuerpoModuloGUI cuerpoModulo = new CuerpoModuloGUI();
            cuerpoModulo.show();
            
            Stage stage = (Stage) button.getScene().getWindow();
            stage.close();
        }
    }
        
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        label.setVisible(false);
    }
    
    private boolean CheckUser(){
        String user = userField.getText();
        String pass = passwordField.getText();
        
        ResultSet users = DatabaseConector.getInstance().getTable(Tables.USUARIO, "RutUsuario = " + user);
        
        try {
            if (!users.isBeforeFirst())
                return false;
            
            users.next();
            
            if (users.getString("Password").equals(pass)){
                DatabaseConector.rutConnected = Integer.parseInt(userField.getText());
                DatabaseConector.typeConnected = users.getInt("IdTipoUsuario");
                return true;
            } else {
                return false;
            }
        } catch (Exception e){
            return false;
        }
    }
}
