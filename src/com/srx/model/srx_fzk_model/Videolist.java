package com.srx.model.srx_fzk_model;

import java.sql.Date;

//视频列表
public class Videolist {
	//视频ID
	private int vid;
	
	//视频标题
	private String vtitle;
	
	//视频日期
	private Date vdate;
	
	//视频热度
	private int vclicks;
	
	//视频路径
	private String vurl;
	
	//视频图片
	private String vpicture;
	
	//人才编号
	private int iid;
	
	//人才姓名
	private String iname;
	
	//人才简介
	private String iintroduction;
	
	//人才热度
	private int iclick;
	
	//人才图片
	private String iimg;
	
	//类型编号
	private int tid;

	public int getVid() {
		return vid;
	}

	public void setVid(int vid) {
		this.vid = vid;
	}

	public String getVtitle() {
		return vtitle;
	}

	public void setVtitle(String vtitle) {
		this.vtitle = vtitle;
	}

	public Date getVdate() {
		return vdate;
	}

	public void setVdate(Date vdate) {
		this.vdate = vdate;
	}

	public int getVclicks() {
		return vclicks;
	}

	public void setVclicks(int vclicks) {
		this.vclicks = vclicks;
	}

	public String getVurl() {
		return vurl;
	}

	public void setVurl(String vurl) {
		this.vurl = vurl;
	}

	public String getVpicture() {
		return vpicture;
	}

	public void setVpicture(String vpicture) {
		this.vpicture = vpicture;
	}

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getIintroduction() {
		return iintroduction;
	}

	public void setIintroduction(String iintroduction) {
		this.iintroduction = iintroduction;
	}

	public int getIclick() {
		return iclick;
	}

	public void setIclick(int iclick) {
		this.iclick = iclick;
	}

	public String getIimg() {
		return iimg;
	}

	public void setIimg(String iimg) {
		this.iimg = iimg;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	@Override
	public String toString() {
		return "Videolist [vid=" + vid + ", vtitle=" + vtitle + ", vdate=" + vdate + ", vclicks=" + vclicks + ", vurl="
				+ vurl + ", vpicture=" + vpicture + ", iid=" + iid + ", iname=" + iname + ", iintroduction="
				+ iintroduction + ", iclick=" + iclick + ", iimg=" + iimg + ", tid=" + tid + "]";
	}
	

}
