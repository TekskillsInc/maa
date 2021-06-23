package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Maa_ClassifiedImages")
public class ClassifiedImages {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "imageid", updatable = false, nullable = false)
	
	int imageid;
	
	
	@Column(name = "classified")
	int classified ; 
	
	
	@Column(name = "imagename")
	String	imagename ;
	public int getImageid() {
		return imageid;
	}


	public void setImageid(int imageid) {
		this.imageid = imageid;
	}


	public int getClassified() {
		return classified;
	}


	public void setClassified(int classified) {
		this.classified = classified;
	}


	public String getImagename() {
		return imagename;
	}


	public void setImagename(String imagename) {
		this.imagename = imagename;
	}



}
