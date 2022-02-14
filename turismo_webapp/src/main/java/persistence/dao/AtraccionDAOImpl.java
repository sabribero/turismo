package persistence.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import excepciones.MissingDataException;
import jdbc.ConnectionProvider;
import model.Atraccion;
import model.TipoDeAtraccion;

public class AtraccionDAOImpl implements AtraccionDAO{
	
	public List<Atraccion> findAll() {
		try {
		String sql = "SELECT * FROM atracciones WHERE borrado=0";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultados = statement.executeQuery();

		List<Atraccion> atracciones = new LinkedList<Atraccion>();
		while (resultados.next()) {
			Atraccion atraccion= toAtraccion(resultados);
			if(atraccion!=null) {
				atracciones.add(atraccion);
			}
		}
		return atracciones;
		} catch(Exception e) {
			throw new MissingDataException(e);
		} 
	}
	
	public List<Atraccion> findAllConBorrados() {
		try {
		String sql = "SELECT * FROM atracciones";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultados = statement.executeQuery();

		List<Atraccion> atracciones = new LinkedList<Atraccion>();
		while (resultados.next()) {
			Atraccion atraccion= toAtraccion(resultados);
			if(atraccion!=null) {
				atracciones.add(atraccion);
			}
		}
		return atracciones;
		} catch(Exception e) {
			throw new MissingDataException(e);
		} 
	}
	
	public List<Atraccion> findItinerarioById(int id) {
		try {
		String sql = "SELECT * FROM itinerarios WHERE id_usuario= ?";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet resultados = statement.executeQuery();

		List<Atraccion> atracciones = new LinkedList<Atraccion>();
		
		//Atraccion atr = new Atraccion();  
		String sql2 = "SELECT * FROM atracciones WHERE ID= ?";
		

		
		while (resultados.next()) {


			Connection conn2 = ConnectionProvider.getConnection();
			PreparedStatement statement2 = conn2.prepareStatement(sql2);
			statement2.setInt(1, resultados.getInt("id_atr"));
			ResultSet resultados2 = statement2.executeQuery();
			
			
			atracciones.add(toAtraccion(resultados2));
		}
		
		
		
		return atracciones;
		} catch(Exception e) {
			throw new MissingDataException(e);
		} 
	}
	
	public int countAll() {
		try {
			String sql = "SELECT count(1) AS 'total' FROM atracciones WHERE borrado=0";
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
	
	public int insert(Atraccion atraccion) {
		try {
			String sql = "INSERT INTO atracciones (nombre,valor,tiempo,usos_disponibles,ID_tipo_atraccion) VALUES (?, ?, ?, ?, (SELECT ID FROM tipos_atraccion WHERE tipo_de_atraccion LIKE ?))";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, atraccion.getNombre());
			statement.setInt(2, atraccion.getValor());
			statement.setDouble(3, atraccion.getTiempoDeUso());
			statement.setInt(4, atraccion.getUsosDisponibles());
			statement.setString(5, atraccion.getNombreTipo());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int update(Atraccion atraccion) {
		try {
			String sql = "UPDATE atracciones SET usos_disponibles = ? WHERE nombre = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, atraccion.getUsosDisponibles());
			statement.setString(2, atraccion.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int modificar(Atraccion atraccion) {
		try {
			String sql = "UPDATE atracciones SET valor = ?, tiempo = ? ,usos_disponibles = ? WHERE nombre = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, atraccion.getValor());
			statement.setDouble(2, atraccion.getTiempoDeUso());
			statement.setInt(3, atraccion.getUsosDisponibles());
			statement.setString(4, atraccion.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int delete(Atraccion atraccion) {
		try {
			String sql = "DELETE FROM atracciones WHERE nombre = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, atraccion.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int borradoLogico(Atraccion atraccion) {
		try {
			String sql = "UPDATE atracciones SET borrado=1 WHERE nombre = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, atraccion.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
		
	}
	
	public Atraccion findByNombre(String nombre) {
		try {
			String sql = "SELECT * FROM atracciones WHERE nombre = ? AND borrado=0";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, nombre);
			ResultSet resultados = statement.executeQuery();

			Atraccion atraccion = null;

			if (resultados.next()) {
				atraccion = toAtraccion(resultados);
			}
			
			return atraccion;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public Atraccion findByID(int ID) {
		try {
			String sql = "SELECT * FROM atracciones WHERE ID  = ? AND borrado=0";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setLong(1, ID);
			ResultSet resultados = statement.executeQuery();

			Atraccion atraccion = null;

			if (resultados.next()) {
				atraccion = toAtraccion(resultados);
			}
			
			return atraccion;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	
	public int findIDByNombre(String nombre) {
		try {
			String sql = "SELECT ID FROM atracciones WHERE nombre = ? AND borrado=0";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, nombre);
			ResultSet resultados = statement.executeQuery();



			return resultados.getInt("ID");
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public Atraccion toAtraccion(ResultSet resultado) {
		try {
			//primero obtengo el valor de tipo de atraccion para pasarlo a String, ya que en la tabla es una FK
			String sql = "SELECT ta.ID, tipo_de_atraccion, ta.borrado FROM tipos_atraccion ta LEFT JOIN atracciones a ON ta.id=a.ID_tipo_atraccion WHERE a.id = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, resultado.getInt("ID"));
			ResultSet resultadoDos = statement.executeQuery();
			
			boolean estado=false;
			if(resultadoDos.getInt("borrado")==1) {
				estado=true;
			}
			TipoDeAtraccion tipoAtraccion= new TipoDeAtraccion(resultadoDos.getInt("ID"), resultadoDos.getString("tipo_de_atraccion"), estado);
			
			if(!tipoAtraccion.getBorrado()) {
			//retorno el objeto
			return new Atraccion(resultado.getString("nombre"), resultado.getInt("valor"), resultado.getDouble("tiempo"), 
					resultado.getInt("usos_disponibles"), tipoAtraccion, resultado.getInt("borrado"));
			} else {
				return null;
			}
			
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
}
