package com.tekskills.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.MeterReadingsDTO;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.Service.MaaService;
import com.tekskills.Service.MeterReadingServie;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.MeterCostsEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.VendorEntity;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class ReadingsController {

	@Autowired
	private MaaService maaService;
	
	
	@Autowired
	private MeterReadingServie readingService;

	

	private static final Logger logger = Logger.getLogger(ReadingsController.class);

	@RequestMapping(value = { "/meterReadings" }, method = RequestMethod.GET)
	public String meterReadings(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");

		List<PropertyDto> propertyList = null;
		List<AssetDetailsDto> assetList = null;
		List<MeterReadingsEntity> readingList = null;
		List<VendorEntity> vendorList = null;
		//int tenantid = 0;
		if(userId!=null) {
		try {
			assetList = maaService.getAssetListByprtyId(userId, propertyId,roleid);
			propertyList = maaService.getPropertListByUserid(userId, roleid);
			readingList=readingService.getMeterReadingList(userId, propertyId,roleid);
			MeterCostsEntity meterCost=readingService.getMeterCostsByPrty(propertyId);
			vendorList=readingService.getAllVendorsByprty(propertyId,roleid);
			model.addAttribute("propertyList", propertyList);
			model.addAttribute("prptyid", propertyId);
			model.addAttribute("prptyName", prptyName);
			model.addAttribute("assetList", assetList);
			model.addAttribute("vendorList", vendorList);
			model.addAttribute("readingList", readingList);
			model.addAttribute("cost", meterCost);
			session.setAttribute("prptyid", propertyId);
		} catch (Exception e) {
			logger.error("Error occured in meterReadings ---", e);

		}
		return "Meter-readings";
		}else {
			
				return "redirect:/login";
			
		}
		
	}
	@RequestMapping(value = { "/meterCosts" }, method = RequestMethod.GET)
	public String meterCosts(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userid");
		int roleid = (int) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");

		List<PropertyDto> propertyList = null;
		List<AssetDetailsDto> assetList = null;
		List<MeterReadingsEntity> readingList = null;
		//int tenantid = 0;
		if(userId!=0) {
		try {
			assetList = maaService.getAssetListByprtyId(userId, propertyId,roleid);
			propertyList = maaService.getPropertListByUserid(userId, roleid);
			readingList=readingService.getMeterReadingList(userId, propertyId,roleid);
			MeterCostsEntity meterCost=readingService.getMeterCostsByPrty(propertyId);
			
			model.addAttribute("propertyList", propertyList);
			model.addAttribute("prptyid", propertyId);
			model.addAttribute("prptyName", prptyName);
			model.addAttribute("assetList", assetList);
			model.addAttribute("readingList", readingList);
			model.addAttribute("cost", meterCost);
			session.setAttribute("prptyid", propertyId);
		} catch (Exception e) {
			logger.error("Error occured in meterCosts ---", e);

		}
		return "MeterCosts";
		}else {
		
				return "redirect:/login";
			
		}
		
	}
	@RequestMapping(value = { "/GST" }, method = RequestMethod.GET)
	public String GST(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userid");
		int roleid = (int) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");

		List<PropertyDto> propertyList = null;
		List<AssetDetailsDto> assetList = null;
		List<MeterReadingsEntity> readingList = null;
		//int tenantid = 0;
		if(userId!=0) {
		try {
			assetList = maaService.getAssetListByprtyId(userId, propertyId,roleid);
			propertyList = maaService.getPropertListByUserid(userId, roleid);
			readingList=readingService.getMeterReadingList(userId, propertyId,roleid);
			GSTEntity gst=readingService.getGstByPrty(propertyId);
			
			model.addAttribute("propertyList", propertyList);
			model.addAttribute("prptyid", propertyId);
			model.addAttribute("prptyName", prptyName);
			model.addAttribute("assetList", assetList);
			model.addAttribute("readingList", readingList);
			model.addAttribute("Gst", gst);
			session.setAttribute("prptyid", propertyId);
		} catch (Exception e) {
			logger.error("Error occured in GST ---", e);

		}
		return "GSTsettings";
		}else {
			return "redirect:/login";
		}
		
		
	}
	@RequestMapping(value = { "/saveMeterCost" }, method = RequestMethod.POST)
	public String saveMeterCost(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		int prtyid=0;
		if (!propertyId.isEmpty()) {
			prtyid = Integer.parseInt(propertyId);
		}
		
		String wCost = request.getParameter("wCost");
		String Ccost = request.getParameter("Ccost");
		String Gcost = request.getParameter("gcost");
		String Dcost = request.getParameter("dcost");
		String ACcost = request.getParameter("aCcost");
		String Otcost = request.getParameter("ocost");
		if(userId!=null) {
		try {
		readingService.saveMeterCost(propertyId,wCost,Ccost,Gcost,Dcost,ACcost,Otcost,userId);
		
		} catch (Exception e) {
			logger.error("Error occured in saveMeterCost ---", e);

		}
		return "redirect:/meterCosts?prtyid="+prtyid+"&prptyName="+prptyName+"&userid="+userId+"&roleid="+roleid+"";
	}else {
		return "redirect:/login";
	}
	}
	@RequestMapping(value = { "/updateMeterCost" }, method = RequestMethod.POST)
	public String updateMeterCost(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		int prtyid=0;
		if (!propertyId.isEmpty()) {
			prtyid = Integer.parseInt(propertyId);
		}
		String costid=request.getParameter("tblPk_e");
		String wCost = request.getParameter("wCost_e");
		String Ccost = request.getParameter("Ccost_e");
		String Gcost = request.getParameter("gcost_e");
		String Dcost = request.getParameter("dcost_e");
		String ACcost = request.getParameter("aCcost_e");
		String Otcost = request.getParameter("ocost_e");
		if(userId!=null) {
		try {
		readingService.updateMeterCost(costid,propertyId,wCost,Ccost,Gcost,Dcost,ACcost,Otcost,userId);
		
		} catch (Exception e) {
			logger.error("Error occured in saveMeterCost ---", e);

		}
		return "redirect:/meterCosts?prtyid="+prtyid+"&prptyName="+prptyName+"&userid="+userId+"&roleid="+roleid+"";
	}else {
		return "redirect:/login";
	}
	}
	
	@RequestMapping(value = { "/saveGST" }, method = RequestMethod.POST)
	public String saveGST(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		int prtyid=0;
		if (!propertyId.isEmpty()) {
			prtyid = Integer.parseInt(propertyId);
		}
		
		String wGst = request.getParameter("wGst");
		String CGst = request.getParameter("CGst");
		String GGst = request.getParameter("gGst");
		String DGst = request.getParameter("dGst");
		String ACGst = request.getParameter("aCGst");
		String OtGst = request.getParameter("oGst");
		String rentGst = request.getParameter("rentGst");
		String mntGst = request.getParameter("mntGst");
		if(userId!=null) {
		try {
		readingService.saveGST(propertyId,wGst,CGst,GGst,DGst,ACGst,OtGst,rentGst,mntGst,userId);
		
		} catch (Exception e) {
			logger.error("Error occured in saveGST ---", e);

		}
		return "redirect:/GST?prtyid="+prtyid+"&prptyName="+prptyName+"&userid="+userId+"&roleid="+roleid+"";
	}else {
		return "redirect:/login";
	}
	}
	
	
	
	@RequestMapping(value = { "/updateGST" }, method = RequestMethod.POST)
	public String updateGST(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		int prtyid=0;
		if (!propertyId.isEmpty()) {
			prtyid = Integer.parseInt(propertyId);
		}
		String gstid=request.getParameter("tblPk_e");
		String wGst = request.getParameter("wtrGst_e");
		String CGst = request.getParameter("pwrGst_e");
		String GGst = request.getParameter("gasGst_e");
		String DGst = request.getParameter("dslGst_e");
		String ACGst = request.getParameter("aCGst_e");
		String OtGst = request.getParameter("otrGst_e");
		String rentGst = request.getParameter("rentGst_e");
		String mntGst = request.getParameter("mntGst_e");
		if(userId!=null) {
		try {
		readingService.updateGST(gstid,propertyId,wGst,CGst,GGst,DGst,ACGst,OtGst,rentGst,mntGst,userId);
		
		} catch (Exception e) {
			logger.error("Error occured in updateGST ---", e);

		}
		return "redirect:/GST?prtyid="+prtyid+"&prptyName="+prptyName+"&userid="+userId+"&roleid="+roleid+"";
	}
	else {
		return "redirect:/login";
	}
}
	
	


	
	
	
	@RequestMapping(value = { "/saveMeterReadings" }, method = RequestMethod.POST)
	public String saveMeterReadings(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		int prtyid=0;
		if (!propertyId.isEmpty()) {
			prtyid = Integer.parseInt(propertyId);
		}
		
		String month = request.getParameter("month_indv");
		String year= request.getParameter("year_indv");
		String unitNo = request.getParameter("unitNo");
		String assetid = request.getParameter("assetid");
		
		String wCost = request.getParameter("wCost");
		String wpresent = request.getParameter("wpresent");
		
		String Cpresent = request.getParameter("Cpresent");
		String Ccost = request.getParameter("Ccost");
		
		String Gpresent = request.getParameter("Gpresent");
		String Gcost = request.getParameter("Gcost");
		
		String Dpresent = request.getParameter("Dpresent");
		String Dcost = request.getParameter("Dcost");
		
		String ACpresent = request.getParameter("ACpresent");
		String ACcost = request.getParameter("ACcost");
		
		String Otpresent = request.getParameter("Otpresent");
		String Otcost = request.getParameter("Otcost");
		if(userId!=null) {
		try {
		readingService.saveMeterReadings(userId,roleid,propertyId,month,year,unitNo,wCost,wpresent,
				Cpresent,Ccost,Gpresent,Gcost,Dpresent,Dcost,ACpresent,ACcost,Otpresent,Otcost,assetid);
		
		} catch (Exception e) {
			logger.error("Error occured in saveMeterReadings ---", e);

		}
		return "redirect:/meterReadings?prtyid="+prtyid+"&prptyName="+prptyName+"&userid="+userId+"&roleid="+roleid+"";
	}else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = { "/updateMeterReading" }, method = RequestMethod.POST)
	public String updateMeterReading(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String tbl_pk = request.getParameter("tbl_pk");
		String propertyId = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		int prtyid=0;
		if (!propertyId.isEmpty()) {
			prtyid = Integer.parseInt(propertyId);
		}
		
		String month = request.getParameter("e_month");
		String year= request.getParameter("e_year");
		String unitNo = request.getParameter("e_flatno");
		
		String wprvious = request.getParameter("e_water_CPU");
		String wpresent = request.getParameter("e_wmr");
		
		String Cprvious = request.getParameter("e_pmr");
		String Ccost = request.getParameter("e_power_CPU");
		
		String Gpresent = request.getParameter("e_gmr");
		String Gcost = request.getParameter("e_gas_CPU");
		
		String Dpresent = request.getParameter("e_dmr");
		String Dcost = request.getParameter("e_disel_CPU");
		
		String ACpresent = request.getParameter("e_amr");
		String ACcost = request.getParameter("e_ac_CPU");
		
		String Otpresent = request.getParameter("e_omr");
		String Otcost = request.getParameter("e_other_CPU");
		List<MeterReadingsEntity> readingList = null;
		if(userId!=null) {
		try {
		readingService.updateMeterReading(tbl_pk,userId,roleid,month,year,unitNo,wprvious,wpresent,
				Cprvious,Ccost,Gpresent,Gcost,Dpresent,Dcost,ACpresent,ACcost,Otpresent,Otcost);
		
		readingList=readingService.getMeterReadingList(userId, propertyId,roleid);
		model.addAttribute("readingList", readingList);
		
		} catch (Exception e) {
			logger.error("Error occured in updateMeterReading ---", e);

		}
		return "redirect:/meterReadings?prtyid="+prtyid+"&prptyName="+prptyName+"&userid="+userId+"&roleid="+roleid+"";
	}else {
		return "redirect:/login";
	}
	}
	@RequestMapping(value = { "/getReadingsByFlat" }, method = RequestMethod.POST)
	@ResponseBody
	public MeterReadingsEntity getReadingsByFlat(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		//HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String flat = request.getParameter("flat");
		String month = request.getParameter("month");
		
		String year = request.getParameter("year");
		//int userId = (int) session.getAttribute("userid");
		MeterReadingsEntity readingObj =null;

		
		try {
			
			 readingObj = maaService.getMeterReadingsByFlat(prtyid, flat, month, year);
			

		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return readingObj;

	}
	@RequestMapping(value = { "/getReadingsByFlatInvoice" }, method = RequestMethod.POST)
	@ResponseBody
	public MeterReadingsDTO getReadingsByFlatInvoice(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		//HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String flat = request.getParameter("flat");
		String month = request.getParameter("month");
		String prvMonth = request.getParameter("prvmonth");
		String readingType = request.getParameter("redingtype");
		String year = request.getParameter("year");
		//int userId = (int) session.getAttribute("userid");
		MeterReadingsDTO readingObj =null;

		
		try {
			
			 readingObj = maaService.getMeterReadingsForInvoice( prtyid,  flat,  readingType,  prvMonth,
						 month,  year);
			

		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return readingObj;

	}
	@RequestMapping(value = { "/DeleteReadingsByFlat" }, method = RequestMethod.POST)
	@ResponseBody
	public String DeleteReadingsByFlat(HttpServletRequest request, Model model,
			HttpServletResponse response) {
		//HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String flat = request.getParameter("flat");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String tblpk = request.getParameter("readingid");
		
		
		String msg=null;
		
		try {
			
			msg= readingService.deleteMeterReadingsByFlat(prtyid,flat,month,year,tblpk);
			

		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return msg;	
		

	}

}
