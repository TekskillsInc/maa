package com.tekskills.ServiceImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tekskills.DAO.MaaHomeDao;
import com.tekskills.DAO.MiscellaneousDao;
import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.DTO.ClassifiedInfoDTO;
import com.tekskills.Service.MaaHomeService;
import com.tekskills.entity.ClassifiedInformation;
import com.tekskills.entity.EnquiryFormEntity;
import com.tekskills.entity.VendorEntity;
import com.tekskills.util.SendHtmlEmailNew;

@Service
@PropertySource("/WEB-INF/Mail.properties")
public class MaaHomeServiceImpl implements MaaHomeService {
	private static final Logger logger = Logger.getLogger(MaaHomeServiceImpl.class);
	
	@Autowired
	private MaaHomeDao maaHomeDao;
	@Autowired
	private Environment env;
	@Autowired
	private SendHtmlEmailNew newEmail;
	@Autowired
	private MiscellaneousDao misDao;
	@Autowired

	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<VendorEntity> getAllVendors() {
		List<VendorEntity> vendorList =null;
		try {
			vendorList = maaHomeDao.getAllVendors();
			}
		 catch (Exception e) {
			logger.error("Error while  getAllVendors", e);
		}
		return vendorList;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<VendorEntity> getAllHomeVendors(String profession,String location) {
		List<VendorEntity> vendorList =null;
		try {
			vendorList = maaHomeDao.getAllHomeVendors(profession,location);
			}
		 catch (Exception e) {
			logger.error("Error while in service implemetion getAllVendorsByprofession", e);

		}
		return vendorList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String saveEnquiryForm(EnquiryFormEntity enquiry) {
		String message = null;
		try {
		int invid=0;
		 invid= maaHomeDao.saveEnquiryForm(enquiry);
		 if(invid!=0) {
 		  message ="Success";
 		  String tomail=env.getProperty("maaservicesmail");
		 String subject="An enquiry about"+enquiry.getEnquiryType()+"in maa properties";
	    String htmlfile=env.getProperty("EquiryFormMail");
	    newEmail.sendEnquiryMail(tomail,enquiry.getName(),enquiry.getPhone(),enquiry.getEmail(),enquiry.getDescription(),enquiry.getEnquiryType(),enquiry.getPrptyType(),htmlfile,subject,enquiry.getUserType());
		 }
		else {
			message="Failure";
		}
		} catch (Exception e) {
			logger.error("Error while  saveEnquiryForm", e);
		}
		return message;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public ClassifedDTO getRecentClassifieds() {
		
		
		
		ClassifedDTO cDto=new ClassifedDTO();
		
		
		try {
			
			List<ClassifiedInfoDTO> classifiedList=maaHomeDao.getRecentClassifieds();
			
			
			cDto.setClassifiedList(classifiedList);
			
		}catch(Exception e){
			logger.info( e.getMessage());
		}
		
		return cDto;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String saveClassifiedEnquiryForm(EnquiryFormEntity enquiry, String classifiedid) {
		String message = null;
		try {
		int csfId=0;
		if(!classifiedid.isEmpty()) {
			csfId=Integer.parseInt(classifiedid);
		}
		 
		int id= maaHomeDao.saveEnquiryForm(enquiry);
		ClassifiedInformation csfInfo=misDao.getClassfiedInfoById(csfId,0);
		
		 if(id!=0) {
 		  message ="Success";
 		  String tomail=csfInfo.getEmail();
 		  
 		  
		 String subject="An enquiry about classified in maa properties";
	    String htmlfile=env.getProperty("EquiryFormclassified");
	    newEmail.sendClassifiedEnquiryMail(tomail,enquiry.getName(),enquiry.getPhone(),enquiry.getEmail(),enquiry.getDescription(),csfInfo.getCsfTitle(),htmlfile,subject,csfInfo.getName());
		 }
		else {
			message="Failure";
		}
		} catch (Exception e) {
			logger.error("Error while  saveEnquiryForm", e);
		}
		return message;
	}
}
