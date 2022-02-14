package controller.promociones;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import persistence.dao.DAOFactory;
import services.ComprarPromocionService;

@WebServlet("/promociones/buy.do")
public class ComprarPromocionServlet extends HttpServlet {

	private static final long serialVersionUID = 1235790159126305127L;
	private ComprarPromocionService comprarPromocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.comprarPromocionService = new ComprarPromocionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		Usuario user = (Usuario) req.getSession().getAttribute("user");
		Map<String, String> errors = comprarPromocionService.buy(user.getNombre(), id);
		
		Usuario user2 = DAOFactory.getUsuarioDAO().findByNombre(user.getNombre());
		req.getSession().setAttribute("user", user2);
		
		if (errors.isEmpty()) {
			req.setAttribute("flash", "¡Gracias por comprar!");
		} else {
			req.setAttribute("errors", errors);
			req.setAttribute("flash", "No ha podido realizarse la compra");
		}

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/user/ofertador.do");
		dispatcher.forward(req, resp);
	}
}
