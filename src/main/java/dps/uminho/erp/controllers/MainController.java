package dps.uminho.erp.controllers;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dps.uminho.erp.components.Localization;
import dps.uminho.erp.components.OperadorLogistico;
import dps.uminho.erp.config.StaticConfigValues;
import dps.uminho.erp.io.ERPDataInterface;
import dps.uminho.erp.io.mysql.ERPMySQLInterface;
import dps.uminho.erp.components.mapa_manipulation.*;


@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	private static ERPDataInterface dataSource = null;
	
	private List<OperadorLogistico> olList = null;
	private List<Localization> locList = null;
	
	public MainController() {
		logger.info("Initializing MainController ... ");
		
		dataSource = new ERPMySQLInterface(StaticConfigValues.database,
										   StaticConfigValues.username,
										   StaticConfigValues.password);
		olList = new ArrayList<OperadorLogistico>();
		locList = new ArrayList<Localization>();
		logger.info("Database Connection :" + dataSource.isInitialized());
		logger.info("Initializing MainController LOADED !");
		
		this.populateData();
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
		for ( Localization loc : locList) {
			distritoList.add(loc.getDistrito());
			concelhoList.add(loc.getConcelho());
		}
		
		page.asMap().put("opList", opList);
		page.asMap().put("distritoList", distritoList);
		page.asMap().put("concelhoList", concelhoList);
		
		Points p1 = new Points (50.0000,25.0000);
		Points p2 = new Points (-4.0000,-25.0000);
		
		Points_Manipulation list = new Points_Manipulation();
		
		list.getGroup_points().add(p1);
		list.getRoutes().add(p2);
		
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
			this.locList.add(loc);
		}
		logger.info("Loaded " + locList.size() + " Localization");
	}
}
