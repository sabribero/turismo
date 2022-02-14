package services;

import java.util.HashMap;
import java.util.Map;

import model.Atraccion;
import model.Usuario;
import ofertador.Sugeridor;
import persistence.dao.AtraccionDAO;
import persistence.dao.DAOFactory;
import persistence.dao.UsuarioDAO;

public class BuyAttractionService {

	AtraccionDAO atraccionDAO = DAOFactory.getAtraccionDAO();
	UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();

	public Map<String, String> buy(String nombre, String attractionName) {
		Map<String, String> errors = new HashMap<String, String>();

		Usuario user= usuarioDAO.findByNombre(nombre);
		Atraccion atraccion = atraccionDAO.findByNombre(attractionName);

		if(!atraccion.podesRecibir()) {
			errors.put("atraccion", "No hay cupo disponible");
		}
		if(!user.podesIrA(atraccion)) {
			errors.put("usuario", "No tiene dinero o tiempo suficiente");
		}
		if(!user.todaviaNoVasA(atraccion)) {
			errors.put("usuario", "La atraccion ya esta en su itinerario");
		}
		
		if(errors.isEmpty()) {
			Sugeridor.agregarYPagar(user, atraccion);
		}
		
		/* Arreglar errores
		
		if (!attraction.canHost(1)     ) {
			errors.put("attraction", "No hay cupo disponible");
		}
		if (!user.canAfford(attraction)) {
			errors.put("user", "No tienes dinero suficiente");
		}
		if (!user.canAttend(attraction)) {
			errors.put("user", "No tienes tiempo suficiente");
		}

		if (errors.isEmpty()) {
			user.addToItinerary(attraction);
			attraction.host(1);

			// no grabamos para no afectar la base de pruebas
			attractionDAO.update(attraction);
			userDAO.update(user);
		}
 * 
		 * 
		 */
		
		return errors;

	}

}
