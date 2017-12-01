package gui.console;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import sql.DatabaseConector;

/**
 * @author Pencho
 * @version 1.0, Last modification: 30-11-2017
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
            }
            
        }while (option != 0);
        
        this.db.close();
    }
    
    public void printAlumnos(){
        ResultSet result = this.db.getTable("alumno");
        
        try {
            printAlumnos(result);            
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
        String parameters = "IdAlumno, NombreAlumno, ApellidoAlumno, MatriculaAlumno, CorreoAlumno";
        String table = "alumno";
        
        if (this.db.putInTable(table, parameters, values))
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
        String parameters = "IdModulo, SEMESTRE, NombreModulo";
        String table = "modulo";
        
        if (this.db.putInTable(table, parameters, values))
            System.out.println("Modulo creado correctamente");
        else
            System.out.println("Error creando el modulo");
    }
    
    public void printModulos(){
        ResultSet result = this.db.getTable("modulo");
        
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
    
    public void printAlumnosFromModulo(){
        printModulos();
        System.out.print("Ingrese el id del modulo a checkear: ");
        int idModulo = Integer.parseInt(this.scanner.nextLine());
        
        String query = "select * from alumno a join ( "
                + "select IdAlumno from evaluaciones e join "
                + "calificacion c on e.IdEvaluacion = c.IdEvaluacion "
                + "where IdModulo = " + idModulo + ") as t "
                + "on a.IdAlumno = t.IdAlumno ";
        
        ResultSet result = this.db.executeQuery(query);
        
        if (result == null){
            System.out.println("No existen alumnos en ese modulo");
            return;
        }
        
        try {
            printAlumnos(result);
        } catch (Exception e) {
            System.out.println("Error al imprimir los alumnos de ese modulo");
        }
    }

    public void asignarAlumnoAModulo(){
        
    }
    
    private void printAlumnos(ResultSet result) throws SQLException {
        System.out.println("ALUMNOS\n");
            
            while(result.next()){
                System.out.println("Id del Alumno: " + result.getInt("IdAlumno"));
                System.out.println("Nombre: " + result.getString("NombreAlumno"));
                System.out.println("Apellido: " + result.getString("ApellidoAlumno"));
                System.out.println("Matricula: " + result.getInt("MatriculaAlumno"));
                System.out.println("Correo: " + result.getString("CorreoAlumno") + "\n");
            }
            
            System.out.println("~~~~~~~~~~~~~~~");
    }
}
