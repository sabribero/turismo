package persistence.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import excepciones.MissingDataException;
import jdbc.ConnectionProvider;
import model.Atraccion;
import model.Itinerario;
import model.Usuario;


public class ItinerarioDAOImpl implements ItinerarioDAO {
	
	UsuarioDAOImpl usuarioDAO = DAOFactory.getUsuarioDAO();
	AtraccionDAOImpl atraccionDAO= DAOFactory.getAtraccionDAO();
	
	public List<Itinerario> findAll() {
		try {
		String sql = "SELECT * FROM itinerarios";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultados = statement.executeQuery();

		//lista con todos los itinerarios
		List<Itinerario> itinerarios = new LinkedList<Itinerario>();
		//variables que acumulan las atracciones del mismo usuario para pasarselo al toItinerario, ya que el Itinerario contiene una lista
		int usuarioId=0;
		int aux= usuarioId;
		List<Integer> mismoUsuario= new ArrayList<Integer>();
		while (resultados.next()) {
			aux=resultados.getInt("id_usuario");
			//si el usuario es el mismo que el del resultado anterior, sólo se acumula el resultado, si no, se pasa el anterior
			//y se acumula el presente
			if(usuarioId==aux){
				//itinerarios.add(toItinerario(resultados));
				mismoUsuario.add(resultados.getInt("id_atr"));
			} else {
				itinerarios.add(toItinerario(mismoUsuario, aux));
				mismoUsuario.clear();
				mismoUsuario.add(resultados.getInt("id_atr"));
			}
			usuarioId=aux;
		}
		
		
		return itinerarios;
		
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int countAll() {
		try {
			String sql = "SELECT count(1) AS 'total' FROM itinerarios";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			resultados.next();
			int total = resultados.getInt("total");

			
			return total;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int cargarItinerario(Itinerario itinerario) {
		try {
			Usuario usuario= itinerario.getUsuario();
			List<Atraccion> atracciones= itinerario.getAtracciones();
			
			String sql = "INSERT INTO itinerarios (id_usuario, id_atr) VALUES (?, ?)";
			

			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			int rows=0;
			
			for(Atraccion atraccion : atracciones) {
				statement.setInt(1, DAOFactory.getUsuarioDAO().findIDByNombre(usuario.getNombre()));
				statement.setInt(2, DAOFactory.getAtraccionDAO().findIDByNombre(atraccion.getNombre()));
				rows= statement.executeUpdate();
			}
			
			
			return rows;
			
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}

	public Itinerario toItinerario(List<Integer> listadoAtracciones, int nUsuario) {
		try {
			List<Atraccion> atracciones= new ArrayList<Atraccion>();
			
			Usuario usuario=usuarioDAO.findByID(nUsuario);
			Atraccion aux;
			
			for(Integer nAtraccion : listadoAtracciones) {
				aux= atraccionDAO.findByID(nAtraccion);
				atracciones.add(aux);
			}
			
			return new Itinerario(atracciones, usuario);
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	



}


