package persistence.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import excepciones.MissingDataException;
import jdbc.ConnectionProvider;
import model.TipoDeAtraccion;

public class TipoDeAtraccionDAOImpl {

	public List<TipoDeAtraccion> findAll() {
		try {
		String sql = "SELECT * FROM tipos_atraccion WHERE borrado=0";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultados = statement.executeQuery();

		List<TipoDeAtraccion> tipos = new LinkedList<TipoDeAtraccion>();
		
		while (resultados.next()) {
			tipos.add(toTipoDeAtraccion(resultados));
		}
		
		
		return tipos;
		
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public List<TipoDeAtraccion> findAllConBorrados() {
		try {
		String sql = "SELECT * FROM tipos_atraccion";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultados = statement.executeQuery();

		List<TipoDeAtraccion> tipos = new LinkedList<TipoDeAtraccion>();
		
		while (resultados.next()) {
			tipos.add(toTipoDeAtraccion(resultados));
		}
		
		
		return tipos;
		
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int insert(TipoDeAtraccion tipo) {
		try {
			String sql = "INSERT INTO tipos_atraccion (tipo_de_atraccion) VALUES (?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, tipo.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int modificar(TipoDeAtraccion tipo, String original) {
		try {
			String sql = "UPDATE tipos_atraccion SET tipo_de_atraccion= ? WHERE tipo_de_atraccion = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, tipo.getNombre());
			statement.setString(2, original);
			int rows = statement.executeUpdate();

			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public TipoDeAtraccion findByNombre(String nombre) {
		try {
			String sql = "SELECT * FROM tipos_atraccion WHERE tipo_de_atraccion = ? AND borrado=0";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, nombre);
			ResultSet resultados = statement.executeQuery();

			TipoDeAtraccion tipo;

			if (resultados.next()) {
				tipo = this.toTipoDeAtraccion(resultados);
			} else {
				tipo=null;
			}
			return tipo;
		} catch(Exception e) {
			throw new MissingDataException(e);

		}
	}
	
	public TipoDeAtraccion toTipoDeAtraccion(ResultSet resultado) {
		try {
			return new TipoDeAtraccion(resultado.getInt("ID"),resultado.getString("tipo_de_atraccion"),false);
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
}
