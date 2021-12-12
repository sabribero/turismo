package services;

import java.util.List;

import model.Atraccion;
import model.Itinerario;
import model.Promocion;
import model.Usuario;
import ofertador.Ofertador;
import persistence.dao.DAOFactory;

public class OfertadorService {

	Ofertador ofertador;

	List<Atraccion> todasLasAtracciones;
	List<Usuario> todosLosUsuarios;
	List<Promocion> todasLasPromociones;
	List<Itinerario> todosLosItinerarios;
	
	List<Atraccion> atraccionesFavoritas;
	List<Atraccion> atraccionesNoFavoritas;
	List<Promocion> promocionesFavoritas;
	List<Promocion> promocionesNoFavoritas;
	
	public void inicializar() {
		todasLasAtracciones= DAOFactory.getAtraccionDAO().findAll();
		todosLosUsuarios= DAOFactory.getUsuarioDAO().findAll();
		todasLasPromociones= DAOFactory.getPromocionDAO().findAll(todasLasAtracciones);
		todosLosItinerarios= DAOFactory.getItinerarioDAO().findAll();
		ofertador = new Ofertador(todasLasAtracciones, todasLasPromociones);

		ofertador.ordenarListas();	
		
		ofertador.separarItinerario(todosLosUsuarios, todosLosItinerarios);
	}
	
	public void ofertar(Usuario usuario) {
		this.ofertador.prepararListas(usuario);
		this.promocionesFavoritas= ofertador.getPromocionesFavoritas();
		this.atraccionesFavoritas= ofertador.getAtraccionesFavoritas();
		this.promocionesNoFavoritas= ofertador.getPromocionesNoFavoritas();
		this.atraccionesNoFavoritas= ofertador.getAtraccionesNoFavoritas();
	}
	
	public List<Promocion> getPromocionesFavoritas(){
		return this.promocionesFavoritas;
	}

	public List<Atraccion> getAtraccionesFavoritas(){
		return this.atraccionesFavoritas;
	}
	
	public List<Promocion> getPromocionesNoFavoritas(){
		return this.promocionesNoFavoritas;
	}
	
	public List<Atraccion> getAtraccionesNoFavoritas(){
		return this.atraccionesNoFavoritas;
	}
}
