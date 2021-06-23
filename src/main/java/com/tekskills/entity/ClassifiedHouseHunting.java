package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Maa_ClassifiedHHunting")
public class ClassifiedHouseHunting {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "id", updatable = false, nullable = false)
	
	int id;
	
	@Column(name = "name")
	  String  name ;
	 
	 @Column(name = "email")
	  String  email ;
	 
	 @Column(name = "phone")
	  String  phone ;
	 
	 @Column(name = "huntingfor")
	  String   huntingfor ;
	 
	 @Column(name = "myinterests")
	  String   myinterests ;
	 
	 @Column(name = "status")
	  String   status ;
	  
	 @Column(name = "prtyid")
	  int  prtyid ;
	 
	 public int getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getHuntingfor() {
		return huntingfor;
	}

	public void setHuntingfor(String huntingfor) {
		this.huntingfor = huntingfor;
	}

	public String getMyinterests() {
		return myinterests;
	}

	public void setMyinterests(String myinterests) {
		this.myinterests = myinterests;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	

}
