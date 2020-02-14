package com.srx.service.srx_fzk_service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.srx.dao.srx_fzk_dao.AdvertisementMapper;
import com.srx.dao.srx_fzk_dao.UserInteractionMapper;
import com.srx.dao.srx_mzj_dao.VideoMapper;
import com.srx.model.srx_fyl_model.UserAnwser;
import com.srx.model.srx_fzk_model.Advertisement;
import com.srx.model.srx_fzk_model.UserInteraction;
import com.srx.model.srx_fzk_model.Videolist;
import com.srx.model.srx_mzj_model.Video;

@Service("fzk_service")
public class fzk_service {
	@Resource//实现广告轮播方法
	private AdvertisementMapper adver;
	
	@Resource//mzj
	private VideoMapper vm;
	
	@Resource//用户互动答疑
	private UserInteractionMapper ui;
	
	//查询广告轮播所有数据
	public List<Advertisement> selectAll() {
		return adver.selectAll();
	}
	//实现根据专家标号获取视频列表
	public List<Advertisement> selectVideo(Integer id) {
		/* System.out.println("--------------server接受的ID为:"+id); */
		return adver.selectVideo(id);				
	}
	//实现根据视频热度获取视频列表
	public List<Videolist> selectTopvideo() {
		return adver.selectTopvideo();
	}
	//实现根据iid条件获取视频列表
		public List<Video> selectTopvideowhere(Integer string) {
			return vm.selvideo(string);
		}
	
	/* 把用户互动信息传入数据库 */
	public boolean insertdata(UserInteraction uii) {
		if (ui.insertdata(uii)>0) {
			return true;
		}
		return false;
	}
	
	/* 查询用户互动信息 */
	public List<UserInteraction> getuserdate(int vid) {
		return ui.getuserdate(vid);
	}
	//回复用户互动信息
	public int  insertuser(UserAnwser user){

		return 	ui.insertuser(user);
		
	}
	//查询用户回复信息
	public List<UserAnwser> sel_user(int id){
		return ui.sel_user(id);
	}
}
