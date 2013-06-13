package dps.uminho.erp.components;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class PontoRecolha extends AbstractGeographicLocation {

	public PontoRecolha(int id, int localization_id, int operatorType_id,
			String name, String morada, String codigoPostal) {
		
		super(id, localization_id, operatorType_id, name, morada, codigoPostal);
	}
	
	
}
