package com.srx.controller.srx_fzk_controller;

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
import com.srx.model.srx_fzk_model.Advertisement;
import com.srx.model.srx_fzk_model.UserInteraction;
import com.srx.model.srx_fzk_model.Videolist;
import com.srx.service.srx_fzk_service.fzk_service;
import com.srx.util.Result;

@CrossOrigin(origins = "*", allowCredentials = "true")
@Controller
public class fzk_controller {
	int iid;
	int vid;
	
	
	
	String vurl;

	@Resource(name = "fzk_service")
	private fzk_service fs;

	// 查询出所有广告录轮播
	@RequestMapping(value = "/Tab_fzk", method = RequestMethod.POST)
	@ResponseBody
	public Result getAll() {
		Result rs = new Result();
		List<Advertisement> adlist = fs.selectAll();
		/* //System.out.println(adlist); */
		rs.setData(adlist);
		return rs;
	}

	// 获取所有使用到的值传给视频播放页面
	@RequestMapping("video")
	public String video(HttpServletRequest req) {
		iid = Integer.parseInt(req.getParameter("iid"));
		vid = Integer.parseInt(req.getParameter("vid"));
		vurl = req.getParameter("vurl");
		
		return "null";
	}

	// 获取视频播放界面推荐视频
	@RequestMapping("/sel_video")
	@ResponseBody
	public Result get_video() {
		
		Result rs = new Result();
//		//System.out.println("作者ID为："+iid); 
		List<Advertisement> adlist = fs.selectVideo(iid);
		
		if (adlist.size()==1) {
//			//System.out.println("专家视频推荐数量为1");
			rs.setStatus(400);
		}else {
//			//System.out.println("专家视频推荐数量不为1");
			rs.setStatus(200);
		}
		rs.setData(adlist);
		return rs;
	}

	// 获取首页推荐视频
	@RequestMapping("/sel_Top_Video")
	@ResponseBody
	public Result TopVideo() {
		// //System.out.println("进入了sel_Top_Video首页推荐视频");
		Result rs = new Result();
		List<Videolist> list = fs.selectTopvideo();
		/* //System.out.println(list); */
		rs.setData(list);
		return rs;
	}

	// 传送视频播放路径与视频ID
	@RequestMapping("get_video")
	@ResponseBody
	public Result get_videourl() {
		Result rs = new Result();
		rs.setMsg(vurl);	//传入视频路径
		rs.setStatus(vid);  //传入视频ID
		return rs;
	}

	// 向用户互动添加信息
	@RequestMapping(value = "user_interaction", method = RequestMethod.POST)
	@ResponseBody
	public Result set_user_interaction(@RequestBody Map<String, Object> map) {
		//System.out.println("进入user_interaction controller iid:" + iid + ",vid:" + vid);
		Result rs = new Result();
		/* 用户ID */
		int ustatusid = (int) map.get("statusid");
		/* 获取用户姓名 */
		String user_name = (String) map.get("user_name");
		/* 获取用户获赞 */
		int user_num = (int) map.get("user_num");
		/* 获取用户互动内容 */
		String user_content = (String) map.get("user_content");
		// //System.out.println("用户id:"+user_id+"用户姓名"+user_name+"--"+"用户获赞"+user_num+"--"+"互动内容"+user_content);
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
	@RequestMapping(value = "get_user_interaction", method = RequestMethod.POST)
	@ResponseBody
	public Result get_userdata() {
		
		Result rs = new Result();
		List<UserInteraction> userdata = new ArrayList<UserInteraction>();
		userdata = fs.getuserdate(vid);
//		//System.out.println("用户互动消息：" + userdata);
		
		rs.setData(userdata);
		return rs;
	}

	// 回复用户互动信息
	@RequestMapping(value = "/reply_user", method = RequestMethod.POST)
	@ResponseBody
	public Result reply(@RequestBody Map<String, Object> map) {
		Result rs = new Result();
//		//System.out.println("我进入了回复评论");

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
	@RequestMapping("/sel_user")
	@ResponseBody
	public Result sel_user(HttpServletRequest req) {
		
		Result rs = new Result();
		int uuid = Integer.parseInt(req.getParameter("uuid"));
		
//		//System.out.println("获取到回复ID为：" + sel_user);
		
		List<UserAnwser> adlist = fs.sel_user(uuid);
		
		rs.setData(adlist);
		return rs;
	}

}
