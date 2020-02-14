package com.srx.service.srx_mzj_service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.srx.dao.srx_mzj_dao.IntroductionMapper;
import com.srx.dao.srx_mzj_dao.VideoMapper;
import com.srx.model.srx_mzj_model.Introduction;
import com.srx.model.srx_mzj_model.Video;


@Service("mzjService")
public class mzjpcService {
	@Resource
	private VideoMapper vm;
	
	@Resource
	private IntroductionMapper Im;
	
	/*查询视频表_video*/
	public  List<Video> selvideo(String iid){
		List<Video> list =vm.selvideoPC(iid);
		return list;
	} 
	
	/*判断登录1*/
	public Introduction logincheck(Introduction user) {
		Introduction u = Im.logincheck(user);
		return u;
	}
}
