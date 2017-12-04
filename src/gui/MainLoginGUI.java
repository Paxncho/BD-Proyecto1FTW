package gui;

import controllers.MainLoginController ;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 * @author Fernanda
 * @version 1.1, Last modification: 04-12-2017
 */

public class MainLoginGUI extends Stage{
    public MainLoginGUI (){
        try {
            //Get the fxml from the file.
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/menu.fxml"));
            
            //Instance the controller and set to the fxml
//            MainLoginController controllerLogin = new MainLoginController();
//            fxml.setController(controllerLogin);
            
            //Load the fxml
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            super.setScene(scene);
        } catch (IOException ex) {
            Logger.getLogger(MainLoginGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
