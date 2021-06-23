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
@Table(name = "maa_user_details")
public class ApartmentDetialsEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * @Id
	 * 
	 * @GeneratedValue(strategy=GenerationType.IDENTITY)
	 * 
	 * @Column(name ="buildingid", updatable =false, nullable =false)
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)

	@Column(name = "buildingid", updatable = false, nullable = false)
	private int buildingid;

	@Column(name = "userid")
	private int userid;
	
	@Column(name = "build_name")
	private String build_name;

	@Column(name = "buldingmail")
	private String buldingmail;
	
	@Column(name = "upiid")
	private String upiid;
	
	@Column(name = "bankAcntNo")
	private String bankAcntNo;
	
	@Column(name = "ifscCode")
	private String ifscCode;
	
	@Column(name = "accountname")
	private String accountname;
	


	public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getBankAcntNo() {
		return bankAcntNo;
	}

	public void setBankAcntNo(String bankAcntNo) {
		this.bankAcntNo = bankAcntNo;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	@Column(name = "uscno")
	private String uscno;

	@Column(name = "proptype")
	private String proptype;
	
	@Column(name = "landmark")
	private String landmark;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "state")
	private String state;
	
	@Column(name = "dist")
	private String dist;
	
	@Column(name = "zip")
	private String zip;
	
	@Column(name = "contact")
	private String contact;

	@Column(name = "altcontact")
	private String altcontact;
	
	@Column(name = "noofflats")
	private int noofflats;
	
	@Column(name = "eachfloorflats")
	private int eachfloorflats;
	
	@Column(name = "meterno")
	private String meterno;
	
	@Column(name = "watermeterno")
	private String watermeterno;
	
	@Column(name = "note")
	private String note;
	
	@Column(name = "mgr_name")
	private String mgr_name;
	
	@Column(name = "mgr_phone")
	private String mgr_phone;
	
	@Column(name = "mgr_alt_phone")
	private String mgr_alt_phone;
	
	@Column(name = "mgr_email")
	private String mgr_email;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "register_on")
	private Date register_on;
	
	@Column(name = "secname")
	private String secname;
	
	@Column(name = "secphn")
	private String secphn;
	
	@Column(name = "secemail")
	private String secemail;
	
	@Column(name = "status")
	private int status;

	@Column(name = "prtyimg")
	private String prtyimg;

	public String getUscno() {
		return uscno;
	}

	public void setUscno(String uscno) {
		this.uscno = uscno;
	}

	public String getPrtyimg() {
		return prtyimg;
	}

	public void setPrtyimg(String prtyimg) {
		this.prtyimg = prtyimg;
	}

	public String getSecname() {
		return secname;
	}

	public void setSecname(String secname) {
		this.secname = secname;
	}

	public String getSecphn() {
		return secphn;
	}

	public void setSecphn(String secphn) {
		this.secphn = secphn;
	}

	public String getSecemail() {
		return secemail;
	}

	public void setSecemail(String secemail) {
		this.secemail = secemail;
	}

	public int getBuildingid() {
		return buildingid;
	}

	public void setBuildingid(int buildingid) {
		this.buildingid = buildingid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getBuild_name() {
		return build_name;
	}

	public void setBuild_name(String build_name) {
		this.build_name = build_name;
	}

	public String getUpiid() {
		return upiid;
	}

	public void setUpiid(String upiid) {
		this.upiid = upiid;
	}

	public String getProptype() {
		return proptype;
	}

	public void setProptype(String proptype) {
		this.proptype = proptype;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAltcontact() {
		return altcontact;
	}

	public void setAltcontact(String altcontact) {
		this.altcontact = altcontact;
	}

	public int getNoofflats() {
		return noofflats;
	}

	public void setNoofflats(int noofflats) {
		this.noofflats = noofflats;
	}

	public int getEachfloorflats() {
		return eachfloorflats;
	}

	public void setEachfloorflats(int eachfloorflats) {
		this.eachfloorflats = eachfloorflats;
	}

	public String getMeterno() {
		return meterno;
	}

	public void setMeterno(String meterno) {
		this.meterno = meterno;
	}

	public String getWatermeterno() {
		return watermeterno;
	}

	public void setWatermeterno(String watermeterno) {
		this.watermeterno = watermeterno;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getMgr_name() {
		return mgr_name;
	}

	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}

	public String getMgr_phone() {
		return mgr_phone;
	}

	public void setMgr_phone(String mgr_phone) {
		this.mgr_phone = mgr_phone;
	}

	public String getMgr_alt_phone() {
		return mgr_alt_phone;
	}

	public void setMgr_alt_phone(String mgr_alt_phone) {
		this.mgr_alt_phone = mgr_alt_phone;
	}

	public String getMgr_email() {
		return mgr_email;
	}

	public void setMgr_email(String mgr_email) {
		this.mgr_email = mgr_email;
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

	public String getBuldingmail() {
		return buldingmail;
	}

	public void setBuldingmail(String buldingmail) {
		this.buldingmail = buldingmail;
	}
	@Override
	public String toString() {
		return "ApartmentDetialsEntity [buildingid=" + buildingid + ", userid=" + userid + ", build_name=" + build_name
				+ ", buldingmail=" + buldingmail + ", upiid=" + upiid + ", uscno=" + uscno + ", proptype=" + proptype
				+ ", landmark=" + landmark + ", city=" + city + ", state=" + state + ", dist=" + dist + ", zip=" + zip
				+ ", contact=" + contact + ", altcontact=" + altcontact + ", noofflats=" + noofflats
				+ ", eachfloorflats=" + eachfloorflats + ", meterno=" + meterno + ", watermeterno=" + watermeterno
				+ ", note=" + note + ", mgr_name=" + mgr_name + ", mgr_phone=" + mgr_phone + ", mgr_alt_phone="
				+ mgr_alt_phone + ", mgr_email=" + mgr_email + ", register_on=" + register_on + ", secname=" + secname
				+ ", secphn=" + secphn + ", secemail=" + secemail + ", status=" + status + ", prtyimg=" + prtyimg + "]";
	}
}
