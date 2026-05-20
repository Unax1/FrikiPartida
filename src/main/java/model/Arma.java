package model;

public class Arma {
    private int id;
    private String nombre;
    private String tipoDano;
    private String dado;
    private String precio;
    private double peso;
    private String propiedades;
    private String nomPartida;

    // Constructor vacío (necesario para el DAO)
    public Arma() {}

    // Constructor sin ID (para insertar armas nuevas)
    public Arma(String nombre, String tipoDano, String dado, String precio, double peso, String propiedades, String nomPartida) {
        this.nombre = nombre;
        this.tipoDano = tipoDano;
        this.dado = dado;
        this.precio = precio;
        this.peso = peso;
        this.propiedades = propiedades;
        this.nomPartida = nomPartida;
    }

    // Constructor completo (para leer de la base de datos)
    public Arma(int id, String nombre, String tipoDano, String dado, String precio, double peso, String propiedades, String nomPartida) {
        this.id = id;
        this.nombre = nombre;
        this.tipoDano = tipoDano;
        this.dado = dado;
        this.precio = precio;
        this.peso = peso;
        this.propiedades = propiedades;
        this.nomPartida = nomPartida;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getTipoDano() { return tipoDano; }
    public void setTipoDano(String tipoDano) { this.tipoDano = tipoDano; }

    public String getDado() { return dado; }
    public void setDado(String dado) { this.dado = dado; }

    public String getPrecio() { return precio; }
    public void setPrecio(String precio) { this.precio = precio; }

    public double getPeso() { return peso; }
    public void setPeso(double peso) { this.peso = peso; }

    public String getPropiedades() { return propiedades; }
    public void setPropiedades(String propiedades) { this.propiedades = propiedades; }

    public String getNomPartida() { return nomPartida; }
    public void setNomPartida(String nomPartida) { this.nomPartida = nomPartida; } 
}
