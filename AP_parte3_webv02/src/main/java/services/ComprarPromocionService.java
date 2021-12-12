package services;

import java.util.HashMap;
import java.util.Map;

import model.Promocion;
import model.Usuario;
import ofertador.Sugeridor;
import persistence.dao.DAOFactory;
import persistence.dao.PromocionDAOImpl;
import persistence.dao.UsuarioDAO;

public class ComprarPromocionService {

	PromocionDAOImpl promocionDAO = DAOFactory.getPromocionDAO();
	UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();

	public Map<String, String> buy(String nombre, int id) {
		Map<String, String> errors = new HashMap<String, String>();

		Usuario user= usuarioDAO.findByNombre(nombre);
		Promocion promocion = promocionDAO.findById(id, DAOFactory.getAtraccionDAO().findAll());

		if(!promocion.tieneCupos()) {
			errors.put("promocion", "No hay cupo disponible");
		}
		if(!user.podesIrA(promocion)) {
			errors.put("usuario", "No tiene dinero o tiempo suficiente");
		}
		if(!user.todaviaNoVasA(promocion)) {
			errors.put("usuario", "La atraccion ya esta en su itinerario");
		}
		
		if(errors.isEmpty()) {
			Sugeridor.agregarYPagarPromo(user, promocion);
		}
		
		return errors;

	}
	
}
