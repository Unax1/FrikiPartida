package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Arma;
import util.DatabaseConnection;

public class ArmaDAO {

    public List<Arma> listarArmas() {
        List<Arma> listaArma = new ArrayList<>();
        String sql = "SELECT IDArma, Nombre, TipoDano, DadoDano, Precio, Peso, Propiedades, NomPartida FROM Armas";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Arma a = new Arma();
                a.setId(rs.getInt("IDArma"));
                a.setNombre(rs.getString("Nombre"));
                a.setTipoDano(rs.getString("TipoDano"));
                a.setDado(rs.getString("DadoDano")); 
                a.setPrecio(rs.getString("Precio"));
                a.setPeso(rs.getDouble("Peso"));
                a.setPropiedades(rs.getString("Propiedades"));
                a.setNomPartida(rs.getString("NomPartida"));
                listaArma.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaArma;
    }

    // CORREGIDO: Cambiado de 'int' a 'boolean' para que el servlet valide correctamente con el IF
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
            return filas > 0; // Si guardó al menos 1 fila, devuelve true. Si no, false.
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