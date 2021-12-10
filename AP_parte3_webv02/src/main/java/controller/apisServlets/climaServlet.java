package controller.apisServlets;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import gsons.climaGson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.Usuario;
import services.AttractionService;
import services.PromocionService;




@WebServlet("/apisServlets/clima")
public class climaServlet extends HttpServlet implements Servlet {

	
	
	
@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
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
		
		
		
		
		


		



	}

