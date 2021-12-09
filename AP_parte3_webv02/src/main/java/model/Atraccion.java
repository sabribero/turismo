package model;

import java.util.HashMap;
import java.util.Map;

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
		this(" ", 0, 0,0, TipoDeAtraccion.DEFAULT,0);
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
		return this.tipo.getNombreDeTipo();
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
		
		if(this.usosDisponibles>=1) {
			
			return true;
		}else {
			
			return false;
		}
		
	}
	
	
	
	public boolean isValid() {
		validate();
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
	}
	
	public Map<String, String> getErrors() {
		return errors;
	}

	//--------------equals y hashcode----------------

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		long temp;
		temp = Double.doubleToLongBits(tiempoDeUso);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
		result = prime * result + usosDisponibles;
		result = prime * result + valor;
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
		Atraccion other = (Atraccion) obj;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (Double.doubleToLongBits(tiempoDeUso) != Double.doubleToLongBits(other.tiempoDeUso))
			return false;
		if (tipo != other.tipo)
			return false;
		if (usosDisponibles != other.usosDisponibles)
			return false;
		if (valor != other.valor)
			return false;
		return true;
	}   
	
	
}