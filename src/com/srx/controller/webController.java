package com.srx.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
@CrossOrigin(origins = "*",allowCredentials="true")
@Controller
public class webController {
	 
	
	@RequestMapping("tab")
	public String tab(Model map){
		
		return "Tab";
	}
	@RequestMapping("home")
	public String gethome() {
		return "home";
	}
	@RequestMapping("Search")
	public String Search() {
		return "Search";
	}
	@RequestMapping("tab2")
	public String tab2() {
		return "Tab_fzk";
	}
	}