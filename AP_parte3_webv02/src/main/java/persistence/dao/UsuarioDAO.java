package persistence.dao;

import java.sql.ResultSet;

import model.Usuario;

public interface UsuarioDAO extends GenericDAO<Usuario>{

	public Usuario findByNombre(String nombre);
	public Usuario findByID(int ID);
	public int findIDByNombre(String nombre);
	public int updatepassword (Usuario user);
	public Usuario toUsuario(ResultSet resultado);
}
