package dps.uminho.erp;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main/", method = RequestMethod.GET)
	public String main(Model page) {
		logger.info("Main Page Fired !");
		
		List<String> opList = new ArrayList<String>();
		opList.add("operator1");
		opList.add("operator2");
		opList.add("operator3");
		
		List<String> distritoList = new ArrayList<String>();
		distritoList.add("Braga");
		distritoList.add("Porto");
		distritoList.add("Lisboa");
		
		List<String> concelhoList = new ArrayList<String>();
		concelhoList.add("Braga");
		concelhoList.add("Boticas");
		concelhoList.add("Cuba");
		
		page.asMap().put("opList", opList);
		page.asMap().put("distritoList", distritoList);
		page.asMap().put("concelhoList", concelhoList);
		
		return "main";
	}
}
