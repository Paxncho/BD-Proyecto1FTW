/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import gui.CrearAyudantiaGUI;
import gui.CrearEvaluacionGUI;
import gui.ModuloDetailsGUI;
import gui.ModulosGUI;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableView;
import javafx.scene.control.TreeTableView;
import javafx.stage.Stage;

/**
 * @author Fernanda, Pencho
 * @version 1.1, Last modification: 08-12-2017
 */

public class ModuloDetailsController implements Initializable {

    private ModuloDetailsGUI gui;
    
    @FXML private TableView horario;
    @FXML private TableView evaluacion;
    @FXML private TableView alumno;
    @FXML private TableView modulo;
    
    
    @FXML private void crearAyudantia(){
        CrearAyudantiaGUI crearAyudantia = new CrearAyudantiaGUI(gui);
        crearAyudantia.show();
    }
    
    @FXML private void crearTutoria(){
        
    }
    
    @FXML private void crearEvaluacion(){
        CrearEvaluacionGUI crearEvaluacion = new CrearEvaluacionGUI(gui);
        crearEvaluacion.show();
    }
    
    @FXML private void back(){
        ModulosGUI modulos = new ModulosGUI();
        modulos.show();

        Stage stage = (Stage) horario.getScene().getWindow();
        stage.close();
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    public void setGUI(ModuloDetailsGUI gui){
        this.gui = gui;
    }
}
