package com.srx.util;

import java.io.Serializable;

public class Result  implements Serializable{

	

		/**
	 * 
	 */
	    private static final long serialVersionUID = 1L;
		private int status;//404// 500 501 200
		private String msg;
		private Object data;
		private int count;
		private String user;
		public int getStatus() {
			return status;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		public Object getData() {
			return data;
		}
		public void setData(Object data) {
			this.data = data;
		}

	public String getUser() {
			return user;
		}
		public void setUser(String user) {
			this.user = user;
		}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Result [user:"+user+"]";
	}
	

}



