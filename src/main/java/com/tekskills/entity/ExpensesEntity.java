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
@Table(name = "maa_Expenses")
public class ExpensesEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)

	@Column(name = "expenseid", updatable = false, nullable = false)
	int expenseid;
	
	@Column(name = "vendorid")
	int vendorid;
	
	@Column(name = "prtyid")
	int prtyid;

	@Column(name = "vendorname")
	String vendorname;
	
	@Column(name = "userid")
	int userid;
	
	@Column(name = "flatno")
	String flatno;
	
	@Column(name = "expenseamount")
	float expenseamount;
	
	@Column(name = "purpose")
	String purpose;
	
	@Column(name = "emonth")
	String emonth;

	@Column(name = "Description")
	String description;
	
	@Column(name = "flag")
	int flag;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "expensedate")
	Date expensedate;
	
	public int getExpenseid() {
		return expenseid;
	}

	public void setExpenseid(int expenseid) {
		this.expenseid = expenseid;
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

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getFlatno() {
		return flatno;
	}

	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}

	public float getExpenseamount() {
		return expenseamount;
	}

	public void setExpenseamount(float expenseamount) {
		this.expenseamount = expenseamount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public Date getExpensedate() {
		return expensedate;
	}

	public void setExpensedate(Date expensedate) {
		this.expensedate = expensedate;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getEmonth() {
		return emonth;
	}

	public void setEmonth(String emonth) {
		this.emonth = emonth;
	}
}
