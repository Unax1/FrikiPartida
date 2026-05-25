package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Arma;
import model.ArmaEspecial;
import util.DatabaseConnection;

public class ArmaEspecialDAO {

    public List<ArmaEspecial> listarArmasEspeciales() {
        List<ArmaEspecial> listaArmaEspecial = new ArrayList<>();
        String sql = "SELECT a.IDArma, a.Nombre, a.TipoDano, a.DadoDano, a.Precio, a.Peso, a.Propiedades, a.NomPartida, "
        		+ "ae.Rareza, ae.Bonificador, ae.EfectoMagico FROM Armas a"
        		+ "INNER JOIN ArmasEspeciales ae ON a.IDArma = ae.IDArma;";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
        	while (rs.next()) {
        	    ArmaEspecial ae = new ArmaEspecial();
        	    
        	    ae.setId(rs.getInt("IDArma"));
        	    ae.setNombre(rs.getString("Nombre"));
        	    ae.setTipoDano(rs.getString("TipoDano"));
        	    ae.setDado(rs.getString("DadoDano")); 
        	    ae.setPrecio(rs.getString("Precio"));
        	    ae.setPeso(rs.getDouble("Peso"));
        	    ae.setPropiedades(rs.getString("Propiedades"));
        	    ae.setNomPartida(rs.getString("NomPartida"));
        	    
        	    
        	    ae.setRareza(rs.getString("Rareza"));
        	    ae.setBonificador(rs.getInt("Bonificador"));
        	    ae.setEfectoMagico(rs.getString("EfectoMagico"));
        	    
        	    listaArmaEspecial.add(ae);
        	}
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaArmaEspecial;
    }
 
    public boolean insertarArmaEspecial(ArmaEspecial armaEspecial) {
        String sql = "INSERT INTO ArmasEspeciales (a.Nombre, a.TipoDano, a.DadoDano, a.Precio, a.Peso, a.Propiedades, a.NomPartida"
    		+ "ae.Rareza, ae.Bonificador, ae.EfectoMagico FROM Armas a "
    		+ "INNER JOIN ArmasEspeciales ae ON a.IDArma = ae.IDArma;) "
    		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, armaEspecial.getNombre());
            ps.setString(2, armaEspecial.getTipoDano());
            ps.setString(3, armaEspecial.getDado());
            ps.setString(4, armaEspecial.getPrecio());
            ps.setDouble(5, armaEspecial.getPeso());
            ps.setString(6, armaEspecial.getPropiedades());
            ps.setString(7, armaEspecial.getNomPartida());
            ps.setString(8, armaEspecial.getRareza());
            ps.setInt(9, armaEspecial.getBonificador());
            ps.setString(10, armaEspecial.getEfectoMagico());
            
            int filas = ps.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            System.err.println("Error SQL en ArmaDAO: " + e.getMessage());
            return false;
        }
    }

    public ArmaEspecial obtenerArmaEspecilPorID(int id) {
        ArmaEspecial armaEspecial = null;
        String sql = "INSERT INTO ArmasEspeciales (a.Nombre, a.TipoDano, a.DadoDano, a.Precio, a.Peso, a.Propiedades, a.NomPartida"
        		+ "ae.Rareza, ae.Bonificador, ae.EfectoMagico FROM Armas a"
        		+ "INNER JOIN ArmasEspeciales ae ON a.IDArma = ae.IDArma;)  WHERE IDArma = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    armaEspecial = new ArmaEspecial(
                        rs.getInt("IDArma"), 
                        rs.getString("Nombre"), 
                        rs.getString("TipoDano"),
                        rs.getString("DadoDano"), 
                        rs.getString("Precio"), 
                        rs.getDouble("Peso"),
                        rs.getString("Propiedades"),
                        rs.getString("NomPartida"),
                        rs.getString("Rareza"),
                        rs.getInt("Bonificador"),
                        rs.getString("EfectoMagico")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return armaEspecial;
    }

    public boolean actualizarArmaEspecial(ArmaEspecial armaEspecial) {
        String sql = "UPDATE ArmasEspeciales SET (a.Nombre, a.TipoDano, a.DadoDano, a.Precio, a.Peso, a.Propiedades, a.NomPartida"
        		+ "ae.Rareza, ae.Bonificador, ae.EfectoMagico FROM Armas a"
        		+ "INNER JOIN ArmasEspeciales ae ON a.IDArma = ae.IDArma;)  WHERE IDArma = ?";
        
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, armaEspecial.getNombre());
            ps.setString(2, armaEspecial.getTipoDano());
            ps.setString(3, armaEspecial.getDado());
            ps.setString(4, armaEspecial.getPrecio());
            ps.setDouble(5, armaEspecial.getPeso());
            ps.setString(6, armaEspecial.getPropiedades());
            ps.setString(7, armaEspecial.getNomPartida());
            ps.setInt(8, armaEspecial.getId());
            ps.setString(8, armaEspecial.getRareza());
            ps.setInt(9, armaEspecial.getBonificador());
            ps.setString(10, armaEspecial.getEfectoMagico());
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean eliminarArmaEspecial(int id) {
        String sql = "DELETE FROM ArmasEspeciales WHERE IDArma = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
