package controller.usuarios;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import services.UsuarioService;

@WebServlet("/usuarios/create.do")
public class CrearUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 7028086047907991113L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/agregar.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nombre = req.getParameter("nombre_usuario");
		String password = req.getParameter("password_usuario");
		String tipo = req.getParameter("favorito_usuario");
		int monedas = Integer.parseInt(req.getParameter("monedas_usuario"));
		float tiempo = Float.parseFloat(req.getParameter("tiempo_usuario"));
		String esAdmin= req.getParameter("admin_usuario");
		boolean admin= false;
		
		if(esAdmin.equals("si")) {
			admin=true;
		}

		Usuario usuario= usuarioService.create(nombre, tipo, monedas, tiempo, password, admin);
		//envio el usuario de todas maneras para juzgar si es adecuado o no desde el mensaje
			req.setAttribute("flash", usuario);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/administrador/agregar.do");
			dispatcher.forward(req, resp);
			

	}
}
