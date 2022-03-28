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
import services.AttractionService;
import services.PromocionService;

@WebServlet("/administrador/promociones.do")
public class PromocionesServlet extends HttpServlet {

	private static final long serialVersionUID = -3692549631155639444L;
	private PromocionService promocionService;
	private AttractionService atraccionService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService= new PromocionService();
		this.atraccionService= new AttractionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Promocion> promociones = promocionService.list();
		List<Atraccion> atracciones = atraccionService.list();
		req.setAttribute("promociones", promociones);
		req.setAttribute("atracciones", atracciones);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/promociones.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Promocion> promociones = promocionService.list();
		List<Atraccion> atracciones = atraccionService.list();
		req.setAttribute("promociones", promociones);
		req.setAttribute("atracciones", atracciones);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/promociones.jsp");
		dispatcher.forward(req, resp);

	}
	
}
