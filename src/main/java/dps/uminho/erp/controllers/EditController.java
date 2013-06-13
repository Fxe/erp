package dps.uminho.erp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EditController {
	
	@RequestMapping(value = "/edit/", method = RequestMethod.GET)
	public String flux(Model page) {
		return "edit";
	}
}
