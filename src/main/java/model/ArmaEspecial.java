package model;

public class ArmaEspecial extends Arma {
	
    private String rareza;
    private int bonificador;
    private String efectoMagico;

    public ArmaEspecial() {
        super();
    }

    public ArmaEspecial(int id, String nombre, String tipoDano, String dado, String precio, double peso, 
                        String propiedades, String nomPartida, String rareza, int bonificador, String efectoMagico) {
        super(id, nombre, tipoDano, dado, precio, peso, propiedades, nomPartida);
        this.rareza = rareza;
        this.bonificador = bonificador;
        this.efectoMagico = efectoMagico;
    }

    public ArmaEspecial(String nombre, String tipoDano, String dado, String precio, double peso, 
                        String propiedades, String nomPartida, String rareza, int bonificador, String efectoMagico) {
        super(nombre, tipoDano, dado, precio, peso, propiedades, nomPartida);
        this.rareza = rareza;
        this.bonificador = bonificador;
        this.efectoMagico = efectoMagico;
    }
    
    public String getRareza() { 
    	return rareza; 
    }
    
    public void setRareza(String rareza) { 
    	this.rareza = rareza; 
    }

    public int getBonificador() { 
    	return bonificador; 
    }
    
    public void setBonificador(int bonificador) { 
    	this.bonificador = bonificador; 
    }

    public String getEfectoMagico() { 
    	return efectoMagico; 
    }
    
    public void setEfectoMagico(String efectoMagico) { 
    	this.efectoMagico = efectoMagico; 
    }
}
