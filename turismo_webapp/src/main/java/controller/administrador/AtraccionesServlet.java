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
import model.TipoDeAtraccion;
import services.AttractionService;
import services.TipoDeAtraccionService;

@WebServlet("/administrador/atracciones.do")
public class AtraccionesServlet extends HttpServlet {

	private static final long serialVersionUID = -8671958220683750742L;
	private AttractionService atraccionService;
	private TipoDeAtraccionService tipoDeAtraccionService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService= new AttractionService();
		this.tipoDeAtraccionService= new TipoDeAtraccionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Atraccion> atracciones = atraccionService.list();
		List<TipoDeAtraccion> tiposDeAtraccion = tipoDeAtraccionService.list();
		req.setAttribute("atracciones", atracciones);
		req.setAttribute("tiposDeAtraccion", tiposDeAtraccion);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/atracciones.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Atraccion> atracciones = atraccionService.list();
		List<TipoDeAtraccion> tiposDeAtraccion = tipoDeAtraccionService.list();
		req.setAttribute("atracciones", atracciones);
		req.setAttribute("tiposDeAtraccion", tiposDeAtraccion);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/atracciones.jsp");
		dispatcher.forward(req, resp);

	}

}
