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

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "maa_payments")
public class AptPaymentDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "tblpk", updatable = false, nullable = false)
	
	int tblpk;
	
	@Column(name = "unitno")
	String unitno ; 
	@Column(name = "prtyid")
	int	prptyid  ;
	
	@Column(name = "paypurpose")
	String	paypurpose ;
	
	@Column(name = "pmonth")
	String	pmonth;  
	
	@Column(name = "invcid")
	int	invcid; 
	
	
	@Column(name = "pyear")
	String	  pyear  ;
	
	@Column(name = "invAmount",precision=10, scale=2)
	double		  invAmount;
	
	@Column(name = "paid_amt",precision=10, scale=2)
	double  paid_amt  ;
	@Column(name = "dueAmount",precision=10, scale=2)
	double  amt_due  ;
	
	

	public double getAmt_due() {
		return amt_due;
	}

	public void setAmt_due(double amt_due) {
		this.amt_due = amt_due;
	}

	@Column(name = "receipt_no")
	String	  receipt_no ;
	
	 @Temporal(TemporalType.DATE)
	
	@Column(name = "paiddate")
			  Date paiddate ;
	
	@Column(name = "paymode")
			  String  paymode ;
	
	@Column(name = "note")
	  String  note ;
	
	@Override
	public String toString() {
		return "AptPaymentDetails [tblpk=" + tblpk + ", unitno=" + unitno + ", prptyid=" + prptyid + ", paypurpose="
				+ paypurpose + ", pmonth=" + pmonth + ", invcid=" + invcid + ", pyear=" + pyear + ", invAmount="
				+ invAmount + ", paid_amt=" + paid_amt + ", receipt_no=" + receipt_no + ", paiddate=" + paiddate
				+ ", paymode=" + paymode + ", userid=" + userid + ", ownerid=" + ownerid + ", tenantid=" + tenantid
				+ ", status=" + status + ", paidby=" + paidby + ",note=" + note + "]";
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Column(name = "userid")
			  int userid ;
	
	@Column(name = "ownerid")
			   int  ownerid ;
	
	@Column(name = "tenantid")
			  int   tenantid ;
	
	@Column(name = "status")
	  int   status ;
	
	@Column(name = "paidby")
	  String  paidby ;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "paymentdate")
	Date paymentdate;

	public Date getPaymentdate() {
		return paymentdate;
	}

	public void setPaymentdate(Date paymentdate) {
		this.paymentdate = paymentdate;
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

	public int getTblpk() {
		return tblpk;
	}

	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
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

	public String getPaypurpose() {
		return paypurpose;
	}

	public void setPaypurpose(String paypurpose) {
		this.paypurpose = paypurpose;
	}

	public String getPmonth() {
		return pmonth;
	}

	public void setPmonth(String pmonth) {
		this.pmonth = pmonth;
	}

	public String getPyear() {
		return pyear;
	}

	public void setPyear(String pyear) {
		this.pyear = pyear;
	}

	public double getInvAmount() {
		return invAmount;
	}

	public void setInvAmount(double invAmount) {
		this.invAmount = invAmount;
	}

	public double getPaid_amt() {
		return paid_amt;
	}

	public void setPaid_amt(double paid_amt) {
		this.paid_amt = paid_amt;
	}

	

	public String getReceipt_no() {
		return receipt_no;
	}

	public void setReceipt_no(String receipt_no) {
		this.receipt_no = receipt_no;
	}

	public Date getPaiddate() {
		return paiddate;
	}

	public void setPaiddate(Date paiddate) {
		this.paiddate = paiddate;
	}

	public String getPaymode() {
		return paymode;
	}

	public void setPaymode(String paymode) {
		this.paymode = paymode;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
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

	public int getInvcid() {
		return invcid;
	}

	public void setInvcid(int invcid) {
		this.invcid = invcid;
	}
	

}
