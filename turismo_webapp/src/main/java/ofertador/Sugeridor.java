package ofertador;

import java.util.ArrayList;
import java.util.List;

import model.Atraccion;
import model.Itinerario;
import model.Promocion;
import model.Usuario;
import persistence.dao.DAOFactory;

public class Sugeridor {

	
//metodos synchronized para que no quede ninguna transaccion a la mitad	
	public synchronized static void agregarYPagarPromo(Usuario unUsuario, Promocion unaPromocion) {
		for (Atraccion cadaAtraccion : unaPromocion.getAtraccionesEnPromocion()) {
			
			cadaAtraccion.reservarLugar(unUsuario);
			//DAOFactory.getItinerarioDAO().cargarAtraccion(cadaAtraccion, unUsuario);
			
		}
		unUsuario.pagar(unaPromocion);
		
		DAOFactory.getItinerarioDAO().cargarItinerario(new Itinerario(unaPromocion.getAtraccionesEnPromocion(), unUsuario));
		DAOFactory.getPromocionDAO().updateAtracciones(unaPromocion);
		DAOFactory.getUsuarioDAO().update(unUsuario);
	}
	
	public synchronized static void agregarYPagar(Usuario unUsuario, Atraccion unaAtraccion) {
		
		unaAtraccion.reservarLugar(unUsuario);
		
		//el Itinerario recibe una lista de atracciones
		List<Atraccion> atraccionList= new ArrayList<Atraccion>();
		atraccionList.add(unaAtraccion);
		
		DAOFactory.getItinerarioDAO().cargarItinerario(new Itinerario(atraccionList, unUsuario));
		unUsuario.pagar(unaAtraccion);
		
		DAOFactory.getAtraccionDAO().update(unaAtraccion);
		DAOFactory.getUsuarioDAO().update(unUsuario);
	}
	//boolean favorito para determinar si tiene que sugerir los tipos favoritos o no 
	protected static List<Promocion> sugerirPromos(Usuario unUsuario, List<Promocion> unasPromociones, boolean favorito) {
		List<Promocion> retorno= new ArrayList<Promocion>();
		
			for (Promocion cadaPromocion : unasPromociones) {
				if(favorito) {
					//si el tipo requerido es el favorito, se piden las promociones que pertenezcan al mismo tipo
					if(cadaPromocion.getTipoDeAtraccion().equals(unUsuario.getAtraccionFavorita())) {	
						if (unUsuario.podesIrA(cadaPromocion) && cadaPromocion.tieneCupos()) { 
				
							retorno.add(cadaPromocion);
						}
					}
				} else {
					//si el tipo requerido no es el favorito, se piden las promociones que no sean del tipo favorito
					if(!cadaPromocion.getTipoDeAtraccion().equals(unUsuario.getAtraccionFavorita())) {	
						if (unUsuario.podesIrA(cadaPromocion) && cadaPromocion.tieneCupos()) { 
				
							retorno.add(cadaPromocion);
						}
					}
				}
			}
		return retorno;
	}
	
	protected static List<Atraccion> sugerirAtracciones(Usuario unUsuario, List<Atraccion> unasAtracciones, boolean favorito) {
		
		List<Atraccion> retorno = new ArrayList<Atraccion>();
		
		for (Atraccion cadaAtraccion : unasAtracciones) {
			if(favorito) {
				if(cadaAtraccion.getTipo().equals(unUsuario.getAtraccionFavorita())) {
					if (unUsuario.podesIrA(cadaAtraccion) && cadaAtraccion.getUsosDisponibles() > 0) {
		
						retorno.add(cadaAtraccion);
		
					}
				}
			} else {
				if(!cadaAtraccion.getTipo().equals(unUsuario.getAtraccionFavorita())) {
					if (unUsuario.podesIrA(cadaAtraccion) && cadaAtraccion.getUsosDisponibles() > 0) {
		
						retorno.add(cadaAtraccion);
		
					}
				}
			}

		}
		return retorno;
	}

}