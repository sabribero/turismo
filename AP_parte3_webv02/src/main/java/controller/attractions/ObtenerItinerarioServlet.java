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
import model.Usuario;
import services.AttractionService;
import services.PromocionService;


@WebServlet("/attractions/itinerario.do")
public class ObtenerItinerarioServlet extends HttpServlet implements Servlet {


		private static final long serialVersionUID = -8346640902238722429L;
		private AttractionService attractionService;

		@Override
		public void init() throws ServletException {
			super.init();
			this.attractionService = new AttractionService();
		}

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			
			Usuario user = (Usuario) req.getSession().getAttribute("user");
			
			
			List<Atraccion> attractions = attractionService.listItinerario(user.getId());
			req.setAttribute("attractions", attractions);

			double acumulador=0;
			for(Atraccion atraccion : attractions) {
				acumulador+= atraccion.getTiempoDeUso();
			}

			req.setAttribute("tiempoTotal", acumulador);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/user/itinerario.jsp");
			dispatcher.forward(req, resp);

		}

	}