
package gui;

import controllers.MainController;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 * @author Pencho
 * @version 1.1, Last modification: 04-12-2017
 */

public class MainGUI extends Stage {
    
    public MainGUI(){
        try {
            //Get the fxml from the file.
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/main.fxml"));
            
            //Instance the controller and set to the fxml
            MainController controller = new MainController();
            fxml.setController(controller);
            
            //Load the fxml
            Parent root = fxml.load();
            Scene scene = new Scene(root, 300, 275);
            
            super.setScene(scene);
        } catch (IOException ex) {
            Logger.getLogger(MainGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
