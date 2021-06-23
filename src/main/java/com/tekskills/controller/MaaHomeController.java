package com.tekskills.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.Service.MaaHomeService;
import com.tekskills.Service.MiscellaneousService;
import com.tekskills.entity.BlogEntity;
import com.tekskills.entity.EnquiryFormEntity;
import com.tekskills.entity.VendorEntity;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class MaaHomeController {
	@Autowired
	private MaaHomeService homeservice;
	@Autowired
	private MiscellaneousService misService;
private static final Logger logger = Logger.getLogger(MaaHomeController.class);
@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
public String HomePage(Model model) {
	
	
	try {
 	   
    ClassifedDTO classified=homeservice.getRecentClassifieds();
    model.addAttribute("classified", classified);
    
    }
    catch(Exception e) {
			logger.error("error in home"+e);
		}
	return "HomePage";
}
@RequestMapping(value = { "/vendors" }, method = RequestMethod.GET)
public String homevendors(HttpServletRequest request, Model model, HttpServletResponse response) {
	try {
	 List<VendorEntity> vendorList=homeservice.getAllVendors();
	model.addAttribute("vendorList", vendorList);
	} catch (Exception e) {
		logger.error("Error occured in homevendors ---", e);
	}
	return "vendor-service";
}

@RequestMapping(value = { "/getAllHomeVendors"})
public String getVendorsByPofession(HttpServletRequest request, Model model, HttpServletResponse response) {
	 List<VendorEntity> vendorList=null;
	try {
		String profession = request.getParameter("profession");
		String location = request.getParameter("location");
		
	  vendorList=homeservice.getAllHomeVendors(profession,location);
	  
	model.addAttribute("vendorList", vendorList);
	} catch (Exception e) {
		logger.error("Error occured in controller getVendorsByPofession ---", e);
	}
	return "vendor-service";
}


@RequestMapping(value = { "/enquiry" }, method = RequestMethod.POST,consumes="application/json")
@ResponseBody
public String saveEnquiry(HttpServletRequest request, Model model,
	HttpServletResponse response ,@RequestBody EnquiryFormEntity Enquiry) {
String message=null;
try {
 message=homeservice.saveEnquiryForm(Enquiry);
} catch (Exception e) {
	logger.error("Error occured in saveEnquiry ---", e);
}
return message;
}	
@RequestMapping(value = { "/classifiedenquiry" }, method = RequestMethod.POST,consumes="application/json")
@ResponseBody
public String saveClassifiedEnquiry(HttpServletRequest request, Model model,
	HttpServletResponse response ,@RequestBody EnquiryFormEntity Enquiry) {
String message=null;
try {
	String classifiedid = request.getParameter("classifiedid");
 message=homeservice.saveClassifiedEnquiryForm(Enquiry,classifiedid);
} catch (Exception e) {
	logger.error("Error occured in saveEnquiry ---", e);
}
return message;
}	

@RequestMapping(value = { "/propertyDeals" }, method = RequestMethod.GET)
public String PropertyDeals() {
	return "property-deals";
}

@RequestMapping(value = { "/tenancyManagement" }, method = RequestMethod.GET)
public String TenancyManagement() {
	return "tenancy-management";
}

@RequestMapping(value = { "/propertyCare" }, method = RequestMethod.GET)
public String PropertyCare() {
	return "property-care";
}

@RequestMapping(value = { "/about" }, method = RequestMethod.GET)
public String About() {
	return "about";
}
@RequestMapping(value = { "/blog" }, method = RequestMethod.GET)
public String blog(Model model) {
	try {
	List<BlogEntity>  blogList=misService.getblogs();
    
    model.addAttribute("blogList", blogList);
	return "homeblogs";
	}
	catch(Exception e) {
		
	}
	return "error";
}
@RequestMapping(value = { "/blog-info" }, method = RequestMethod.GET)
public String bloginner(HttpServletRequest request, Model model) {
	try{
		String blog=request.getParameter("blog");
		BlogEntity  blogInfo=misService.getblogInfo(blog);
		List<BlogEntity>  blogList=misService.getblogs();
	    
	    model.addAttribute("blogList", blogList);
	    model.addAttribute("blogInfo", blogInfo);
	}
catch(Exception e) {
		
	}
	   
	return "homeblogs-inner";
}
@RequestMapping(value = { "/contactus" }, method = RequestMethod.GET)
public String contactus() {
	return "homecontact-us";
}
@RequestMapping(value = { "/favourites" }, method = RequestMethod.GET)
public String homefavourites() {
	return "homefavourites";
}
@RequestMapping(value = { "/testimonials" }, method = RequestMethod.GET)
public String hometestimonials() {
	return "hometestimonials";
}

@RequestMapping(value = { "/privacy" }, method = RequestMethod.GET)
public String homeprivacy() {
	return "homeprivacy";
}
}
