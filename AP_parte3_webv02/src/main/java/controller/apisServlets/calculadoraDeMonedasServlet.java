package controller.apisServlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;





@WebServlet("/apisServlets/calcular.do")
public class calculadoraDeMonedasServlet extends HttpServlet{

float valorMonedaEnArs=200;

int cantidadMonedas=-1;


	private static final long serialVersionUID = -1732675137217876732L;


		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			

			Integer cantidad = Integer.parseInt(req.getParameter("cantidadDeDinero"));
			
			
			
			Boolean esPesos = Boolean.getBoolean(req.getParameter("selec_peso"));
			Boolean esDolar = Boolean.getBoolean(req.getParameter("selec_dolar"));
			Boolean esEuro = Boolean.getBoolean(req.getParameter("selec_euro"));
;
		//	float valorDolar = Float.parseFloat(req.getParameter("moneda.getARS"));
			//float valorEuro = Float.parseFloat(req.getParameter("moneda.getEUR"));


			if (esPesos) {
				
				cantidadMonedas= Float.floatToIntBits(cantidad/valorMonedaEnArs);


		} else {if(esDolar) {
			
			//cantidadMonedas= Float.floatToIntBits((cantidad*valorDolar)/valorMonedaEnArs);
			
		} else { if(esEuro){
			
			
			//cantidadMonedas= Float.floatToIntBits(((cantidad*valorDolar)/valorEuro)/valorMonedaEnArs);
			
			
			
			
		}
			
			
			
			
			
			
			
		}
			
		
		
		
		
		
		}
			System.out.println(req.getParameter("selec_peso"));
			System.out.println(cantidad);
			System.out.println(esPesos);
			
			req.setAttribute("monedasCompradas", cantidadMonedas);
			
			
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/user/monedero.jsp");
			dispatcher.forward(req, resp);
			
			

	}
		
		

		
}