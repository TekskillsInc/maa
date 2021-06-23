package com.tekskills.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "maa_vendors")
public class VendorEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "vendorid", updatable = false, nullable = false)

	private int vendorid;

	@Column(name = "prtyid")
	private int prtyid;

	@Column(name = "vendorname")
	private String vendorname;

	@Column(name = "profession")
	private String profession;

	@Column(name = "mobile")
	private String mobile;

	@Column(name = "altmobile")
	private String altmobile;

	@Column(name = "email")
	private String email;

	@Column(name = "vendorimg")
	private String vendorimg;

	@Column(name = "idtype")
	private String idtype;

	@Column(name = "idimg")
	private String idimg;

	@Column(name = "idno")
	private String idno;

	@Column(name = "country")
	private String country;

	@Column(name = "state")
	private String state;

	@Column(name = "city")
	private String city;

	@Column(name = "pincode")
	private String pincode;

	@Column(name = "address")
	private String address;

	@Column(name = "status")
	private int status;

	@Column(name = "vstatus")
	private String vstatus;

	@Column(name = "flag")
	private String flag;

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getVendorid() {
		return vendorid;
	}

	public void setVendorid(int vendorid) {
		this.vendorid = vendorid;
	}

	public int getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAltmobile() {
		return altmobile;
	}

	public void setAltmobile(String altmobile) {
		this.altmobile = altmobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVendorimg() {
		return vendorimg;
	}

	public void setVendorimg(String vendorimg) {
		this.vendorimg = vendorimg;
	}

	public String getIdtype() {
		return idtype;
	}

	public void setIdtype(String idtype) {
		this.idtype = idtype;
	}

	public String getIdimg() {
		return idimg;
	}

	public void setIdimg(String idimg) {
		this.idimg = idimg;
	}

	public String getIdno() {
		return idno;
	}

	public void setIdno(String idno) {
		this.idno = idno;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getVstatus() {
		return vstatus;
	}

	public void setVstatus(String vstatus) {
		this.vstatus = vstatus;
	}

}
