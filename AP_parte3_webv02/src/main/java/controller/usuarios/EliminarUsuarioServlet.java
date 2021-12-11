package controller.usuarios;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UsuarioService;

@WebServlet("/usuarios/delete.do")
public class EliminarUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = -3656486171059195534L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = (String)(req.getParameter("usuario_eliminar"));

		usuarioService.delete(name);
		resp.sendRedirect("/AP_parte3_webv02/administrador/eliminar.do");
	}
}
