package com.tekskills.Service;

import java.util.List;

import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.entity.EnquiryFormEntity;
import com.tekskills.entity.VendorEntity;

public interface MaaHomeService {

	List<VendorEntity> getAllVendors();

	List<VendorEntity> getAllHomeVendors(String profession, String location);

	String saveEnquiryForm(EnquiryFormEntity enquiry);

	ClassifedDTO getRecentClassifieds();

	String saveClassifiedEnquiryForm(EnquiryFormEntity enquiry, String classifiedid);

}
