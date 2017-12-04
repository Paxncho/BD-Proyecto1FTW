import gui.MainLoginGUI;
import gui.console.MySystem;
import javafx.application.Application;
import javafx.stage.Stage;


/**
 * @author Pencho
 * @version 1.0, Last modification: 04-12-2017
 */

public class Main extends Application {
    
    public static void main(String[] args) {
//        MySystem system = new MySystem();
//        system.Main();
        
        launch(args);
    }
    
    @Override
    public void start(Stage originalStage) throws Exception {
//        MainGUI stage = new MainGUI();
        MainLoginGUI stage = new MainLoginGUI();
        stage.show();
    }
}