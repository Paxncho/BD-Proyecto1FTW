package gui.console;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import sql.DatabaseConector;
import sql.Tables;

/**
 * @author Pencho
 * @version 1.0, Last modification: 03-12-2017
 */

public class MySystem {

    private Scanner scanner;
    private DatabaseConector db;
    
    public MySystem(){
        this.scanner = new Scanner(System.in);
        this.fileLogIn();
    }
    
    private void fileLogIn(){
        try {
            Scanner sc = new Scanner(new File("Database Connection.txt"));
            String dbName = sc.nextLine();
            String user = sc.nextLine();
            String pass = sc.nextLine();
            
            this.db = new DatabaseConector(dbName, user, pass);
        } catch (FileNotFoundException ex) {
            System.out.println("Archivo de conexión no encontrado, pasando a conexión manual:");
            logIn();
        }
    }
    
    private void logIn(){
        System.out.print("Database Name: ");
        String dbName = this.scanner.nextLine();
        System.out.print("User: ");
        String user = this.scanner.nextLine();
        System.out.print("Password: ");
        String pass = this.scanner.nextLine();
        
        this.db = new DatabaseConector(dbName, user, pass);
    }
    
    public void Main(){
        int option;
        
        do{
            Menu.MainMenu();
            option = Integer.parseInt(this.scanner.nextLine());
            
            switch(option){
                case 1: printAlumnos(); break;
                case 2: insertAlumno(); break;
                case 3: createModulo(); break;
                case 4: printModulos(); break;
                case 5: printAlumnosFromModulo(); break;
                case 6: asignarAlumnoAModulo(); break;
                case 7: crearEvaluacion(); break;
            }
            
        }while (option != 0);
        
        this.db.close();
    }
    
    public void printAlumnos(){
        ResultSet result = this.db.getTable(Tables.ALUMNO);
        
        try {
            printAlumnosWithTitle(result, true);
        } catch (Exception e){
            System.out.println("An error has ocurred while reading the database");
        }   
    }
    
    public void insertAlumno(){
        System.out.print("Ingrese el Id del Alumno: ");
        int id = Integer.parseInt(this.scanner.nextLine());
        System.out.print("Ingrese el Nombre del Alumno: ");
        String nombre = this.scanner.nextLine();
        System.out.print("Ingrese el Apellido: ");
        String apellido = this.scanner.nextLine();
        System.out.print("Ingrese la Matricula: ");
        int matricula = Integer.parseInt(this.scanner.nextLine());
        System.out.print("Ingrese el mail: ");
        String mail = this.scanner.nextLine();
        
        this.insertAlumno(id, nombre, apellido, matricula, mail);
    }
    
    public void insertAlumno(int id, String nombre, String apellido, int matricula, String mail){
        String values = id + ", \"" + nombre + "\", \"" + apellido + "\", " + matricula + ", \"" + mail + "\"";        
        
        if (this.db.putInTable(Tables.ALUMNO, values))
            System.out.println("Alumno Ingresado Correctamente");
        else
            System.out.println("Error ingresando el Alumno");
    }
    
    public void createModulo(){
        System.out.print("Ingrese el Id del modulo: ");
        int id = Integer.parseInt(this.scanner.nextLine());
        System.out.print("Ingrese el Nombre del modulo: ");
        String nombre = this.scanner.nextLine();
        System.out.print("Ingrese el semestre al que corresponde: ");
        int semestre = Integer.parseInt(this.scanner.nextLine());
        
        this.insertModulo(id, semestre, nombre);
    }
    
    public void insertModulo(int id, int semestre, String nombre){
        String values = id + ", " + semestre + ", \"" + nombre + "\"";
        
        if (this.db.putInTable(Tables.MODULO, values))
            System.out.println("Modulo creado correctamente");
        else
            System.out.println("Error creando el modulo");
    }
    
    public void printModulos(){
        ResultSet result = this.db.getTable(Tables.MODULO);
        
        System.out.println("MODULOS\n");
                
        try {
            while (result.next()){
                System.out.println("Id: " + result.getInt("IdModulo"));
                System.out.println("Nombre del modulo: " + result.getString("NombreModulo"));
                System.out.println("Semestre: " + result.getInt("SEMESTRE") + "\n");
            }
            
            System.out.println("~~~~~~~~~~~~~~~");
            
        } catch (Exception e){
            System.out.println("Error al mostrar los modulos");
        }
    }
    
    public void printEvaluaciones(){
        printModulos();
        System.out.println("Ingrese el id del modulo al cuál ver las evaluaciones");
        int idModulo = Integer.parseInt(this.scanner.nextLine());
        
        ResultSet result = this.db.getTable(Tables.EVALUACION, "IdModulo = " + idModulo);
        
        try {
            if (!result.isBeforeFirst())
                System.out.println("No existen evaluaciones en ese modulo");
            
            else {
                
            }
            
            
            
        } catch (Exception e){
            System.out.println("Error al leer las evaluaciones de ese modulo");
        }
    }
    
    public void printAlumnosFromModulo(){
        printModulos();
        System.out.print("Ingrese el id del modulo a checkear: ");
        int idModulo = Integer.parseInt(this.scanner.nextLine());
        
        String query = "select * from " + Tables.ALUMNO.getDatabaseName() + " a join ( "
                + "select IdAlumno from " + Tables.EVALUACION.getDatabaseName() + " e join "
                + Tables.CALIFICACION.getDatabaseName() + "c on e.IdEvaluacion = c.IdEvaluacion "
                + "where IdModulo = " + idModulo + ") as t "
                + "on a.IdAlumno = t.IdAlumno ";
        
        ResultSet result = this.db.executeQuery(query);
        
        if (result == null){
            System.out.println("No existen alumnos en ese modulo");
            return;
        }
        
        try {
            printAlumnosWithTitle(result, true);
        } catch (Exception e) {
            System.out.println("Error al imprimir los alumnos de ese modulo");
        }
    }
        
    public void crearEvaluacion(){
        printModulos();
        System.out.print("Ingrese el Id del Modulo: ");
        int idModulo = Integer.parseInt(this.scanner.nextLine());
        
        //printTipoEvaluaciones();
        System.out.print("Ingrese el Id de las Evaluaciones: ");
        int idTipoEvaluacion = Integer.parseInt(this.scanner.nextLine());
               
        System.out.print("Ingrese el Contenido: ");
        String content = this.scanner.nextLine();
        
        try {
            
            ResultSet evaluaciones = this.db.getTable(Tables.EVALUACION);
            evaluaciones.last();
            int idEvaluacion = evaluaciones.getRow();
            
            String values = idEvaluacion + ", " + idTipoEvaluacion + ", 0, " + idModulo + ", now(), \"" + content + "\"";
            this.db.putInTable(Tables.EVALUACION, values);
            
            System.out.println("Evaluación creada.");
            
        } catch (Exception e){
            System.out.println("Error al tratar de crear la evaluación");
        }
    }

    public void asignarAlumnoAModulo(){
        
        printModulos();
        System.out.print("Ingrese el Id del Modulo: ");
        int idModulo = Integer.parseInt(this.scanner.nextLine());
        
        printAlumnos();
        System.out.print("Ingrese el Id del Alumno");
        int idAlumno = Integer.parseInt(this.scanner.nextLine());
        
        try {
            ResultSet tipoEvaluacion = this.db.getTable(Tables.TIPO_EVALUACION, "IdTipoevaluacion = 0");
            
            if (!tipoEvaluacion.isBeforeFirst()){ //TipoEvaluacion = No Rows
                String values = "0, \"Asistencia\", NULL";
                this.db.putInTable(Tables.TIPO_EVALUACION, values);
            }
            
            ResultSet profesor = this.db.getTable(Tables.PROFESOR, "IdProfesor = 0");
            
            if (!profesor.isBeforeFirst()){
                String values = "0, \"Admin\", NULL, NULL";
                this.db.putInTable(Tables.PROFESOR, values);
            }
            
            ResultSet evaluaciones = this.db.getTable(Tables.EVALUACION);
            evaluaciones.last();
            int idEvaluacion = evaluaciones.getRow();
            
            String values = idEvaluacion + ", 0, " + "0" + ", " + idModulo + ", NULL, NULL";
            this.db.putInTable(Tables.EVALUACION, values);
            
            values = idEvaluacion + ", " + idAlumno + ", 0";            
            this.db.putInTable(Tables.CALIFICACION, values);
        } catch (Exception e){

        }
    }
    
    private void printAlumnosWithTitle(ResultSet result, boolean printId) throws SQLException {
        if (!result.isBeforeFirst()){
            System.out.println("No hay alumnos inscritos.");
            System.out.println("~~~~~~~~~~~~~~~");
            return;
        }
        
        System.out.println("ALUMNOS\n");

        printAlumnos(result, printId);
            
        System.out.println("~~~~~~~~~~~~~~~");
    }
    
    private void printAlumnos(ResultSet result, boolean printId) throws SQLException{
        if (!result.isBeforeFirst()){
            System.out.println("No hay alumnos inscritos.");
            return;
        }
        
        while(result.next()){
            if (printId)
                System.out.println("Id del Alumno: " + result.getInt("IdAlumno"));

            System.out.println("Nombre: " + result.getString("NombreAlumno"));
            System.out.println("Apellido: " + result.getString("ApellidoAlumno"));
            System.out.println("Matricula: " + result.getInt("MatriculaAlumno"));
            System.out.println("Correo: " + result.getString("CorreoAlumno") + "\n");
        }
    }
    
    private void printEvaluacionWithTitle(ResultSet result, boolean printId) throws SQLException {
        if (!result.isBeforeFirst()){
            System.out.println("No existen evaluaciones.");
            System.out.println("~~~~~~~~~~~~~~~");
            return;
        }
        
        System.out.println("EVALUACIONES\n");
            
        printEvaluacion(result, printId);

        System.out.println("~~~~~~~~~~~~~~~");
    }

    private void printEvaluacion(ResultSet result, boolean printId) throws SQLException {
        if (!result.isBeforeFirst()){
            System.out.println("No existen evaluaciones.");
            return;
        }
        
        while(result.next()){
            if (printId)
                System.out.println("Id Evaluacion: " + result.getInt("IdEvaluacion"));
            
            System.out.println("Id Tipo Evaluacion: " + result.getString("NombreAlumno"));
            System.out.println("Apellido: " + result.getString("ApellidoAlumno"));
            System.out.println("Matricula: " + result.getInt("MatriculaAlumno"));
            System.out.println("Correo: " + result.getString("CorreoAlumno") + "\n");
        }
    }
}
