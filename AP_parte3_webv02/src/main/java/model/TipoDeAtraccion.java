package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import persistence.dao.DAOFactory;


public class TipoDeAtraccion {

	int id;
	private String tipoDeAtraccion;
	boolean borrado;

	private Map<String, String> errors;
	
	public TipoDeAtraccion(int id, String tipo, boolean borrado) {
		this.id=id;
		this.tipoDeAtraccion= tipo.toUpperCase();
		this.borrado=borrado;
	}
	
	public int getId() {
		return this.id;
	}
	
	public String getNombre() {
		return this.tipoDeAtraccion;
	}
	
	public void setNombre(String nombre) {
		nombre= nombre.toUpperCase();
		this.tipoDeAtraccion=nombre;
	}
	
	public boolean getBorrado() {
		return this.borrado;
	}
	
	public void setBorrado(boolean estado) {
		this.borrado=estado;
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

		List<TipoDeAtraccion> tipos=DAOFactory.getTipoDeAtraccionDAO().findAllConBorrados();
		int repeticiones=0;
		for(TipoDeAtraccion tipo: tipos) {
			if(this.getNombre().equals(tipo.getNombre())) {
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

		List<TipoDeAtraccion> tipos=DAOFactory.getTipoDeAtraccionDAO().findAllConBorrados();
		int repeticiones=0;
		for(TipoDeAtraccion tipo: tipos) {
			if(this.getNombre().equals(tipo.getNombre())) {
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

}
