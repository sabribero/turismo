package services;

import java.util.List;

import model.Atraccion;
import model.Promocion;
import persistence.dao.DAOFactory;

public class PromocionService {

	public List<Promocion> list() {
		List<Atraccion> atracciones= DAOFactory.getAtraccionDAO().findAll();
		return DAOFactory.getPromocionDAO().findAll(atracciones);
	}

}
