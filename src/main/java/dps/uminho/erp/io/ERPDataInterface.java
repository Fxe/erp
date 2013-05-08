package dps.uminho.erp.io;

import java.util.Set;

import dps.uminho.erp.components.CentroRecepcao;
import dps.uminho.erp.components.Localization;
import dps.uminho.erp.components.OperadorLogistico;
import dps.uminho.erp.components.OperatorType;
import dps.uminho.erp.components.PontoElectrao;
import dps.uminho.erp.components.PontoRecolha;

public interface ERPDataInterface {
	public boolean isInitialized();
	
	public Localization getLocalizationInformation(int id);
	public OperatorType getOperatorTypeInformation(int id);
	public PontoElectrao getPontoElectrao(int id);
	public PontoRecolha getPontoRecolha(int id);
	public CentroRecepcao getCentroRecepcao(int id);
	public OperadorLogistico getOperadorLogistico(int id);
	
	public Set<Integer> getAllLocalizationIds();
	public Set<Integer> getAllOperatorTypeIds();
	public Set<Integer> getAllPontoElectraoIds();
	public Set<Integer> getAllPontoRecolhaIds();
	public Set<Integer> getAllCentroRecepcaoIds();
	public Set<Integer> getAllOperadorLogisticoIds();
	
	public void updateLocalizationInformation(Localization localization);
	public void updateOperatorTypeInformation(OperatorType opType);
	public void updatePontoElectrao(PontoElectrao pe);
	public void updatePontoRecolha(PontoRecolha pr);
	
	public void saveLocalizationInformation(Localization localization);
	public void saveOperatorTypeInformation(OperatorType opType);
	public void savePontoElectrao(PontoElectrao pe);
	public void savePontoRecolha(PontoRecolha pr);
	
	public void deleteLocalizationInformation(int id);
	public void deleteOperatorTypeInformation(int id);
	public void deletePontoElectrao(int id);
	public void deletePontoRecolha(int id);
}