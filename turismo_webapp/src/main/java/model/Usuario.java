package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import persistence.dao.DAOFactory;
import utils.Crypt;


public class Usuario {

	private List<Atraccion> itinerario = new ArrayList<Atraccion>();

	private String nombre, password;
	private TipoDeAtraccion atraccionFavorita;
	private int presupuesto, monedasIniciales;
	private float tiempoDisponible, tiempoDisponibleOriginal;
	private int id;
	private boolean esAdmin;

	private HashMap<String, String> errors;
	
	public Usuario(String nombre, TipoDeAtraccion atraccionFavorita, int monedas, float tiempoLibre, String password, boolean esAdmin, int id) {
		this.nombre = nombre;
		this.atraccionFavorita = atraccionFavorita;
		this.presupuesto = monedas;
		this.monedasIniciales = this.presupuesto;
		this.tiempoDisponible = tiempoLibre;
		this.tiempoDisponibleOriginal = this.tiempoDisponible;
		this.password = password;
		this.esAdmin = esAdmin;
		this.id=id;
	}

	public Usuario() {
		this(" ", null, 0, 0,"",false, 0);
	}

	//----------------------------GETTERS---------------------------------------------------
	public int getPresupuesto() {
		return presupuesto;
	}

	public void setPresupuesto(int monedas) {
		this.presupuesto= monedas;
		this.monedasIniciales=monedas;
	}
	
	public List<Atraccion> getItinerario() {
		return itinerario;
	}

	public float getTiempoDisponible() {
		return tiempoDisponible;
	}
	
	public void setTiempoDisponible(float tiempo) {
		this.tiempoDisponible= tiempo;
	}

	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre= nombre;
	}

	public String getNombreAtraccionFavorita() {
		return this.atraccionFavorita.getNombre();
	}

	public TipoDeAtraccion getAtraccionFavorita() {
		return this.atraccionFavorita;
	}
	
	public void setTipoFavorito(TipoDeAtraccion tipo) {
		this.atraccionFavorita= tipo;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = Crypt.hash(password);
	}
	
	public boolean getEsAdmin() {
		return esAdmin;
	}
	
	public void setAdmin(boolean admin) {
		this.esAdmin= admin;
	}

	public void setItinerario(List<Atraccion> nuevoItinerario) {
		this.itinerario = nuevoItinerario;
	}
//-------------------------------METODOS----------------------------
	
	
	public void vaciarItinerario() {
		this.itinerario=new ArrayList<Atraccion>();
	}
	
	public String itinerarioToString() {
		String retorno="";
		if(itinerario.size()<1) {
			retorno="[vacio] \n";
		} else {
			for (int i = 0; i < itinerario.size(); i++) {
				retorno += itinerario.get(i).getNombre();
				retorno += "\n";
			}
		}
		
		return retorno;
	}
	
	public boolean isValid() {
		validate();
		return errors.isEmpty();
	}
	
	public boolean isValid2() {
		validate2();
		return errors.isEmpty();
	}
	
	public void validate() {
		errors = new HashMap<String, String>();

		if (this.presupuesto <= 0) {
			errors.put("monedas", "Cantidad de monedas no debe ser negativa ni cero");
		}
		if (this.tiempoDisponible <= 0) {
			errors.put("tiempo", "Tiempo no debe ser negativo ni cero");
		}
		List<Usuario> usuarios=DAOFactory.getUsuarioDAO().findAll();
		int repeticiones=0;
		for(Usuario usuario : usuarios) {
			if(this.nombre.equals(usuario.getNombre())) {
				repeticiones++;
			}
		}
		if(repeticiones>0) {
			errors.put("nombre", "Nombre repetido, ingrese un nombre nuevo");
		}
	}
	//validador para cuando el usuario ya esta en la base de datos
	public void validate2() {
		errors = new HashMap<String, String>();

		if (this.presupuesto <= 0) {
			errors.put("monedas", "Cantidad de monedas no debe ser negativa ni cero");
		}
		if (this.tiempoDisponible <= 0) {
			errors.put("tiempo", "Tiempo no debe ser negativo ni cero");
		}
		//recorro todos los usuarios
		List<Usuario> usuarios=DAOFactory.getUsuarioDAO().findAll();
		//acumulador que cuenta cuando encuentra el mismo nombre en la base de datos,
		//si se encuentra mas de una vez, es decir esta repetido, da error
		int repeticiones=0;
		for(Usuario usuario : usuarios) {
			if(this.nombre.equals(usuario.getNombre())) {
				repeticiones++;
			}
		}
		if(repeticiones>1) {
			errors.put("nombre", "Nombre repetido, ingrese un nombre nuevo");
		}
	}
	
	public Map<String, String> getErrors() {
		return errors;
	}
	
	@Override
	public String toString() {
		return this.nombre + ": Gasto " + (this.monedasIniciales - this.presupuesto) + " monedas.\n" + "Pasara "
				+ (this.tiempoDisponibleOriginal - this.tiempoDisponible)
				+ " horas en tierra media.\nSu tipo de atraccion favorito es: " + this.getNombreAtraccionFavorita()
				+ ".\nSu itinerario es: " + this.getItinerario() + ".";
	}
	
	//Datos para validar en junit
	public String userInfo() {
		return this.nombre + " tiene " + this.presupuesto + " monedas, " + (int) (this.tiempoDisponible)
				+ " horas libres y su tipo de atraccion favorito es " + this.getNombreAtraccionFavorita().toLowerCase();
	}
	
	// a usarse cuando el usuario clickea aceptar
	public void agregarAtraccion(Atraccion unaAtraccion) {
		this.itinerario.add(unaAtraccion);
		this.tiempoDisponible -= unaAtraccion.getTiempoDeUso();
	}
	
	

	public void agregarAlItinerario(Atraccion unaAtraccion) {
		this.itinerario.add(unaAtraccion);
	}

	//paga dependiendo si es una promocion o atraccion
	public void pagar(Promocion unaPromocion) {
		this.presupuesto -= unaPromocion.getValorPromo();
	}
	
	public void pagar(Atraccion unaAtraccion) {
		this.presupuesto -= unaAtraccion.getValor();
	}

	// Responde verdadero si tiene las monedas y el tiempo suficiente ---->
	// Verdadero, tengo dinero y tiempo para ir a...
	public boolean podesIrA(Atraccion atraccion) {

		return this.presupuesto >= atraccion.getValor() 
				&& this.tiempoDisponible >= atraccion.getTiempoDeUso() 
				&& todaviaNoVasA(atraccion);								  
	}
	
	public boolean podesIrA(Promocion promocion) {
		return this.presupuesto>= promocion.getValorPromo() 
				&& this.tiempoDisponible>= promocion.getTiempoDeUso() 
				&& todaviaNoVasA(promocion);
	}
	
	// Si todavia no tiene en el itinerario la atraccion que le pasan como
	// parametro, da true --> Verdad, todavia no voy a .....
	public boolean todaviaNoVasA(Atraccion unaAtraccion) {

		for (Atraccion misAtracciones : this.itinerario) {
			if (misAtracciones.getNombre().equals(unaAtraccion.getNombre())) {
				return false;
			}
		}
		return true;
	}
	
	public boolean todaviaNoVasA(Promocion promocion) {

		for(Atraccion atraccionPromo : promocion.getAtraccionesEnPromocion()) {
			for (Atraccion misAtracciones : this.itinerario) {
				if(misAtracciones.getNombre().equals(atraccionPromo.getNombre())) {
					return false;
				}
			}
		}
		return true;
	}
	
	
	public boolean checkPassword(String password) {
		// this.password en realidad es el hash del password
		return Crypt.match(password, this.password);
	}
	
	public boolean isNull() {
		return false;
	}
	
	
//----------------------equals y hashcode------------
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((atraccionFavorita == null) ? 0 : atraccionFavorita.hashCode());
		result = prime * result + ((itinerario == null) ? 0 : itinerario.hashCode());
		result = prime * result + monedasIniciales;
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		result = prime * result + presupuesto;
		result = prime * result + Float.floatToIntBits(tiempoDisponible);
		result = prime * result + Float.floatToIntBits(tiempoDisponibleOriginal);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		if (atraccionFavorita != other.atraccionFavorita)
			return false;
		if (itinerario == null) {
			if (other.itinerario != null)
				return false;
		} else if (!itinerario.equals(other.itinerario))
			return false;
		if (monedasIniciales != other.monedasIniciales)
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (presupuesto != other.presupuesto)
			return false;
		if (Float.floatToIntBits(tiempoDisponible) != Float.floatToIntBits(other.tiempoDisponible))
			return false;
		if (Float.floatToIntBits(tiempoDisponibleOriginal) != Float.floatToIntBits(other.tiempoDisponibleOriginal))
			return false;
		return true;
	}
}