package model;

public class DungeonMaster {
    private int idMaster;
    private String usuario;
    private String contrasena;
    private String email;

    public DungeonMaster() {}

    public DungeonMaster(String usuario, String contrasena, String email) {
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.email = email;
    }

    public int getIdMaster() { return idMaster; }
    public void setIdMaster(int idMaster) { this.idMaster = idMaster; }

    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }

    public String getContrasena() { return contrasena; }
    public void setContrasena(String contrasena) { this.contrasena = contrasena; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}