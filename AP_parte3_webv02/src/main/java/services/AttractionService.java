package services;

import java.util.List;

import model.Atraccion;
import persistence.dao.AtraccionDAO;
import persistence.dao.DAOFactory;
import model.TipoDeAtraccion;

public class AttractionService {

	public List<Atraccion> list() {
		return DAOFactory.getAtraccionDAO().findAll();
	}
	

	public List<Atraccion> listItinerario(int id) {
		return DAOFactory.getAtraccionDAO().findItinerarioById(id);
	}
	

	public Atraccion create(String name, Integer cost, Double duration, Integer capacity) {

		Atraccion atr = new Atraccion(name, cost, duration, capacity, null, 0);

		if (atr.isValid()) {
			AtraccionDAO attractionDAO = DAOFactory.getAtraccionDAO();
			attractionDAO.insert(atr);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return atr;
	}

	public Atraccion update(Integer id, String name, Integer cost, Double duration, Integer capacity) {

		AtraccionDAO attractionDAO = DAOFactory.getAtraccionDAO();
		Atraccion atr = attractionDAO.findByID(id);

		atr.setNombre(name);
		atr.setValor(cost);
		atr.setTiempoDeUso(duration);
		atr.setUsosDisponibles(capacity);

		if (atr.isValid()) {
			attractionDAO.update(atr);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return atr;
	}

	public void delete(Integer id) {
		
		Atraccion attraction = new Atraccion("", 0, 0, 0, null, 0);

		AtraccionDAO attractionDAO = DAOFactory.getAtraccionDAO();
		attractionDAO.delete(attraction);
	}

	public Atraccion find(Integer id) {
		AtraccionDAO attractionDAO = DAOFactory.getAtraccionDAO();
		return attractionDAO.findByID(id);
	}

}
