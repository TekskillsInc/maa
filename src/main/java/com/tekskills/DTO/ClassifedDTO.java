package com.tekskills.DTO;

import java.util.List;

import com.tekskills.entity.ClassifiedHouseHunting;

public class ClassifedDTO {
	 List<ClassifiedInfoDTO> classifiedList;
	 List<ClassifiedHouseHunting> hhClassifiedList;
	public List<ClassifiedInfoDTO> getClassifiedList() {
		return classifiedList;
	}
	public void setClassifiedList(List<ClassifiedInfoDTO> classifiedList) {
		this.classifiedList = classifiedList;
	}
	public List<ClassifiedHouseHunting> getHhClassifiedList() {
		return hhClassifiedList;
	}
	public void setHhClassifiedList(List<ClassifiedHouseHunting> hhClassifiedList) {
		this.hhClassifiedList = hhClassifiedList;
	}
}
