package sql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Pencho
 * @version 1.0, Last modification: 17-11-2017
 */

public class DatabaseConector {

    private static String localpath = "jdbc:mysql://localhost/";
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
        } catch (SQLException ex){
            
        }
    }
    
    public ResultSet executeQuery(String query){
        try {
            return statement.executeQuery(query);
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void executeUpdate(String update){
        try {
            statement.executeUpdate(update);
        } catch (SQLException ex){
            
        }
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
