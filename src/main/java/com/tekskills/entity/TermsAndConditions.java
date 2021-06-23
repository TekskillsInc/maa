package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="maa_TermsAndConditions")
public class TermsAndConditions {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="tblpk",updatable =false, nullable =false)
	int tblpk ;
	@Column(name="prptyId")
	int prptyId;
	@Column(name="userId")
	int userId; 
	@Column(name="TandC")
	String tandC;
	
	public int getTblpk() {
		return tblpk;
	}
	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
	}
	public int getPrptyId() {
		return prptyId;
	}
	public void setPrptyId(int prptyId) {
		this.prptyId = prptyId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTandC() {
		return tandC;
	}
	public void setTandC(String tandC) {
		this.tandC = tandC;
	}
	
}
