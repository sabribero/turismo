package services;

import java.util.HashMap;
import java.util.Map;

import model.Atraccion;
import model.Usuario;
import persistence.dao.AtraccionDAO;
import persistence.dao.UsuarioDAO;
import persistence.dao.DAOFactory;

public class BuyAttractionService {

	AtraccionDAO atraccionDAO = DAOFactory.getAtraccionDAO();
	UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();

	public Map<String, String> buy(Integer userId, Integer attractionId) {
		Map<String, String> errors = new HashMap<String, String>();

		Usuario user = usuarioDAO.findByID(userId);
		Atraccion attraction = atraccionDAO.findByID(attractionId);

		
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
