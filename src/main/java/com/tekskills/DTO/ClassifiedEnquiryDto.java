package com.tekskills.DTO;

import com.tekskills.entity.EnquiryFormEntity;

public class ClassifiedEnquiryDto {
	private EnquiryFormEntity enquiryForm;
	private int classifiedid;
	/*private String classifiedTitle;
	private String 
*/
	public EnquiryFormEntity getEnquiryForm() {
		return enquiryForm;
	}
	public void setEnquiryForm(EnquiryFormEntity enquiryForm) {
		this.enquiryForm = enquiryForm;
	}
	public int getClassifiedid() {
		return classifiedid;
	}
	public void setClassifiedid(int classifiedid) {
		this.classifiedid = classifiedid;
	}
}
