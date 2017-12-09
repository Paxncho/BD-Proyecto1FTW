package gui;
import controllers.ModuloDetailsController;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.stage.Stage;
import javafx.util.Callback;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Fernanda, Pencho
 * @version 1.1, Last modification: 04-12-2017
 */

public class ModuloDetailsGUI extends Stage{
    
    private int idModulo;
    private TableView ayudantias;
    private TableView horarios;
    private TableView evaluaciones;
    private TableView alumnos;
    
    public ModuloDetailsGUI (int id){
        this.idModulo = id;
        
        try {
            //Get the fxml from the file.
            FXMLLoader fxml = new FXMLLoader(getClass().getResource("/resources/VentanaModuloDetalles.fxml"));

            //Load the fxml
            Parent root = fxml.load();
            Scene scene = new Scene(root, 600, 400);
            
            //Assign the tables to the variables
            this.ayudantias = (TableView) scene.lookup("#ayudantiasTable");
            this.horarios = (TableView) scene.lookup("#horariosTable");
            this.evaluaciones = (TableView) scene.lookup("#evaluacionesTable");
            this.alumnos = (TableView) scene.lookup("#alumnosTable");
            
            //Prepare the Tables to put the info in them
            this.initializeColumns(this.ayudantias);
            this.initializeColumns(this.horarios);
            this.initializeColumns(this.evaluaciones);
            this.initializeColumns(this.alumnos);
            
            //Then fill them
            this.fillAyudantias();
            this.fillHorarios();
            this.fillEvaluaciones();
            this.fillAlumnos();
            
            super.setScene(scene);
            
            ((ModuloDetailsController) fxml.getController()).setGUI(this);
        } catch (IOException ex) {
            Logger.getLogger(ModuloDetailsGUI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void initializeColumns(TableView table){
        for (int i = 0; i < table.getColumns().size(); i++){
            final int j = i;

            ((TableColumn) table.getColumns().get(i)).setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ObservableList,String>,ObservableValue<String>>(){
                    public ObservableValue<String> call(TableColumn.CellDataFeatures<ObservableList, String> param) {
                        return new SimpleStringProperty(param.getValue().get(j).toString()); 
                    }             
                });
        }
    }
    
    public void fillAyudantias(){
        ObservableList<ObservableList> data = FXCollections.observableArrayList();
        
        try {
            String query = "select * from " + Tables.MODULO.getDatabaseName() + " mo join (" +
                    "select s.NombreSeccion, a." + Tables.MODULO.getId() + " from " +
                    Tables.AYUDANTIA.getDatabaseName() + " a join " + Tables.SECCION.getDatabaseName() + " s on a." +
                    Tables.AYUDANTIA.getId() + " = s." + Tables.AYUDANTIA.getId() + ") as sa on mo." +
                    Tables.MODULO.getId() + " = sa." + Tables.MODULO.getId() + " where mo." +
                    Tables.MODULO.getId() + " = " + this.idModulo;
            
            ResultSet result = DatabaseConector.getInstance().executeQuery(query);
            
            if (!result.isBeforeFirst())
                return;
            
            while (result.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                
                row.add(result.getString("NombreModulo"));
                row.add(result.getString("NombreSeccion"));
                
                data.add(row);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            this.ayudantias.setItems(data);
        }
    }
    
    public void fillHorarios(){
        ObservableList<ObservableList> data = FXCollections.observableArrayList();
        
        try {
            String query = "Select * from " + Tables.HORARIO.getDatabaseName() + " ho join (" +
                    "select h." + Tables.HORARIO.getId() + ", b.HoraInicio, b.HoraTermino from " +
                    Tables.HORARIO_BLOQUE.getDatabaseName() + " h join " + Tables.BLOQUE.getDatabaseName() + " b on h." + Tables.BLOQUE.getId() + " = b." + Tables.BLOQUE.getId() +
                    ") as hb on ho." + Tables.HORARIO.getId() + " = hb." + Tables.HORARIO.getId() + " where ho." + Tables.MODULO.getId() + " = " + idModulo;
                        
            ResultSet result = DatabaseConector.getInstance().executeQuery(query);
            
            if (!result.isBeforeFirst())
                return;
            
            while (result.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                
                String horarioData = result.getString("Dia") + " " + result.getTime("HoraInicio") + " - " + result.getTime("HoraTermino");
                row.add(horarioData);
                data.add(row);
            }
        } catch (Exception e){
            
        } finally {
            this.horarios.setItems(data);
        }
    }
       
    public void fillEvaluaciones(){
        ObservableList<ObservableList> data = FXCollections.observableArrayList();
        
        try {
            
            String query = "select * from " + Tables.EVALUACION.getDatabaseName() + " where " +
                    Tables.MODULO.getId() + " = " + idModulo + " order by FechaEvaluacion";
            
            ResultSet result = DatabaseConector.getInstance().executeQuery(query);
            
            if (!result.isBeforeFirst())
                return;
                        
            while (result.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                
                String fecha = result.getDate("FechaEvaluacion").toString();
                String contenido = result.getString("Contenido");
                String idEvaluacion = Integer.toString(result.getInt(Tables.EVALUACION.getId()));
                
                row.addAll(fecha, contenido, idEvaluacion);
                data.add(row);
            }
            
            try {
                for (int i = 0; i < data.size(); i++){
                    ObservableList<String> row = data.get(i);
                    
                    query = "Select avg(nota) as promedio from " + Tables.CALIFICACION.getDatabaseName() +
                            " where " + Tables.EVALUACION.getId() + " = " + row.get(2);
                    
                    System.out.println(query);
                    
                    ResultSet promedios = DatabaseConector.getInstance().executeQuery(query);
                    row.remove(2);
                    
                    if (promedios != null){
                        if (!promedios.isBeforeFirst())
                            row.add("No hay notas");
                        else {
                            promedios.next();
                            
                            float promedio = promedios.getFloat("promedio");
                            
                            if (promedio != 0)
                                row.add(Float.toString(promedio));
                            else
                                row.add("No hay notas");
                        }
                    } else {
                        row.add("No hay notas");
                    }
                }
            } catch (Exception e){
                
            }
        } catch (Exception e){
            
        } finally {
            this.evaluaciones.setItems(data);
        }        
    }
    
    public void fillAlumnos(){
        ObservableList<ObservableList> data = FXCollections.observableArrayList();
        
        try {
            String query = "select * from " + Tables.ASISTENCIA_A_CLASES.getDatabaseName() + " c join " + Tables.ALUMNO.getDatabaseName() + " a on c." +
                    Tables.ALUMNO.getId() + " = a." + Tables.ALUMNO.getId() + " order by a.ApellidoAlumno";
                        
            ResultSet result = DatabaseConector.getInstance().executeQuery(query);
            
            if (!result.isBeforeFirst())
                return;
            
            int i = 1;
            
            while (result.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                
                String alumno = result.getInt("MatriculaAlumno") + " - " + result.getString("NombreAlumno") + " " + result.getString("ApellidoAlumno");
                
                row.addAll(Integer.toString(i), alumno);
                data.add(row);
                i++;
            }
        } catch (Exception e){
            
        } finally {
            this.alumnos.setItems(data);
        }
    }
    
    public int getIdModulo(){
        return this.idModulo;
    }
}
