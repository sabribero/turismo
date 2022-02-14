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
import model.Usuario;
import model.nullobjects.NullUser;

public class UsuarioDAOImpl implements UsuarioDAO{

	public List<Usuario> findAll() {
		try {
		String sql = "SELECT * FROM usuarios WHERE borrado=0";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultados = statement.executeQuery();

		List<Usuario> usuarios = new LinkedList<Usuario>();
		while (resultados.next()) {
			Usuario usuario= toUsuario(resultados);
			if(usuario!=null) {
				usuarios.add(usuario);
			}
		}

		return usuarios;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	//para validaciones
	public List<Usuario> findAllConBorrados() {
		try {
		String sql = "SELECT * FROM usuarios";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet resultados = statement.executeQuery();

		List<Usuario> usuarios = new LinkedList<Usuario>();
		while (resultados.next()) {
			Usuario usuario= toUsuario(resultados);
			if(usuario!=null) {
				usuarios.add(usuario);
			}
		}

		return usuarios;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int countAll() {
		try {
			String sql = "SELECT count(1) AS 'total' FROM usuarios WHERE borrado=0";
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

	public int insert(Usuario usuario) {
		try {
			String sql = "INSERT INTO usuarios (nombre, monedas, tiempo_libre, ID_tipo_favorito, password, esAdmin) VALUES (?, ?, ?, (SELECT ID FROM tipos_atraccion WHERE tipo_de_atraccion LIKE ?),?,?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			statement.setInt(2, usuario.getPresupuesto());
			statement.setDouble(3, usuario.getTiempoDisponible());
			statement.setString(4, usuario.getAtraccionFavorita().getNombre());
			statement.setString(5,usuario.getPassword());
			statement.setBoolean(6, usuario.getEsAdmin());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int update(Usuario usuario) {
		try {
			String sql = "UPDATE usuarios SET monedas = ?, tiempo_libre = ?, esAdmin = ? WHERE nombre = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, usuario.getPresupuesto());
			statement.setDouble(2, usuario.getTiempoDisponible());
			statement.setBoolean(3, usuario.getEsAdmin());
			statement.setString(4, usuario.getNombre());
			int rows = statement.executeUpdate();

			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int modificar(Usuario usuario, int id) {
		try {
			String sql = "UPDATE usuarios SET nombre= ?, monedas = ?, tiempo_libre = ?, ID_tipo_favorito=(SELECT ID FROM tipos_atraccion WHERE tipo_de_atraccion = ?), password=?, esAdmin = ? WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			statement.setInt(2, usuario.getPresupuesto());
			statement.setDouble(3, usuario.getTiempoDisponible());
			statement.setString(4, usuario.getNombreAtraccionFavorita());
			statement.setString(5, usuario.getPassword());
			if(usuario.getEsAdmin()) {
				statement.setInt(6, 1);
			} else {
				statement.setInt(6, 0);
			}
			statement.setInt(7, id);
			int rows = statement.executeUpdate();

			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int updatepassword (Usuario usuario) {
		try {
			String sql = "UPDATE usuarios SET password = ? WHERE nombre = ?";
			
			Connection conn = ConnectionProvider.getConnection();
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getPassword());
			statement.setString(2, usuario.getNombre());
			int rows = statement.executeUpdate();

			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int delete(Usuario usuario) {
		try {
			String sql = "DELETE FROM usuarios WHERE nombre = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			int rows = statement.executeUpdate();

			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public int borradoLogico(Usuario usuario) {
		try {
			String sql = "UPDATE usuarios SET borrado=1 WHERE nombre = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
		
	}
	

	public Usuario findByNombre(String nombre) {
		try {
			String sql = "SELECT * FROM usuarios WHERE nombre = ? AND borrado=0";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, nombre);
			ResultSet resultados = statement.executeQuery();

			Usuario usuario = NullUser.build();

			if (resultados.next()) {
				usuario = this.toUsuario(resultados);
			}
			return usuario;
		} catch(Exception e) {
			throw new MissingDataException(e);

		}
	}
	
	
	public Usuario findByID(int ID) {
		try {
			String sql = "SELECT * FROM usuarios WHERE ID = ? AND borrado=0";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setLong(1, ID);
			ResultSet resultados = statement.executeQuery();

			Usuario usuario = null;

			if (resultados.next()) {
				usuario = toUsuario(resultados);
			}
			
			return usuario;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	
	public int findIDByNombre(String nombre) {
		try {
			String sql = "SELECT ID FROM usuarios WHERE nombre = ? AND borrado=0";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, nombre);
			ResultSet resultados = statement.executeQuery();

			

			return resultados.getInt("ID");
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}

	public Usuario toUsuario(ResultSet resultado) {
		try {
			//primero obtengo el valor de tipo de atraccion para pasarlo a String, ya que en la tabla es una FK
			String sql = "SELECT a.ID, tipo_de_atraccion, a.borrado FROM tipos_atraccion a JOIN usuarios u ON a.id=u.ID_tipo_favorito WHERE u.id = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, resultado.getInt("ID"));
			ResultSet resultadoDos = statement.executeQuery();
			//lo guardo en variable
			boolean estado=false;
			if(resultadoDos.getInt("borrado")==1) {
				estado=true;
			}
			
			TipoDeAtraccion tipoAtraccion= new TipoDeAtraccion(resultadoDos.getInt("ID") ,resultadoDos.getString("tipo_de_atraccion"), estado);
			
			if(tipoAtraccion.getBorrado()) {
				return null;
			}
			
			Usuario usuario=new Usuario(resultado.getString("nombre"), tipoAtraccion,
					resultado.getInt("monedas"), resultado.getFloat("tiempo_libre"), resultado.getString("password"), resultado.getBoolean("esAdmin"), resultado.getInt("ID"));
			//le cargo su itinerario
			
			List<Atraccion> itinerario= DAOFactory.getAtraccionDAO().findItinerarioById(resultado.getInt("ID"));
			usuario.setItinerario(itinerario);
			//retorno el objeto
			return usuario;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}
	
}
