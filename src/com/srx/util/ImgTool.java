package com.srx.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class ImgTool {
	

	
	public static void main(String[] args) {
		
		try {
            String bWrite = "我是中国人,我在学习输出流";
            System.out.println(bWrite);
            OutputStream os = new FileOutputStream("test.txt");
        
                os.write(bWrite.getBytes()); 
                
                os.close();
 
            InputStream is = new FileInputStream("test.txt");
            int size = is.available();
 
            for (int i = 0; i < size; i++) {
                System.out.print((char) is.read() + "  ");
            }
            is.close();
        } catch (IOException e) {
            System.out.print("Exception");
        }
    }
	

}
