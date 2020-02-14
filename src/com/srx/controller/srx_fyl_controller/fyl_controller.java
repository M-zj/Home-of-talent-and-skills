package com.srx.controller.srx_fyl_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ResponseBody;

import com.srx.model.srx_fyl_model.Introduction;
import com.srx.model.srx_fyl_model.Yh;
import com.srx.model.srx_fyl_model.zjdy;
import com.srx.model.srx_mzj_model.Video;
import com.srx.model.srx_fyl_model.Zj;
import com.srx.service.srx_fyl_service.fyl_service;
import com.srx.service.srx_fzk_service.fzk_service;
import com.srx.util.Result;

@CrossOrigin(origins = "*",allowCredentials="true")
@Controller
public class fyl_controller {
	
	

	Integer id;
	@Resource(name="fyl_service")
	private  fyl_service fyl_service;
		

	@Resource(name = "fzk_service")
	private fzk_service fs;
	


	@RequestMapping("list")
	public String sel(HttpServletRequest request){
		id=Integer.parseInt(request.getParameter("id").toString());
//		System.out.println("专家列表ID为"+id);
		return "null";
	}
	
	//专家查询跳转	
	@RequestMapping(value="zjdy",method = RequestMethod.GET)
	public String zjdy(HttpServletRequest request){
		id=Integer.parseInt(request.getParameter("id").toString());
//		System.out.println("互动答疑ID为："+id);
		return "null";
	}
	//根据专家id查询
	@RequestMapping("zjdyid")
	@ResponseBody
	public Result zjdyid(){
		
		Result r=new Result();
		List<zjdy> list=fyl_service.selzjdy(id);
		r.setData(list);
		return r;
		
	}
	//用户插入留言
@RequestMapping("zjdyinsert")
@ResponseBody
public Result zjdyinsert(HttpServletRequest request){
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	List<zjdy> list=fyl_service.selinsert(request.getParameter("content"),df.format(new Date()).toString(),id);
	Result r=new Result();
	r.setData(list);
	return  r;
}
	
	//pc端专家答疑
	@RequestMapping("/chat")
	public String chat() {
		return "chat";
	}
	

	@RequestMapping("/selectyhzhi")
	@ResponseBody
	public Result selectyhzhi() {
		Result r = new Result();
		List<Zj> list = fyl_service.select();
		r.setData(list);
		return r;
		
	}


	/*mzj*/
	@RequestMapping("/selectyhids")
	@ResponseBody
	public List selectyh(HttpServletRequest hrs) {
		//System.out.println(hrs.getParameter("yhiid"));
		List<Yh> list = fyl_service.selectyh(Integer.parseInt(hrs.getParameter("yhiid")));
		return list;


	}
	//pc端发送mzj
	@RequestMapping("/selectyhWhere")
	@ResponseBody
	public Result selectWhere(HttpServletRequest req) {
//		System.out.println("控制层______"+req.getParameter("zjid"));
		Result r = new Result();
		List<Yh> list = fyl_service.selectWhere(Integer.parseInt(req.getParameter("zjid")));
		r.setData(list);
		return r;


	}
	//mzj
	@RequestMapping("/huida")
	@ResponseBody
	public Result huida(HttpServletRequest hrs) {
		Result r = new Result();
		Zj z = new Zj();
//		System.out.println(hrs.getParameter("iid"));

		z.setZjcontent(hrs.getParameter("zjcontent"));
		z.setZjtime(hrs.getParameter("zjtime"));
		z.setYhid(Integer.parseInt(hrs.getParameter("yhid")));
		z.setIid(Integer.parseInt(hrs.getParameter("iid")));


		fyl_service.insert(z);
		r.setData(z);


		return r;


	}
	//mzj
	@RequestMapping("/selectyh")
	@ResponseBody
	public Result select(HttpServletRequest req) {
		System.out.println(req.getParameter("zjid"));
		Result r = new Result();
		List<Yh> list = fyl_service.select();
		r.setData(list);
		return r;


	}
	
	@RequestMapping("zj")
	@ResponseBody
	public Result zj(HttpServletRequest request){
		Result r=new Result();		
		r.setData(fyl_service.zj(id));
		return r;
	}
	
	@RequestMapping("zjtop")
	@ResponseBody
	public Result zjtop(HttpServletRequest request){
		Result r=new Result();
		r.setData(fyl_service.zjtop(id));
		return r;
	}
	
	
@RequestMapping("/videoo")
public String selvideo(HttpServletRequest request){
	return "list";	
}


@RequestMapping("/select")
@ResponseBody
public Result selec(){
	Result r=new Result();
	Introduction t=new Introduction();
	List list=fyl_service.selI();
	r.setData(list);
	return r;
}


@RequestMapping(value="/selectzhuanjia",method=RequestMethod.POST)
@ResponseBody
public Result selecz(){
	Result r=new Result();
	Introduction t=new Introduction();
	List<Introduction> list=fyl_service.selzhuanjia(id);
	r.setData(list);
	return r;
}


@RequestMapping("/sel_Top_Video_where")
@ResponseBody
public Result TopVideowhere() {
	System.out.println("sel_Top_Video_where专家id:"+id);
	Result rs=new Result();
	List<Video> list=fs.selectTopvideowhere(id);
	System.out.println("sel_Top_Video_where集合："+list);
	rs.setData(list);
	return rs;
}
}
