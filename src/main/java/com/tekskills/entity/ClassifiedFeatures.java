package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Maa_ClassifiedFeatures")
public class ClassifiedFeatures {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "featureid", updatable = false, nullable = false)
	
	int featureid;
	
	@Column(name = "classified")
	int classified ; 
	
	
	@Column(name = "csffeature")
	String	csffeature ;


	public int getFeatureid() {
		return featureid;
	}


	public void setFeatureid(int featureid) {
		this.featureid = featureid;
	}


	public int getClassified() {
		return classified;
	}


	public void setClassified(int classified) {
		this.classified = classified;
	}


	public String getCsffeature() {
		return csffeature;
	}


	public void setCsffeature(String csffeature) {
		this.csffeature = csffeature;
	}

}

