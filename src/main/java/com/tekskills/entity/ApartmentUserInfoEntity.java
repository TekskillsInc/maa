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
@Table(name="maa_user_info")
public class ApartmentUserInfoEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="userid",updatable =false, nullable =false)

	 
	  private Integer id;
	  
	  @Column(name="email")
	  private String email;
	  
	  @Column(name="password")
	  private String password;
	 
	  @Temporal(TemporalType.DATE)
	  @Column(name="register_on")
	  private Date register_on;
	  
	  @Column(name="active")
	  private int active;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegister_on() {
		return register_on;
	}

	public void setRegister_on(Date register_on) {
		this.register_on = register_on;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	  

	
 
	 
}
