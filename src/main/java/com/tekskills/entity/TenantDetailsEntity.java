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
@Table(name="maa_tenant_details")
public class TenantDetailsEntity {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="tntid",updatable =false, nullable =false)
	int tbl_id ;
	
	@Column(name="userid")
	int userid ;

	@Column(name="tenant_name")
	String tenant_name ;
	
	@Column(name="tenant_email")
	String tenant_email ;
	
	@Column(name="tenant_contact")
	String tenant_contact ;
	
	@Column(name="pics")
	String pics ;
	
	@Column(name="id_pics")
	String id_pics ;
	
	@Column(name="id_number")
	String id_number ;
	
	@Column(name="advamount")
	int advamount ;
	
	@Column(name="address")
	String address ;
	 @Temporal(TemporalType.DATE)
	@Column(name="join_date")
	Date join_date ;
	 @Override
	public String toString() {
		return "TenantDetailsEntity [tbl_id=" + tbl_id + ", userid=" + userid + ", tenant_name=" + tenant_name
				+ ", tenant_email=" + tenant_email + ", tenant_contact=" + tenant_contact + ", pics=" + pics
				+ ", id_pics=" + id_pics + ", id_number=" + id_number + ", advamount=" + advamount + ", address="
				+ address + ", join_date=" + join_date + ", end_date=" + end_date + ", register_on=" + register_on
				+ ", status=" + status + ", tusrid=" + tusrid + ", comments=" + comments + ", IdNumber=" + IdNumber
				+ "]";
	}

	@Temporal(TemporalType.DATE)
	@Column(name="end_date")
	Date end_date ;
	 @Temporal(TemporalType.DATE)
	@Column(name="register_on")
	Date register_on ;
	
	@Column(name="status")
	int status ;
	
	@Column(name="tusrid")
	int tusrid ;
	
	@Column(name="comments")
	String comments ;
	@Column(name="IdNumber")
	String IdNumber ;
	
	
	public String getIdNumber() {
		return IdNumber;
	}

	public void setIdNumber(String idNumber) {
		IdNumber = idNumber;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public int getTbl_id() {
		return tbl_id;
	}

	public void setTbl_id(int tbl_id) {
		this.tbl_id = tbl_id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	

	
	public int getTusrid() {
		return tusrid;
	}

	public void setTusrid(int tusrid) {
		this.tusrid = tusrid;
	}

	public String getTenant_name() {
		return tenant_name;
	}

	public void setTenant_name(String tenant_name) {
		this.tenant_name = tenant_name;
	}

	public String getTenant_email() {
		return tenant_email;
	}

	public void setTenant_email(String tenant_email) {
		this.tenant_email = tenant_email;
	}

	public String getTenant_contact() {
		return tenant_contact;
	}

	public void setTenant_contact(String tenant_contact) {
		this.tenant_contact = tenant_contact;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public String getId_pics() {
		return id_pics;
	}

	public void setId_pics(String id_pics) {
		this.id_pics = id_pics;
	}

	public String getId_number() {
		return id_number;
	}

	public void setId_number(String id_number) {
		this.id_number = id_number;
	}

	public int getAdvamount() {
		return advamount;
	}

	public void setAdvamount(int advamount) {
		this.advamount = advamount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

}
