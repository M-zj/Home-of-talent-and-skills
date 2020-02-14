package com.srx.model.srx_fyl_model;

import java.util.Date;

public class UserAnwser {

	
	private int auid;
	public int getAuid() {
		return auid;
	}
	public void setAuid(int auid) {
		this.auid = auid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	public int getApraise() {
		return apraise;
	}
	public void setApraise(int apraise) {
		this.apraise = apraise;
	}
	public int getAstatusid() {
		return astatusid;
	}
	public void setAstatusid(int astatusid) {
		this.astatusid = astatusid;
	}
	public int getUuid() {
		return uuid;
	}
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}
	
	@Override
	public String toString() {
		return "UserAnwser [auid=" + auid + ", aname=" + aname + ", acontent=" + acontent + ", adate=" + adate
				+ ", apraise=" + apraise + ", astatusid=" + astatusid + ", uuid=" + uuid + "]";
	}

	private String aname;
	private String acontent;
	private Date adate;
	private int apraise;
	private int astatusid;
	private int uuid;
}
