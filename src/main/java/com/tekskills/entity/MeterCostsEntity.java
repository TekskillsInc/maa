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
@Table(name = "maa_meter_metercosts")
public class MeterCostsEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "tblpk", updatable = false, nullable = false)
	int tblpk;
	
	@Column(name = "pwrCost" ,precision=10, scale=2)
	float pwrCost;
	
	@Column(name = "wtrCost",precision=10, scale=2)
	float wtrCost;
	
	@Column(name = "acCost",precision=10, scale=2)
	float acCost;
	
	@Column(name = "dslCost",precision=10, scale=2)
	float dslCost;
	
	@Column(name = "gasCost",precision=10, scale=2)
	float gasCost;
	@Column(name = "otherCost",precision=10, scale=2)
	float otherCost;
	
	


	
	@Column(name = "prtyid")
	int prtyid;
	
	
	  @Temporal(TemporalType.DATE)
	@Column(name = "createdDate")
	Date createdDate;
	
	@Override
	public String toString() {
		return "MeterCostsEntity [tblpk=" + tblpk + ", pwrCost=" + pwrCost + ", wtrCost=" + wtrCost + ", acCost="
				+ acCost + ", dslCost=" + dslCost + ", gasCost=" + gasCost + ", otherCost=" + otherCost + ", prtyid="
				+ prtyid + ", createdDate=" + createdDate + ", status=" + status + "]";
	}

	@Column(name = "status")
	String status;

	public int getTblpk() {
		return tblpk;
	}

	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
	}

	public float getPwrCost() {
		return pwrCost;
	}

	public void setPwrCost(float pwrCost) {
		this.pwrCost = pwrCost;
	}

	public float getWtrCost() {
		return wtrCost;
	}

	public void setWtrCost(float wCostInt) {
		this.wtrCost = wCostInt;
	}

	public float getAcCost() {
		return acCost;
	}

	public void setAcCost(float acCost) {
		this.acCost = acCost;
	}

	public float getDslCost() {
		return dslCost;
	}

	public void setDslCost(float dslCost) {
		this.dslCost = dslCost;
	}

	public float getGasCost() {
		return gasCost;
	}

	public void setGasCost(float gasCost) {
		this.gasCost = gasCost;
	}

	
	public float getOtherCost() {
		return otherCost;
	}

	public void setOtherCost(float otherCost) {
		this.otherCost = otherCost;
	}

	
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid2) {
		this.prtyid = prtyid2;
	}

	
}
