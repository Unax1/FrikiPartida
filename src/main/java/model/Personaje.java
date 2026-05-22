package model;

public class Personaje {
    private int id;
    private String nombrePJ;
    private String nombreJugador;
    private int nivel;
    private String nomPartida;

    public Personaje() {}
    
    public Personaje(String nombrePJ, String nombreJugador, int nivel, String nomPartida) {
    	this.nombrePJ = nombrePJ;
    	this.nombreJugador = nombreJugador;
    	this.nivel = nivel;
    	this.nomPartida = nomPartida;
    }
    public Personaje(int id, String nombrePJ, String nombreJugador, int nivel, String nomPartida) {
        this.id = id;
        this.nombrePJ = nombrePJ;
        this.nombreJugador = nombreJugador;
        this.nivel = nivel;
        this.nomPartida = nomPartida;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombrePJ() { return nombrePJ; }
    public void setNombrePJ(String nombrePJ) { this.nombrePJ = nombrePJ; }

    public String getNombreJugador() { return nombreJugador; }
    public void setNombreJugador(String nombreJugador) { this.nombreJugador = nombreJugador; }

    public int getNivel() { return nivel; }
    public void setNivel(int nivel) { this.nivel = nivel; }

    public String getNomPartida() { return nomPartida; }
    public void setNomPartida(String nomPartida) { this.nomPartida = nomPartida; }
}