package controller.tipoDeAtraccion;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TipoDeAtraccion;
import services.TipoDeAtraccionService;

@WebServlet("/tipos/edit.do")
public class ModificarTipoDeAtraccion extends HttpServlet {

	private static final long serialVersionUID = -1256378506033220456L;
	private TipoDeAtraccionService tipoDeAtraccionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.tipoDeAtraccionService = new TipoDeAtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/modificar.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String original = req.getParameter("seleccion_tipo");
		String name = req.getParameter("nombre_tipo");

		name= name.trim().replace("á", "a")
						.replace("é", "e")
						.replace("í", "i")
						.replace("ó", "o")
						.replace("ú", "u");
		
		TipoDeAtraccion tipo = tipoDeAtraccionService.update(name, original);

	//mando el usuario y luego analizo si hay errores o no
			req.setAttribute("flash", tipo);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/administrador/modificar.do");
			dispatcher.forward(req, resp);
	}
}
