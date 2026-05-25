package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.ArmaEspecial;
import util.DatabaseConnection;

public class ArmaEspecialDAO {

    public List<ArmaEspecial> listarArmasEspeciales() {
        List<ArmaEspecial> listaArmaEspecial = new ArrayList<>();
        String sql = "SELECT a.IDArma, a.Nombre, a.TipoDano, a.DadoDano, a.Precio, a.Peso, a.Propiedades, a.NomPartida, "
                   + "ae.Rareza, ae.Bonificador, ae.EfectoMagico "
                   + "FROM Armas a "
                   + "INNER JOIN ArmasEspeciales ae ON a.IDArma = ae.IDArma";

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
        String sqlArmaBase = "INSERT INTO Armas (Nombre, TipoDano, DadoDano, Precio, Peso, Propiedades, NomPartida) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String sqlArmaMagica = "INSERT INTO ArmasEspeciales (IDArma, Rareza, Bonificador, EfectoMagico) VALUES (?, ?, ?, ?)";
        
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false); 
            
            try (PreparedStatement psBase = conn.prepareStatement(sqlArmaBase, Statement.RETURN_GENERATED_KEYS)) {
                psBase.setString(1, armaEspecial.getNombre());
                psBase.setString(2, armaEspecial.getTipoDano());
                psBase.setString(3, armaEspecial.getDado());
                psBase.setString(4, armaEspecial.getPrecio());
                psBase.setDouble(5, armaEspecial.getPeso());
                psBase.setString(6, armaEspecial.getPropiedades());
                psBase.setString(7, armaEspecial.getNomPartida());
                
                int filasBase = psBase.executeUpdate();
                if (filasBase == 0) {
                    conn.rollback();
                    return false;
                }
                
                int idGenerado = 0;
                try (ResultSet generatedKeys = psBase.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        idGenerado = generatedKeys.getInt(1);
                    } else {
                        conn.rollback();
                        return false;
                    }
                }
                
                try (PreparedStatement psMagica = conn.prepareStatement(sqlArmaMagica)) {
                    psMagica.setInt(1, idGenerado);
                    psMagica.setString(2, armaEspecial.getRareza());
                    psMagica.setInt(3, armaEspecial.getBonificador());
                    psMagica.setString(4, armaEspecial.getEfectoMagico());
                    
                    int filasMagicas = psMagica.executeUpdate();
                    if (filasMagicas > 0) {
                        conn.commit(); 
                        return true;
                    } else {
                        conn.rollback();
                        return false;
                    }
                }
            }
        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            System.err.println("Error SQL en ArmaEspecialDAO: " + e.getMessage());
            return false;
        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }

    public ArmaEspecial obtenerArmaEspecilPorID(int id) {
        ArmaEspecial armaEspecial = null;
        String sql = "SELECT a.IDArma, a.Nombre, a.TipoDano, a.DadoDano, a.Precio, a.Peso, a.Propiedades, a.NomPartida, "
                   + "ae.Rareza, ae.Bonificador, ae.EfectoMagico "
                   + "FROM Armas a "
                   + "INNER JOIN ArmasEspeciales ae ON a.IDArma = ae.IDArma "
                   + "WHERE a.IDArma = ?";
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
        String sqlBase = "UPDATE Armas SET Nombre = ?, TipoDano = ?, DadoDano = ?, Precio = ?, Peso = ?, Propiedades = ?, NomPartida = ? WHERE IDArma = ?";
        String sqlMagica = "UPDATE ArmasEspeciales SET Rareza = ?, Bonificador = ?, EfectoMagico = ? WHERE IDArma = ?";
        
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false);
            
            try (PreparedStatement psBase = conn.prepareStatement(sqlBase)) {
                psBase.setString(1, armaEspecial.getNombre());
                psBase.setString(2, armaEspecial.getTipoDano());
                psBase.setString(3, armaEspecial.getDado());
                psBase.setString(4, armaEspecial.getPrecio());
                psBase.setDouble(5, armaEspecial.getPeso());
                psBase.setString(6, armaEspecial.getPropiedades());
                psBase.setString(7, armaEspecial.getNomPartida());
                psBase.setInt(8, armaEspecial.getId());
                psBase.executeUpdate();
            }
            
            try (PreparedStatement psMagica = conn.prepareStatement(sqlMagica)) {
                psMagica.setString(1, armaEspecial.getRareza());
                psMagica.setInt(2, armaEspecial.getBonificador());
                psMagica.setString(3, armaEspecial.getEfectoMagico());
                psMagica.setInt(4, armaEspecial.getId());
                
                int filasMagicas = psMagica.executeUpdate();
                if (filasMagicas > 0) {
                    conn.commit();
                    return true;
                } else {
                    conn.rollback();
                    return false;
                }
            }
        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
    
    public boolean eliminarArmaEspecial(int id) {
    	
        String sql = "DELETE FROM Armas WHERE IDArma = ?";
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