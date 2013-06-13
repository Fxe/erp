package dps.uminho.erp.controllers;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dps.uminho.erp.components.Localization;
import dps.uminho.erp.components.OperadorLogistico;
import dps.uminho.erp.components.PontoElectrao;
import dps.uminho.erp.config.StaticConfigValues;
import dps.uminho.erp.io.ERPDataInterface;
import dps.uminho.erp.io.mysql.ERPMySQLInterface;
import dps.uminho.erp.components.mapa_manipulation.*;


@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	private static ERPDataInterface dataSource = null;
	
	private Points_Manipulation list = null;
	private List<OperadorLogistico> olList = null;
	private Map<Integer, Localization> locMap = null;
	private Map<Integer, PontoElectrao> peMap = null;
	
	private FormMainMapa mainForm = null;
	
	public MainController() {
		logger.info("Initializing MainController ... ");
		
		dataSource = new ERPMySQLInterface(StaticConfigValues.database,
										   StaticConfigValues.username,
										   StaticConfigValues.password);
		olList = new ArrayList<OperadorLogistico>();
		locMap = new HashMap<Integer, Localization>();
		peMap = new HashMap<Integer, PontoElectrao>();
		list = new Points_Manipulation();
		
		logger.info("Database Connection :" + dataSource.isInitialized());
		logger.info("Initializing MainController LOADED !");
		
		mainForm = new FormMainMapa();
		
		this.populateData();
	}
	
	private List<PontoElectrao> getPE_FromDistrito(String distrito) {
		List<PontoElectrao> peList = new ArrayList<PontoElectrao>();
		
		for (Integer peId : peMap.keySet()) {
			PontoElectrao pe = peMap.get(peId);
			Localization loc = locMap.get( pe.getLocalization_id());
			if ( loc.getDistrito().equals(distrito)) {
				peList.add(pe);
				System.out.println(pe.getLatitude() + " " + pe.getLongitude());
				Points point = new Points(pe.getLatitude(), pe.getLongitude());
				//this.list.getGroup_points().add(point);
				this.list.getRoutes().add(point);
			}
		}
		logger.info("Match " + peList.size() + " PontoElectrao");
		return peList;
	}

	@RequestMapping(value = "/main/addDist.ajax", method = RequestMethod.GET)
	public @ResponseBody String addDistritoToForm(Model model, 
			@RequestParam(value = "dist", required = true) String dist) {
		
		if ( !mainForm.getDistritosSet().add(dist)) {
			return "null";
		}
		
		mainForm.getPontoElectraoSet().addAll( getPE_FromDistrito(dist));
		
		return mainForm.getDistritosSet().toString();
	}
	
	@RequestMapping(value = "/main/addConc.ajax", method = RequestMethod.GET)
	public @ResponseBody String addConcelhoToForm(Model model, 
			@RequestParam(value = "conc", required = true) String dist) {
		
		if ( !mainForm.getConcelhosSet().add(dist)) {
			return "null";
		}
		
		return mainForm.getConcelhosSet().toString();
	}
	
	
	@RequestMapping(value = "/main/", method = RequestMethod.GET)
	public String main(Model page) {
		logger.info("Main Page Fired !");
		
		List<String> opList = new ArrayList<String>();
		for ( OperadorLogistico ol : olList) {
			opList.add(ol.getName());
		}
		
		Set<String> distritoList = new HashSet<String>();
		Set<String> concelhoList = new HashSet<String>();
		for ( Localization loc : locMap.values()) {
			distritoList.add(loc.getDistrito());
			concelhoList.add(loc.getConcelho());
		}
		
		page.asMap().put("opList", opList);
		page.asMap().put("distritoList", distritoList);
		page.asMap().put("concelhoList", concelhoList);
		page.asMap().put("formListDist", mainForm.getDistritosSet());
		page.asMap().put("formListConc", mainForm.getConcelhosSet());
		
		page.addAttribute("latitude",list.toStringGroupPoints());
		page.addAttribute("longitude",list.toStringRoutes());
		
		return "main";
	}
	
	
	
	private void populateData() {
		for (Integer olId : dataSource.getAllOperadorLogisticoIds()) {
			OperadorLogistico ol = dataSource.getOperadorLogistico(olId);
			this.olList.add(ol);
		}
		logger.info("Loaded " + olList.size() + " OperadorLogistico");
		for (Integer locId : dataSource.getAllLocalizationIds()) {
			Localization loc = dataSource.getLocalizationInformation(locId);
			this.locMap.put(locId, loc);
		}
		logger.info("Loaded " + locMap.size() + " Localization");
		for (Integer peId : dataSource.getAllPontoElectraoIds()) {
			PontoElectrao pe = dataSource.getPontoElectrao(peId);
			this.peMap.put(peId, pe);
		}
		logger.info("Loaded " + peMap.size() + " PontoElectrao");
	}
}
