package com.srx.controller.srx_gpl_controller;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.srx.model.srx_gpl_model.Policiesandregulations;
import com.srx.service.srx_gpl_service.gpl_service;
import com.srx.util.Result;
@CrossOrigin(origins = "*",allowCredentials="true")
@Controller
public class gpl_controller {
	String id;
	@Resource(name="gpl_service")
    private gpl_service gs;
	
	@RequestMapping("zcfg")
	public String sel(){
	   	 return "policiesAndRegulations";
    }
	
	@RequestMapping("/ss")
	 @ResponseBody
	 public Result select(HttpServletRequest rq,HttpServletResponse rs,Model model){
		 Result rs1=new Result();
		 List lt=gs.select();
		/* //System.out.println(lt); */
		 rs1.setData(lt);
		 rs1.setMsg("ok");
		 rs1.setStatus(200);
		 return rs1;
		} 
	
	@RequestMapping(value="zcfg_content",method = RequestMethod.GET)
	public String sel_content(HttpServletRequest req){
		 id=req.getParameter("id");
	   	 return "null";
    }
	
	@RequestMapping(value="zcfg_contentt.do",method = RequestMethod.GET)
	@ResponseBody
	 public Result select1(Policiesandregulations p,HttpServletRequest rq,HttpServletResponse rs,Model model){
		p.setId(Integer.parseInt(id));
		/* //System.out.println("p ID为："+p.getId()); */
		 Result rs1=new Result();
		 List lt=gs.select_content(p);
		/* //System.out.println(lt); */
		 rs1.setData(lt);
		 rs1.setMsg("ok");
		 rs1.setStatus(200);
		 return rs1;
		}

}

