package com.srx.service.srx_fyl_service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.srx.dao.srx_fyl_dao.IntroductionMappers;
import com.srx.model.srx_fyl_model.Introduction;
import com.srx.model.srx_fyl_model.Yh;
import com.srx.model.srx_fyl_model.zjdy;
import com.srx.model.srx_fyl_model.Zj;
import com.srx.model.srx_fyl_model.video;
@Service("fyl_service")
public class fyl_service {
	@Resource
	private IntroductionMappers Intro;
	
	static byte[] bytes=null; 
	
	public List<Introduction> selI(){
		List<Introduction> list=Intro.selI();
		return list;
		
	}
	
	/****
	 * 2019年12月12日19:04:45
	 * 刘潇
	 * bytes 文件数据
	 * **/
	
		/**
	     * 以字节为单位读取文件，常用于读二进制文件，如图片、声音、影像等文件。
	     */
	    public  void readFileByBytes(String name,String title,String time,String img,String fileName,HttpServletRequest req) {
	        File file = new File(fileName);
	        InputStream in = null;
	        try {
	            System.out.println("以字节为单位读取文件内容，一次读一个字节：");
	            // 一次读一个字节
	            in = new FileInputStream(file);
	            int tempbyte;
	            while ((tempbyte = in.read()) != -1) {
	                System.out.write(tempbyte);
	            }
	            in.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	            return;
	        }
	        try {
	            System.out.println("以字节为单位读取文件内容，一次读多个字节：");
	            // 一次读多个字节
	            byte[] tempbytes = new byte[100];
	            int byteread = 0;
	            in = new FileInputStream(fileName);
	            fyl_service.showAvailableBytes(in);
	            in.read(bytes,0,in.available());
	            
	        } catch (Exception e1) {
	            e1.printStackTrace();
	        } finally {
	            if (in != null) {
	                try {
	                    in.close();
	                } catch (IOException e1) {
	                }
	            }
	        }
	       ///////////////////////写////////////////////////// 
	        BufferedInputStream bis = null;
	        FileOutputStream fos = null;
	        BufferedOutputStream output = null;
	        try {
	            ByteArrayInputStream byteInputStream = new ByteArrayInputStream(bytes);
	            bis = new BufferedInputStream(byteInputStream);
	            File file2 = new File(req.getSession().getServletContext().getRealPath("WebContent")+"/resource");
	            // 获取文件的父路径字符串
	            File path = file2.getParentFile();
	            if (!path.exists()) {	                
	                boolean isCreated = path.mkdirs();	               
	            }
	            fos = new FileOutputStream(file);
	            // 实例化OutputString 对象
	            output = new BufferedOutputStream(fos);
	            byte[] buffer = new byte[1024];
	            int length = bis.read(buffer);
	            while (length != -1) {
	                output.write(buffer, 0, length);
	                length = bis.read(buffer);
	            }
	            output.flush();
	        } catch (Exception e) {
	           
	        } finally {
	            try {
	                bis.close();
	                fos.close();
	                output.close();
	            } catch (IOException e0) {
	               
	            }
	        }
	        video v=new video();
	        v.setIid(3);
	        v.setVclicks(10);
	        Date date=new Date();
	        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
	        v.setVdate(s.format(date));
	        v.setVpicture("./resource/images/Screen_cover/cover.png");
	        v.setVtitle(title);
	        String[] ss=fileName.split(".");
	        v.setVurl("./resource/video/Video_is_recommended/video1.mp4");
	        int count = Intro.insertV(v);
	 }
	
	    
	    /**
	     * 显示输入流中还剩的字节数
	     */
	    private static void showAvailableBytes(InputStream in) {
	        try {
	            System.out.println("当前字节输入流中的字节数为:" + in.available());
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	public List<Introduction> selzhuanjia(Integer iid){
		List<Introduction> list=Intro.selIzhuanjia(iid);
		return list;
		
	}
	public int selvid(String name,String title,String time,String img,String fileName){
		 video v=new video();
	        v.setIid(3);
	        v.setVclicks(10);
	        Date date=new Date();
	        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
	        v.setVdate(s.format(date));
	        v.setVpicture("./resource/images/Screen_cover/cover.png");
	        v.setVtitle(title);
	        v.setVurl("./resource/video/Video_is_recommended/"+fileName);
	        return   Intro.insertV(v);

	}
	
	
	//查询id
	public List<zjdy> selzjdy(Integer iid){
		List<zjdy> list=Intro.selzjdy(iid);
		return list;
	}
	//插入用户表
	public List<zjdy> selinsert(String content,String data,Integer iid){
		List<zjdy> list=null;
		zjdy z=new zjdy();
		z.setYhcontent(content);
		z.setYhtime(data);
		z.setYhiid(iid);
		int i=Intro.insertzjdy(z);
		return list;
	}
	
	//查询全部问答
	public List<zjdy> zj(Integer i){
		return Intro.selzj(i);
    }
	public List<zjdy> zjtop(Integer i){
		return Intro.selzjtop(i);
    }
	
	// 查询用户所有
		public List select() {
			List list = Intro.selectAll();
			return list;
		}

		//pc端发送
				public boolean insert(Zj z) {
					if (Intro.insert(z) > 0) {
						return true;
					} else {
						return false;
					}
				}
				
				public List selectyh(Integer yhiid) {
					List<Yh> list = Intro.selectyh(yhiid);


					return list;
				}
				
				public List selectWhere(Integer yhid) {
					System.out.println("业务层————————"+yhid);
					List list = Intro.selectWhere(yhid);
					return list;
				}
	}
