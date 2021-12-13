package model;

public class TipoDeAtraccion {

	int id;
	private String tipoDeAtraccion;
	boolean borrado;
	
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
		this.tipoDeAtraccion=nombre;
	}
	
	public boolean getBorrado() {
		return this.borrado;
	}
	
	public void setBorrado(boolean estado) {
		this.borrado=estado;
	}
}
