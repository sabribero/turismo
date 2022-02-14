package controller.promociones;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.PromocionService;

@WebServlet("/promociones/delete.do")
public class EliminarPromocionesServlet extends HttpServlet {

	private static final long serialVersionUID = 2050639169030648488L;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("seleccion_promo");

		promocionService.delete(name);
//TODO mostrar errores
		resp.sendRedirect("/turismo_webapp/administrador/eliminar.do");
	}
}
