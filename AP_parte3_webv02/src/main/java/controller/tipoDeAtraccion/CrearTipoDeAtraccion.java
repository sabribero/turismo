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

@WebServlet("/tipos/create.do")
public class CrearTipoDeAtraccion extends HttpServlet {

	private static final long serialVersionUID = -7616014167463346271L;
	private TipoDeAtraccionService tipoDeAtraccionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.tipoDeAtraccionService = new TipoDeAtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/agregar.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("nuevo_tipo");

		name= name.trim().replace("á", "a")
						.replace("é", "e")
						.replace("í", "i")
						.replace("ó", "o")
						.replace("ú", "u");
		
		TipoDeAtraccion tipoDeAtraccion = tipoDeAtraccionService.create(name);
		
			req.setAttribute("flash", tipoDeAtraccion);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/administrador/agregar.do");
			dispatcher.forward(req, resp);

	}
}
