package persistence.dao;

import java.sql.ResultSet;
import java.util.List;

import model.TipoDeAtraccion;

public interface TipoDeAtraccionDAO {

	public List<TipoDeAtraccion> findAll();
	public List<TipoDeAtraccion> findAllConBorrados();
	public int insert(TipoDeAtraccion tipo);
	public int modificar(TipoDeAtraccion tipo, String original);
	public int borradoLogico(TipoDeAtraccion tipo);
	public TipoDeAtraccion findByNombre(String nombre);
	public TipoDeAtraccion toTipoDeAtraccion(ResultSet resultado);
}
