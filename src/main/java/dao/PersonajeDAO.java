package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Personaje;
import util.DatabaseConnection;

public class PersonajeDAO {

    public List<Personaje> listarPersonajes() {
        List<Personaje> listaPersonaje = new ArrayList<>();
        String sql = "SELECT IDPersonaje, NomPersonaje, NomJugador, Nivel, NomPartida FROM Personaje";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Personaje p = new Personaje();
                p.setId(rs.getInt("IDPersonaje"));
                p.setNombrePJ(rs.getString("NomPersonaje"));
                p.setNombreJugador(rs.getString("NomJugador"));
                p.setNivel(rs.getInt("Nivel"));
                p.setNomPartida(rs.getString("NomPartida")); 
                listaPersonaje.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaPersonaje;
    }
    
    public boolean insertarPersonaje(Personaje personaje) {
        String sql = "INSERT INTO Personaje (NomPersonaje, NomJugador, Nivel, NomPartida) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, personaje.getNombrePJ());
            ps.setString(2, personaje.getNombreJugador());
            ps.setInt(3, personaje.getNivel());
            ps.setString(4, personaje.getNomPartida());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al insertar personaje: " + e.getMessage());
            return false;
        }
    }

    public Personaje obtenerPersonajePorID(int id) {
        Personaje personaje = null;
        String sql = "SELECT IDPersonaje, NomPersonaje, NomJugador, Nivel, NomPartida FROM Personaje WHERE IDPersonaje = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    personaje = new Personaje(
                        rs.getInt("IDPersonaje"),
                        rs.getString("NomPersonaje"),
                        rs.getString("NomJugador"),
                        rs.getInt("Nivel"),
                        rs.getString("NomPartida")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return personaje;
    }

    public boolean actualizarPersonaje(Personaje personaje) {
        String sql = "UPDATE Personaje SET NomPersonaje = ?, NomJugador = ?, Nivel = ?, NomPartida = ? WHERE IDPersonaje = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, personaje.getNombrePJ());
            ps.setString(2, personaje.getNombreJugador());
            ps.setInt(3, personaje.getNivel());
            ps.setString(4, personaje.getNomPartida());
            ps.setInt(5, personaje.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarPersonaje(int id) {
        String sql = "DELETE FROM Personaje WHERE IDPersonaje = ?";
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