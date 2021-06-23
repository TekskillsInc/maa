package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "maa_meterreadings")
public class MeterReadingsEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "tbl_pk", updatable = false, nullable = false)
	int tbl_pk;
	
	
	@Column(name = "prtyid")
	int prtyid;
	
	@Column(name = "assetid")
	int assetid;
	
	@Column(name = "flatno")
	String flatno;
	
	@Column(name = "userid")
	int userid;
	
	@Column(name = "water_CPU")
	double water_CPU;
	
	@Column(name = "water_MR")
	int water_MR;
	
	@Column(name = "power_CPU")
	double power_CPU;
	
	@Column(name = "power_MR")
	int power_MR;
	
	@Column(name = "gas_CPU")
	double gas_CPU;
	
	@Column(name = "gas_MR")
	int gas_MR;
	
	@Column(name = "ac_CPU")
	double ac_CPU;
	
	@Column(name = "ac_MR")
	int ac_MR;
	
	@Column(name = "disel_CPU")
	double disel_CPU;
	
	@Column(name = "disel_MR")
	int disel_MR;
	
	@Column(name = "month")
	String month;
	
	@Column(name = "year")
	String year;
	
	@Column(name = "Other_CPU")
	double other_CPU;
	
	@Column(name = "Other_MR")
	int other_MR;
	
	public double getOther_CPU() {
		return other_CPU;
	}

	public void setOther_CPU(double other_CPU) {
		this.other_CPU = other_CPU;
	}

	public int getOther_MR() {
		return other_MR;
	}

	public void setOther_MR(int otpresentInt) {
		this.other_MR = otpresentInt;
	}

	
	public int getTbl_pk() {
		return tbl_pk;
	}

	public void setTbl_pk(int tbl_pk) {
		this.tbl_pk = tbl_pk;
	}

	public int getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}

	public int getAssetid() {
		return assetid;
	}

	public void setAssetid(int assetid) {
		this.assetid = assetid;
	}

	public String getFlatno() {
		return flatno;
	}

	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public double getWater_CPU() {
		return water_CPU;
	}

	public void setWater_CPU(double water_CPU) {
		this.water_CPU = water_CPU;
	}

	public int getWater_MR() {
		return water_MR;
	}

	public void setWater_MR(int water_MR) {
		this.water_MR = water_MR;
	}

	public double getPower_CPU() {
		return power_CPU;
	}

	public void setPower_CPU(double power_CPU) {
		this.power_CPU = power_CPU;
	}

	public int getPower_MR() {
		return power_MR;
	}

	public void setPower_MR(int power_MR) {
		this.power_MR = power_MR;
	}

	public double getGas_CPU() {
		return gas_CPU;
	}

	public void setGas_CPU(double gas_CPU) {
		this.gas_CPU = gas_CPU;
	}

	public int getGas_MR() {
		return gas_MR;
	}

	public void setGas_MR(int gas_MR) {
		this.gas_MR = gas_MR;
	}

	public double getAc_CPU() {
		return ac_CPU;
	}

	public void setAc_CPU(double ac_CPU) {
		this.ac_CPU = ac_CPU;
	}

	public int getAc_MR() {
		return ac_MR;
	}

	public void setAc_MR(int ac_MR) {
		this.ac_MR = ac_MR;
	}

	public double getDisel_CPU() {
		return disel_CPU;
	}

	public void setDisel_CPU(double disel_CPU) {
		this.disel_CPU = disel_CPU;
	}

	public int getDisel_MR() {
		return disel_MR;
	}

	public void setDisel_MR(int disel_MR) {
		this.disel_MR = disel_MR;
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

}
