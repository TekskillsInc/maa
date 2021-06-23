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
@Table(name="maa_owner_details")
public class OwnerDetails implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="ownrid",updatable =false, nullable =false)
	int ownrid ;
	
	@Column(name="name")
	String name ;
	@Column(name="pic")
	String pic ;
	@Column(name="id_pic")
	String id_pic;
	@Column(name="upiid")
	String upiid ;
	@Column(name="contact")
	String contact ;
	@Column(name="altcontact")
	String altcontact ;
	@Column(name="email")
	String email;
	@Column(name="address")
	String address;
	@Column(name="note")
	String note;
	 @Temporal(TemporalType.DATE)
	@Column(name="register_on")
	Date register_on;
	@Column(name="status")
		int status ;
	@Column(name="userid")
	int userid ;

	@Column(name="ousrid")
	int ousrid ;

	
	
	
	public int getOwnrid() {
		return ownrid;
	}
	
	public void setOwnrid(int ownrid) {
		this.ownrid = ownrid;
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
	public String getId_pic() {
		return id_pic;
	}
	public void setId_pic(String id_pic) {
		this.id_pic = id_pic;
	}
	public String getUpiid() {
		return upiid;
	}
	public void setUpiid(String upiid) {
		this.upiid = upiid;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
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
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getOusrid() {
		return ousrid;
	}

	public void setOusrid(int ousrid) {
		this.ousrid = ousrid;
	}

	@Override
	public String toString() {
		return "OwnerDetails [ownrid=" + ownrid + ",   name=" + name + ", pic=" + pic + ", id_pic=" + id_pic + ", upiid=" + upiid
				+ ", contact=" + contact + ", altcontact=" + altcontact + ", email=" + email + ", address=" + address
				+ ", note=" + note + ", register_on=" + register_on + ", status=" + status + "]";
	}
}
