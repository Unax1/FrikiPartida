package dao;

import model.DungeonMaster;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MasterDAO {
    private final String url = "jdbc:mysql://localhost:3306/FrikiPartida";
    private final String user = "root";
    private final String pass = "_Plaiaundi25";

    public MasterDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection obtenerConexion() throws SQLException {
        return DriverManager.getConnection(url, user, pass);
    }

    public boolean registrarMaster(DungeonMaster master) throws SQLException {
        String sql = "INSERT INTO DungeonMaster (Usuario, contrasena, Email) VALUES (?, ?, ?)";
        
        try (Connection conn = obtenerConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, master.getUsuario());
            ps.setString(2, master.getContrasena());
            ps.setString(3, master.getEmail());
            
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        }
    }
}