package services;

import model.Usuario;
import persistence.dao.DAOFactory;
import persistence.dao.UsuarioDAO;

public class ChangePwdService {

	public static int change(Usuario user, String oldpass, String newpass, String repass) {
		int mensaje;

		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();

		if (!user.checkPassword(oldpass) || user.isNull()) {
			mensaje = 2;
		} else if (!newpass.equals(repass) || newpass.equals("") || newpass.equals(oldpass)) {
			mensaje = 3;
		} else {
			user.setPassword(newpass);
			usuarioDAO.updatepassword(user);
			mensaje = 1;
		}

		return mensaje;
	}

}
