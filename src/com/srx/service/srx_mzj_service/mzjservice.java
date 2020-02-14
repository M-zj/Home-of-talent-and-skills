package com.srx.service.srx_mzj_service;


import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.srx.dao.srx_mzj_dao.IntroductionMapper;
import com.srx.dao.srx_mzj_dao.MenuitemMapper;
import com.srx.dao.srx_mzj_dao.TypeMapper;
import com.srx.dao.srx_mzj_dao.VideoMapper;
import com.srx.model.srx_mzj_model.Introduction;
import com.srx.model.srx_mzj_model.Menuitem;
import com.srx.model.srx_mzj_model.Type;
import com.srx.model.srx_mzj_model.Video;


@Service("sel")
public class mzjservice {
	
	@Resource
	private IntroductionMapper im;
	
	
	@Resource
	private VideoMapper vi;


	// 查询视频表
	public List<Video> selectvideo() {
		List<Video> list = vi.sel();
		return list;
	}


	// 按条件查询视频表
	public List<Video> conditionSelvideo(Integer tid) {
		List<Video> list = vi.selvideo(tid);
		return list;
	}

	
	//查询专家表
	public  List<Introduction> selectTeacher(){
		List<Introduction> list=im.sel();
		return list;
	} 
	
	//按条件查询专家表
		public  List<Introduction> conditionSel(Integer tid){
			List<Introduction> list=im.conditionSel(tid);
			return list;
		} 
	
	//查询专家类型表
		@Resource
		private TypeMapper tm;
		public  List<Type> selType(){
			List<Type> list=tm.selType();
			return list;
		}
		
	//查询图标表
		@Resource
		private MenuitemMapper mm;
		public  List<Menuitem> selMenuitem(){
			List<Menuitem> list=mm.selMenuitem();
			return list;
		}
		
}
