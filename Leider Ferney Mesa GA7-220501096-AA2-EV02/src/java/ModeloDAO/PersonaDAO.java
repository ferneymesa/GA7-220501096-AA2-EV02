package ModeloDAO;

import Config.Conexion;
import Modelo.Persona;
import Interfaces.CRUD;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;

public class PersonaDAO implements CRUD {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Persona p = new Persona();

    @Override
    public List listar() {
        ArrayList<Persona> list = new ArrayList<>();
        String sql = "select * from persona";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Persona per = new Persona();
                per.setId(rs.getInt("Id"));
                per.setDni(rs.getString("DNI"));
                per.setNom(rs.getString("Nombres"));
                per.setTelefono(rs.getString("Telefono"));
                per.setEmail(rs.getString("Email"));
                per.setAreaTrabajo(rs.getString("AreaTrabajo"));
                per.setFotoUsua(rs.getString("FotoUsuario"));
                list.add(per);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar: " + e);
        }
        return list;
    }

    @Override
    public boolean add(Persona per) {
        String sql = "insert into persona(DNI,Nombres,Telefono,Email,AreaTrabajo,FotoUsuario) values('"
                + per.getDni() + "','" + per.getNom() + "','"+ per.getTelefono() + "','" + per.getEmail() + "','" + per.getAreaTrabajo() + "','" + per.getFotoUsua() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Agregar(PersonaDAO): " + e);
        }
        return false;
    }

    @Override
    public Persona list(int id) {
        String sql = "select * from persona where Id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                p.setId(rs.getInt("Id"));
                p.setDni(rs.getString("DNI"));
                p.setNom(rs.getString("Nombres"));
                p.setTelefono(rs.getString("Telefono"));
                p.setEmail(rs.getString("Email"));
                p.setAreaTrabajo(rs.getString("AreaTrabajo"));
                p.setFotoUsua(rs.getString("FotoUsuario"));

                System.out.println("Modificando Persona: " + p.getNom());
            }
        } catch (SQLException e) {
            System.out.println("Error al listar (PesonaDAO) en metodo List: " + e);
        }
        return p;
    }

    @Override
    public boolean eliminar(int id) {
       String sql = "delete from persona where Id=" + id;
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();            
        }catch(SQLException e){
            System.out.println("Error al Eliminar (productoDAO): " + e);            
        }     
        return false;    
    }

    @Override
    public boolean edit(Persona per) {
        String sql = "update persona set DNI='" + per.getDni()
                + "', Nombres='" + per.getNom() +  "', Telefono='" + per.getTelefono() + "', Email='" + per.getEmail() + "', AreaTrabajo='" + per.getAreaTrabajo() + "', FotoUsuario='" + per.getFotoUsua() + "' where Id=" + per.getId();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Actualizar (edit) (productoDAO): " + e);
        }
        return false;
    }

    @Override
public Persona buscarPorDni(String dni) {
    String sql = "SELECT * FROM persona WHERE DNI = ?";
    Persona persona = null;
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, dni);
        rs = ps.executeQuery();

        if (rs.next()) {
            persona = new Persona();
            persona.setId(rs.getInt("Id"));
            persona.setDni(rs.getString("DNI"));
            persona.setNom(rs.getString("Nombres"));
            persona.setTelefono(rs.getString("Telefono"));
            persona.setEmail(rs.getString("Email"));
            persona.setAreaTrabajo(rs.getString("AreaTrabajo"));
            persona.setFotoUsua(rs.getString("FotoUsuario"));
        }
    } catch (SQLException e) {
        System.out.println("Error al buscar por DNI: " + e);
    }
    return persona;
}

}