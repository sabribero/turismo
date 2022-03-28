package services;

import java.util.List;

import model.TipoDeAtraccion;
import model.Usuario;
import persistence.dao.DAOFactory;
import persistence.dao.UsuarioDAO;
import persistence.dao.UsuarioDAOImpl;

public class UsuarioService {

	public List<Usuario> list() {
		return DAOFactory.getUsuarioDAO().findAll();
	}
	
	public Usuario create(String nombre, String tipo, int monedas, float tiempo, String password, boolean esAdmin) {

		TipoDeAtraccion tipoDeAtraccion= DAOFactory.getTipoDeAtraccionDAO().findByNombre(tipo);
		
		Usuario usuario = new Usuario(nombre, tipoDeAtraccion, monedas, tiempo, password, esAdmin, 0);
		usuario.setPassword(password);

		if (usuario.isValid()) {
			UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
			usuarioDAO.insert(usuario);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return usuario;
	}
	
	public Usuario update(int id, String password, String tipo, int monedas, float tiempo, boolean esAdmin) {

		UsuarioDAOImpl usuarioDAO = DAOFactory.getUsuarioDAO();
		Usuario usuario = usuarioDAO.findByID(id);
		TipoDeAtraccion tipoDeAtraccion= DAOFactory.getTipoDeAtraccionDAO().findByNombre(tipo);

		//usuario.setNombre(nombre);
		usuario.setPassword(password);
		usuario.setTipoFavorito(tipoDeAtraccion);
		usuario.setPresupuesto(monedas);
		usuario.setTiempoDisponible(tiempo);
		usuario.setAdmin(esAdmin);

		if (usuario.isValid()) {
			usuarioDAO.modificar(usuario, id);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return usuario;
	}
	
	public void delete(String name) {
		
		Usuario usuario = new Usuario(name, null, 0, 0f, "", false, 0);

		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
		usuarioDAO.borradoLogico(usuario);
	}
	
}
