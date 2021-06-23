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

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "maa_assets_details")
public class AssetDetails implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "assetid", updatable = false, nullable = false)
	int assetid;// assetid pk

	@Column(name = "prtyid")
	int prtyid; // propert id

	@Column(name = "userid")
	int userid; // user id

	@Column(name = "flatno")
	String flatno; // unit no

	@Column(name = "asttype")
	int asttype;// no of beds

	@Column(name = "prtytax")
	int prtytax;// prty tax

	@Column(name = "areasqft")
	int areasqft;// sqft

	@Column(name = "rent")
	int rent;

	@Column(name = "maintenance")
	int maintenance;

	@Column(name = "secBill")
	int secBill;

	@Column(name = "curmeterno")
	String curmeterno;

	@Column(name = "watermeter")
	String watermeter;

	@Column(name = "desselmeter")
	String desselmeter;

	@Column(name = "acmeter")
	String acmeter;

	@Column(name = "gasmeter")
	String gasmeter;

	@Column(name = "othMeter")
	String othMeter;
	
	 @Temporal(TemporalType.DATE)
	@Column(name = "register_on")
	Date register_on;
	@Column(name = "ownerid")
	int ownerid;

	@Override
	public String toString() {
		return "AssetDetails [assetid=" + assetid + ", prtyid=" + prtyid + ", userid=" + userid + ", flatno=" + flatno
				+ ", asttype=" + asttype + ", prtytax=" + prtytax + ", areasqft=" + areasqft + ", rent=" + rent
				+ ", maintenance=" + maintenance + ", secBill=" + secBill + ", curmeterno=" + curmeterno
				+ ", watermeter=" + watermeter + ", desselmeter=" + desselmeter + ", acmeter=" + acmeter + ", gasmeter="
				+ gasmeter + ", othMeter=" + othMeter + ", register_on=" + register_on + ", ownerid=" + ownerid
				+ ", tenantId=" + tenantId + ", occ_by=" + occ_by + ", status=" + status + "]";
	}

	@Column(name = "tenantId")
	int tenantId;

	public int getTenantId() {
		return tenantId;
	}

	public void setTenantId(int tenantId) {
		this.tenantId = tenantId;
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

	public String getOcc_by() {
		return occ_by;
	}

	public void setOcc_by(String occ_by) {
		this.occ_by = occ_by;
	}

	@Column(name = "occ_by")
	String occ_by;
	@Column(name = "status")
	int status;

	public int getAssetid() {
		return assetid;
	}

	public void setAssetid(int assetid) {
		this.assetid = assetid;
	}

	public int getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}

	public int getUserd() {
		return userid;
	}

	public void setUserd(int userd) {
		this.userid = userd;
	}

	public String getFlatno() {
		return flatno;
	}

	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}

	public int getAsttype() {
		return asttype;
	}

	public void setAsttype(int asttype) {
		this.asttype = asttype;
	}

	public int getPrtytax() {
		return prtytax;
	}

	public void setPrtytax(int prtytax) {
		this.prtytax = prtytax;
	}

	public int getAreasqft() {
		return areasqft;
	}

	public void setAreasqft(int areasqft) {
		this.areasqft = areasqft;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public int getMaintenance() {
		return maintenance;
	}

	public void setMaintenance(int maintenance) {
		this.maintenance = maintenance;
	}

	public int getSecBill() {
		return secBill;
	}

	public void setSecBill(int secBill) {
		this.secBill = secBill;
	}

	public String getCurmeterno() {
		return curmeterno;
	}

	public void setCurmeterno(String curmeterno) {
		this.curmeterno = curmeterno;
	}

	public String getWatermeter() {
		return watermeter;
	}

	public void setWatermeter(String watermeter) {
		this.watermeter = watermeter;
	}

	public String getDesselmeter() {
		return desselmeter;
	}

	public void setDesselmeter(String desselmeter) {
		this.desselmeter = desselmeter;
	}

	public String getAcmeter() {
		return acmeter;
	}

	public void setAcmeter(String acmeter) {
		this.acmeter = acmeter;
	}

	public String getGasmeter() {
		return gasmeter;
	}

	public void setGasmeter(String gasmeter) {
		this.gasmeter = gasmeter;
	}

	public String getOthMeter() {
		return othMeter;
	}

	public void setOthMeter(String othMeter) {
		this.othMeter = othMeter;
	}

	public Date getRegister_on() {
		return register_on;
	}

	public void setRegister_on(Date register_on) {
		this.register_on = register_on;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
