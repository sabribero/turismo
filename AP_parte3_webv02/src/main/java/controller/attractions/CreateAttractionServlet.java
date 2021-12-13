package controller.attractions;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import services.AttractionService;

@WebServlet("/attractions/create.do")
public class CreateAttractionServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private AttractionService attractionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.attractionService = new AttractionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/agregar.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("nombre_atraccion");
		Integer cost = Integer.parseInt(req.getParameter("valor_atraccion"));
		Double duration = Double.parseDouble(req.getParameter("tiempo_atraccion"));
		Integer capacity = Integer.parseInt(req.getParameter("cupos_atraccion"));
		String tipo= req.getParameter("seleccion_tipo_atraccion");

		Atraccion attraction = attractionService.create(name, cost, duration, capacity, tipo);
		
			req.setAttribute("flash", attraction);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/administrador/agregar.do");
			dispatcher.forward(req, resp);

	}

}
