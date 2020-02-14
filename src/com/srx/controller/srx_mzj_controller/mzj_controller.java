package com.srx.controller.srx_mzj_controller;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.srx.dao.srx_mzj_dao.solrImp;
import com.srx.model.srx_fyl_model.video;
import com.srx.model.srx_mzj_model.Introduction;
import com.srx.model.srx_mzj_model.Menuitem;
import com.srx.model.srx_mzj_model.Type;
import com.srx.model.srx_mzj_model.Video;
import com.srx.service.srx_ck_service.VideoService;
import com.srx.service.srx_mzj_service.mzjservice;
import com.srx.util.Result;

@CrossOrigin(origins = "*",allowCredentials="true")
@Controller
public class mzj_controller {
	

	   @Resource(name="sel")
	    private mzjservice ts;
	   
	   @Resource(name = "CkVideoService")
	   //ck service
	    private VideoService VideoM;
	   
	   /**
	     * ��д��:����
	     * Type:���ݽӿ�
	     * Date:2019-12-4:8:45
	     * �����޸�
	     * video��Ĳ�ѯ�������ݺ��е�
	     *
	     * @return
	     */
	   
	   /**
	    * mzj
	     * begin---------------------------------------------------------------
	     */

	   //mzj
	   
	   //[{"iid":1,"vclicks":1,"vdate":"2019-12-31","vid":27,"vpicture":"./resource/images/Screen_cover/cover.png","vtitle":"444","vurl":"http://43.231.185.233/Home_of_talent_and_skills/resource/video/video3.mp4"}]
	   //[{"iid":1,"iname":"灏圭礌鏄�","vclicks":1,"vdate":"2019-12-31","vid":27,"vpicture":"./resource/images/Screen_cover/cover.png","vtitle":"444","vurl":"http://43.231.185.233/Home_of_talent_and_skills/resource/video/video3.mp4"}]
	   
	   
	   //mzj 版本 solr索引搜索版----solr利用分词器（不是模糊查询）
	   solrImp si=new solrImp();
		
	   @RequestMapping(value = "V_LikeVtitle", method = RequestMethod.POST)
	   @ResponseBody
	    public List<video> VideoSelectLikeVtitle(String vtitle) throws Exception {
	    	return si.solrSelVideo(vtitle);
	    }
	    //ck 模糊查询版本搜索
	   /* @RequestMapping(value = "V_LikeVtitle", method = RequestMethod.POST)
	    @ResponseBody
	    public List<Video> VideoSelectLikeVtitle(String vtitle) {
	        return VideoM.selectLikeVtitle ( vtitle );
	    }*/
	    /**
	     * end---------------------------------------------------------------
	     */
	   
	    
	    @RequestMapping(value = "V_All", method = RequestMethod.POST)
	    @ResponseBody
	    public List<Video> VideoSelectAll() {
	        return VideoM.selectAll ();
	    }
	   
	// ��ѯ��Ƶ�ķ���
		@RequestMapping("/selvideo")
		@ResponseBody
		public Result selvideo(HttpServletRequest req) {
			Result r = new Result();
			List<Video> list = ts.selectvideo();
			//System.out.println("selvideo���ϣ�"+list);
			r.setData(list);
			return r;
		}
	   
	   
		/* �����Ͳ�ѯ��Ƶ */
		@RequestMapping("/conditionSelvideo")
		@ResponseBody
		public Result conditionSelvideo(HttpServletRequest req) {
			Result r = new Result();
			
			List<Video> list = ts.conditionSelvideo(Integer.parseInt(req.getParameter("tid")));
			r.setData(list);
			return r;
		}
	   
	   
	 //��ѯר�ҷ���
	 @RequestMapping("/selteacher")
	 @ResponseBody
	 public Result ceshi(HttpServletRequest req){	
	    	Result r=new Result();
	    	List<Introduction> list=ts.selectTeacher();
			/*for(Teacher item : list){
				//System.out.println(item.getTid());
				//System.out.println(item.getTname());
				//System.out.println(item.getTclicks());
				//System.out.println(item.getTsignature());
				//System.out.println(item.getTimg());
				//System.out.println(item.getT());
			}*/
	    	r.setData(list);
	    	 //r.setCount(list.size());
	    	 //r.setMsg("ok");
	    	 //r.setStatus(200);
	    	return r;
	    }
	 
	/*�����Ͳ�ѯר��*/
	 @RequestMapping("/conditionSel")
	 @ResponseBody
	 public Result conditionSel(HttpServletRequest req){	
	    	Result r=new Result();
	    	List<Introduction> list=ts.conditionSel(Integer.parseInt(req.getParameter("tid")));
	    	r.setData(list);
	    	return r;
	    }
	 
	 
	//��ѯר�����ͷ���
		 @RequestMapping("/seltype")
		 @ResponseBody
		 public Result type(HttpServletRequest req){	
		    	Result r=new Result();
		    	List<Type> list=ts.selType();
		    	r.setData(list);
		    	return r;
		    }
		 
		 
		 
		 //��ѯtabҳ��ͼ��ķ���
		 
		 @RequestMapping("/selMenuitem")
		 @ResponseBody
		 public Result selMenuitem(HttpServletRequest req){	
		    	Result r=new Result();
		    	List<Menuitem> list=ts.selMenuitem();
		    	r.setData(list);
		    	return r;
		    }
		 
		 
		 
		 
}
