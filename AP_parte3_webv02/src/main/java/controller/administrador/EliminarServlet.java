package controller.administrador;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.Promocion;
import model.TipoDeAtraccion;
import services.AttractionService;
import services.PromocionService;
import services.TipoDeAtraccionService;

@WebServlet("/administrador/eliminar.do")
public class EliminarServlet extends HttpServlet {

	private static final long serialVersionUID = -3633941772706036477L;

	private AttractionService atraccionService;
	private TipoDeAtraccionService tipoDeAtraccionService;
	private PromocionService promocionService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService = new AttractionService();
		this.tipoDeAtraccionService= new TipoDeAtraccionService();
		this.promocionService= new PromocionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Atraccion> attractions = atraccionService.list();
		req.setAttribute("attractions", attractions);
		
		List<TipoDeAtraccion> tiposDeAtraccion = tipoDeAtraccionService.list();
		req.setAttribute("tiposDeAtraccion", tiposDeAtraccion);

		List<Promocion> promociones = promocionService.list();
		req.setAttribute("promociones", promociones);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/eliminar.jsp");
		dispatcher.forward(req, resp);

	}
}
