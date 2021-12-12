package controller.promociones;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Promocion;
import model.TipoDePromo;
import services.PromocionService;

@WebServlet("/promociones/create.do")
public class CrearPromocionesServlet extends HttpServlet {

	private static final long serialVersionUID = -4300687329652525076L;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/agregar.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TipoDePromo tipo = TipoDePromo.valueOf(req.getParameter("tipo_promo"));
		int valor = Integer.parseInt(req.getParameter("valor_promo"));
		String atr1 = req.getParameter("atr1_promo");
		String atr2 = req.getParameter("atr2_promo");
		String atr3 = req.getParameter("atr3_promo");
		
		Promocion promocion = promocionService.create(tipo,valor, atr1, atr2, atr3);

			req.setAttribute("flash", promocion);
    		
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/administrador/agregar.do");
			dispatcher.forward(req, resp);

	}
}
