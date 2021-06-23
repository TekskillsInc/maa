package com.tekskills.DTO;

import java.util.List;

import com.tekskills.entity.ClassifiedImages;
import com.tekskills.entity.ClassifiedInformation;

public class ClassifiedInformationView {
	ClassifiedInformation csfinfo;
	List<ClassifiedImages> images;
	List<String> features;
	
	public List<String> getFeatures() {
		return features;
	}
	public void setFeatures(List<String> features) {
		this.features = features;
	}
	public ClassifiedInformation getCsfinfo() {
		return csfinfo;
	}
	public void setCsfinfo(ClassifiedInformation csfinfo) {
		this.csfinfo = csfinfo;
	}
	public List<ClassifiedImages> getImages() {
		return images;
	}
	public void setImages(List<ClassifiedImages> images) {
		this.images = images;
	}

}
