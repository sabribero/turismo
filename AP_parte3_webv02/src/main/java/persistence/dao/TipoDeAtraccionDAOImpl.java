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
	
	public TipoDeAtraccion toTipoDeAtraccion(ResultSet resultado) {
		try {
			return TipoDeAtraccion.valueOf(resultado.getString("tipo_de_atraccion"));
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
}