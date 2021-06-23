package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "maa_EnquiryForm")
public class EnquiryFormEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "tblpk", updatable = false, nullable = false)
	int tblpk;

	@Column(name = "userType")
	String userType; 
	
	@Column(name = "enquiryType")
	String enquiryType; 
	
	@Column(name = "prptyType")
	String prptyType; 
	
	@Column(name = "name")
	String name; 
	
	@Column(name = "email")
	String email; 
	
	@Column(name = "phone")
	String phone; 

	@Column(name = "description")
	String description;

	public int getTblpk() {
		return tblpk;
	}

	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(String enquiryType) {
		this.enquiryType = enquiryType;
	}

	

	public String getPrptyType() {
		return prptyType;
	}

	public void setPrptyType(String prptyType) {
		this.prptyType = prptyType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	} 

}
