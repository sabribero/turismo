package controller.apisServlets;

import java.io.IOException;
import java.net.http.HttpClient;
import java.net.URI;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import gsons.monedaGson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/apisServlets/moneda.do")
public class monedaServlet extends HttpServlet implements Servlet {

		


	/**
	 * 
	 */
	private static final long serialVersionUID = -55868458734814184L;

	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

				
				
				
				
				HttpRequest request = HttpRequest.newBuilder().uri(URI.create("https://freecurrencyapi.net/api/v2/latest?apikey=d4b5aea0-59d3-11ec-814a-8fa67cd735f5&base_currency=USD") ).GET().build();

				
				HttpClient client = HttpClient.newHttpClient();
				
				
				
				HttpResponse<String> response=null;
				try {
					response = client.send(request, HttpResponse.BodyHandlers.ofString());
				} catch (IOException | InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				String json = (response.body());
				
				String cutJson= json.substring(json.indexOf("data")+6, json.length()-1);
				
				
				//System.out.println(json);
				
				GsonBuilder builder = new GsonBuilder();
				Gson gson = builder.create();
				
				
				monedaGson valormoneda = gson.fromJson(cutJson, monedaGson.class);
				
				
				
				//System.out.println(cutJson);
				//System.out.println(valormoneda.getARS());
				
				
				float euronumero= (Float.parseFloat(valormoneda.getARS())/Float.parseFloat(valormoneda.getEUR()));
				
				String euro = Float.toString(euronumero);
				
				req.setAttribute("moneda", valormoneda);
				
				req.setAttribute("valoreuro", euro);
				
				
				
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/user/monedero.jsp");
				dispatcher.forward(req, resp);

				
				
	    		//resp.sendRedirect("/AP_parte3_webv02/views/user/monedero.jsp");  
			
				/*
				
				String json= response.body();
				
				
				GsonBuilder builder = new GsonBuilder();
				Gson gson = builder.create();
				
				climaGson clima = gson.fromJson(json, climaGson.class);
				
				req.setAttribute("clima", clima);
				
				*/
		
				
		}
			
			
			
			
			


			



		}