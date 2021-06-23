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
@Table(name = "maa_invoice")
public class InvoiceEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "invoiceid", updatable = false, nullable = false)
	
	int invoiceid;
	
	@Column(name = "flano")
	String flano ; 
	@Column(name = "prptyid")
	Integer	prptyid  ;
	
	@Column(name = "wtrUnits")
	Integer	wtrUnits ;
	
	@Column(name = "wtrCost" ,precision=10, scale=2)
	Double	wtrCost;  
	
	
	@Column(name = "wtrGST")
	Double	  wtrGST  ;
	@Column(name = "pwrUnits")
	Integer		  pwrUnits;
	
	@Column(name = "pwrCost",precision=10, scale=2)
	Double  pwrCost  ;
	
	@Column(name = "pwrGST")
	Double	  pwrGST ;
	
	@Column(name = "gasUnits")
	Integer	  gasUnits ;
	@Column(name = "gasCost",precision=10, scale=2)
	Double	  gasCost  ;
	
	@Column(name = "gasGST")
	Double	  gasGST;
	
	@Column(name = "dslUnits")
	Integer		  dslUnits;
	
	@Column(name = "dslCost",precision=10, scale=2)
	Double		  dslCost  ;
	@Column(name = "dslGST")
	Double		  dslGST  ;
	@Column(name = "acUnits")
		Integer	  acUnits;
	
	@Column(name = "acCost",precision=10, scale=2)
		Double	  acCost;
	@Column(name = "acGST")
		Double  acGST ;
	@Column(name = "othrUnits")
			Integer  othrUnits ;
	
	@Column(name = "othrCost",precision=10, scale=2)
			  Double	  othrCost;
	
	@Column(name = "othrGST")
			  Double	  othrGST ;
	
	@Column(name = "rent")
			 Integer  rent ;
	@Column(name = "rentGST")
			 Double  rentGST;
	
	@Column(name = "maintenance")
			  Integer maintenance ;
	
	@Column(name = "maintenanceGST")
	Integer maintenanceGST ;
	
	
	@Column(name = "invoiceAmount",precision=10, scale=2)
	  Double  invoiceAmount ;
	
	public Double getInvoiceAmount() {
		return invoiceAmount;
	}
	public void setInvoiceAmount(Double invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}
	@Column(name = "month")
			  String month ;
	@Column(name = "year")
			 String year ;
	@Column(name = "comment")
			  String comment ;
	@Column(name = "userid")
			  Integer userid ;
	@Column(name = "ownerid")
			   Integer  ownerid ;
	@Column(name = "tenentid")
			  Integer   tenentid ;
	
	@Column(name = "status")
	int   status ;
	
	@Column(name = "wtrtotal",precision=10, scale=2)
	  Double  wtrtotal ;
	
	@Column(name = "pwrtotal",precision=10, scale=2)
	  Double  pwrtotal ;
	
	@Column(name = "gastotal",precision=10, scale=2)
	  Double  gastotal ;
	
	@Column(name = "dsltotal",precision=10, scale=2)
	  Double  dsltotal ;
	
	@Column(name = "actotal",precision=10, scale=2)
	  Double  actotal ;
	
	@Column(name = "othtotal",precision=10, scale=2)
	  Double  othtotal ;
	
	@Column(name = "renttotal",precision=10, scale=2)
	  Double  renttotal ;
	
	@Column(name = "mnttotal",precision=10, scale=2)
	  Double  mnttotal ;
	
	
	@Temporal(TemporalType.DATE)
	@Column(name = "invoicedate")
	  Date  invoicedate ;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "updateddate")
	Date  updateddate ;
	

	
	
	public Date getUpdateddate() {
		return updateddate;
	}
	public void setUpdateddate(Date updateddate) {
		this.updateddate = updateddate;
	}
	
	
	
	
	
	public Integer getMaintenanceGST() {
		return maintenanceGST;
	}
	public void setMaintenanceGST(Integer maintenanceGST) {
		this.maintenanceGST = maintenanceGST;
	}
	public Double getWtrtotal() {
		return wtrtotal;
	}
	public void setWtrtotal(Double wtrtotal) {
		this.wtrtotal = wtrtotal;
	}
	public Double getPwrtotal() {
		return pwrtotal;
	}
	public void setPwrtotal(Double pwrtotal) {
		this.pwrtotal = pwrtotal;
	}
	public Double getGastotal() {
		return gastotal;
	}
	public void setGastotal(Double gastotal) {
		this.gastotal = gastotal;
	}
	public Double getDsltotal() {
		return dsltotal;
	}
	public void setDsltotal(Double dsltotal) {
		this.dsltotal = dsltotal;
	}
	public Double getActotal() {
		return actotal;
	}
	public void setActotal(Double actotal) {
		this.actotal = actotal;
	}
	public Double getOthtotal() {
		return othtotal;
	}
	public void setOthtotal(Double othtotal) {
		this.othtotal = othtotal;
	}
	public Double getRenttotal() {
		return renttotal;
	}
	public void setRenttotal(Double renttotal) {
		this.renttotal = renttotal;
	}
	public Double getMnttotal() {
		return mnttotal;
	}
	public void setMnttotal(Double mnttotal) {
		this.mnttotal = mnttotal;
	}
	public Date getInvoicedate() {
		return invoicedate;
	}
	public void setInvoicedate(Date invoicedate) {
		this.invoicedate = invoicedate;
	}
	public void setMaintenance(Integer maintenance) {
		this.maintenance = maintenance;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status2) {
		this.status = status2;
	}
	public int getInvoiceid() {
		return invoiceid;
	}
	public void setInvoiceid(int invoiceid) {
		this.invoiceid = invoiceid;
	}
	public String getFlano() {
		return flano;
	}
	public void setFlano(String flano) {
		this.flano = flano;
	}
	public Integer getPrptyid() {
		return prptyid;
	}
	public void setPrptyid(Integer prptyid) {
		this.prptyid = prptyid;
	}
	public Integer getWtrUnits() {
		return wtrUnits;
	}
	public void setWtrUnits(Integer wtrUnits) {
		this.wtrUnits = wtrUnits;
	}
	public Double getWtrCost() {
		return wtrCost;
	}
	public void setWtrCost(Double wtrCost) {
		this.wtrCost = wtrCost;
	}
	public Double getWtrGST() {
		return wtrGST;
	}
	public void setWtrGST(Double wtrGST) {
		this.wtrGST = wtrGST;
	}
	public Integer getPwrUnits() {
		return pwrUnits;
	}
	public void setPwrUnits(Integer pwrUnits) {
		this.pwrUnits = pwrUnits;
	}
	public Double getPwrCost() {
		return pwrCost;
	}
	public void setPwrCost(Double pwrCost) {
		this.pwrCost = pwrCost;
	}
	public Double getPwrGST() {
		return pwrGST;
	}
	public void setPwrGST(Double pwrGST) {
		this.pwrGST = pwrGST;
	}
	public Integer getGasUnits() {
		return gasUnits;
	}
	public void setGasUnits(Integer gasUnits) {
		this.gasUnits = gasUnits;
	}
	public Double getGasCost() {
		return gasCost;
	}
	public void setGasCost(Double gasCost) {
		this.gasCost = gasCost;
	}
	public Double getGasGST() {
		return gasGST;
	}
	public void setGasGST(Double gasGST) {
		this.gasGST = gasGST;
	}
	public Integer getDslUnits() {
		return dslUnits;
	}
	public void setDslUnits(Integer dslUnits) {
		this.dslUnits = dslUnits;
	}
	public Double getDslCost() {
		return dslCost;
	}
	public void setDslCost(Double dslCost) {
		this.dslCost = dslCost;
	}
	public Double getDslGST() {
		return dslGST;
	}
	public void setDslGST(Double dslGST) {
		this.dslGST = dslGST;
	}
	public Integer getAcUnits() {
		return acUnits;
	}
	public void setAcUnits(Integer acUnits) {
		this.acUnits = acUnits;
	}
	public Double getAcCost() {
		return acCost;
	}
	public void setAcCost(Double acCost) {
		this.acCost = acCost;
	}
	public Double getAcGST() {
		return acGST;
	}
	public void setAcGST(Double acGST) {
		this.acGST = acGST;
	}
	public Integer getOthrUnits() {
		return othrUnits;
	}
	public void setOthrUnits(Integer othrUnits) {
		this.othrUnits = othrUnits;
	}
	public Double getOthrCost() {
		return othrCost;
	}
	public void setOthrCost(Double othrCost) {
		this.othrCost = othrCost;
	}
	public Double getOthrGST() {
		return othrGST;
	}
	public void setOthrGST(Double othrGST) {
		this.othrGST = othrGST;
	}
	public Integer getRent() {
		return rent;
	}
	public void setRent(Integer rent) {
		this.rent = rent;
	}
	public Double getRentGST() {
		return rentGST;
	}
	public void setRentGST(Double rentGST) {
		this.rentGST = rentGST;
	}
	public Integer getMaintenance() {
		return maintenance;
	}
	public void setMaIntegerenance(Integer maIntegerenance) {
		this.maintenance = maintenance;
	}
	public Integer getMaIntegerenanceGST() {
		return maintenanceGST;
	}
	public void setMaIntegerenanceGST(Integer maintenanceGST) {
		this.maintenanceGST = maintenanceGST;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(Integer ownerid) {
		this.ownerid = ownerid;
	}
	public Integer getTenentid() {
		return tenentid;
	}
	public void setTenentid(Integer tenentid) {
		this.tenentid = tenentid;
	}
			    
			

}
