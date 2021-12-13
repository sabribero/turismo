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

@WebServlet("/usuarios/edit.do")
public class ModificarUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 738424339970214946L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/modificar.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String original= req.getParameter("seleccion_usuario");
		String nombre = req.getParameter("nombre_usuario");
		String password= req.getParameter("password_usuario");
		String tipo =req.getParameter("seleccion_favorito_usuario");
		int monedas = Integer.parseInt(req.getParameter("dinero_usuario"));
		float tiempo = Float.parseFloat(req.getParameter("tiempo_usuario"));
		String esAdmin= req.getParameter("admin_usuario");
		boolean admin= false;
		
		if(esAdmin.equals("si")) {
			admin=true;
		}

		Usuario usuario = usuarioService.update(original,nombre, password,tipo, monedas, tiempo, admin);

	//mando el usuario y luego analizo si hay errores o no
			req.setAttribute("flash", usuario);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/administrador/modificar.do");
			dispatcher.forward(req, resp);
	}
}
