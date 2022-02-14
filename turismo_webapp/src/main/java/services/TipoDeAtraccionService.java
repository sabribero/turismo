package services;

import java.util.List;

import model.TipoDeAtraccion;
import persistence.dao.DAOFactory;
import persistence.dao.TipoDeAtraccionDAOImpl;

public class TipoDeAtraccionService {
	
	public List<TipoDeAtraccion> list() {
		return DAOFactory.getTipoDeAtraccionDAO().findAll();
	}
	
	public TipoDeAtraccion create(String nombre) {
		
		TipoDeAtraccion tipo = new TipoDeAtraccion(0, nombre, false);

		if (tipo.isValid()) {
			TipoDeAtraccionDAOImpl tipoDeAtraccionDAO = DAOFactory.getTipoDeAtraccionDAO();
			tipoDeAtraccionDAO.insert(tipo);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return tipo;
	}
	
	public TipoDeAtraccion update(String nombre, String original) {

		TipoDeAtraccionDAOImpl tipoDeAtraccionDAO = DAOFactory.getTipoDeAtraccionDAO();
		TipoDeAtraccion tipo = tipoDeAtraccionDAO.findByNombre(original);

		tipo.setNombre(nombre);

		if (tipo.isValid2()) {
			tipoDeAtraccionDAO.modificar(tipo, original);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return tipo;
	}
	
	public void delete(String name) {
		
		TipoDeAtraccion tipo = new TipoDeAtraccion(0, name, false);

		TipoDeAtraccionDAOImpl tipoDeAtraccionDAO = DAOFactory.getTipoDeAtraccionDAO();
		tipoDeAtraccionDAO.borradoLogico(tipo);
	}
}
