package model;

import java.util.List;

public class Itinerario  {
	
	//ojala no rompa nada cambiarlo de protected a private
	private List<Atraccion> atracciones;
	private Usuario usuario;
	
	
	
	public Itinerario(List<Atraccion> unasAtracciones, Usuario unUsuario) {
		this.atracciones = unasAtracciones;
		this.usuario= unUsuario;

	}



	// --------------------------GETTERS----------------------


	public Usuario getUsuario() {
		return this.usuario;
	}
	

	
	public List<Atraccion> getAtracciones() {
		return this.atracciones;
	}

	// -----------------------Metodos------------------------
	
	public void agregarAtraccion(Atraccion atraccion) {
		this.atracciones.add(atraccion);
	}



	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.usuario.getNombre() + ", " + this.atracciones.toString();
	}

	
	
}
