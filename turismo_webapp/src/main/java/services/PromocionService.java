package services;

import java.util.ArrayList;
import java.util.List;

import model.Atraccion;
import model.PromoAbsoluta;
import model.PromoAxB;
import model.PromoPorcentual;
import model.Promocion;
import model.TipoDePromo;
import persistence.dao.AtraccionDAOImpl;
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
				promo = new PromoAbsoluta(0,atracciones, valor);
				break;
			case PORCENTUAL:
				promo = new PromoPorcentual(0,atracciones, valor);
				break;
			case AxB:
				promo = new PromoAxB(0,atracciones);
				break;
			default:
				promo= new Promocion(0,null);
			
		
		}

		
		if (promo.isValid()) {
			PromocionDAOImpl promocionDAO = DAOFactory.getPromocionDAO();
			promocionDAO.insert(promo);
			// XXX: si no devuelve "1", es que hubo más errores
		}
		return promo;
	}
	
	public Promocion update(int id, int valor, String atr1, String atr2, String atr3) {
		
		AtraccionDAOImpl atraccionDAO= DAOFactory.getAtraccionDAO();
		List<Atraccion> attractions= new ArrayList<Atraccion>();
		
		Atraccion atraccion1=atraccionDAO.findByNombre(atr1);
		Atraccion atraccion2=atraccionDAO.findByNombre(atr2);
		attractions.add(atraccion1);
		attractions.add(atraccion2);
		if(!atr3.equals("-")) {
			Atraccion atraccion3=DAOFactory.getAtraccionDAO().findByNombre(atr3);
			attractions.add(atraccion3);
		}
		
		PromocionDAOImpl promocionDAO = DAOFactory.getPromocionDAO();
		//int id= promocionDAO.findByAtraccionesList(atracciones);
		
		Promocion promoOriginal= promocionDAO.findById(id, atraccionDAO.findAll());
		
		//promocion a modificar
		Promocion promo= promocionDAO.findById(id, atraccionDAO.findAll());

		promo.setValor(valor);
		promo.setAtraccionesEnPromocion(attractions);

		if (promo.isValid()) {
			promocionDAO.modificar(promo, promoOriginal);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return promo;
	}

	public void delete(int id) {
		/*String[] listaAtracciones= atracciones.split(",");
		List<Atraccion> attractions= new ArrayList<Atraccion>();
		for(String cadaUna : listaAtracciones) {
			cadaUna = cadaUna.trim();
			Atraccion attraction = new Atraccion(cadaUna, 0, 0, 0, null, 0);
			attractions.add(attraction);
			
		}
		Promocion promocion = new Promocion(0,attractions);
		*/
		
		
		PromocionDAOImpl promocionDAO = DAOFactory.getPromocionDAO();
		List<Atraccion> atracciones= DAOFactory.getAtraccionDAO().findAll();
		
		Promocion promocion= promocionDAO.findById(id, atracciones);
		promocionDAO.borradoLogico(promocion);
	}


}
