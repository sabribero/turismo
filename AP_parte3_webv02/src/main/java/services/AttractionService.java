package services;

import java.util.List;

import model.Atraccion;
import model.TipoDeAtraccion;
import persistence.dao.AtraccionDAO;
import persistence.dao.AtraccionDAOImpl;
import persistence.dao.DAOFactory;

public class AttractionService {

	public List<Atraccion> list() {
		return DAOFactory.getAtraccionDAO().findAll();
	}
	

	public List<Atraccion> listItinerario(int id) {
		return DAOFactory.getAtraccionDAO().findItinerarioById(id);
	}
	

	public Atraccion create(String name, Integer cost, Double duration, Integer capacity, TipoDeAtraccion tipo) {

		Atraccion atr = new Atraccion(name, cost, duration, capacity, tipo, 0);

		if (atr.isValid()) {
			AtraccionDAO attractionDAO = DAOFactory.getAtraccionDAO();
			attractionDAO.insert(atr);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return atr;
	}

	public Atraccion update(String name, Integer cost, Double duration, Integer capacity) {

		AtraccionDAOImpl attractionDAO = DAOFactory.getAtraccionDAO();
		Atraccion atr = attractionDAO.findByNombre(name);

		atr.setValor(cost);
		atr.setTiempoDeUso(duration);
		atr.setUsosDisponibles(capacity);

		if (atr.isValid()) {
			attractionDAO.modificar(atr);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return atr;
	}

	public void delete(String name) {
		
		Atraccion attraction = new Atraccion(name, 0, 0, 0, null, 0);

		AtraccionDAO attractionDAO = DAOFactory.getAtraccionDAO();
		attractionDAO.borradoLogico(attraction);
	}

	public Atraccion find(Integer id) {
		AtraccionDAO attractionDAO = DAOFactory.getAtraccionDAO();
		return attractionDAO.findByID(id);
	}

}
