package persistence.dao;

import java.sql.ResultSet;
import java.util.List;

import model.Atraccion;

public interface AtraccionDAO extends GenericDAO<Atraccion>{
	
	public List<Atraccion> findAllConBorrados();
	public Atraccion findByNombre(String nombre);
	public Atraccion findByID(int ID);
	public int modificar(Atraccion atraccion);
	public int borradoLogico(Atraccion atraccion);
	public int findIDByNombre(String nombre);
	public Atraccion toAtraccion(ResultSet resultado);
	public List<Atraccion> findAll();
}
