package controllers;

import gui.ModulosGUI;
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
    @FXML private Label nombreErroneo;
    @FXML private Label passErroneo;
    @FXML private Button button;
    
    
    @FXML
    private void loginAction(ActionEvent event) {
        nombreErroneo.setVisible(false);
        passErroneo.setVisible(false);
        
        switch(CheckUser()){
            case -2: //Error al conectar con la BD
                nombreErroneo.setVisible(true);
                nombreErroneo.setText("Error al conectar con la Base de Datos, checkee 'conexion.txt'\ny revise que los datos sean correctos.");
                break;
            case -1: //Pass Incorrecta
                passErroneo.setVisible(true);
                break;
            case 0: //Usuario no encontrado
                nombreErroneo.setVisible(true);
                nombreErroneo.setText("El nombre ingresado no es el correcto. Por favor intente nuevamente.");
                break;
            case 1: //Conexión concreatada
                ModulosGUI modulos = new ModulosGUI();
                modulos.show();

                Stage stage = (Stage) button.getScene().getWindow();
                stage.close();
                break;
        }
    }
        
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        nombreErroneo.setVisible(false);
        passErroneo.setVisible(false);
    }
    
    private int CheckUser(){
        String user = userField.getText();
        String pass = passwordField.getText();

        try {
            ResultSet users = DatabaseConector.getInstance().getTable(Tables.USUARIO, "RutUsuario = " + user);
            if (!users.isBeforeFirst())
                return 0;
            
            users.next();
            
            if (users.getString("Password").equals(pass)){
                DatabaseConector.rutConnected = Integer.parseInt(userField.getText());
                DatabaseConector.typeConnected = users.getInt("IdTipoUsuario");
                return 1;
            } else {
                return -1;
            }
        } catch (Exception e){
            return -2;
        }
    }
}
