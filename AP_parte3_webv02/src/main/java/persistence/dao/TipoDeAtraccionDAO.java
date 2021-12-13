package persistence.dao;

import java.sql.ResultSet;
import java.util.List;

import model.TipoDeAtraccion;

public interface TipoDeAtraccionDAO {

	public List<TipoDeAtraccion> findAll();
	public TipoDeAtraccion toTipoDeAtraccion(ResultSet resultado);
}
