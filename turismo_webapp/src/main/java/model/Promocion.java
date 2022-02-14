package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class Promocion {
	protected int valor, id;
	protected double tiempoPromo;
	protected TipoDeAtraccion tipoAtraccion;
	protected TipoDePromo tipo;
	protected List<Atraccion> atraccionesEnPromocion = new ArrayList<Atraccion>();
	

	protected Map<String, String> errors;

	public Promocion(int id, List<Atraccion> atraccionesEnPromo) {
		this.id=id;
		this.atraccionesEnPromocion = atraccionesEnPromo;
		this.setTiempo();
	}

	// --------------------------GETTERS----------------------


	public List<Atraccion> getAtraccionesEnPromocion() {
		return atraccionesEnPromocion;
	}
	
	public int getId() {
		return this.id;
	}
	
	public String getNombre() {
		
		String salida="";
		
		for(Atraccion cadaUna :this.getAtraccionesEnPromocion())
			salida += " "+cadaUna.getNombre() + ",";
			
		return salida;
	}
	
	public int getValorPromo() {
		return this.valor;
	}
	
	public double getTiempoDeUso() {
		return tiempoPromo;
	}

	public TipoDePromo getTipo() {
		return tipo;
	}

	public TipoDeAtraccion getTipoDeAtraccion() {
		//asumiendo que esta validado que todas las atracciones son del mismo tipo
		return this.atraccionesEnPromocion.get(0).getTipo();
	}
	
	public boolean tieneCupos() {
		for(Atraccion cadaAtraccion : this.atraccionesEnPromocion) {
			if(cadaAtraccion.getUsosDisponibles()<=0) {
				return false;
			}
		}
		return true;
	}
//-------------------------SETTERS--------------------
	public void setTiempo() {
		this.tiempoPromo=0;
		for(Atraccion cadaUna : atraccionesEnPromocion) {
			this.tiempoPromo += cadaUna.getTiempoDeUso();
		}
	}
	
	public void setValor(int nuevoValor) {
		this.valor= nuevoValor;
	}
	
	public void setAtraccionesEnPromocion(List<Atraccion> nuevasAtracciones) {
		this.getAtraccionesEnPromocion().set(0, nuevasAtracciones.get(0));
		this.getAtraccionesEnPromocion().set(1, nuevasAtracciones.get(1));	
		if(nuevasAtracciones.size()>2) {
			if(this.getAtraccionesEnPromocion().size() > 2) {
				this.getAtraccionesEnPromocion().set(2, nuevasAtracciones.get(2));
			}else {
				this.getAtraccionesEnPromocion().add(nuevasAtracciones.get(2));
			}
		}
	}
	
	public boolean isValid() {
		validate();
		return errors.isEmpty();
	}
	
	public void validate() {
		errors = new HashMap<String, String>();

		if (this.valor <= 0) {
			errors.put("valor", "Costo invalido.");
		}
		if (this.getAtraccionesEnPromocion().get(0) == null) {
			errors.put("atr1", "Atraccion 1 no puede ser null");
		}
		if (this.getAtraccionesEnPromocion().get(1) == null) {
			errors.put("atr2", "Atraccion 2 no puede ser null");
		}
		if(this.getAtraccionesEnPromocion().get(0).equals(this.getAtraccionesEnPromocion().get(1))) {
			errors.put("repetida", "Las atracciones no deben repetirse");
		}
		if (!this.getAtraccionesEnPromocion().get(0).getTipo().getNombre().equals(this.getAtraccionesEnPromocion().get(1).getTipo().getNombre())) {
			errors.put("tipos", "Discrepancia de tipos con la segunda atraccion");
		}
		if(this.getAtraccionesEnPromocion().size()==3) {
			if(!this.getAtraccionesEnPromocion().get(1).getTipo().getNombre().equals(this.getAtraccionesEnPromocion().get(2).getTipo().getNombre())) {
				errors.put("tipos3", "Discrepancia de tipos con la tercer atraccion");
			}
			if(this.getAtraccionesEnPromocion().get(0).equals(this.getAtraccionesEnPromocion().get(2)) || this.getAtraccionesEnPromocion().get(1).equals(this.getAtraccionesEnPromocion().get(2))) {
				errors.put("repetida", "Las atracciones no deben repetirse");
			}
		}
	}
	public Map<String, String> getErrors() {
		return errors;
	}

	
	//--------equals y hashcode---------------------------	
	@Override
	public int hashCode() {
		return Objects.hash(atraccionesEnPromocion, id, tiempoPromo, tipo, tipoAtraccion, valor);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Promocion other = (Promocion) obj;
		return Objects.equals(atraccionesEnPromocion, other.atraccionesEnPromocion) && id == other.id
				&& Double.doubleToLongBits(tiempoPromo) == Double.doubleToLongBits(other.tiempoPromo)
				&& tipo == other.tipo && Objects.equals(tipoAtraccion, other.tipoAtraccion) && valor == other.valor;
	}
	

}
