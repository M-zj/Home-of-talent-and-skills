package com.srx.controller.srx_mzj_controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
@CrossOrigin(origins = "*",allowCredentials="true")
@Controller
public class view_controller {
	//MZJ
		@RequestMapping("/Celebrity_column")
		public String Celebrity_column(Model map){
			return "Celebrity_column";
		}
		
		// ��Ƶҳ����ת
		@RequestMapping("/video_column")
		public String video_column(Model map) {
			return "video_column";
		}


		//pc
		@RequestMapping("/index")
		public String index(){
			return "index";
		}
		
		@RequestMapping("/info")
		public String info(){
			return "info";
		}
		
		@RequestMapping("/info_hd")
		public String info_hd(HttpServletRequest req){
			return "info_hd";
		}
		
		@RequestMapping("/login")
		public String login(HttpServletRequest request){
			return "login";
		}
		
		@RequestMapping("/Upload_video")
		public String Upload_video(){
			return "Upload_video";
		}
		
		@RequestMapping("/Upload_video1")
		public String Upload_video1(){
			return "Upload_Video1";
		}
		
		@RequestMapping("/apk")
		public String apk(){
			return "apk";
		}
	

		
}
