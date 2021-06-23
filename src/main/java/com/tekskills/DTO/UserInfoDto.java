package com.tekskills.DTO;

import java.util.Date;

public class UserInfoDto {

	private Integer userid;
	private String email;
	private String uscno;
	private Date register_on;
	private int status;
	private int roleid;


	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUscno() {
		return uscno;
	}

	public void setUscno(String uscno) {
		this.uscno = uscno;
	}

	public Date getRegister_on() {
		return register_on;
	}

	public void setRegister_on(Date register_on) {
		this.register_on = register_on;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	

}
