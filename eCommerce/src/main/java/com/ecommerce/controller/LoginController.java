package com.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping("/login")
	//When Spring intercepts the admin URL requests, it will redirect to login page
	public String login(@RequestParam (value="error", required = false) String error,
						@RequestParam (value="logout", required = false) String logout, Model model
						){
		if(null != error) {
			model.addAttribute("error", "Usario e senha invalidos");
		}

		if(null != logout) {
			model.addAttribute("msg", "Você foi desconectado, com sucesso.");
		}

		return "login";
	}
}
