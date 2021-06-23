package com.tekskills.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tekskills.DTO.AptInvoiceDTO;
import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.OwnerDTo;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.DTO.TenantDTo;
import com.tekskills.Service.MaaService;
import com.tekskills.Service.MeterReadingServie;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.MeterCostsEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.VendorEntity;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class InvoiceController {
	@Autowired
	private MaaService maaService;
	
	@Autowired
	private MeterReadingServie readingService;
	
	
	@Autowired
	private Environment env;
	
	private static final Logger logger = Logger.getLogger(InvoiceController.class);
	@RequestMapping(value = { "/invoice" }, method = RequestMethod.GET)
	public String Invoice(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
	HttpSession session = request.getSession(true);
	Integer userId = (Integer) session.getAttribute("userid");
	Integer roleid = (Integer) session.getAttribute("roleid");
	String propertyId = request.getParameter("prtyid");
	String prptyName = request.getParameter("prptyName");

	List<PropertyDto> propertyList = null;
	List<AssetDetailsDto> assetList = null;
	List<MeterReadingsEntity> readingList = null;
	
	if(userId!=null) {
	try {
		
		assetList = maaService.getAssetListByprtyId(userId, propertyId,roleid);
		propertyList = maaService.getPropertListByUserid(userId, roleid);
		List<AssetDetailsDto> assetListInvoice = maaService.getAssetListByprtyIdInvoice(userId, propertyId,roleid);
		MeterCostsEntity meterCost=readingService.getMeterCostsByPrty(propertyId);
		List<AptInvoiceDTO> invoiceList=readingService.getInvoicesByproperty(userId,propertyId,roleid);
		
		model.addAttribute("propertyList", propertyList);
		model.addAttribute("prptyid", propertyId);
		model.addAttribute("prptyName", prptyName);
		model.addAttribute("assetList", assetList);
		model.addAttribute("assetListInvoice", assetListInvoice);
		model.addAttribute("readingList", readingList);
		model.addAttribute("meterCost", meterCost);
		model.addAttribute("invoiceList", invoiceList);
		session.setAttribute("prptyid", propertyId);
	} catch (Exception e) {
		logger.error("Error occured in Invoice ---", e);

	}
	return "invoice";
	}else {

		return "redirect:/login";
	}
	

}
	@RequestMapping(value = { "/getAssetByFlat" }, method = RequestMethod.POST)
	@ResponseBody
	public AssetDetails getAssetByFlat(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String flat = request.getParameter("flat");
		
		int userId = (int) session.getAttribute("userid");
		AssetDetails asset =null;

		
		try {
			//assetList = maaService.getAssetListByprtyIdTenant(userId, prtyid,tntid);
			asset = maaService.getAssetByFlat(prtyid, userId,flat);
			

		} catch (Exception e) {
			logger.error("Error occured in getAssetByFlat ---", e);

		}
		return asset;

	}
	@RequestMapping(value = { "/getGst" }, method = RequestMethod.GET)
	@ResponseBody
	public GSTEntity Gst(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		int userId = (int) session.getAttribute("userid");
		GSTEntity gst =null;
 
		
		try {
			//assetList = maaService.getAssetListByprtyIdTenant(userId, prtyid,tntid);
			gst = maaService.getGST(prtyid);
			

		} catch (Exception e) {
			logger.error("Error occured in getAssetByFlat ---", e);

		}
		return gst;

	}
	@RequestMapping(value = { "/saveInvoice" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public String saveInvoice(HttpServletRequest request, Model model,
			HttpServletResponse response ,@RequestBody InvoiceEntity invoice) {
		HttpSession session = request.getSession(true);
		
		//int roleid=(int) session.getAttribute("roleid");
		int userId=(int) session.getAttribute("userid");
		String flatno = request.getParameter("flatno");
		String occBy = request.getParameter("occBy");
		String prptyName = request.getParameter("prptyName");
		
		
		String message=null;
		try {
		 message=readingService.saveInvoice(flatno,userId,invoice,occBy,prptyName);
		} catch (Exception e) {
			logger.error("Error occured in getAssetByFlat ---", e);

		}
		return message;
	}
	@RequestMapping(value = { "/updateInvoice" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public String updateInvoice(HttpServletRequest request, Model model,
			HttpServletResponse response ,@RequestBody InvoiceEntity invoice) {
		HttpSession session = request.getSession(true);
		
		//int roleid=(int) session.getAttribute("roleid");
		Integer userId=(Integer) session.getAttribute("userid");
		String flatno = request.getParameter("flatno");
		String prptyName = request.getParameter("Ed_prtyname");
		
		String message=null;
		try {
		 message=readingService.updateInvoice(flatno,userId,invoice,prptyName);
		} catch (Exception e) {
			logger.error("Error occured in getAssetByFlat ---", e);

		}
		return message;
	}
	
	@RequestMapping(value = { "/deleteInvoice" }, method = RequestMethod.POST)
	@ResponseBody
	public String deleteInvoice(HttpServletRequest request, Model model,
			HttpServletResponse response ) {
		HttpSession session = request.getSession(true);
		
		//int roleid=(int) session.getAttribute("roleid");
		int userId=(int) session.getAttribute("userid");
		String invoiceid = request.getParameter("invoiceid");
		
		
		String message=null;
		try {
		 message=readingService.deleteInvoice(userId,invoiceid);
		} catch (Exception e) {
			logger.error("Error occured in deleteInvoice ---", e);

		}
		return message;
	}
	@RequestMapping(value = { "/retriveInvoice" }, method = RequestMethod.POST)
	@ResponseBody
	public InvoiceEntity retriveInvoice(HttpServletRequest request, Model model,
			HttpServletResponse response ) {
		HttpSession session = request.getSession(true);
		
		//int roleid=(int) session.getAttribute("roleid");
		int userId=(int) session.getAttribute("userid");
		String invoiceid = request.getParameter("invoiceid");
		
		InvoiceEntity invoice=null;
		
		try {
			invoice=readingService.getInvoiceByinvoiceId(userId,invoiceid);
		} catch (Exception e) {
			logger.error("error in retrieve invoice--"+e.toString());
			e.printStackTrace();
		}
		return invoice;
	}
	@RequestMapping(value = { "/savePayment" }, method = RequestMethod.POST)
	
	public String savePayment(HttpServletRequest request, Model model,
			HttpServletResponse response ) {
		HttpSession session = request.getSession(true);
		
		//int roleid=(int) session.getAttribute("roleid");
		Integer userId=(Integer) session.getAttribute("userid");
		String unitNo = request.getParameter("unitNo_pay");
		String prtyid = request.getParameter("prptyid_pay");
		String payDate = null;
		//String payDate=request.getParameter("payDate");
		String payPeriod = request.getParameter("payPeriod");
		String paypurpose = request.getParameter("InvId");
		String InvId = request.getParameter("InvIdHidden");
		String ownerid_pay = request.getParameter("ownerid_pay");
		String tenantid_pay = request.getParameter("tenantid_pay");
		String invAmount = request.getParameter("invAmount");
		String amountPaid = request.getParameter("amountPaid");
		String dueAmount = request.getParameter("dueAmount");
		String payType = request.getParameter("payType");
		String prptyName=request.getParameter("prptyName");
		String paidBy=request.getParameter("paidBy");
		String paynote=request.getParameter("paynote");
		
		
		
		String payFrom="Inv";
		
		if(userId!=null) {
		
		try {
		 readingService.savePayment(unitNo,payDate,payPeriod,InvId,ownerid_pay,tenantid_pay,invAmount,amountPaid,dueAmount,payType,userId,prtyid,paypurpose,paidBy,prptyName,payFrom,paynote,null);
		} catch (Exception e) {
			logger.error("Error occured in savePayment ---", e);

		}
		return "redirect:/payments?prtyid="+prtyid+"&prptyName="+prptyName+"";
	}
	else {
		return "redirect:/login";
	}
	
	}
	
	@RequestMapping(value = { "/payments" }, method = RequestMethod.GET)
	public String payments(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
	HttpSession session = request.getSession(true);
	Integer userId = (Integer) session.getAttribute("userid");
	Integer roleid = (Integer) session.getAttribute("roleid");
	String propertyId = request.getParameter("prtyid");
	String prptyName = request.getParameter("prptyName");

	List<PropertyDto> propertyList = null;
	List<AssetDetailsDto> assetList = null;
	List<MeterReadingsEntity> readingList = null;
	//int tenantid = 0;
	if(userId!=null) {
	try {
		
		assetList = maaService.getAssetListByprtyId(userId, propertyId,roleid);
		propertyList = maaService.getPropertListByUserid(userId, roleid);
		
		MeterCostsEntity meterCost=readingService.getMeterCostsByPrty(propertyId);
		List<AptInvoiceDTO> invoiceList=readingService.getInvoicesByproperty(userId,propertyId,roleid);
		List<AptPaymentsDTO> paymentList=readingService.getPaymentsByproperty(userId,propertyId,roleid);
		model.addAttribute("propertyList", propertyList);
		model.addAttribute("prptyid", propertyId);
		model.addAttribute("prptyName", prptyName);
		model.addAttribute("assetList", assetList);
		model.addAttribute("readingList", readingList);
		model.addAttribute("meterCost", meterCost);
		model.addAttribute("invoiceList", invoiceList);
		model.addAttribute("paymentList", paymentList);
		session.setAttribute("prptyid", propertyId);
		
	} catch (Exception e) {
		logger.error("Error occured in Invoice ---", e);

	}
	return "payment";
	}else {
		return "redirect:/login";
		
	}
	
	

}
	@RequestMapping(value = { "/getTenantsbByProprtyId" }, method = RequestMethod.POST)
	@ResponseBody
	public List<TenantDTo> getTenantsbByProprtyIdEdit(HttpServletRequest request, Model model,
			HttpServletResponse response ) {
		HttpSession session = request.getSession(true);
		
		Integer roleid=(Integer) session.getAttribute("roleid");
		Integer userId=(Integer) session.getAttribute("userid");
		String propertyId = request.getParameter("prtyid");
		
		List<TenantDTo> tenantDetails=null;
		
		try {
			tenantDetails= readingService.getTenantInfoByPrtyId(propertyId,userId,roleid);
		} catch (Exception e) {
			logger.error("Error occured in retriveInvoice ---", e);

		}
		return tenantDetails;
	}
	@RequestMapping(value = { "/getOnwerbByProprtyId" }, method = RequestMethod.POST)
	@ResponseBody
	public List<OwnerDTo> getOnwerbByProprtyId(HttpServletRequest request, Model model,
			HttpServletResponse response ) {
		HttpSession session = request.getSession(true);
		
		Integer roleid=(Integer) session.getAttribute("roleid");
		Integer userId=(Integer) session.getAttribute("userid");
		String propertyId = request.getParameter("prtyid");
		
		List<OwnerDTo> ownerDetails=null;
		
		try {
			ownerDetails= readingService.getOwnerInfoByPrtyId(propertyId,userId,roleid);
		} catch (Exception e) {
			logger.error("Error occured in retriveInvoice ---", e);

		}
		return ownerDetails;
	}
@RequestMapping(value = { "/savePaymentTenant" }, method = RequestMethod.POST)
	
	public String savePaymentTenant(HttpServletRequest request, Model model,
			HttpServletResponse response ) {
		HttpSession session = request.getSession(true);
		
		Integer userId=(Integer) session.getAttribute("userid");
		String unitNo = request.getParameter("unitNo_tnt");
		String prtyid = request.getParameter("prptyid");
		
		String month = request.getParameter("month_tnt");
		String paypurpose = request.getParameter("paypurpose_T");
		//String InvId = request.getParameter("InvIdHidden");
		String year = request.getParameter("year_tnt");
		String tenantid_pay = request.getParameter("tnt_id");
		String invAmount = request.getParameter("totamt_T");
		String amountPaid = request.getParameter("amtpaid_T");
		String dueAmount = request.getParameter("dueamt_T");
		//String payType = request.getParameter("tnt_id");
		String prptyName=request.getParameter("prptyName");
		String paidBy=request.getParameter("tnt_name");
		String paymentdate = request.getParameter("paymentdate");
		String payPeriod=month+"/"+year;
		String payFrom="Tnt";
		
		
		try {
		 readingService.savePayment(unitNo,"",payPeriod,"","",tenantid_pay,invAmount,amountPaid,dueAmount,"Cash",userId,prtyid,paypurpose,paidBy,prptyName,payFrom,null,paymentdate);
		} catch (Exception e) {
			logger.error("Error occured in savePaymentTenant ---", e);

		}
		return "redirect:/payments?prtyid="+prtyid+"&prptyName="+prptyName+"";
	}
@RequestMapping(value = { "/savePaymentOwner" }, method = RequestMethod.POST)

public String savePaymentOwner(HttpServletRequest request, Model model,
		HttpServletResponse response ) {
	HttpSession session = request.getSession(true);
	
	
	Integer userId=(Integer) session.getAttribute("userid");
	String unitNo = request.getParameter("unitNo_ownr");
	String prtyid = request.getParameter("prptyid");
	
	String month = request.getParameter("month_ownr");
	String paypurpose = request.getParameter("paypurpose_o");
	String year = request.getParameter("year_ownr");
	String ownerid_pay = request.getParameter("owner_id");
	String invAmount = request.getParameter("totAmnt_o");
	String amountPaid = request.getParameter("amtpaid_o");
	String dueAmount = request.getParameter("dueamt_o");
	String prptyName=request.getParameter("prptyName");
	String paidBy=request.getParameter("ownr_name");
	String paymentdate = request.getParameter("paymentdate");
	
	String payPeriod=month+"/"+year;
	String payFrom="Ownr";
	if(userId!=null) {
	try {
	 readingService.savePayment(unitNo,"",payPeriod,"",ownerid_pay,"",invAmount,amountPaid,dueAmount,"Cash",userId,prtyid,paypurpose,paidBy,prptyName,payFrom,null,paymentdate);
	} catch (Exception e) {
		logger.error("Error occured in savePaymentOwner ---", e);

	}
	return "redirect:/payments?prtyid="+prtyid+"&prptyName="+prptyName+"";
	}
	
	else {
		return "redirect:/login";
	}


}
	
@RequestMapping(value = { "/propertyvendors" }, method = RequestMethod.GET)
public String vendors(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
HttpSession session = request.getSession(true);
Integer userId = (Integer) session.getAttribute("userid");
Integer roleid = (Integer) session.getAttribute("roleid");
String propertyId = request.getParameter("prtyid");
String prptyName = request.getParameter("prptyName");

		/*
		 * List<PropertyDto> propertyList = null; List<AssetDetailsDto> assetList =
		 * null; List<MeterReadingsEntity> readingList = null;
		 */
List<VendorEntity> vendorList = null;

if(userId!=null) {
try {
	
//	assetList = maaService.getAssetListByprtyId(userId, propertyId,roleid);
//	propertyList = maaService.getPropertListByUserid(userId, roleid);
	vendorList=readingService.getAllVendorsByprty(propertyId,roleid);
	
	//MeterCostsEntity meterCost=readingService.getMeterCostsByPrty(propertyId);
	//List<AptInvoiceDTO> invoiceList=readingService.getInvoicesByproperty(userId,propertyId,roleid);
	//model.addAttribute("propertyList", propertyList);
	//model.addAttribute("prptyid", propertyId);
	model.addAttribute("prptyName", prptyName);
//	model.addAttribute("assetList", assetList);
	//model.addAttribute("readingList", readingList);
	model.addAttribute("vendorList", vendorList);
//	model.addAttribute("meterCost", meterCost);
	//model.addAttribute("invoiceList", invoiceList);
	session.setAttribute("prptyid", propertyId);
} catch (Exception e) {
	logger.error("Error occured in Vendors ---", e);

}
return "vendor-details";
}else {
	return "redirect:/login";
}


}
@RequestMapping(value = { "/saveVendor" }, method = RequestMethod.POST,headers = { "content-type=multipart/*" })

public String saveVendor(HttpServletRequest request, Model model,
		HttpServletResponse response, @RequestParam("vendorimg") MultipartFile vendorimg, @RequestParam("idproof") MultipartFile idproof) {
	HttpSession session = request.getSession(true);
	
	//int roleid=(int) session.getAttribute("roleid");
	Integer userId=(Integer) session.getAttribute("userid");
	String vendorimg1 =null;
	String vendorname = request.getParameter("vendorname");
	String profession = request.getParameter("profession");
	String mobile = request.getParameter("mobile");
	String altmobile = request.getParameter("altmobile");
	String email = request.getParameter("email");
	String idtype = request.getParameter("idtype");
	String idproof1 = null;
	String idno = request.getParameter("idno");
	String country = request.getParameter("country");
	String State = request.getParameter("state");
	String city = request.getParameter("city");
	String pincode = request.getParameter("pincode");
	String address = request.getParameter("address");
	String status = request.getParameter("status");
	
	
	String prtyid = request.getParameter("prtyid");
	String prptyName = request.getParameter("prptyName");
	if(userId!=null) {
	if (!vendorimg.isEmpty()) {
		vendorimg1= vendorimg.getOriginalFilename();
	}
	if (!idproof.isEmpty()) {
		idproof1= idproof.getOriginalFilename();
	}
	try {
		 readingService.saveVendor(vendorimg1,vendorname,profession,mobile,altmobile,email,idtype,idproof1,idno
				 ,country,userId,prtyid,State,city,pincode,address,status,prptyName);
		} catch (Exception e) {
			logger.error("Error occured in saveVendor ---", e);

		}
	
	String directorypath = env.getProperty("maa-images");
	
	if (!new File(directorypath).exists()) {
		new File(directorypath).mkdir();
	
		}

	File dest = null;
	File dest1 = null;
	if (!vendorimg.isEmpty()) {
		dest = new File(directorypath + File.separator + vendorimg.getOriginalFilename());
		try {
			if(dest.exists()!=true)

			{vendorimg.transferTo(dest);}
			} catch (Exception ex) {
			logger.error("Exception due to:", ex);
		}
	}
if (!idproof.isEmpty() ) {
		dest1 = new File(directorypath + File.separator + idproof.getOriginalFilename());
		try {
			idproof.transferTo(dest1);
		} catch (Exception ex) {
			logger.error("Exception due to:", ex);
		}
	}
	
	
	
	return "redirect:/propertyvendors?prtyid="+prtyid+"&prptyName="+prptyName+"";
	}else {
		return "redirect:/login";
	}
}
@RequestMapping(value = { "/updateVendor" }, method = RequestMethod.POST,headers = { "content-type=multipart/*" })
public String updateVendor(HttpServletRequest request, Model model, HttpServletResponse response, @RequestParam("E_vendorimg") MultipartFile vendorimg, @RequestParam("E_idproof") MultipartFile idproof) {
	HttpSession session = request.getSession(true);
	Integer userId = (Integer) session.getAttribute("userid");
	Integer roleid = (Integer) session.getAttribute("roleid");
	String propertyId = request.getParameter("prtyid");
	String prptyName = request.getParameter("prptyName");
	int prtyid=0;
	if (!propertyId.isEmpty()) {
		prtyid = Integer.parseInt(propertyId);
	}
	String vendorid = request.getParameter("vendorid");
	String vendorimg1 = null;
	String vendorname = request.getParameter("E_vendorname");
	String profession = request.getParameter("E_profession");
	String mobile = request.getParameter("E_mobile");
	String altmobile = request.getParameter("E_altmobile");
	String email = request.getParameter("E_email");
	String idtype = request.getParameter("E_idtype");
	String idproof1 = null;
	String idno = request.getParameter("E_idno");
	String country = request.getParameter("E_country");
	String State = request.getParameter("E_State");
	String city = request.getParameter("E_city");
	/*String country = request.getParameter("E_country");
	String State = request.getParameter("E_State");
	String city = request.getParameter("E_city");*/
	String pincode = request.getParameter("E_pincode");
	String address = request.getParameter("E_address");
	String status = request.getParameter("E_status");
	String statusTogle = request.getParameter("statusTogle");
	String directorypath = env.getProperty("maa-images");
	if(userId!=null) {
	if (!new File(directorypath).exists()) {
		new File(directorypath).mkdir();
	
		}

	File dest = null;
	File dest1 = null;
	if (!vendorimg.isEmpty()) {
		vendorimg1= vendorimg.getOriginalFilename();
		dest = new File(directorypath + File.separator + vendorimg.getOriginalFilename());
		try {
			if(dest.exists()!=true)

			{vendorimg.transferTo(dest);}
			} catch (Exception ex) {
			logger.error("Exception due to:", ex);
		}
	}
	if (!idproof.isEmpty()) {
	idproof1= idproof.getOriginalFilename();
		dest1 = new File(directorypath + File.separator + idproof.getOriginalFilename());
		try {
			idproof.transferTo(dest1);
		} catch (Exception ex) {
			logger.error("Exception due to:", ex);
		}
	}
	
	try {
		 readingService.updateVendor(vendorid,vendorimg1,vendorname,profession,mobile,altmobile,email,idtype,idproof1,idno
				 ,country,userId,prtyid,State,city,pincode,address,status,prptyName,statusTogle);
		} catch (Exception e) {
			logger.error("Error occured in updateVendor ---", e);

		}
	
	return "redirect:/propertyvendors?prtyid="+prtyid+"&prptyName="+prptyName+"&userid="+userId+"&roleid="+roleid+"";
	}else {
		return "redirect:/login";
	}
}

@RequestMapping(value = { "/deleteVendor" }, method = RequestMethod.POST)
@ResponseBody
public String deleteOwnerDetails(HttpServletRequest request, Model model, HttpServletResponse response) {
	//HttpSession session = request.getSession(true);
	
	String vendorid = request.getParameter("vendorid");
	String message = null;
	try {
		message = readingService.deleteVendor(vendorid);
	} catch (Exception e) {
		logger.error("Error occured in deleteOwner ---", e);

	}

	return message;
}
@RequestMapping(value = { "/showUserInWebSite" }, method = RequestMethod.POST)
@ResponseBody
public String showUserInWebSite(HttpServletRequest request, Model model,HttpServletResponse response) {
       String msg=null;
       
       try {
              String propertyId = request.getParameter("propertyId");
              String vendorId = request.getParameter("vendorId");
              String flag = request.getParameter("flag");
              msg=maaService.showUserInWebSite(propertyId,vendorId,flag);
       }
       catch(Exception e){
              logger.error("Error occured in showUserInWebSite ---", e);
       
       
       }
       return msg;
}
@RequestMapping(value = { "/showClaasifiedWebSite" }, method = RequestMethod.POST)
@ResponseBody
public String showClaasifiedWebSite(HttpServletRequest request, Model model,HttpServletResponse response) {
       String msg=null;
       
       try {
              String propertyId = request.getParameter("propertyId");
              String classified = request.getParameter("classified");
              String status = request.getParameter("status");
              
              msg=maaService.hideClasified(propertyId,classified, status);
       }
       catch(Exception e){
              logger.error("Error occured in showUserInWebSite ---", e);
       
       
       }
       return msg;
}
	/*
	 * @RequestMapping(value = { "{uri}" }, method = RequestMethod.POST)
	 * 
	 * public String callApi(@PathVariable("uri") String uri,HttpServletRequest
	 * request,HttpServletResponse response,Model model) { try {
	 * model.addAttribute("uri", uri); //return new ModelAndView("UpiPayment");
	 * return "UpiPayment"; } catch (Exception e) {
	 * logger.error("-----api--mail--"+e.toString()); } return null;
	 * 
	 * }
	 */


	/*
	 * @RequestMapping(value = { "{uri}" }, method = RequestMethod.POST)
	 * 
	 * public String callApi(@PathVariable("uri") String uri,HttpServletRequest
	 * request,HttpServletResponse response,Model model) { try {
	 * model.addAttribute("uri", uri); //return new ModelAndView("UpiPayment");
	 * return "UpiPayment"; } catch (Exception e) {
	 * logger.error("-----api--mail--"+e.toString()); } return null;
	 * 
	 * }
	 */
	 

	/*
	 * @RequestMapping(value = { "/apinew" }, method = RequestMethod.GET)
	 * 
	 * // public String callApi(@RequestParam("url") String uri,HttpServletRequest
	 * request,HttpServletResponse response,Model model) { public String
	 * callApi(HttpServletRequest request,HttpServletResponse response,Model model)
	 * { try { // model.addAttribute("uri", uri);
	 * 
	 * }catch (Exception e) { logger.error("-----api--mail--"+e.toString()); }
	 * return "upipay";
	 * 
	 * }
	 */
@RequestMapping(value = { "apinew" }, method = RequestMethod.GET)

public String callApinew(@RequestParam("prtyid") int prtyid,@RequestParam("invoiceid") int invoiceid,
		@RequestParam("invoiceamt") Double invoiceamt, HttpServletRequest request,HttpServletResponse response,Model model) {
       try {
    	  // bankAcntNo,ifscCode,accountname,upiid
    	   logger.info("invoiceamt--"+invoiceamt+"prtyid--"+prtyid);
    		String[] getBankdetails = maaService.getBankDetailsByProperty(prtyid);
			
			String accountNumber = getBankdetails[0];
			String ifscCode = getBankdetails[1];
			String payeename = getBankdetails[2];
			String upiid = getBankdetails[3];
			String tn="INV"+invoiceid;
			String acountnumber="";
			
			 //ramakrishnap123@okhdfcbank  upi
			 //123456789@hdfc0000454.ifsc.npci    //acn   HDFC0000545.ifsc.npci

			//if(upiid!="" || upiid!=null) {
			if(!upiid.isEmpty()) {
				System.out.println("-----------"+upiid);
    			acountnumber=upiid;
    		}
			else if (!accountNumber.isEmpty() && !ifscCode.isEmpty()) {
			//if(ifscCode!=null&&accountNumber!=null) {
				ifscCode=ifscCode+".ifsc.npci";
				String s=accountNumber+"@"+ifscCode;
	    		acountnumber=s;
				System.out.println("-----------"+acountnumber);
			}
    		else {
    			ifscCode=ifscCode+".ifsc.npci";
    			 String s=accountNumber+"@"+ifscCode;
    			acountnumber=s;
    		}
    		logger.info("acountnumber--"+acountnumber+"------payeename--"+payeename);
    	   model.addAttribute("payeename", payeename);
    	   model.addAttribute("acountnumber", acountnumber);
    	   model.addAttribute("invoiceamt", invoiceamt);
    	   model.addAttribute("tn", tn);
    	   return "upipay";
    	} 
    	catch (Exception e) { 
    	    logger.error("----apinew-pdf----"+e);
    	}
	return null;
	  
}

@RequestMapping(value = { "/updatePaymentDetails" }, method = RequestMethod.POST)
public String updatePaymentDetails(HttpServletRequest request, Model model,
		HttpServletResponse response ) {
	HttpSession session = request.getSession(true);
	String paidBy=null;
	Integer userId=(Integer) session.getAttribute("userid");
	String paymentid = request.getParameter("ed_paymentid");
	String unitNo = request.getParameter("ed_unitNo");
	String prtyid = request.getParameter("prptyid");
	String month = request.getParameter("ed_month");
	String paypurpose = request.getParameter("ed_paypurpose");
	//String InvId = request.getParameter("InvIdHidden");
	String year = request.getParameter("ed_year");
	String tenantid_pay = request.getParameter("ed_tnt_id");
	String ownr_id_pay = request.getParameter("ed_ownr_id");
	String invAmount = request.getParameter("ed_totamt");
	String amountPaid = request.getParameter("ed_amtpaid");
	String dueAmount = request.getParameter("ed_dueamt");
	//String payType = request.getParameter("tnt_id");
	String prptyName=request.getParameter("prptyName");
	String ed_paymentdate = request.getParameter("ed_paymentdate");
	String ed_tnt_name=request.getParameter("ed_tnt_name");
	//String payfrm=null;
	if(!ed_tnt_name.isEmpty()) {
		paidBy=ed_tnt_name;
		//payfrm="Tnt";
	}
	String ed_ownr_name=request.getParameter("ed_ownr_name");
	if(!ed_ownr_name.isEmpty()) {
		paidBy=ed_ownr_name;
		//payfrm="Ownr";
	}
	System.out.println("ownr_id_pay********"+ownr_id_pay);
	System.out.println("tenantid_pay********"+tenantid_pay);
	String payPeriod=month+"/"+year;
	try {
	 readingService.updatePayment(unitNo,payPeriod,tenantid_pay,invAmount,amountPaid,dueAmount,ownr_id_pay,userId,prtyid,paypurpose,paidBy,prptyName,paymentid,ed_paymentdate);
	} catch (Exception e) {
		logger.error("Error occured in updatePaymentDetails ---", e);

	}
	return "redirect:/payments?prtyid="+prtyid+"&prptyName="+prptyName+"";
}



}