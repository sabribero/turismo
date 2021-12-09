package controller.promociones;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Promocion;
import services.PromocionService;

@WebServlet("/promociones/edit.do")
public class ModificarPromocionesServlet extends HttpServlet {

	private static final long serialVersionUID = -2258815988587842326L;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("seleccion_promo");
		Integer cost = Integer.parseInt(req.getParameter("valor_promo"));
		// Integer cost = req.getParameter("cost").trim() == "" ? null : Integer.parseInt(req.getParameter("cost"));
		String atr1 = req.getParameter("seleccion_atr1_promo");
		String atr2 = req.getParameter("seleccion_atr2_promo");
		String atr3 = req.getParameter("seleccion_atr3_promo");

		Promocion promo = promocionService.update(name, cost, atr1, atr2, atr3);

		if (promo.isValid()) {
//TODO mensaje de todo bien
			resp.sendRedirect("/AP_parte3_webv02/administrador/modificar.do");
		} else {
			req.setAttribute("promocion", promo);
//TODO mensaje de todo mal
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/administrador/modificar.do");
			dispatcher.forward(req, resp);
		}
	}
}
