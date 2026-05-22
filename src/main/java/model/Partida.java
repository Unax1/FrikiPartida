package model;

public class Partida {
    private int id;
    private String nombre;
    private String dm;
    private String estado;
    private int cantSesiones;
    private String dificultad;


    public Partida() {}
    
    public Partida(String nombre, String dm, String estado, int cantSesiones, String dificultad) {
        this.nombre = nombre;
        this.dm = dm;
        this.estado = estado;
        this.cantSesiones = cantSesiones;
        this.dificultad = dificultad;
    }

    public Partida(int id, String nombre, String dm, String estado, int cantSesiones, String dificultad) {
        this.id = id;
        this.nombre = nombre;
        this.dm = dm;
        this.estado = estado;
        this.cantSesiones = cantSesiones;
        this.dificultad = dificultad;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDm() { return dm; }
    public void setDm(String dm) { this.dm = dm; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public int getCantSesiones() { return cantSesiones; }
    public void setCantSesiones(int cantSesiones) { this.cantSesiones = cantSesiones; }

    public String getDificultad() { return dificultad; }
    public void setDificultad(String dificultad) { this.dificultad = dificultad; }
}