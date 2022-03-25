package persistence.dao;

import java.util.List;

import model.Itinerario;

public interface  ItinerarioDAO{
	
	public List<Itinerario> findAll();
	public int countAll();
	public int cargarItinerario(Itinerario itinerario);
	public Itinerario toItinerario(List<Integer> listadoAtracciones, int nUsuario);

}
