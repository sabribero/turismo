package services;

import java.util.ArrayList;
import java.util.List;

import model.Atraccion;
import model.PromoAbsoluta;
import model.PromoAxB;
import model.PromoPorcentual;
import model.Promocion;
import model.TipoDePromo;
import persistence.dao.DAOFactory;
import persistence.dao.PromocionDAOImpl;

public class PromocionService {

	public List<Promocion> list() {
		List<Atraccion> atracciones= DAOFactory.getAtraccionDAO().findAll();
		return DAOFactory.getPromocionDAO().findAll(atracciones);
	}
	
	public Promocion create(TipoDePromo tipo, int valor, String atr1, String atr2, String atr3) {

		List<Atraccion> atracciones= new ArrayList<Atraccion>();
		Atraccion atraccion1=DAOFactory.getAtraccionDAO().findByNombre(atr1);
		Atraccion atraccion2=DAOFactory.getAtraccionDAO().findByNombre(atr2);
		atracciones.add(atraccion1);
		atracciones.add(atraccion2);
		
		if(!atr3.equals("-")) {
			Atraccion atraccion3=DAOFactory.getAtraccionDAO().findByNombre(atr3);
			atracciones.add(atraccion3);
		}
		Promocion promo;
		
		switch(tipo) {
			case ABSOLUTA:
				promo = new PromoAbsoluta(atracciones, valor);
				break;
			case PORCENTUAL:
				promo = new PromoPorcentual(atracciones, valor);
				break;
			case AxB:
				promo = new PromoAxB(atracciones);
				break;
			default:
				promo= new Promocion(null);
			
		
		}

		int actualizacion=0;
		
		if (promo.isValid()) {
			PromocionDAOImpl promocionDAO = DAOFactory.getPromocionDAO();
			actualizacion= promocionDAO.insert(promo);
			// XXX: si no devuelve "1", es que hubo más errores
		}
		if(actualizacion == 1) {
			return promo;
		} else {
			return null;
		}
	}

}
