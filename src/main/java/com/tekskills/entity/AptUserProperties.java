package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "maa_user_properties")
public class AptUserProperties {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	@Column(name = "tblpk", updatable = false, nullable = false)
	int tblpk;

	@Column(name = "userid")
	int userid;

	@Column(name = "status")
	int status;

	@Column(name = "prptyid")
	int prtyid;
	
	@Column(name="role")
		int role; //unit no
	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

	public int getTblpk() {
		return tblpk;
	}

	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}

}
