package com.tekskills.DTO;



public class AptInvoiceDTO {
	private int invid;
	private String unitno;
	private int prptyid;
	private String month;
	private String year;
	private Double invoiceAmount;
	private String paidby;
	private int status;
	private Double amountpaid;
	private Double dueAmount;
	private int ownerid;
	private int tenantid;
	private String upiid;
	private String bankAcntNo;
	private String ifscCode;
	private String accountname;
	

	public String getUpiid() {
		return upiid;
	}
	public void setUpiid(String upiid) {
		this.upiid = upiid;
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
	public String getAccountname() {
		return accountname;
	}
	public void setAccountname(String accountname) {
		this.accountname = accountname;
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
	public int getInvid() {
		return invid;
	}
	public void setInvid(int invid) {
		this.invid = invid;
	}
	public String getUnitno() {
		return unitno;
	}
	public void setUnitno(String unitno) {
		this.unitno = unitno;
	}
	public int getPrptyid() {
		return prptyid;
	}
	public void setPrptyid(int prptyid) {
		this.prptyid = prptyid;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Double getInvoiceAmount() {
		return invoiceAmount;
	}
	public void setInvoiceAmount(Double invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}
	public String getPaidby() {
		return paidby;
	}
	public void setPaidby(String paidby) {
		this.paidby = paidby;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Double getAmountpaid() {
		return amountpaid;
	}
	public void setAmountpaid(Double amountpaid) {
		this.amountpaid = amountpaid;
	}
	public Double getDueAmount() {
		return dueAmount;
	}
	public void setDueAmount(Double dueAmount) {
		this.dueAmount = dueAmount;
	}
}
