package dps.uminho.erp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FluxController {

	@RequestMapping(value = "/flux/", method = RequestMethod.GET)
	public String flux(Model page) {
		return "fluxos";
	}
}
