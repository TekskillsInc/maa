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
@Table(name="maa_gst")
public class GSTEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="tblpk",updatable =false, nullable =false)
	private int tbl_pk ;
	
	 @Column(name="powerGST")
	 private double powerGST ; 
	 
	 @Column(name="waterGST")
	 private double waterGST ; 
	 
	 @Column(name="acGST")
	 private double acGST ; 
	 
	 @Column(name="gasGST")
	 private double gasGST ; 
	

	@Column(name="deselGST")
	 private double deselGST ; 
	
	@Column(name="prtyid")
	 private int prtyid ; 
	
	@Column(name="status")
	 private int status ; 
	 
	 
	 @Column(name="other")
	 private double other ; 
	 
	 public double getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}

	public double getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name="rentGST")
	 private double rentGST ; 
	 
	 @Column(name="maintenanceGST")
	 private double maintenanceGST ;
	 @Temporal(TemporalType.DATE)
	 @Column(name="aplicableDate")
	 private Date aplicableDate ;
	 
	 @Override
	public String toString() {
		return "GSTEntity [tbl_pk=" + tbl_pk + ", powerGST=" + powerGST + ", waterGST=" + waterGST + ", acGST=" + acGST
				+ ", gasGST=" + gasGST + ", deselGST=" + deselGST + ", other=" + other + ", rentGST=" + rentGST
				+ ", maintenanceGST=" + maintenanceGST + ", aplicableDate=" + aplicableDate + ", updatedDate="
				+ updatedDate + "]";
	}

	@Column(name="updatedDate")
	 private Date updatedDate ;
	 
	 
	 
	 
	
	 
	public Date getAplicableDate() {
		return aplicableDate;
	}

	public void setAplicableDate(Date aplicableDate) {
		this.aplicableDate = aplicableDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public int getTbl_pk() {
		return tbl_pk;
	}

	public void setTbl_pk(int tbl_pk) {
		this.tbl_pk = tbl_pk;
	}

	public double getPowerGST() {
		return powerGST;
	}

	public void setPowerGST(double powerGST) {
		this.powerGST = powerGST;
	}

	public double getWaterGST() {
		return waterGST;
	}

	public void setWaterGST(double waterGST) {
		this.waterGST = waterGST;
	}

	public double getAcGST() {
		return acGST;
	}

	public void setAcGST(double acGST) {
		this.acGST = acGST;
	}

	public double getGasGST() {
		return gasGST;
	}

	public void setGasGST(double gasGST) {
		this.gasGST = gasGST;
	}

	public double getOther() {
		return other;
	}

	public void setOther(double other) {
		this.other = other;
	}

	public double getRentGST() {
		return rentGST;
	}

	public void setRentGST(double rentGST) {
		this.rentGST = rentGST;
	}

	public double getMaintenanceGST() {
		return maintenanceGST;
	}

	public void setMaintenanceGST(double maintenanceGST) {
		this.maintenanceGST = maintenanceGST;
	}

	 
	 public double getDeselGST() {
		return deselGST;
	}

	public void setDeselGST(double deselGST) {
		this.deselGST = deselGST;
	}
	    

}
