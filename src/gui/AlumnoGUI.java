/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;
import controllers.AlumnoController  ;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


import javafx.stage.Stage;
/**
 *
 * @author Fernanda
 */
public class AlumnoGUI extends Stage{
    
    public AlumnoGUI(){
          try {
            //Get the fxml from the file.
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/VentanaAlumno.fxml"));
            
            //Instance the controller and set to the fxml
            AlumnoController  controllerAlumno = new AlumnoController ();
            fxml.setController(controllerAlumno);
            
            //Load the fxml
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            super.setScene(scene);
        } catch (IOException ex) {
            Logger.getLogger(AlumnoGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
