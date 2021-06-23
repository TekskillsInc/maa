package com.tekskills.entity;

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
@Table(name = "maa_assoc_details")
public class AssociationEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)

	@Column(name = "id", updatable = false, nullable = false)
	private int id;
	
	@Column(name = "prtyid")
	private int prtyid;
	@Column(name = "name")
	private String name;
	@Column(name = "pic")
	private String pic;
	
	@Column(name = "email")
	private String email;
	@Column(name = "contact")
	private String contact;
	@Column(name = "memType")
	private String memType;
	@Column(name = "ownerid")
	private int ownerid;
	@Column(name = "tenantid")
	private int tenantid;
	@Temporal(TemporalType.DATE)
	@Column(name = "startdate")
	private Date startdate;
	@Temporal(TemporalType.DATE)
	@Column(name = "enddate")
	private Date enddate;
	@Column(name = "status")
	private int status;
	
	@Column(name = "flat")
	private String flat;
	
	
	
	
	public String getFlat() {
		return flat;
	}
	public void setFlat(String flat) {
		this.flat = flat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrtyid() {
		return prtyid;
	}
	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public int getTenantid() {
		return tenantid;
	}
	public void setTenantid(int tenantid) {
		this.tenantid = tenantid;
	}
	
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

}
