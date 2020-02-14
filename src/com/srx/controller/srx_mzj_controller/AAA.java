package com.srx.controller.srx_mzj_controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.druid.sql.visitor.functions.Function;
import com.srx.model.srx_mzj_model.Video;
import com.srx.service.srx_mzj_service.wylService;
import com.srx.util.Result;

@Controller
public class AAA {
	
	/*mzj*/
	@Resource(name="wylService")
	private wylService wylS;
	
	private String cover="";
	private String video="";
	private String IP;
	
	/*
     *采用spring提供的上传文件的方法 POST
     *MZJ精心打造
     */
    @RequestMapping(value="/springUpload", method = RequestMethod.POST)
    @ResponseBody
    public Result  springUploadpost(HttpServletRequest request)
    {
    	//获取本项目在服务器上的路径
    	String tomcatPath=request.getSession().getServletContext().getRealPath("");
    	Result result=new Result();
         //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
           //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    try {
						//判断上传的封面还是视频，然后给参数赋值往数据库插入
						switch (request.getParameter("op")) {
						case "cover":
							cover="";
							cover=file.getOriginalFilename();
							//上传
							file.transferTo(new File(tomcatPath+"/resource/img/"+file.getOriginalFilename()));
							result.setMsg("C");
							break;
						case "video":
							video="";
							video=file.getOriginalFilename();
							//上传
							file.transferTo(new File(tomcatPath+"/resource/video/"+file.getOriginalFilename()));
							result.setMsg("V");
							break;
						default:
							break;
						}
						result.setStatus(200);
	                    result.setData("ok");
					} catch (IllegalStateException e) {
						result.setData(e);
						e.printStackTrace();
					} catch (IOException e) {
						result.setData(e);
						e.printStackTrace();
					}
                }

            }

        }
        return result; 
    }
    
    //插入video表数据
    @RequestMapping(value="/insertvideo", method = RequestMethod.POST)
    @ResponseBody
    private int insertvideo(HttpServletRequest req,HttpSession hs) throws ParseException{
    	/*ip*/
        InetAddress addr = null;
    	try {
    		addr = InetAddress.getLocalHost();
    	} catch (UnknownHostException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	IP=addr.getHostAddress().toString();//获得本机IP
    	
    	
    	String vtitle=req.getParameter("vtitle");
    	String vdate=req.getParameter("vdate");
    	//转date类型
    	 SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
         Date date1=format.parse(vdate);
         java.sql.Date resultDate=new java.sql.Date(date1.getTime());
    	
        Video v=new Video();
        //获取登录专家iid
        int iid=Integer.parseInt(hs.getAttribute("iid").toString());
        v.setIid(iid);
        v.setVclicks(0);
        v.setVdate(resultDate);
        v.setVpicture("http://"+IP+"/Home_of_talent_and_skills/resource/img/"+cover);
        v.setVurl("http://"+IP+"/Home_of_talent_and_skills/resource/video/"+video);
        v.setVtitle(vtitle);
        try {
        	wylS.insert(v);
		} catch (Exception e) {
			return 0;
		}
        cover="";//吧上传的封面名字为空
        video="";//吧上传的视频名字为空
        return 1;
    }
    

    

}
