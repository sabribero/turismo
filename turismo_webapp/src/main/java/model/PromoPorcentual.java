package model;

import java.util.List;


public class PromoPorcentual extends Promocion {

	/*
	 * Descuenta un porcentaje del valor total (suma) de todas las atracciones incluidas en la promo.
	 */

	private int descuento;
	
	public PromoPorcentual(int id, List<Atraccion> atraccionesEnPromo, int valorDescuento) {
		super(id, atraccionesEnPromo);
		this.atraccionesEnPromocion=atraccionesEnPromo;
		
		this.tipoAtraccion = atraccionesEnPromo.get(0).getTipo();
		this.tipo = TipoDePromo.PORCENTUAL;
		this.descuento=valorDescuento;
		
		int auxValor=0;
		for(Atraccion cadaUna: atraccionesEnPromocion) {
			auxValor+= cadaUna.getValor();
		}
		this.valor= (int) Math.round(auxValor- auxValor*(this.descuento/100.0));
	}	
	
	@Override
	public int getDescuento() {
		return this.descuento;
	}
	
	@Override
	public void setValor(int descuento) {
		int auxValor=0;
		this.descuento=descuento;
		for(Atraccion cadaUna: atraccionesEnPromocion) {
			auxValor+= cadaUna.getValor();
		}
		this.valor= (int) Math.round(auxValor- auxValor*(descuento/100.0));
	}
}