package com.dgit.domain;

import java.util.Date;

public class MemberVO {
	private String userid;
	private String userpw;
	private String email;
	private Date joindate;
	private boolean secretmem;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public boolean isSecretmem() {
		return secretmem;
	}
	public void setSecretmem(boolean secretmem) {
		this.secretmem = secretmem;
	}
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", userpw=" + userpw + ", email=" + email + ", joindate=" + joindate
				+ ", secretmem=" + secretmem + "]";
	}
	
	
}
