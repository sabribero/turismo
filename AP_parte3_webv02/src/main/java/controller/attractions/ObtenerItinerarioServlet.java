package controller.attractions;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.Promocion;
import services.AttractionService;
import services.PromocionService;


@WebServlet("/attractions/itinerario.do")
public class ObtenerItinerarioServlet extends HttpServlet implements Servlet {


		private static final long serialVersionUID = -8346640902238722429L;
		private AttractionService attractionService;
		private PromocionService promocionService;

		@Override
		public void init() throws ServletException {
			super.init();
			this.attractionService = new AttractionService();
			this.promocionService = new PromocionService();
		}

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			List<Atraccion> attractions = attractionService.listItinerario(8);
			req.setAttribute("attractions", attractions);
			

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/user/itinerario.jsp");
			dispatcher.forward(req, resp);

		}

	}