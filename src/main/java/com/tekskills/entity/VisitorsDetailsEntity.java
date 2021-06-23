package com.tekskills.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "maa_Visitors_Details")
public class VisitorsDetailsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", updatable = false, nullable = false)
	int id;
	@Column(name = "userid")
	int userid;
	@Column(name = "prtyid")
	int prtyid;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "visitdate")
	Date visitdate;

	@Column(name = "vname")
	String vname;
	
	@Column(name = "mobile")
	String mobile;
	
	@Column(name = "address")
	String address;
	
	@Column(name = "flag")
	int flag;
	
	@Column(name = "persontomeet")
	String persontomeet;
	
	@Column(name = "purpose")
	String purpose;
	
	@Column(name = "flatno")
	String flatno;

	@Column(name = "intime")
	String intime;
	
	@Column(name = "outtime")
	String outtime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Date getVisitdate() {
		return visitdate;
	}

	public void setVisitdate(Date visitdate) {
		this.visitdate = visitdate;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getPersontomeet() {
		return persontomeet;
	}

	public void setPersontomeet(String persontomeet) {
		this.persontomeet = persontomeet;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getFlatno() {
		return flatno;
	}

	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}

	public String getIntime() {
		return intime;
	}

	public void setIntime(String intime) {
		this.intime = intime;
	}

	public String getOuttime() {
		return outtime;
	}

	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
