package controller.user;

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
import model.Usuario;
import services.OfertadorService;

@WebServlet("/user/ofertador.do")
public class OfertadorServlet extends HttpServlet {

	private static final long serialVersionUID = -3645990588712781146L;
	private OfertadorService ofertadorService;

	List<Atraccion> atraccionesFavoritas;
	List<Atraccion> atraccionesNoFavoritas;
	List<Promocion> promocionesFavoritas;
	List<Promocion> promocionesNoFavoritas;

	@Override
	public void init() throws ServletException {
		super.init();
		this.ofertadorService = new OfertadorService();
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Usuario usuario= (Usuario)req.getSession().getAttribute("user");

		this.ofertadorService.inicializar();
		this.ofertadorService.ofertar(usuario);
		
		this.promocionesFavoritas= this.ofertadorService.getPromocionesFavoritas();
		this.atraccionesFavoritas= this.ofertadorService.getAtraccionesFavoritas();
		this.promocionesNoFavoritas= this.ofertadorService.getPromocionesNoFavoritas();
		this.atraccionesNoFavoritas= this.ofertadorService.getAtraccionesNoFavoritas();
		
		int contador= promocionesFavoritas.size() + atraccionesFavoritas.size() + promocionesNoFavoritas.size() + atraccionesNoFavoritas.size() ;
		
		req.setAttribute("cantidad", contador);
		req.setAttribute("usuario", usuario);
		req.setAttribute("promocionesFavoritas", promocionesFavoritas);
		req.setAttribute("atraccionesFavoritas", atraccionesFavoritas);
		req.setAttribute("promocionesNoFavoritas", promocionesNoFavoritas);
		req.setAttribute("atraccionesNoFavoritas", atraccionesNoFavoritas);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/user/sugeridor.jsp");
		dispatcher.forward(req, resp);

	}
}
