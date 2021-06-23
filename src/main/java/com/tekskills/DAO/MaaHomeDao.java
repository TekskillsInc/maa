package com.tekskills.DAO;

import java.util.List;

import com.tekskills.DTO.ClassifiedInfoDTO;
import com.tekskills.entity.EnquiryFormEntity;
import com.tekskills.entity.VendorEntity;

public interface MaaHomeDao {

	List<VendorEntity> getAllVendors();

	List<VendorEntity> getAllHomeVendors(String profession, String location);

	int saveEnquiryForm(EnquiryFormEntity enquiry);

	List<ClassifiedInfoDTO> getRecentClassifieds();


}
