package com.srx.model.srx_fzk_model;

import java.sql.Date;

//��Ƶ�б�
public class Videolist {
	//��ƵID
	private int vid;
	
	//��Ƶ����
	private String vtitle;
	
	//��Ƶ����
	private Date vdate;
	
	//��Ƶ�ȶ�
	private int vclicks;
	
	//��Ƶ·��
	private String vurl;
	
	//��ƵͼƬ
	private String vpicture;
	
	//�˲ű��
	private int iid;
	
	//�˲�����
	private String iname;
	
	//�˲ż��
	private String iintroduction;
	
	//�˲��ȶ�
	private int iclick;
	
	//�˲�ͼƬ
	private String iimg;
	
	//���ͱ��
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
