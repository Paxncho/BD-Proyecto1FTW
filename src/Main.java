import javafx.application.Application;
import javafx.stage.Stage;

import gui.MainGUI;
import gui.console.MySystem;

/**
 * @author Pencho
 * @version 1.0, Last modification: 30-11-2017
 */

public class Main extends Application {

    public static void main(String[] args) {
        MySystem system = new MySystem();
        system.Main();
        
//        launch(args);
    }
    
    @Override
    public void start(Stage originalStage) throws Exception {
        MainGUI stage = new MainGUI();
        stage.show();
    }
}