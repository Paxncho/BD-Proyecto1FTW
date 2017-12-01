package gui.console;

import java.sql.ResultSet;
import java.util.Scanner;
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
        this.logIn();
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
            }
            
        }while (option != 0);
    }
    
    public void printAlumnos(){
        ResultSet result = this.db.executeQuery("select * from alumno");
        
        try {
            System.out.println("Id  | Nombre   | Apellido      | Matricula   | Correo");
            
            while(result.next()){
                System.out.println(result.getInt("IdAlumno") + " | " + result.getString("NombreAlumno") + " | " + result.getString("ApellidoAlumno") + " | " + result.getInt("MatriculaAlumno") + " | " + result.getString("CorreoAlumno"));
            }
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
        String update = "Insert into alumno(IdAlumno, NombreAlumno, ApellidoAlumno, MatriculaAlumno, CorreoAlumno) values (" + values + ")";
        
        if (this.db.executeUpdate(update))
            System.out.println("Alumno Ingresado Correctamente");
        else
            System.out.println("Error ingresando el Alumno");
    }
}
