package dps.uminho.erp.components;

public class PontoElectrao extends AbstractGeographicLocation {

	private boolean abertoPublico;
	//private int nPontoE;	//nº pontos electrao
	//private int nPontoELamp;//nº pontos electrao lampadas
	
	public PontoElectrao(int id, int localization_id, int operatorType_id,
			String name, String morada, String codigoPostal) {
		
		super(id, localization_id, operatorType_id, name, morada, codigoPostal);
		this.abertoPublico = true;
	}

	public PontoElectrao(int id, int localization_id, int operatorType_id,
			String name, String morada, String codigoPostal, boolean abertoPublico) {
		
		super(id, localization_id, operatorType_id, name, morada, codigoPostal);
		
		this.abertoPublico = abertoPublico;
	}

	public boolean isAbertoPublico() {
		return abertoPublico;
	}

	public void setAbertoPublico(boolean abertoPublico) {
		this.abertoPublico = abertoPublico;
	}
	
}
