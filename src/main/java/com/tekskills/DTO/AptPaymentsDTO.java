package com.tekskills.DTO;

public class AptPaymentsDTO {
	private int paymentid;
	private String receiptNo;
	private String payeeName;
	private String unitNo;
	private String  paymentPurpose;
	private String paymentDate;
	private String month;
	private double totalAmount;
	private double amountPaid;
	private double dueAmount;
	private int prptyid;
	private int invcid;
	private String year;
	private int ownerid; 
	private int tenantid;
	
	public int getTblpk() {
		return tblpk;
	}
	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
	}
	private String payeeinfo;
	private Double due_amt;
	private int tblpk;
	
	
	
	public int getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}
	public int getPrptyid() {
		return prptyid;
	}
	public void setPrptyid(int prptyid) {
		this.prptyid = prptyid;
	}
	public int getInvcid() {
		return invcid;
	}
	public void setInvcid(int invcid) {
		this.invcid = invcid;
	}
	public String getReceiptNo() {
		return receiptNo;
	}
	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}
	public String getPayeeName() {
		return payeeName;
	}
	public void setPayeeName(String payeeName) {
		this.payeeName = payeeName;
	}
	public String getUnitNo() {
		return unitNo;
	}
	public void setUnitNo(String unitNo) {
		this.unitNo = unitNo;
	}
	public String getPaymentPurpose() {
		return paymentPurpose;
	}
	public void setPaymentPurpose(String paymentPurpose) {
		this.paymentPurpose = paymentPurpose;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public double getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(double amountPaid) {
		this.amountPaid = amountPaid;
	}
	public double getDueAmount() {
		return dueAmount;
	}
	public void setDueAmount(double dueAmount) {
		this.dueAmount = dueAmount;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
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
	public String getPayeeinfo() {
		return payeeinfo;
	}
	public void setPayeeinfo(String payeeinfo) {
		this.payeeinfo = payeeinfo;
	}
	public Double getDue_amt() {
		return due_amt;
	}
	public void setDue_amt(Double due_amt) {
		this.due_amt = due_amt;
	}
	
	
	
	
	
	
	
	
	
}
