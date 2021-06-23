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
import com.tekskills.entity.AssetDetails;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class OwnerController {

	@Autowired
	private MaaService maaService;
	@Autowired
	private Environment env;
	@Autowired
	private OwnerService ownerService;
	private static final Logger logger = Logger.getLogger(OwnerController.class);

	@RequestMapping(value = { "/Ownerdetails" }, method = RequestMethod.GET)
	public String Ownerdetails(HttpServletRequest request, Model model, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");

		List<OwnerDetailsDTo> onwerList = null;
		List<PropertyDto> propertyList = null;
		List<AssetDetails> assetList = null;
		int ownerid = 0;
		if(userId!=null) {
		try {
			onwerList = ownerService.getOwnerByprtyId(userId, propertyId,roleid);
			assetList = maaService.getAssetListByprtyIdOwner(userId, propertyId, ownerid);
			propertyList = maaService.getPropertListByUserid(userId, roleid);
			model.addAttribute("onwerList", onwerList);
			model.addAttribute("propertyList", propertyList);
			model.addAttribute("prptyid", propertyId);
			model.addAttribute("prptyName", prptyName);
			model.addAttribute("assetList", assetList);
			model.addAttribute("roleid", roleid);
		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return "Owner-details";
		}else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = { "/AddOwner" }, headers = { "content-type=multipart/*" }, method = RequestMethod.POST)
	public String SaveOwnerDetils(HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestParam("ownrIdImg") MultipartFile ownrIdImg, @RequestParam("ownrImage") MultipartFile ownrImage) {

		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		String propertyId = request.getParameter("prtyId");

		String prptyName = request.getParameter("prptyName");
		String ownerName = request.getParameter("Name");
		String flatno_input = request.getParameter("flatno_input");

		String UPID = request.getParameter("UPID");
		String mobile = request.getParameter("mobile");
		String altMobile = request.getParameter("altMobile");

		String emailId = request.getParameter("EmailId");
		String address = request.getParameter("Address");
		String notes = request.getParameter("Notes");
		String ownrImgName = null;
		String ownrIdImgName = null;
		String occ_by = null;
if(userId!=null) {
		if (ownrImage.getOriginalFilename() != null) {

			ownrImgName = ownrImage.getOriginalFilename();

		}
		if (ownrIdImg.getOriginalFilename() != null) {

			ownrIdImgName = ownrIdImg.getOriginalFilename();

		}
		List<AssetDetails> assetList = new LinkedList<>();
		try {

			ownerService.saveOwnerDetails(userId, propertyId, flatno_input, UPID, mobile, ownerName, altMobile, emailId,
					address, notes, ownrImgName, ownrIdImgName, occ_by,prptyName);
			
			
			
			
			String directorypath = env.getProperty("maa-images");
			
			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();
			
				}

			File dest = null;
			File dest1 = null;
			if (ownrImage != null) {
				dest = new File(directorypath + File.separator + ownrImage.getOriginalFilename());
				try {
					if(dest.exists()!=true)

					{ownrImage.transferTo(dest);}
				} catch (Exception ex) {
					logger.error("Exception due to:", ex);
				}
			}
	if (ownrIdImg != null) {
				dest1 = new File(directorypath + File.separator + ownrIdImg.getOriginalFilename());
				try {
					ownrIdImg.transferTo(dest1);
				} catch (Exception ex) {
					logger.error("Exception due to:", ex);
				}
			}

			model.addAttribute("assetList", assetList);
			model.addAttribute("propertyId", propertyId);
		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return "redirect:/Ownerdetails?prtyid=" + propertyId + "&prptyName=" + prptyName;
}else {
			return "redirect:/login";
		}
	}
	
	
	@RequestMapping(value = { "/getOccupiedByFlat" }, method = RequestMethod.POST)
	@ResponseBody
	public String getOccupiedByFlat(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userid");
		String propertyId = request.getParameter("prtyid");
		String flat = request.getParameter("flat");
		String message = null;
		try {
			message = ownerService.getOccupiedByFlat(userId, propertyId, flat);
		} catch (Exception e) {
			logger.error("Error occured in getOccupiedByFlat ---", e);

		}

		return message;
	}


	@RequestMapping(value = { "/UpdateOwner" }, headers = { "content-type=multipart/*" }, method = RequestMethod.POST)
	public String UpdateOwnerDetails(HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestParam("IownrIdImg") MultipartFile ownrIdImg, @RequestParam("IownrImage") MultipartFile ownrImage,
			@RequestParam("flatObjArr") String[] flatObjArr) {
		
		System.out.println("came to owner controller edit part");

		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		String propertyId = request.getParameter("IprtyId");
		String iOwnrId = request.getParameter("IOwnrId");
		String prptyName = request.getParameter("IprptyName");
		String ownerName = request.getParameter("IName");
		// String flatno_input = request.getParameter("Iflatno_input");
		String flatArr = request.getParameter("flatArr");
		// String flatObjArr = request.getParameter("flatObjArr");
System.out.println("flatObjArr----"+flatObjArr);
System.out.println("flatArr----"+flatArr);
		String UPID = request.getParameter("IUPID");
		String mobile = request.getParameter("Imobile");
		String altMobile = request.getParameter("IaltMobile");

		String emailId = request.getParameter("IEmailId");
		String address = request.getParameter("IAddress");
		String notes = request.getParameter("INotes");
		String chkBox = request.getParameter("IstatusTogle");

		String ownrImgName = null;
		String ownrIdImgName = null;
		String occ_by = null;
		
if(userId!=null) {
		if (ownrImage.getOriginalFilename() != null) {

			ownrImgName = ownrImage.getOriginalFilename();

		}
		if (ownrIdImg.getOriginalFilename() != null) {

			ownrIdImgName = ownrIdImg.getOriginalFilename();

		}
		List<AssetDetails> assetList = new LinkedList<>();
		try {

			ownerService.UpdateOwnerDetails(userId, propertyId, iOwnrId, flatArr, UPID, mobile, ownerName, altMobile,
					emailId, address, notes, ownrImgName, ownrIdImgName, occ_by, chkBox, flatObjArr);

			String directorypath = env.getProperty("maa-images");
			
			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();
			
				}

			File dest = null;
			File dest1 = null;
			if (ownrImage != null) {
				dest = new File(directorypath + File.separator + ownrImage.getOriginalFilename());
				try {
					if(dest.exists()!=true)

					{ownrImage.transferTo(dest);}
					} catch (Exception ex) {
					logger.error("Exception due to:", ex);
				}
			}
	if (ownrIdImg != null) {
				dest1 = new File(directorypath + File.separator + ownrIdImg.getOriginalFilename());
				try {
					ownrIdImg.transferTo(dest1);
				} catch (Exception ex) {
					logger.error("Exception due to:", ex);
				}
			}

			model.addAttribute("assetList", assetList);
			model.addAttribute("propertyId", propertyId);
		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		//return null;
		return "redirect:/Ownerdetails?prtyid=" + propertyId + "&prptyName=" + prptyName;
	}
else {
	return "redirect:/login";
}
}

	@RequestMapping(value = { "/deleteOwner" }, method = RequestMethod.POST)
	@ResponseBody
	public String deleteOwnerDetails(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userid");
		String propertyId = request.getParameter("prptyid");
		String iOwnrId = request.getParameter("onwerid");
		String message = null;
		try {
			message = ownerService.deleteOwner(userId, propertyId, iOwnrId);
		} catch (Exception e) {
			logger.error("Error occured in deleteOwner ---", e);

		}

		return message;
	}

	@RequestMapping(value = { "/getAssetDetailsPeoprtyIdEdit" }, method = RequestMethod.POST)
	@ResponseBody
	public List<AssetDetails> getAssetDetailsPeoprtyId(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String ownerid = request.getParameter("onwerid");
		int userId = (int) session.getAttribute("userid");
		int roleid = (int) session.getAttribute("roleid");

		List<AssetDetails> assetList = null;
		try {
			
			
			assetList = maaService.getAssetListByprtyIdEdit(userId, prtyid, roleid,ownerid);

		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return assetList;

	}
	@RequestMapping(value = { "/getTenantsByOwner" }, method = RequestMethod.POST)
	@ResponseBody
	public List<TenantDetailsDTo> getTenantsByOwner(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		String prtyid = request.getParameter("prtyid");
		String ownerid = request.getParameter("onwerid");
		int userId = (int) session.getAttribute("userid");
		int roleid = (int) session.getAttribute("roleid");

		List<TenantDetailsDTo> tenanatList = null;
		try {
			
			//assetList = maaService.getAssetListByprtyId(userId, prtyid, roleid);
			tenanatList =ownerService.getTenantsByOwner(userId, prtyid, roleid,ownerid);

		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return tenanatList;

	}
	
	@RequestMapping(value = { "/validatEmail" }, method = RequestMethod.GET)
	@ResponseBody
	public String validatEmail(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		String prtyid = request.getParameter("prptyid");
		String ownermail = request.getParameter("ownerMail");
		String type = request.getParameter("type");
		int userId = (int) session.getAttribute("userid");
		int roleid = (int) session.getAttribute("roleid");

		String message=null;
		try {
			
			//assetList = maaService.getAssetListByprtyId(userId, prtyid, roleid);
			message =ownerService.validateOwnerMail(prtyid,ownermail,type);

		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return message;

	}
	
	
	

}
