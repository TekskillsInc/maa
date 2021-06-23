package com.tekskills.DTO;

public class PropertyDto {
	  private int buildingid ;
	  private int userid ; 
	  private String build_name;  
	  private String upiid ;
	  private String  proptype;
	  private String landmark ;
	  private String city ;
	  private String state;
	  private String dist ;
	  private String zip ; 
	  private String contact ;
	  private String altcontact  ;
	  private int noofflats ;
	  private int eachfloorflats ;
	  private String meterno;
	  private String watermeterno ; 
	  private String note ; 
	  private String mgr_name ;
	  private String mgr_phone ;
	  private String mgr_alt_phone;  
	  private String mgr_email  ;
	  private String bankAcntNo;
	  private String secname ;
	  private String usc ;
	  private String secphn ;
	  private String secemail ;
	  private int status ;
	  private String buldingmail  ;
	  private String prtyimg ;
	  private String accountName;
	  
	  
	  
	  
	  public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
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
	private String ifscCode;
	  //private String register_on  ;
	  
	  
	  
	  public String getPrtyimg() {
		return prtyimg;
	}
	public void setPrtyimg(String prtyimg) {
		this.prtyimg = prtyimg;
	}
	  public String getBuldingmail() {
			return buldingmail;
		}
		public void setBuldingmail(String buldingmail) {
			this.buldingmail = buldingmail;
		}
	  
	  public String getSecname() {
		return secname;
	}
	@Override
	public String toString() {
		return "PropertyDto [buildingid=" + buildingid + ", userid=" + userid + ", build_name=" + build_name
				+ ", upiid=" + upiid + ", proptype=" + proptype + ", landmark=" + landmark + ", city=" + city
				+ ", state=" + state + ", dist=" + dist + ", zip=" + zip + ", contact=" + contact + ", altcontact="
				+ altcontact + ", noofflats=" + noofflats + ", eachfloorflats=" + eachfloorflats + ", meterno="
				+ meterno + ", watermeterno=" + watermeterno + ", note=" + note + ", mgr_name=" + mgr_name
				+ ", mgr_phone=" + mgr_phone + ", mgr_alt_phone=" + mgr_alt_phone + ", mgr_email=" + mgr_email
				+ ", bankAcntNo=" + bankAcntNo + ", secname=" + secname + ", usc=" + usc + ", secphn=" + secphn
				+ ", secemail=" + secemail + ", status=" + status + ", buldingmail=" + buldingmail + ", prtyimg="
				+ prtyimg + ", accountName=" + accountName + ", ifscCode=" + ifscCode + "]";
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
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUsc() {
		return usc;
	}
	public void setUsc(String usc) {
		this.usc = usc;
	}
	

}
