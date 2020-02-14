package com.srx.controller.srx_mzj_controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.srx.model.srx_fyl_model.UserAnwser;
import com.srx.model.srx_fzk_model.UserInteraction;
import com.srx.service.srx_fzk_service.fzk_service;
import com.srx.util.Result;
@CrossOrigin(origins = "*", allowCredentials = "true")
@Controller
public class mzj_hd_controller {
	
	int iid;
	int vid;
	
			//get iid and vid
			@RequestMapping("/get_vid")
			@ResponseBody
			public void get_vid(HttpServletRequest req) {
				iid=Integer.parseInt(req.getParameter("iid"));
				vid=Integer.parseInt(req.getParameter("vid"));
				//System.out.println("专家id"+iid);
				//System.out.println("视频id:"+vid);
			}
		
	@Resource(name = "fzk_service")
	private fzk_service fs;
	
	// 向用户互动添加信息
		@RequestMapping(value = "user_interaction_pc", method = RequestMethod.POST)
		@ResponseBody
		public Result set_user_interaction(@RequestBody Map<String, Object> map) {
			//System.out.println("进入user_interaction_pc controller iid:" + iid + ",vid:" + vid);
			Result rs = new Result();
			/* 身份ID */
			int ustatusid = (int) map.get("ustatusid");
			/* 获取用户姓名 */
			String user_name = (String) map.get("user_name");
			/* 获取用户获赞 */
			int user_num = (int) map.get("user_num");
			/* 获取用户互动内容 */
			String user_content = (String) map.get("user_content");
			//System.out.println("身份id:"+ustatusid+"用户姓名："+user_name+"--"+"用户获赞"+user_num+"--"+"互动内容："+user_content);
			if (user_content == null||"".equals(user_content)) {
				rs.setStatus(400);
			} else {
				UserInteraction ui = new UserInteraction();
				ui.setUstatusid(ustatusid);
				ui.setUpraise(user_num);
				ui.setUname(user_name);
				ui.setUcontent(user_content);
				ui.setIid(iid);
				ui.setVid(vid);
				if (fs.insertdata(ui)) {
					rs.setStatus(200);
				} else {
					rs.setStatus(400);
				}
			}

			return rs;
		}

		// 获取用户互动信息
		@RequestMapping(value = "get_user_interaction_pc", method = RequestMethod.POST)
		@ResponseBody
		public Result get_userdata() {
			//System.out.println("进入get_user_interaction_pc视频ID为：" + vid);
			Result rs = new Result();
			List<UserInteraction> userdata = new ArrayList<UserInteraction>();
			userdata = fs.getuserdate(vid);
			//System.out.println("用户互动消息：" + userdata);
			//System.out.println("用户互动集合大小：" + userdata.size());
			rs.setData(userdata);
			return rs;
		}

		// 回复用户互动信息
		@RequestMapping(value = "/reply_user_pc", method = RequestMethod.POST)
		@ResponseBody
		public Result reply(@RequestBody Map<String, Object> map) {
			Result rs = new Result();
//			//System.out.println("我进入了回复评论");

			//互动内容
			String content = (String) map.get("ucontent");

			//互动ID
			int uuid = (int) map.get("uuid");
			
			//用户名称
			String aname=(String) map.get("aname");
			
			//身份编号
			int ustatusid=(int) map.get("ustatusid");
			
			//点赞个数
			int apraise=(int) map.get("apraise");
			
			//System.out.println("aname:" + aname);
			  //System.out.println("content:" + content); 
			  //System.out.println("uuid:" + uuid);
			 
			if (content == null || "".equals(content)) {
				rs.setStatus(400);
			} else {
				UserAnwser user=new UserAnwser();
				user.setAname(aname);
				user.setAcontent(content);
				user.setApraise(apraise);
				user.setAstatusid(ustatusid);
				user.setUuid(uuid);
				fs.insertuser(user);
				rs.setStatus(200);
			}
			return rs;
		}

		// 查询用户回复信息
		@RequestMapping("/sel_user_pc")
		@ResponseBody
		public Result sel_user(HttpServletRequest req) {
			//System.out.println("进入了sel_user_pc");
			int sel_user = Integer.parseInt(req.getParameter("uuid"));
//			//System.out.println("获取到回复ID为：" + sel_user);
			Result rs = new Result();
			List<UserAnwser> adlist = fs.sel_user(sel_user);
			rs.setData(adlist);
			return rs;
		}
}
