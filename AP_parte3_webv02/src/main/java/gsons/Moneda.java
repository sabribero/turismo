package gsons;

public class Moneda {
	
	
	int ARS;



	public int getARS() {
		return ARS;
	}

	public void setARS(int aRS) {
		ARS = aRS;
	}

	public int getEUR() {
		return EUR;
	}

	public void setEUR(int eUR) {
		EUR = eUR;
	}
	
	
	@Override
	public String toString() {
		return "Moneda [ARS=" + ARS + ", EUR=" + EUR + "]";
	}
	
	
	

}
