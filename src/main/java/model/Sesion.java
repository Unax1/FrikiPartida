package model;

import java.sql.Date;

public class Sesion {
    private int numSesion;
    private String nombre;
    private int cantidad;
    private Date fecha;
    private double duracion;
    private String nomPartida;

    // Constructor vacío
    public Sesion() {}

    // Constructor completo
    public Sesion(int numSesion, String nombre, int cantidad, Date fecha, double duracion, String nomPartida) {
        this.numSesion = numSesion;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.duracion = duracion;
        this.nomPartida = nomPartida;
    }

    // Getters y Setters
    public int getNumSesion() { return numSesion; }
    public void setNumSesion(int numSesion) { this.numSesion = numSesion; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }

    public double getDuracion() { return duracion; }
    public void setDuracion(double duracion) { this.duracion = duracion; }

    public String getNomPartida() { return nomPartida; }
    public void setNomPartida(String nomPartida) { this.nomPartida = nomPartida; }
}