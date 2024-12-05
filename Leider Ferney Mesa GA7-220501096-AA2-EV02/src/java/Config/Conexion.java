package Config;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Conexion {
   Connection con;
    String bd = "cerberusjs";
    String url = "jdbc:mysql://localhost:3306/" + bd + "?useUnicode=true&use"
            + "JDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&"
            + "serverTimezone=UTC";
    String usuario = "root";
    String pwd = "";
    String driver = "com.mysql.cj.jdbc.Driver";
    
    public Conexion(){
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(url, usuario, pwd);
            System.out.println("Conexión exitosa a la base de datos " + bd);
            
        }catch(ClassNotFoundException | SQLException ex){
            System.out.println("No se pudo Conectar a la base de datos " + bd);
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);                       
        }// Fin constructor conexion
        //return con;
    }
    
    public Connection getConnection(){
        return con;
    }
    
    public static void main(String[]args){
        Conexion conexion = new Conexion();
        conexion.getConnection();
    }

    public PreparedStatement prepareStatement(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }
}
