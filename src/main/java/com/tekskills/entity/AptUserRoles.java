package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="maa_user_roles")
public class AptUserRoles {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="tblpk",updatable =false, nullable =false)
	int tblpk ;//assetid pk
	
	  @Column(name="userid")
	int userid; //propert id
	  @Column(name="role")
	int role; //unit no

	

	  @Column(name="status")
	int status;//prty tax

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


}
