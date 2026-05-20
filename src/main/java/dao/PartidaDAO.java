package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Partida;
import util.DatabaseConnection;

public class PartidaDAO {

    public List<Partida> listarPartidas() {
        List<Partida> listaPartida = new ArrayList<>();
        String sql = "SELECT * FROM Partida";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Partida p = new Partida();
                p.setId(rs.getInt("IDPartida"));
                p.setNombre(rs.getString("NomPartida"));
                p.setDm(rs.getString("DM"));
                p.setEstado(rs.getString("Estado"));
                p.setCantSesiones(rs.getInt("CantSesiones"));
                p.setDificultad(rs.getString("Dificultad"));
                listaPartida.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaPartida;
    }

    public boolean insertarPartida(Partida partida) {
        String sql = "INSERT INTO Partida (NomPartida, DM, Estado, CantSesiones, Dificultad) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, partida.getNombre());
            ps.setString(2, partida.getDm());
            ps.setString(3, partida.getEstado());
            ps.setInt(4, partida.getCantSesiones());
            ps.setString(5, partida.getDificultad());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Partida obtenerPartidaPorID(int id) {
        Partida partida = null;
        String sql = "SELECT IDPartida, NomPartida, DM, Estado, CantSesiones, Dificultad FROM Partida WHERE IDPartida = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    partida = new Partida(
                        rs.getInt("IDPartida"), 
                        rs.getString("NomPartida"), 
                        rs.getString("DM"),
                        rs.getString("Estado"), 
                        rs.getInt("CantSesiones"), 
                        rs.getString("Dificultad")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return partida;
    }

    public boolean actualizarPartida(Partida partida) {
        String sql = "UPDATE Partida SET NomPartida = ?, DM = ?, Estado = ?, CantSesiones = ?, Dificultad = ? WHERE IDPartida = ?";
        try (Connection conn = DatabaseConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, partida.getNombre());
            ps.setString(2, partida.getDm());
            ps.setString(3, partida.getEstado());
            ps.setInt(4, partida.getCantSesiones());
            ps.setString(5, partida.getDificultad());
            ps.setInt(6, partida.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarPartida(int id) {
        String sql = "DELETE FROM Partida WHERE IDPartida = ?";
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