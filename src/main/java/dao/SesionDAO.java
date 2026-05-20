package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Sesion;
import util.DatabaseConnection;

public class SesionDAO {

    public List<Sesion> listarSesiones() {
        List<Sesion> listaSesiones = new ArrayList<>();
        String sql = "SELECT NumSesion, Nombre, Cantidad, Fecha, Duracion, NomPartida FROM Sesion";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Sesion s = new Sesion();
                s.setNumSesion(rs.getInt("NumSesion"));
                s.setNombre(rs.getString("Nombre"));
                s.setCantidad(rs.getInt("Cantidad"));
                s.setFecha(rs.getDate("Fecha"));
                s.setDuracion(rs.getDouble("Duracion"));
                s.setNomPartida(rs.getString("NomPartida"));
                listaSesiones.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaSesiones;
    }

    public boolean insertarSesion(Sesion sesion) {
        String sql = "INSERT INTO Sesion (NumSesion, Nombre, Cantidad, Fecha, Duracion, NomPartida) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sesion.getNumSesion());
            ps.setString(2, sesion.getNombre());
            ps.setInt(3, sesion.getCantidad());
            ps.setDate(4, sesion.getFecha());
            ps.setDouble(5, sesion.getDuracion());
            ps.setString(6, sesion.getNomPartida());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Sesion obtenerSesionPorNumero(int numSesion, String nomPartida) {
        Sesion sesion = null;
        String sql = "SELECT NumSesion, Nombre, Cantidad, Fecha, Duracion, NomPartida FROM Sesion WHERE NumSesion = ? AND NomPartida = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, numSesion);
            ps.setString(2, nomPartida);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    sesion = new Sesion(
                        rs.getInt("NumSesion"), 
                        rs.getString("Nombre"), 
                        rs.getInt("Cantidad"), 
                        rs.getDate("Fecha"), 
                        rs.getDouble("Duracion"), 
                        rs.getString("NomPartida")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sesion;
    }

    public boolean actualizarSesion(Sesion sesion) {
        String sql = "UPDATE Sesion SET Nombre = ?, Cantidad = ?, Fecha = ?, Duracion = ? WHERE NumSesion = ? AND NomPartida = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, sesion.getNombre());
            ps.setInt(2, sesion.getCantidad());
            ps.setDate(3, sesion.getFecha());
            ps.setDouble(4, sesion.getDuracion());
            ps.setInt(5, sesion.getNumSesion());
            ps.setString(6, sesion.getNomPartida());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarSesion(int numSesion, String nomPartida) {
        String sql = "DELETE FROM Sesion WHERE NumSesion = ? AND NomPartida = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, numSesion);
            ps.setString(2, nomPartida);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}