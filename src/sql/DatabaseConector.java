package sql;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Pencho
 * @version 1.1, Last modification: 04-12-2017
 */

public class DatabaseConector {

    //Atributos relativos al usuario loggeado.
    public static int rutConnected;
    public static int typeConnected;
    
    //Atributos y metodos para el puente entre la base de datos y la app.
    private static DatabaseConector instance;
    private static DatabaseConector setInstance(){
        try {
            Scanner sc = new Scanner(new File("Database Connection.txt"));
            String dbName = sc.nextLine();
            String user = sc.nextLine();
            String pass = sc.nextLine();
            
            return new DatabaseConector(dbName, user, pass);
        } catch (FileNotFoundException ex) {
            System.out.println("Archivo de conexión no encontrado, pasando a conexión manual:");
            Scanner scanner = new Scanner(System.in);
            System.out.print("Database Name: ");
            String dbName = scanner.nextLine();
            System.out.print("User: ");
            String user = scanner.nextLine();
            System.out.print("Password: ");
            String pass = scanner.nextLine();
            
            return new DatabaseConector(dbName, user, pass);
        }
    }
    public static DatabaseConector getInstance(){
        if (instance == null)
            instance = setInstance();
        
        return instance;
    }
    
    //Atributos de la conexión a la base de datos
    private static String localpath = "jdbc:mysql://localhost:3306/";
    private static String parameters = "?autoReconnect=true&useSSL=false";
    
    private Connection conexion;
    private Statement statement;
    
    public DatabaseConector(String databaseName){
        this(databaseName, "root", "admin");
    }
    
    public DatabaseConector(String databaseName, String user, String pass){
        try{
            conexion = java.sql.DriverManager.getConnection(localpath + databaseName + parameters, user, pass);
            statement = conexion.createStatement();
            
            System.out.println("Connection Successful!");
        } catch (SQLException ex){
            System.out.println("SQL - Error with the connection\n" + (localpath + databaseName + parameters + "|" + user + "|" +pass));
            ex.printStackTrace();
        }
    }
    
    public ResultSet executeQuery(String query){
        try {
            return statement.executeQuery(query);
        } catch (SQLException ex) {
            System.out.println("SQL - Error with the Query");
            return null;
        }
    }
    
    public boolean executeUpdate(String update){
        try {
            statement.executeUpdate(update);
            return true;
        } catch (SQLException ex){
            return false;
        }
    }
    
    public ResultSet getTable(Tables table){
        return executeQuery("select * from " + table.getDatabaseName());
    }
    
    public ResultSet getTable(Tables table, String conditions) {
        return executeQuery("select * from " + table.getDatabaseName() + " where " + conditions);
    }
    
    public boolean putInTable(Tables table, String values){
        return executeUpdate("Insert into " + table.getDatabaseName() + "(" + table.getDatabaseParameters() + ") values (" + values + ")");
    }
    
    public void close(){
        if (conexion != null){
            try {
                conexion.close();
            } catch (SQLException ex) {
            }
        }
    }
}
