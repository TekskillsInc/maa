package com.tekskills.DTO;

public class VacanciesDto {
	
	String ropertyName;
	String unitNo;
	String ownerName;
	String mobileNo;
	String eMailId;
	String location;
	int prtyid;
	
	public int getPrtyid() {
		return prtyid;
	}
	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}
	public String getRopertyName() {
		return ropertyName;
	}
	public void setRopertyName(String ropertyName) {
		this.ropertyName = ropertyName;
	}
	public String getUnitNo() {
		return unitNo;
	}
	public void setUnitNo(String unitNo) {
		this.unitNo = unitNo;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String geteMailId() {
		return eMailId;
	}
	public void seteMailId(String eMailId) {
		this.eMailId = eMailId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
}
