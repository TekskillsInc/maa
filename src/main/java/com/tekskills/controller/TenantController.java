package com.tekskills.controller;

import java.io.File;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tekskills.DTO.OwnerDetailsDTo;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.DTO.TenantDetailsDTo;
import com.tekskills.Service.MaaService;
import com.tekskills.Service.OwnerService;
import com.tekskills.Service.TenantService;
import com.tekskills.entity.AssetDetails;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class TenantController {

	@Autowired
	private MaaService maaService;
	@Autowired
	private Environment env;
	@Autowired
	private TenantService tenantService;

	@Autowired
	private OwnerService ownerService;

	private static final Logger logger = Logger.getLogger(TenantController.class);

	@RequestMapping(value = { "/Tenantdetails" }, method = RequestMethod.GET)
	public String Tenantdetails(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");

		List<OwnerDetailsDTo> onwerList = null;
		List<PropertyDto> propertyList = null;
		List<AssetDetails> assetList = null;
		List<TenantDetailsDTo>  tenantList =null;
		int tenantid = 0;
		if(userId!=null) {
		try {
			tenantList = tenantService.getTenantListByPrtyId(propertyId,userId,roleid);
			
			onwerList = ownerService.getOwnerByprtyId(userId, propertyId,roleid);
			assetList = maaService.getAssetListByprtyIdTenant(userId, propertyId,tenantid);
			propertyList = maaService.getPropertListByUserid(userId, roleid);
			model.addAttribute("onwerList", onwerList);
			model.addAttribute("propertyList", propertyList);
			model.addAttribute("prptyid", propertyId);
			model.addAttribute("prptyName", prptyName);
			model.addAttribute("assetList", assetList);
			model.addAttribute("tenantList", tenantList);
		} catch (Exception e) {
			logger.error("Error occured in Tenantdetails ---", e);

		}
		return "tenant-details";}
	else {
		return "redirect:/login";
	}
	}

	@RequestMapping(value = { "/AddTenant" }, headers = { "content-type=multipart/*" }, method = RequestMethod.POST)
	public String SaveOwnerDetils(HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestParam("tenantIdImg") MultipartFile tenantIdImg,
			@RequestParam("tenantImg") MultipartFile tenantImg) {

		HttpSession session = request.getSession(true);
		Integer userId=(Integer) session.getAttribute("userid");
		String prtyId = request.getParameter("prtyId");
		String prptyName = request.getParameter("prptyName");
		String assetNo = request.getParameter("assetNo");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		//String ownerName = request.getParameter("ownerName");
		String paddress = request.getParameter("paddress");

		String advamntpaid = request.getParameter("advamntpaid");
		String Idno = request.getParameter("Idno");
		String joiningdate = request.getParameter("joiningdate");
		String endingdate = request.getParameter("endingdate");
		String comments = request.getParameter("comments");

		String tenantImgName = null;
		String tenantIdImgName = null;
		String occ_by = null;
if(userId!=null) {
		if (tenantImg.getOriginalFilename() != null) {

			tenantImgName = tenantImg.getOriginalFilename();
		}
		if (tenantImg.getOriginalFilename() != null) {

			tenantIdImgName = tenantIdImg.getOriginalFilename();

		}
		List<AssetDetails> assetList = new LinkedList<>();
		try {

			tenantService.saveTenantDetails(userId, assetNo, name, email, phone, paddress, advamntpaid, Idno,
					joiningdate, endingdate, comments, tenantImgName, tenantIdImgName, occ_by,prtyId,prptyName);

			String directorypath = env.getProperty("maa-images");
			
			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();
			
				}
			File dest = null;
			File dest1 = null;
			if (tenantImg != null) {
				dest = new File(directorypath + File.separator + tenantImg.getOriginalFilename());
				try {
					if(dest.exists()!=true)

					{tenantImg.transferTo(dest);}
					} catch (Exception ex) {
					logger.error("Exception due to:", ex);
				}
			}
	if (tenantIdImg != null) {
				dest1 = new File(directorypath + File.separator + tenantIdImg.getOriginalFilename());
				try {
					tenantIdImg.transferTo(dest1);
				} catch (Exception ex) {
					logger.error("Exception due to:", ex);
				}
			}
			
			
			model.addAttribute("assetList", assetList);
			model.addAttribute("propertyId", prtyId);
		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return "redirect:/Tenantdetails?prtyid=" + prtyId + "&prptyName=" + prptyName;
}else {
	return "redirect:/login";
}
	}

	@RequestMapping(value = { "/getTenantAssetListbyPrptyId" }, method = RequestMethod.GET)
	@ResponseBody 
	public List<AssetDetails> getAssetDetailsPeoprtyId(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyId");
		String tenantid = request.getParameter("tenantid");
		
		
		int userId = (int) session.getAttribute("userid");

		List<AssetDetails> assetList = null;
		try {

			assetList = tenantService.getTenantAssetListbyPrptyId(userId, prtyid,tenantid);
		} catch (Exception e) {
			logger.error("Error occured in getTenantAssetListbyPrptyId ---", e);

		}
		return assetList;

	}
	
	@RequestMapping(value = { "/getTenantListByPrtyId" }, method = RequestMethod.GET)
	public String getTenantListByPrtyId(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");

		List<TenantDetailsDTo> tenantList = null;
		if(userId!=null) {
		try {
			tenantList = tenantService.getTenantListByPrtyId(propertyId,userId,roleid);
			model.addAttribute("tenantList", tenantList);
			model.addAttribute("propertyId", propertyId);
			model.addAttribute("prptyName", prptyName);
		} catch (Exception e) {
			logger.error("Error occured in Tenantdetails ---", e);

		}
		return "tenant-details";
		}else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = { "/deleteTenant" }, method = RequestMethod.POST)
	@ResponseBody
	public String deleteOwnerDetails(HttpServletRequest request, Model model,HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		int userId=(int) session.getAttribute("userid");
		String tntId = request.getParameter("tntId");
		String prtyid = request.getParameter("prptyid");
		String message=null;
	try {
		 message=tenantService.deleteTenant(tntId,prtyid,userId);
	}catch (Exception e) {
		logger.error("Error occured in deleteTenant ---", e);

	}
		return message;
	}
	
	
	@RequestMapping(value = { "/UpdateTenant" }, headers = {"content-type=multipart/*" }, method = RequestMethod.POST) 
	public String  UpdateTenantDetails(HttpServletRequest request, Model model,HttpServletResponse response,
	  @RequestParam("ImagName") MultipartFile ImagName, @RequestParam("ImagIdName") MultipartFile ImagIdName, @RequestParam("flatObjArr")String[] flatObjArr) {
	  
	  HttpSession session = request.getSession(true); 
	  Integer userId = (Integer)session.getAttribute("userid"); 
	  String propertyId = request.getParameter("eprtyId");
	  String tenantId = request.getParameter("tenantId");
	  String etenant_name =request.getParameter("etenant_name"); 
	  String prptyName =request.getParameter("eprptyName"); 
	  String email =request.getParameter("etenant_email");
	  String mobile =request.getParameter("etenant_contact");
	  String eassetNo = request.getParameter("flatArr"); 
	  String eaddress =request.getParameter("eaddress");
	  String eadvamount =request.getParameter("eadvamount");
	 
	  String Idno = request.getParameter("Idno");
	  String ejoin_date =request.getParameter("ejoin_date");
	  String eend_date = request.getParameter("eend_date"); 
	  String ecomments = request.getParameter("ecomments");
	  String chkBox = request.getParameter("IstatusTogle");
	 
	  
	  String tntImgName = null; String tntIdImgName = null; 
	  //String occ_by = null;
	  if(userId!=null) {
	 
	 if (!ImagName.getOriginalFilename().isEmpty() || ImagName.getOriginalFilename() != null) {
	 
		 tntImgName = ImagName.getOriginalFilename();
	 
	 } if (!ImagIdName.getOriginalFilename().isEmpty() || ImagIdName.getOriginalFilename() != null) {
	 
		 tntIdImgName = ImagIdName.getOriginalFilename();
	 
	  } List<AssetDetails> assetList = new LinkedList<>(); 
	  try {

	  tenantService.UpdateTenantDetails(userId, propertyId, etenant_name, prptyName,email,
			  mobile, eassetNo, eaddress, eadvamount, Idno, ejoin_date, eend_date,
			  ecomments, chkBox, tntImgName,tntIdImgName,tenantId,flatObjArr);
	
	  String directorypath = env.getProperty("maa-images");
		
		if (!new File(directorypath).exists()) {
			new File(directorypath).mkdir();
		
			}
		File dest = null;
		File dest1 = null;
		if (ImagName != null) {
			dest = new File(directorypath + File.separator + ImagName.getOriginalFilename());
			try {
				if(dest.exists()!=true)

				{ImagName.transferTo(dest);}
				} catch (Exception ex) {
				logger.error("Exception due to:", ex);
			}
		}
		if (ImagIdName != null) {
			dest1 = new File(directorypath + File.separator + ImagIdName.getOriginalFilename());
			try {
				ImagIdName.transferTo(dest1);
			} catch (Exception ex) {
				logger.error("Exception due to:", ex);
			}
		} 
	  
	  
	  model.addAttribute("assetList", assetList);
	  model.addAttribute("propertyId", propertyId);
	  
	  }
	  catch (Exception e) {
	  logger.error("Error occured in AssetDetails ---", e);
	  
	  } return "redirect:/Tenantdetails?prtyid=" + propertyId + "&prptyName=" + prptyName; 
	  }
	  else {
			return "redirect:/login";
		}
	
	}
	

}
