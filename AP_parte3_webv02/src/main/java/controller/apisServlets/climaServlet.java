package controller.apisServlets;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.Clima;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;





@WebServlet("/apisServlets/clima.do")
public class climaServlet extends HttpServlet{

/**
	 * 
	 */
	private static final long serialVersionUID = 2106454382593919517L;

float valorMonedaEnArs=200;

int cantidadMonedas=-1;





		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			

			HttpRequest request = HttpRequest.newBuilder().uri(URI.create("https://ws.smn.gob.ar/map_items/forecast/1")).GET().build();
			
			
			HttpClient client = HttpClient.newHttpClient();
			
			
			HttpResponse<String> response=null;
			try {
				response = client.send(request, HttpResponse.BodyHandlers.ofString());
			} catch (IOException | InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String json= response.body();
			
			
			
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.create();
			
			//Clima clima = gson.fromJson(json, Clima.class);
			
			Clima[] c = gson.fromJson(json, Clima[].class);
			

		/*	
			for(int i=0; i<c.length; i++) {
				
				System.out.println(i + c[i].toString());
				
			}
		*/
			Clima parana=  c[132];

		
			
		

			
			req.setAttribute("parana", parana);
			
			
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/user/climaTierraMedia.jsp");
			dispatcher.forward(req, resp);
			
		}

	
		
		

		

	
	
	
	
	
	
	
	
	
	
	
	
		
	/*	
		HttpRequest request = HttpRequest
				.newBuilder()
				.uri(URI.create("https://weatherbit-v1-mashape.p.rapidapi.com/forecast/minutely?lat=-37.73&lon=-60.53"));
				.addHeader("x-rapidapi-host", "weatherbit-v1-mashape.p.rapidapi.com")
				.addHeader("x-rapidapi-key", "d7f15d82c7msheb550697bf1d319p15c821jsne027b6a4ed61")
				.GET()
				.build();
			
			
			HttpClient client = HttpClient.newHttpClient();

			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			
			String json= response.body();
			
			
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.create();
			
			climaGson clima = gson.fromJson(json, climaGson.class);
			
			req.setAttribute("clima", clima);
			*/
			
	}
		

