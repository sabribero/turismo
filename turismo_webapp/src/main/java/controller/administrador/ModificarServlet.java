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
import model.TipoDeAtraccion;
import model.Usuario;
import services.AttractionService;
import services.PromocionService;
import services.TipoDeAtraccionService;
import services.UsuarioService;

@WebServlet("/administrador/modificar.do")
public class ModificarServlet extends HttpServlet {

	private static final long serialVersionUID = -1009562989770731291L;
	
	private AttractionService atraccionService;
	private TipoDeAtraccionService tipoDeAtraccionService;
	private PromocionService promocionService;
	private UsuarioService usuarioService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService = new AttractionService();
		this.tipoDeAtraccionService= new TipoDeAtraccionService();
		this.promocionService= new PromocionService();
		this.usuarioService= new UsuarioService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Atraccion> attractions = atraccionService.list();
		req.setAttribute("attractions", attractions);
		
		List<TipoDeAtraccion> tiposDeAtraccion = tipoDeAtraccionService.list();
		req.setAttribute("tiposDeAtraccion", tiposDeAtraccion);

		List<Promocion> promociones = promocionService.list();
		req.setAttribute("promociones", promociones);

		List<Usuario> usuarios = usuarioService.list();
		req.setAttribute("usuarios", usuarios);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/modificar.jsp");
		dispatcher.forward(req, resp);

	}

	//doPost utiliza doGet ya que accedemos a el solo desde el request dispatcher de cualquier edit.do
		@Override
		public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			req.setAttribute("flash", req.getAttribute("flash"));
			
			this.doGet(req, resp);
		}
	
}
