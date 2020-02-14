package com.srx.controller.srx_mzj_controller;

import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.srx.model.srx_mzj_model.Video;
import com.srx.service.srx_mzj_service.wylService;
import com.sun.org.apache.xml.internal.security.algorithms.implementations.IntegrityHmac.IntegrityHmacRIPEMD160;

@Controller
public class wylController {
	
	@Resource(name="wylService")
	private wylService wylS;
	
	@RequestMapping("/VP")
	public String VP(){
		return "VP";
		
	}
	
	@RequestMapping("/HP")
	public String HP(){
		return "HP";
		
	}
	
	@RequestMapping("/Upload_video_data")
	@ResponseBody
	public void request(HttpServletRequest  request,HttpSession hs) throws Exception  {
		String path = null;
		String path2=null;
		String url=null;
		String picture=null;
		CommonsMultipartResolver multipartResolver = 
				new CommonsMultipartResolver(request.getSession().getServletContext());
		 //检查form中是否有enctype="multipart/form-data"
		String url2=request.getSession().getServletContext().getRealPath("");
		if(multipartResolver.isMultipart(request)) {
			
			//将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            Iterator iterator =  multiRequest.getFileNames();
            int length=1;
            while(iterator.hasNext()) {
            	//一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iterator.next().toString());
               
                if(file!=null)
                {   
                
                	if(length==1){             	
                  	
                  	
                  	 picture=file.getOriginalFilename();
                	 path=url2+"/resource/img/"+file.getOriginalFilename();  
                    //上传
                    file.transferTo(new File(path));
                  
                    length+=1;
                    
                	}
                	else
                	{
                		 url=file.getOriginalFilename();
                		 
                         path2=url2+"/resource/video/"+file.getOriginalFilename();              
                       //上传
                        file.transferTo(new File(path2)); 
                       
                    	
                	}    
                }  
            }
           
            String date=request.getParameter("date");
        
            SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
            Date date1=format.parse(date);
            java.sql.Date resultDate=new java.sql.Date(date1.getTime());
          
            String title=request.getParameter("title");
          
            /*ip*/
            InetAddress addr = null;
    		try {
    			addr = InetAddress.getLocalHost();
    		} catch (UnknownHostException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		String ip=addr.getHostAddress().toString();//获得本机IP
            
            
            Video vid=new  Video();
            /*获取登录专家iid*/
            int iid=Integer.parseInt(hs.getAttribute("iid").toString());
            vid.setIid(iid);
            vid.setVclicks(1);
            vid.setVdate(resultDate);
            vid.setVpicture("http://"+ip+"/Home_of_talent_and_skills/resource/img/"+picture);
            vid.setVurl("http://"+ip+"/Home_of_talent_and_skills/resource/video/"+url);
            vid.setVtitle(title);
            wylS.insert(vid);
            
		}
		
	}
}
