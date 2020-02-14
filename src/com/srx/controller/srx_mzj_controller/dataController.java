package com.srx.controller.srx_mzj_controller;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.srx.model.srx_mzj_model.Introduction;
import com.srx.model.srx_mzj_model.Video;
import com.srx.service.srx_mzj_service.mzjpcService;
import com.srx.util.Result;


@Controller
public class dataController {
	
	@Resource(name="mzjService")
	private mzjpcService mzjS;
	
	/*查询视频表_Video*/
	@RequestMapping("/sel_Video")
	 @ResponseBody
	 public Result sel_Video(HttpServletRequest req,HttpSession hs){	
	    	Result r=new Result();
	    	//获取教师
	    	//HttpSession hs=req.getSession();
	    	try {
	    		List<Video> list=mzjS.selvideo(hs.getAttribute("iid").toString());
	    		 r.setData(list);
	    		 
	    	} catch (Exception e) {
				// TODO: handle exception
	    		//System.out.println(e);
			}
	    	
	    	return r;
	    	
	    	
	    }
	 
	 /*登录判断1*/
	 @RequestMapping(value = "/login_Check1", method = RequestMethod.POST)
	 @ResponseBody
		public String login_Check1(@RequestParam("tuid") String username,
				@RequestParam("tpwd") String password,Model model,HttpSession hs){
			Introduction user = new Introduction();
			user.setTuid(username);
			user.setTpwd(password);
			
			Introduction ind=mzjS.logincheck(user);
			
			if(ind != null){
				System.out.println(ind.getIname()+"登录成功");
				hs.setAttribute("iid", ind.getIid());
				hs.setAttribute("username", ind.getIname());
				//model.addAttribute("tuid",username);
				//return "index";
				return "1";
			}
		    else{
		    	System.out.println(ind.getIname()+"登录失败");
		    	//model.addAttribute("error","账号或密码错误");
		    	//return "login";
		    	return "0";
		    }
		}
	
	/*退出登录*/
	@RequestMapping("/exit_login")
	public String tologout(HttpServletRequest request){
		Enumeration em = request.getSession().getAttributeNames();
		while(em.hasMoreElements()){
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		return "login";
	}
	
	
}
