package com.srx.controller.srx_lx_controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.srx.service.srx_fyl_service.fyl_service;

/***
 * 2019年12月12日19:02:27
 * 刘潇
 * **/
@CrossOrigin(origins = "*",allowCredentials="true")
@Controller
public class lx_controller {

	@Resource(name="fyl_service")
	private  fyl_service fyl_service;

	@RequestMapping("/scvideo")
	public String sel(){
		return "scvideo";
	}
	
	@RequestMapping("AddVideo")
	@ResponseBody
	public int AddVideo(HttpServletRequest req){
		//System.out.println(req.getParameter("image"));
		//System.out.println(req.getParameter("video"));
		return fyl_service.selvid(req.getParameter("name"),
				req.getParameter("title"),req.getParameter("time"),req.getParameter("image"),
				req.getParameter("video"));
	}
}
