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
                listaArmaEspecial.add(ae);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaArmaEspecial;
    }

    public boolean insertarArma(Arma arma) {
        String sql = "INSERT INTO Armas (Nombre, TipoDano, DadoDano, Precio, Peso, Propiedades, NomPartida) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, arma.getNombre());
            ps.setString(2, arma.getTipoDano());
            ps.setString(3, arma.getDado());
            ps.setString(4, arma.getPrecio());
            ps.setDouble(5, arma.getPeso());
            ps.setString(6, arma.getPropiedades());
            ps.setString(7, arma.getNomPartida());
            
            int filas = ps.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            System.err.println("Error SQL en ArmaDAO: " + e.getMessage());
            return false;
        }
    }

    public Arma obtenerArmaPorID(int id) {
        Arma arma = null;
        String sql = "SELECT IDArma, Nombre, TipoDano, DadoDano, Precio, Peso, Propiedades, NomPartida FROM Armas WHERE IDArma = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    arma = new Arma(
                        rs.getInt("IDArma"), 
                        rs.getString("Nombre"), 
                        rs.getString("TipoDano"),
                        rs.getString("DadoDano"), 
                        rs.getString("Precio"), 
                        rs.getDouble("Peso"),
                        rs.getString("Propiedades"),
                        rs.getString("NomPartida")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arma;
    }

    public boolean actualizarArma(Arma arma) {
        String sql = "UPDATE Armas SET Nombre = ?, TipoDano = ?, DadoDano = ?, Precio = ?, Peso = ?, Propiedades = ?, NomPartida = ? WHERE IDArma = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, arma.getNombre());
            ps.setString(2, arma.getTipoDano());
            ps.setString(3, arma.getDado());
            ps.setString(4, arma.getPrecio());
            ps.setDouble(5, arma.getPeso());
            ps.setString(6, arma.getPropiedades());
            ps.setString(7, arma.getNomPartida());
            ps.setInt(8, arma.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean eliminarArma(int id) {
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
