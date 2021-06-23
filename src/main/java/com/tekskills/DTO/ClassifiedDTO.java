package com.tekskills.DTO;

import com.tekskills.entity.ClassifiedInformation;

public class ClassifiedDTO {
	public ClassifiedInformation classifiedInfo;
	String classifiedFetures;
	String imageRemoveArr;
	
	public String getImageRemoveArr() {
		return imageRemoveArr;
	}
	public void setImageRemoveArr(String imageRemoveArr) {
		this.imageRemoveArr = imageRemoveArr;
	}
	public ClassifiedInformation getClassifiedInfo() {
		return classifiedInfo;
	}
	public void setClassifiedInfo(ClassifiedInformation classifiedInfo) {
		this.classifiedInfo = classifiedInfo;
	}
	public String getClassifiedFetures() {
		return classifiedFetures;
	}
	public void setClassifiedFetures(String classifiedFetures) {
		this.classifiedFetures = classifiedFetures;
	}
	

}
