package com.srx.model.srx_fyl_model;

import java.sql.Date;

public class video {
private int vid;
private String vtitle;
private String vdate;
private int vclicks;
private String vurl;
private String iname;
/*@Override
public String toString() {
	return "video [vid=" + vid + ", vtitle=" + vtitle + ", vdate=" + vdate + ", vclicks=" + vclicks + ", vurl=" + vurl
			+ ", vpicture=" + vpicture + ", iid=" + iid + ", getVid()=" + getVid() + ", getVtitle()=" + getVtitle()
			+ ", getVdate()=" + getVdate() + ", getVclicks()=" + getVclicks() + ", getVurl()=" + getVurl()
			+ ", getVpicture()=" + getVpicture() + ", getIid()=" + getIid() + ", getClass()=" + getClass()
			+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}*/




private String vpicture;
@Override
public String toString() {
	return "video [vid=" + vid + ", vtitle=" + vtitle + ", vdate=" + vdate + ", vclicks=" + vclicks + ", vurl=" + vurl
			+ ", iname=" + iname + ", vpicture=" + vpicture + ", iid=" + iid + "]";
}
private int iid;

public String getIname() {
	return iname;
}

public void setIname(String iname) {
	this.iname = iname;
}
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
public String getVdate() {
	return vdate;
}
public void setVdate(String string) {
	this.vdate = string;
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
}
