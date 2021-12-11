package services;

import java.util.List;

import model.TipoDeAtraccion;
import model.Usuario;
import persistence.dao.DAOFactory;
import persistence.dao.UsuarioDAO;

public class UsuarioService {

	public List<Usuario> list() {
		return DAOFactory.getUsuarioDAO().findAll();
	}
	
	public Usuario create(String nombre, TipoDeAtraccion tipo, int monedas, float tiempo, String password, boolean esAdmin) {

		Usuario usuario = new Usuario(nombre, tipo, monedas, tiempo, password, esAdmin, 0);
		usuario.setPassword(password);

		if (usuario.isValid()) {
			UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
			usuarioDAO.insert(usuario);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return usuario;
	}
	
}
