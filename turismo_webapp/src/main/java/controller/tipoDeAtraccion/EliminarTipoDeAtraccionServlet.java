package controller.tipoDeAtraccion;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.TipoDeAtraccionService;

@WebServlet("/tipos/delete.do")
public class EliminarTipoDeAtraccionServlet extends HttpServlet {

	private static final long serialVersionUID = 6817874314458154872L;
	private TipoDeAtraccionService tipoDeAtraccionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.tipoDeAtraccionService = new TipoDeAtraccionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = (String)(req.getParameter("seleccion_tipo"));

		tipoDeAtraccionService.delete(name);
		resp.sendRedirect("/turismo_webapp/administrador/eliminar.do");
	}

}
