package services;

import java.util.List;

import model.TipoDeAtraccion;
import persistence.dao.DAOFactory;

public class TipoDeAtraccionService {
	
	public List<TipoDeAtraccion> list() {
		return DAOFactory.getTipoDeAtraccionDAO().findAll();
	}
}
