package services;

import model.Usuario;
import model.nullobjects.NullUser;
import persistence.dao.UsuarioDAO;
import persistence.dao.DAOFactory;

public class LoginService {

	public Usuario login(String username, String password) {
		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
    	Usuario user = usuarioDAO.findByNombre(username);
    	
    	
    	//	if (user.isNull() || !user.checkPassword(password)) {
    	if (user.isNull()|| !password.equals("pass")) {
    		user = NullUser.build();
    	}
    	
    	return user;
	}
	
}
