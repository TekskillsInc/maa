package com.tekskills.DTO;

public class ExpenseDTO {
	 private int expenseid;
	 private int vendorid;
	 private int prtyid;
	 private String vendorname;
	 private int userid;
	 private String flatno;
	 private Double expenseamount;
	 private String purpose;
	 private String description;
	 private int flag;
	 private  String expensedate;
	 private  String month;
	 
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getExpenseid() {
		return expenseid;
	}

	public void setExpenseid(int expenseid) {
		this.expenseid = expenseid;
	}
	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
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

	public Double getExpenseamount() {
		return expenseamount;
	}

	public void setExpenseamount(Double expenseamount) {
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

	public String getExpensedate() {
		return expensedate;
	}

	public void setExpensedate(String expensedate) {
		this.expensedate = expensedate;
	}
}
