package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import persistence.dao.DAOFactory;

public class Atraccion {

	private String nombre;
	private int valor;
	private double tiempoDeUso;
	private int usosDisponibles, borrado;
	public int getBorrado() {
		return borrado;
	}

	public void setBorrado(int borrado) {
		this.borrado = borrado;
	}

	private TipoDeAtraccion tipo;
	
	private Map<String, String> errors;

	
	public Atraccion( String nombre, int valor, double tiempoDeUso, int usosMaximos, TipoDeAtraccion tipo, int borrado) {

		this.nombre=nombre;
		this.valor=valor;
		this.tiempoDeUso=tiempoDeUso;
		this.usosDisponibles=usosMaximos;
		this.tipo=tipo;
		this.borrado=borrado;
		

	}

	//constructor por defecto
	public Atraccion() {
		this(" ", 0, 0,0, null,0);
	}

//--------------------------GETTERS----------------------------------
	public int getValor() {
		return this.valor;
	}

	public double getTiempoDeUso() {
		return this.tiempoDeUso;
	}

	public int getUsosDisponibles() {
		return this.usosDisponibles;

	}
	public TipoDeAtraccion getTipo() {
		return tipo;
	}
	
	public String getNombreTipo() {
		return this.tipo.getNombre();
	}


	public String getNombre() {
		return this.nombre;
	}

	public boolean borrado() {
		return this.borrado!=0;
	}
	//--------------------SETTERS----------------

	protected void setTipo(TipoDeAtraccion tipo) {
		this.tipo = tipo;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}

	public void setTiempoDeUso(double tiempoDeUso) {
		this.tiempoDeUso = tiempoDeUso;
	}

	public void setUsosDisponibles(int usosDisponibles) {
		this.usosDisponibles = usosDisponibles;
	}

	//-----------------METODOS---------------------
	//Reescribe el toString de la superclase para poder usarlo en println
    @Override
    public String toString() {
        return nombre;
    }

	public void reservarLugar(Usuario unUsuario) {
		this.usosDisponibles-=1;
		unUsuario.agregarAtraccion(this);
	}
	
	public boolean podesRecibir() {
		return this.usosDisponibles>=1;
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

		if ( valor<= 0) {
			errors.put("cost", "Debe ser positivo");
		}
		if (this.tiempoDeUso <= 0) {
			errors.put("duration", "Debe ser positivo");
		}
		if (this.usosDisponibles <= 0) {
			errors.put("capacity", "Debe ser positivo");
		}

		List<Atraccion> atracciones=DAOFactory.getAtraccionDAO().findAllConBorrados();
		int repeticiones=0;
		for(Atraccion atraccion: atracciones) {
			if(this.nombre.equals(atraccion.getNombre())) {
				repeticiones++;
			}
		}
		if(repeticiones>0) {
			errors.put("nombre", "Nombre repetido, ingrese un nombre nuevo");
		}
	}
	//para modificacion, acepta que el nombre ya este 1 vez en la base de datos
	public void validate2() {
		errors = new HashMap<String, String>();

		if ( valor<= 0) {
			errors.put("cost", "Debe ser positivo");
		}
		if (this.tiempoDeUso <= 0) {
			errors.put("duration", "Debe ser positivo");
		}
		if (this.usosDisponibles <= 0) {
			errors.put("capacity", "Debe ser positivo");
		}

		List<Atraccion> atracciones=DAOFactory.getAtraccionDAO().findAllConBorrados();
		int repeticiones=0;
		for(Atraccion atraccion: atracciones) {
			if(this.nombre.equals(atraccion.getNombre())) {
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


	//--------------equals y hashcode----------------	
	
	@Override
	public int hashCode() {
		return Objects.hash(borrado, nombre, tiempoDeUso, tipo, valor);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Atraccion other = (Atraccion) obj;
		return borrado == other.borrado && Objects.equals(nombre, other.nombre)
				&& Double.doubleToLongBits(tiempoDeUso) == Double.doubleToLongBits(other.tiempoDeUso)
				&& Objects.equals(tipo, other.tipo) && valor == other.valor;
	}


	  
	
	
}