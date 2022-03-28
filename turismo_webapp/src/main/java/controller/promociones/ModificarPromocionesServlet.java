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
		int id= Integer.parseInt(name);
		Integer cost = Integer.parseInt(req.getParameter("valor_promo"));
		// Integer cost = req.getParameter("cost").trim() == "" ? null : Integer.parseInt(req.getParameter("cost"));
		String atr1 = req.getParameter("seleccion_atr1_promo");
		String atr2 = req.getParameter("seleccion_atr2_promo");
		String atr3 = req.getParameter("seleccion_atr3_promo");

		Promocion promo = promocionService.update(id, cost, atr1, atr2, atr3);

			req.setAttribute("flash", promo);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/administrador/promociones.do");
			dispatcher.forward(req, resp);
	}
}
