package com.srx.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URISyntaxException;



public class Filetool {

    public static int  k=0;
	
	
	public static String txt2String(File file){
        StringBuilder result = new StringBuilder();
        try{
            BufferedReader br = new BufferedReader(new FileReader(file));//锟斤拷锟斤拷一锟斤拷BufferedReader锟斤拷锟斤拷锟斤拷取锟侥硷拷
            String s = null;
            while((s = br.readLine())!=null){//使锟斤拷readLine锟斤拷锟斤拷锟斤拷一锟轿讹拷一锟斤拷
                result.append(System.lineSeparator()+s);
            }
            br.close();    
        }catch(Exception e){
            e.printStackTrace();
        }
        return result.toString();
    }
	

	public  synchronized static void wirtefile(String path ,String content){
		
		
		FileOutputStream fop = null;
		  File file;
		
		
		
		  try {

		   file = new File(path);
		   if (!file.exists()) {
			    file.createNewFile();
			   }
		   fop = new FileOutputStream(file);

		   // if file doesnt exists, then create it
		   

		   // get the content in bytes
		   byte[] contentInBytes = content.getBytes();

		   fop.write(contentInBytes);
		   fop.flush();
		   fop.close();

		   System.out.println("Done");

		  } catch (IOException e) {
		   e.printStackTrace();
		  } finally {
		   try {
		    if (fop != null) {
		     fop.close();
		    }
		   } catch (IOException e) {
		    e.printStackTrace();
		   }
		  }
		
	
		
		
		
	}
	
	
	
	//写锟斤拷锟狡讹拷锟斤拷锟侥硷拷锟斤拷锟斤拷
	public static void writeTo(String path,String contxet) {
		
		  try {

		   String content =contxet ;

		   File file = new File(path);

		   // if file doesnt exists, then create it
		   if (!file.exists()) {
		    file.createNewFile();
		   }

		   FileWriter fw = new FileWriter(file.getAbsoluteFile());
		   BufferedWriter bw = new BufferedWriter(fw);
		   bw.write(content);
		   bw.close();

		   System.out.println("Done");

		  } catch (IOException e) {
		   e.printStackTrace();
		  }
		 }
		
		
	public static boolean fileIsExists(String strFile)
    {
        try
        {
            File f=new File(strFile);
            if(!f.exists())
            {
                    return false;
            }
 
        }
        catch (Exception e)
        {
            return false;
        }
 
        return true;
    }

	
	public static void main(String[] args) {
		 Filetool.writeTo("D:\\springwork\\game_count\\WebContent\\static\\player\\lib\\test0.js","function a() { alert('锟斤拷锟斤拷锟�');}\n锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷");
	}
		
	}
	
	

