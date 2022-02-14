package services;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import gsons.climaGson;






public class ClimaService {
	

	

		public climaGson leerClima(){
			
			
			HttpRequest request = HttpRequest
					.newBuilder()
					.uri("https://weatherbit-v1-mashape.p.rapidapi.com/forecast/minutely?lat=-37.73&lon=-60.53")
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
				
				
				
				
		}
			
			
			
			
		}
		

		




