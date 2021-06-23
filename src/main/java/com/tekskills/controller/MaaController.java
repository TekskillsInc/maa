
package com.tekskills.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.DTO.ClassifiedInfoDTO;
import com.tekskills.DTO.ExpenseChatDto;
import com.tekskills.DTO.ExpenseDTO;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.DTO.SecurityBean;
import com.tekskills.DTO.UserInfoDto;
import com.tekskills.DTO.VacanciesDto;
import com.tekskills.DTO.mailBean;
import com.tekskills.Service.MaaService;
import com.tekskills.Service.MeterReadingServie;
import com.tekskills.Service.MiscellaneousService;
import com.tekskills.entity.ApartmentDetialsEntity;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.AssociationEntity;
import com.tekskills.entity.ComplaintDetailsEntity;
import com.tekskills.entity.NotificationEntity;
import com.tekskills.entity.TermsAndConditions;
import com.tekskills.entity.VendorEntity;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class MaaController {
	@Autowired
	private MaaService maaService;

	@Autowired
	private MeterReadingServie readingService;
	@Autowired
	private MiscellaneousService misService;
	
	
	
	
	@Autowired
	private Environment env;

	private static final Logger logger = Logger.getLogger(MaaController.class);

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String Loginform() {
		return "loginpage";
	}

	@RequestMapping(value = { "/comingsoon" }, method = RequestMethod.GET)
	public String comingsoon(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String prtyName = request.getParameter("prptyName");
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		model.addAttribute("prptyid", prtyid);
		model.addAttribute("userid", userid);
		model.addAttribute("prptyName", prtyName);
		model.addAttribute("roleid", roleid);
		return "comingsoon";
	}

	@RequestMapping(value = { "/homecomingsoon" }, method = RequestMethod.GET)
	public String homecomingsoon(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "comingsoon";
	}

	@RequestMapping(value = { "/PropertyCreation" }, method = RequestMethod.GET)
	public String propertyCreation() {
		return "property-details";
	}
	
	
	
	@RequestMapping(value = { "/admin-properties" }, method = RequestMethod.GET)
	public String adminProperties(HttpServletRequest req, HttpServletResponse response, Model model) {
		
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		if (userid != null) {
		try {

			
			//List<AssociationEntity> assoiciationList = null;
			
			List<ApartmentDetialsEntity> userList = maaService.getUserDetails();

			model.addAttribute("userList", userList);
		int prptyCount=maaService.getPropertyCount();
		  int blogCount=maaService.getBlogCountByProperty();
		  int vendorCount=maaService.getVendorCountByProperty();
		  int classifiedCount=maaService.getClassifiedCountByProperty(); 
		  int vacancies=maaService.getVacanciesByProperty("",userid,roleid);
		 
		  //int tcount=maaService.getTenanantCountByProperty(null,userid);
		  model.addAttribute("prptyCount", prptyCount);
		  
		  model.addAttribute("blogCount", blogCount);
			 model.addAttribute("vendorCount", vendorCount);
			  model.addAttribute("vacancies", vacancies);
			  model.addAttribute("classifiedCount",classifiedCount);
		 
		   return "Masteradminsscreen-dashboard";
		} catch (Exception e) {
			logger.error("Ecxception occured while PropertyFetch---" + e);

		}
	} else {
		return "redirect:/login";
	}
		return null;
	}
	
	@RequestMapping(value = { "/classifides-admin" }, method = RequestMethod.GET)
	public String AdminClassifieds(HttpServletRequest req, HttpServletResponse response, Model model) {
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		if (userid != null) {
		try {

			
			//List<AssociationEntity> assoiciationList = null;
			
			//ClassifedDTO classified=misService.getClassifiedsByProperty(null);
			ClassifedDTO classified=misService.adminClassifieds();
			//

			model.addAttribute("classified", classified);
				
		 
		   return "classifides-admin";
		} catch (Exception e) {
			logger.error("Ecxception occured while PropertyFetch---" + e);

		}
	} else {
		return "redirect:/login";
	}
		return null;

	}
	
	
	@RequestMapping(value = { "/vacancies-admin" }, method = RequestMethod.GET)
	public String AdminVacancies(HttpServletRequest req, HttpServletResponse response, Model model) {
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		if (userid != null) {
		try {
			List<VacanciesDto> vacanciesList=misService.getAllVacancies();

			model.addAttribute("vacanciesList", vacanciesList);
			
			
		 
			  return "vaicancies";
		} catch (Exception e) {
			logger.error("Ecxception occured while vacancies-admin---" + e);

		}
	} else {
		return "redirect:/login";
	}
		return null;

	}
	
	@RequestMapping(value = { "/vendor-admin" }, method = RequestMethod.GET)
	public String AdminVendors(HttpServletRequest req, HttpServletResponse response, Model model) {
		System.out.println("vendor-admin");
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		if (userid != null) {
		try {
			List<VendorEntity> vendorList  = readingService.getAllVendorsByprty("", roleid);
			model.addAttribute("vendorList", vendorList);
			model.addAttribute("roleid", roleid);
			
			
		 
		   return "admin-vendors";
		} catch (Exception e) {
			logger.error( e.getMessage(),e);

		}
	} else {
		return "redirect:/login";
	}
		return null;

	}

	@RequestMapping(value = { "/MasterDashboard" }, method = RequestMethod.GET)
	public String MasterDashboard(HttpServletRequest req, HttpServletResponse response, Model model) {
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		//List<PropertyDto> propertyList = null;
		
		
		if (userid != null) {
			try {

				
				//List<AssociationEntity> assoiciationList = null;
				
				List<ApartmentDetialsEntity> userList = maaService.getUserDetails();

				model.addAttribute("userList", userList);
					
				
				//ClassifedDTO classified=misService.getClassifiedsByProperty(null);
				
					
					  int prptyCount=maaService.getPropertyCount();
					  int blogCount=maaService.getBlogCountByProperty();
					  int vendorCount=maaService.getVendorCountByProperty();
					  int classifiedCount=maaService.getClassifiedCountByProperty(); 
					  int vacancies=maaService.getVacanciesByProperty("",userid,roleid);
					 
					  //int tcount=maaService.getTenanantCountByProperty(null,userid);
					  model.addAttribute("prptyCount", prptyCount);
					  
					  model.addAttribute("blogCount", blogCount);
						 model.addAttribute("vendorCount", vendorCount);
						  model.addAttribute("vacancies", vacancies);
						  model.addAttribute("classifiedCount",classifiedCount);
					 
					   return "Masteradminsscreen-dashboard"; 
					 

					//return "property-details";
				

			} catch (Exception e) {
				logger.error("Ecxception occured while PropertyFetch---" + e);

			}
		} else {
			return "redirect:/login";
		}
		return null;
	}
	@RequestMapping(value = { "/Dashboard" }, method = RequestMethod.GET)
	public String Dashboard(HttpServletRequest req, HttpServletResponse response, Model model) {
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		List<PropertyDto> propertyList = null;
		 List<ComplaintDetailsEntity> complaintList=null;
		List<NotificationEntity> notificationList = null;
		
		PropertyDto property = null;
		List<VendorEntity> vendorList = null;
		if (userid != null) {
			try {

				String propId = req.getParameter("prptyid");
				List<AssociationEntity> assoiciationList = null;
				if (propId != null) {
					property = maaService.getPropertByProptyid(userid, propId, roleid);
					assoiciationList = misService.getAssociationList(propId, roleid, userid);
					//complaintList=misService.getComplaintListByprtyId(userid,propId,roleid);
					complaintList=misService.getComplaintListByUser(userid,propId,roleid);
					
				propertyList = maaService.getPropertListByUserid(userid, roleid);
					vendorList = readingService.getAllVendorsByprty(propId, roleid);
					
					  int ownerCount=maaService.getOwnerCountByProperty(propId,userid); int
					tenenatCount=maaService.getTenanantCountByProperty(propId,userid); int
					 vacancies=maaService.getVacanciesByProperty(propId,userid,roleid); int
					  assetCount=maaService.getAssetCount(propId);
					 
						notificationList = misService.getNotificationCountsListByprtyId(userid, propId, roleid);
					 
					  ClassifedDTO classified=misService.getClassifiedsByProperty(propId);
					  
					  List<ClassifiedInfoDTO> classifiedList=classified.getClassifiedList();
					  
					  List<VendorEntity> topvendorList = vendorList .stream() .limit(5).collect(Collectors.toList());
					  
					  
					  List<NotificationEntity> topEventList =
					  notificationList.stream().limit(5).collect(Collectors.toList());
					  List<ClassifiedInfoDTO> topClassifiedList =
					  classifiedList.stream().limit(5).collect(Collectors.toList());
					 List<ExpenseChatDto> expensechatList= maaService.getExpensesForYear(propId,userid,roleid);
					 
					 model.addAttribute("asosize", assoiciationList.size());
					 model.addAttribute("expensechatList", new Gson().toJson(expensechatList));
					model.addAttribute("assoiciationList", assoiciationList);
					//model.addAttribute("expenseList", expenseList);
					 model.addAttribute("classified", classified);
					model.addAttribute("propertyList", propertyList);
					//model.addAttribute("assetList", assetList);
					model.addAttribute("property", property);
					model.addAttribute("prptyid", property.getBuildingid());
					model.addAttribute("prptyName", property.getBuild_name());
					model.addAttribute("userid", userid);
					model.addAttribute("roleid", roleid);
					
					  model.addAttribute("notificationList", topEventList);
					model.addAttribute("vendorList", topvendorList);
					  model.addAttribute("classifiedList", topClassifiedList);
					  model.addAttribute("complaintList", complaintList);
					  
					  model.addAttribute("ownerCount", ownerCount);
					 model.addAttribute("tenenatCount", tenenatCount);
					  model.addAttribute("vacancies", vacancies); model.addAttribute("assetCount",
					  assetCount);
					 

					//session.setAttribute("notfcount", notificationList.size());
					//session.setAttribute("compcount", complaintList.size());
					
					  // if(roleid==2 && roleid!=1) {
					  return "adminDashboard"; 
					  //}
					   
					   
					 //  else { return "property-details"; }
					 

					//return "property-details";
				}

			} catch (Exception e) {
				logger.error(e.getMessage(), e);

			}
		} else {
			return "redirect:/login";
		}
		return null;
	}

	@RequestMapping(value = { "/PropertyFetch" }, method = RequestMethod.GET)
	public String PropertyFetch(HttpServletRequest req, HttpServletResponse response, Model model) {
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String username=(String) session.getAttribute("username");
		List<PropertyDto> propertyList = null;
		
		
	
		
		PropertyDto property = null;
		List<ExpenseDTO> expenseList = null;
		List<AssetDetailsDto> assetList = null;
		
		if (userid != null) {
			try {

				String propId = req.getParameter("prptyid");
				
				if (propId != null) {
					property = maaService.getPropertByProptyid(userid, propId, roleid);
					propertyList = maaService.getPropertListByUserid(userid, roleid);
					
					assetList = maaService.getAssetListByprtyId(userid, propId, roleid);
					expenseList = misService.getAllExpensesByProperty(propId, roleid,userid);
					
					//  ClassifedDTO classified=misService.getClassifiedsByProperty(propId);

					// model.addAttribute("expensechatList", new Gson().toJson(expensechatList));
					//model.addAttribute("assoiciationList", assoiciationList);
					model.addAttribute("expenseList", expenseList);
					// model.addAttribute("classified", classified);
					model.addAttribute("propertyList", propertyList);
					model.addAttribute("assetList", assetList);
					model.addAttribute("property", property);
					model.addAttribute("prptyid", property.getBuildingid());
					model.addAttribute("prptyName", property.getBuild_name());
					model.addAttribute("userid", userid);
					model.addAttribute("roleid", roleid);
					model.addAttribute("username", username);
					
					
				
					  
				
					  
					 

					return "property-details";
				}

			} catch (Exception e) {
				logger.error(e.getMessage(), e);

			}
		} else {
			return "redirect:/login";
		}
		return null;
	}

	
	
	
	
	
	
	
	@RequestMapping(value = { "/PropertyEntrance" }, method = RequestMethod.GET)
	public ModelAndView propertyEntrance(HttpServletRequest req, HttpServletResponse response) {
		HttpSession session = req.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		List<PropertyDto> propertyList = null;
		// int size=0;
		ModelAndView model = new ModelAndView();
		if (userId != null) {
			try {
				propertyList = maaService.getPropertListByUserid(userId, roleid);
				if (propertyList.size() > 0) {
					model.addObject("propertyList", propertyList);
					model.addObject("userid", userId);
					model.addObject("roleid", roleid);
					model.setViewName("Property_enternce_screen");
				} else {
					String message = "You are not active with any property..!!";

					model.addObject("message", new Gson().toJson(message));
					model.setViewName("loginpage");

				}
			} catch (Exception e) {
				logger.error("Ecxception occured while propertyEntrance---" + e);

			}

			return model;
		} else {
			return new ModelAndView("redirect:/login");
		}
	}

	@RequestMapping(value = { "/UserRegistration" }, method = RequestMethod.GET)
	public String Registration() {
		return "register-page-new";
	}

	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {

		HttpSession session = req.getSession(true);

		session.removeAttribute("userid");
		session.invalidate();
		return "redirect:/login";
	}

	@RequestMapping(value = { "/LoginValidation" }, method = RequestMethod.POST)
	public String loginvalidate(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession(true);
		String username = req.getParameter("email").trim();
		String password = req.getParameter("password").trim();

		String role = req.getParameter("role");
		try {
			SecurityBean sbean = maaService.getAllSecuredPwd();
			if (sbean != null) {

				mailBean.setMail_User(sbean.getName());
				mailBean.setMail_password(Jsecurity.decipher(sbean.getPwd()));
			}

			UserInfoDto userInfo = maaService.validateUser(username, password, role);

			if (userInfo != null) {
				if (userInfo.getStatus() != 0) {

					session.setAttribute("userid", userInfo.getUserid());
					session.setAttribute("roleid", userInfo.getRoleid());
					session.setAttribute("username", userInfo.getEmail());

					model.addAttribute("userid", userInfo.getUserid());
					model.addAttribute("roleid", userInfo.getRoleid());

					if (userInfo.getRoleid() > 1 && userInfo.getRoleid() <= 4) {
						return "redirect:/PropertyEntrance";
					} else if (userInfo.getRoleid() == 1) {
						return "redirect:/MasterDashboard";
					} else {
						String message = "Invalid Credentials..Please check role";

						model.addAttribute("message", new Gson().toJson(message));
						return "loginpage";

					}
				}

				else {
					String message = "Your cant login till property activated by admin";

					model.addAttribute("message", new Gson().toJson(message));
					return "loginpage";

				}

			} else {
				String message = "Invalid Credentials";
				model.addAttribute("message", new Gson().toJson(message));
				// model.addAttribute("message", message);
				return "loginpage";

			}
		} catch (Exception e) {
			logger.error("Ecxception occured while login---" + e);
			String message = "Database Exception Occured!!";
			model.addAttribute("message", new Gson().toJson(message));
			// model.addAttribute("message", message);

		}
		return "loginpage";

	}

	@RequestMapping(value = { "/checkBuildingMail" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkBuildingMail(HttpServletRequest request, Model model, HttpServletResponse response) {
		String buldingMail = request.getParameter("email");

		String buldnigname = null;

		try {
			buldnigname = maaService.getBuildingNmaeByMail(buldingMail);
		} catch (Exception e) {
			logger.info("Exception in checkBuildingMail--" + e.getMessage());
		}
		return buldnigname;

	}

	@RequestMapping(value = { "/saveUserRegistration" }, method = RequestMethod.POST)
	public String saveUserRegistration(HttpServletRequest request, Model model, HttpServletResponse response) {
		String buildingName = request.getParameter("BuldingName");
		String buldingMail = request.getParameter("BuldingMail");
		String buldingPhn = request.getParameter("BuldingPhn");

		String password = request.getParameter("Password");
		// String Password="YXNkQVNEMTIz";
		String uscNo = request.getParameter("uscNo");
		String pincode = request.getParameter("pincode");
		try {
			String message = maaService.saveUserRegistration(buildingName, buldingMail, buldingPhn, password, uscNo,
					pincode);
			model.addAttribute("message", message);
			if (message.equalsIgnoreCase("Success")) {

				PrintWriter out = response.getWriter();

				out.println("<script type=\"text/javascript\">");
				out.println(
						"alert('Your account will be activated within in 24 hrours.Please check your inbox  ....!!');");
				out.println("location.href='login';");
				out.println("</script>");
				out.close();
				// return "redirect:/LoginForm";
			} else {

				return "redirect:/login";
			}

		} catch (Exception e) {
			logger.error("Error while saving Registration ---", e);
		}
		return null;
	}

	@RequestMapping(value = { "/loadProperty" }, headers = { "content-type=multipart/*" }, method = RequestMethod.POST)
	public String loadProperty(HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestParam("prtyImg") MultipartFile iprtyImg) throws IOException {

		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String prtyName = request.getParameter("prtyname");
		Integer roleid = (Integer) session.getAttribute("roleid");
		Integer userId = (Integer) session.getAttribute("userid");
		String buildingName = request.getParameter("BuildingName");
		String noOfUnits = request.getParameter("noOfUnits");
		String proptype = request.getParameter("proptype");

		String blocality = request.getParameter("blocality");
		String uscNo = request.getParameter("uscNo");
		String City = request.getParameter("City");
		String userid = request.getParameter("userid");

		String district = request.getParameter("district");
		String State = request.getParameter("State");
		String Pincode = request.getParameter("Pincode");

		String bcontact = request.getParameter("bcontact");
		String altcontact = request.getParameter("altcontact");

		String bEmail = request.getParameter("bEmail");
		String upiId = request.getParameter("upiId");
		// String comnCurMeter = request.getParameter("uscNo");

		String bAcntNo = request.getParameter("bAcntNo");
		String accountname = request.getParameter("accountname");
		String ifscCode = request.getParameter("ifscCode");
		String comnWtrMeter = request.getParameter("comnWtrMeter");
		String mgrName = request.getParameter("mgrName");
		String mgrPhn = request.getParameter("mgrPhn");
		String mgrAltPhn = request.getParameter("mgrAltPhn");
		String mgrMail = request.getParameter("mgrMail");

		String secName = request.getParameter("SecName");
		String secPhn = request.getParameter("SecPhn");
		String secEmail = request.getParameter("SecEMail");
		String notes = request.getParameter("notes");
		String prtyImg = null;
		int userIdint = 0;
		if (userId == null) {
			return "redirect:/login";

		} else {
			try {
				if (userid != null) {
					userIdint = Integer.parseInt(userid);
				}
				if (!iprtyImg.isEmpty()) {

					prtyImg = iprtyImg.getOriginalFilename();

				}
				String message = maaService.saveBuilding(buildingName, noOfUnits, proptype, blocality, bEmail, bcontact,
						City, State, Pincode, altcontact, uscNo, comnWtrMeter, mgrName, mgrPhn, mgrAltPhn, mgrMail,
						notes, upiId, district, secName, secPhn, secEmail, prtyImg, userid, uscNo, bAcntNo, ifscCode,
						accountname);

				model.addAttribute("message", message);
				List<PropertyDto> propertyList = maaService.getPropertListByUserid(userIdint, roleid);

				model.addAttribute("propertyList", propertyList);
				model.addAttribute("propertyId", prtyid);
				model.addAttribute("prptyName", prtyName);

				String directorypath = env.getProperty("maa-images");

				if (!new File(directorypath).exists()) {
					new File(directorypath).mkdir();

				}

				File dest = null;
				if (iprtyImg != null) {
					dest = new File(directorypath + File.separator + iprtyImg.getOriginalFilename());
					try {

						iprtyImg.transferTo(dest);

					} catch (Exception ex) {
						logger.error("Exception due to:", ex);
					}
				}
				if (message.equalsIgnoreCase("Success")) {
					PrintWriter out = response.getWriter();

					out.println("<script type=\"text/javascript\">");
					out.println("alert('" + buildingName
							+ " will be activated with in next 24 Hours. Please check your inbox.....!!');");
					out.println("location.href='PropertyFetch?prptyid=" + prtyid + "&prptyname=" + prtyName + "';");
					out.println("</script>");
					out.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('" + buildingName + " Property Not added!!');");
					out.println("location.href='PropertyFetch?prptyid=" + prtyid + "&prptyname=" + prtyName + "';");
					out.println("</script>");
					out.close();
				}
			} catch (Exception e) {
				logger.error("Error while saving Registration ---", e);
			}
		}
		return null;

	}

	@RequestMapping(value = { "/EditPropertyDetails" }, headers = {
			"content-type=multipart/*" }, method = RequestMethod.POST)
	public String editPropertyDetails(HttpServletRequest request, Model model, HttpServletResponse response,
			@RequestParam("iprtyImg") MultipartFile iprtyImg) {
		String buildingName = request.getParameter("iBuildingName");
		String noOfUnits = request.getParameter("iNoOfUnits");
		String proptype = request.getParameter("iPrtyType");
		String userId = request.getParameter("iUserId");
		String propertyId = request.getParameter("iBuildingId");

		String blocality = request.getParameter("iBLocality");
		String buldingMail = request.getParameter("iEmail");
		String buldingPhn = request.getParameter("iCntNo");

		String City = request.getParameter("iCity");
		String State = request.getParameter("iState");
		String Pincode = request.getParameter("iPincode");

		String ibAcntNo = request.getParameter("ibAcntNo");
		String ifscCode = request.getParameter("e_ifscCode");
		String accountname = request.getParameter("e_accountname");
		System.out.println("accountname----"+accountname);

		// String bcontact = request.getParameter("iCntNo");
		String altcontact = request.getParameter("iAltNo");

		// String bEmail=request.getParameter("iEmail");
		String upiId = request.getParameter("iUpiId");
		String comnCurMeter = request.getParameter("iCrtMtr");
		String uscNo = request.getParameter("iusc");

		String comnWtrMeter = request.getParameter("iWtrCmnMeter");
		String mgrName = request.getParameter("iMgrName");
		String mgrPhn = request.getParameter("iMgrtNo");

		String secName = request.getParameter("iSecName");
		String secPhn = request.getParameter("iSecPhn");
		String secEmail = request.getParameter("iSecEmail");

		// String Password="YXNkQVNEMTIz";
		String mgrAltPhn = request.getParameter("iMgrtAltNo");
		String mgrMail = request.getParameter("iMgrEmail");
		String notes = request.getParameter("iNotes");
		String district = request.getParameter("iDistrict");
		String prtyImg = null;
		try {
			if (!iprtyImg.isEmpty()) {

				prtyImg = iprtyImg.getOriginalFilename();

			}
			String message = maaService.updateProperty(propertyId, buildingName, noOfUnits, proptype, blocality,
					buldingMail, buldingPhn, City, State, Pincode, prtyImg, altcontact, uscNo, comnWtrMeter, mgrName,
					mgrPhn, mgrAltPhn, mgrMail, notes, upiId, district, secName, secPhn, secEmail, userId, ibAcntNo,
					ifscCode, accountname);

			String directorypath = env.getProperty("maa-images");
			System.out.println(directorypath+"-----------directorypath");

			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();

			}

			File dest = null;
			if (iprtyImg != null) {
				dest = new File(directorypath + File.separator + iprtyImg.getOriginalFilename());
				
					if (dest.exists() != true)

					{
						try {iprtyImg.transferTo(dest);}
					 catch (Exception ex) {
						logger.error(ex.getMessage(), ex);
					}
					}

				
			}

			model.addAttribute("message", message);

		} catch (Exception e) {
			logger.error("Error while saving Registration ---", e);

		}
		return "redirect:/PropertyFetch?prptyid=" + propertyId + "&prptyname=" + buildingName + "";

	}

	@RequestMapping(value = { "/AssetDetails" }, method = RequestMethod.GET)
	public ModelAndView AssetDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");

		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");
		ModelAndView model = new ModelAndView();
		if (userId != null) {
			List<AssetDetailsDto> assetList = null;
			List<PropertyDto> propertyList = null;

			try {
				int unitCount = maaService.getUnitCount(propertyId);
				int assetCount = maaService.getAssetCount(propertyId);
				assetList = maaService.getAssetListByprtyId(userId, propertyId, roleid);
				propertyList = maaService.getPropertListByUserid(userId, roleid);
				model.addObject("assetList", assetList);
				model.addObject("propertyList", propertyList);
				model.addObject("prptyid", propertyId);
				model.addObject("prptyName", prptyName);
				model.addObject("roleid", roleid);
				model.addObject("unitCount", unitCount);
				model.addObject("assetCount", assetCount);
				System.out.println("unitCount---" + unitCount + "--assetCount---" + assetCount);
				model.setViewName("Asset-Details");
			} catch (Exception e) {
				logger.error("Error occured in AssetDetails ---", e);

			}
		} else {

			return new ModelAndView("redirect:/login");

		}
		return model;
	}

	@RequestMapping(value = { "/SaveAssetDetils" }, method = RequestMethod.POST)
	public String SaveAssetDetils(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession(true);
		Integer roleid = (Integer) session.getAttribute("roleid");
		Integer userId = (Integer) session.getAttribute("userid");
		String propertyId = request.getParameter("prtyId");
		String unitNo = request.getParameter("unitNo");
		String roomType = request.getParameter("roomType");
		String prtytax = request.getParameter("prtytax");
		String areSqft = request.getParameter("areSqft");
		String propertyName = request.getParameter("prtyName");

		String rent = request.getParameter("rent");
		String maintanance = request.getParameter("maintanance");
		String secBill = request.getParameter("secBill");

		String wtrMeter = request.getParameter("wtrMeter");
		String curMeter = request.getParameter("curMeter");
		String dslMeter = request.getParameter("dslMeter");
		String acMeter = request.getParameter("acMeter");
		String gasMeter = request.getParameter("gasMeter");
		String othMeter = request.getParameter("othMeter");

		List<AssetDetailsDto> assetList = null;
		if (userId == null) {

			return "redirect:/login";

		} else {
			try {
				maaService.saveAssetByPropertyId(userId, propertyId, unitNo, roomType, prtytax, areSqft, rent,
						maintanance, secBill, wtrMeter, curMeter, dslMeter, acMeter, gasMeter, othMeter);
				assetList = maaService.getAssetListByprtyId(userId, propertyId, roleid);
				model.addAttribute("assetList", assetList);
				model.addAttribute("propertyId", propertyId);
			} catch (Exception e) {
				logger.error("Error occured in AssetDetails ---", e);

			}
		}
		return "redirect:/AssetDetails?prtyid=" + propertyId + "&prptyName=" + propertyName;
	}

	@RequestMapping(value = { "/getAssetByFlat" }, method = RequestMethod.GET)
	@ResponseBody
	public AssetDetails getAssetDetailsByAssetId(HttpServletRequest request, Model model,
			HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		String flatno = request.getParameter("flatno");
		// String assetid = request.getParameter("assetid");
		Integer userid = (Integer) session.getAttribute("userid");
		AssetDetails asset = null;

		try {
			asset = maaService.getFlat(prtyid, flatno, userid);

		} catch (Exception e) {
			logger.error("Error occured in AssetDetails ---", e);

		}
		return asset;

	}

	@RequestMapping(value = { "/updateAssetDetils" }, method = RequestMethod.POST)
	public String updateAssetDetils(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		String propertyId = request.getParameter("EprtyId");
		String propertyName = request.getParameter("EprtyName");

		String unitNo = request.getParameter("EunitNo");
		String roomType = request.getParameter("EroomType");

		String prtytax = request.getParameter("Eprtytax");
		String areSqft = request.getParameter("EareSqft");

		String rent = request.getParameter("Erent");
		String maintanance = request.getParameter("Emaintanance");
		String secBill = null;

		String wtrMeter = request.getParameter("EwtrMeter");
		String curMeter = request.getParameter("EcurMeter");
		String dslMeter = request.getParameter("EdslMeter");
		String acMeter = request.getParameter("EacMeter");
		String gasMeter = request.getParameter("EgasMeter");
		String othMeter = request.getParameter("EothMeter");
		String assetId = request.getParameter("Eassetid");
		if (userId == null) {
			return "redirect:/login";

		} else {
			try {
				maaService.updateAssetByPropertyId(userId, propertyId, assetId, unitNo, roomType, prtytax, areSqft,
						rent, maintanance, secBill, wtrMeter, curMeter, dslMeter, acMeter, gasMeter, othMeter);

				model.addAttribute("propertyId", propertyId);
			} catch (Exception e) {
				logger.error("Error occured in AssetDetails ---", e);

			}
		}
		return "redirect:/AssetDetails?prtyid=" + propertyId + "&prptyName=" + propertyName;
	}

	@RequestMapping(value = { "/masterAdmin" }, method = RequestMethod.GET)
	public String masterAdmin(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		// int roleid=(int) session.getAttribute("roleid");

		if (userid == null) {
			return "redirect:/login";

		} else {

			try {
				List<ApartmentDetialsEntity> userList = maaService.getUserDetails();

				model.addAttribute("userList", userList);

			} catch (Exception e) {
				logger.error("Error occured in masterAdmin ---", e);
			}
		}
		return "Master-Adminscreen";
	}

	@RequestMapping(value = { "/updateUserStatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String updateUserStatus(HttpServletRequest request, Model model, HttpServletResponse response) {
		String msg = null;

		try {
			String statusid = request.getParameter("statusid");
			String userid = request.getParameter("userid");
			String buildingid = request.getParameter("buildingid");
			String buldingmail = request.getParameter("buldingmail");
			String buildName = request.getParameter("buildName");
			String uscno = request.getParameter("uscno");

			msg = maaService.updateUserStatus(statusid, userid, buildingid, buldingmail, buildName, uscno);

		} catch (Exception e) {
			logger.error("Error occured in updateUserStatus ---", e);

		}
		return msg;
	}

	@RequestMapping(value = { "/changePassword" }, method = RequestMethod.GET)
	public String changePwd(HttpServletRequest req, HttpServletResponse response, Model model) {
		HttpSession session = req.getSession(true);
		Integer userid = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		if (userid != null) {
			model.addAttribute("userid", userid);
			model.addAttribute("roleid", roleid);
			return "change-password";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = { "/ChangeLoginPassword" }, method = RequestMethod.POST)

	public void changeLoginPassword(Map<String, Object> map, Model model, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		HttpSession ses = req.getSession();

		Integer userid = (Integer) ses.getAttribute("userid");
		if (userid != null) {
			try {
				String currentPassword = req.getParameter("currentpassword");
				String newPassword = req.getParameter("newpassword");
				String confirmPassword = req.getParameter("confirmpassword");

				PrintWriter out = res.getWriter();
				String checkPassword = maaService.checkPassword(userid, currentPassword);

				if (checkPassword == null) {

					out.println("<script type=\"text/javascript\">");
					out.println("alert('Current password is not Correct');");
					out.println("window.location.href='changePassword'");
					out.println("</script>");
					out.close();
				} else {

					String msg = maaService.changePassword(userid, currentPassword, newPassword, confirmPassword);

					if (msg.equalsIgnoreCase("success")) {

						out.println("<script type=\"text/javascript\">");
						out.println("alert('password changed Successfully');");
						if (userid == 1) {
							out.println("window.location.href='masterAdmin'");
						} else {
							// out.println("location.href='PropertyFetch?prptyid=" + prtyid + "&prptyname="
							// + prtyName + "';");
							out.println("window.location.href='PropertyEntrance'");
						}

						out.println("</script>");
						out.close();

					}

					else {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('password not changed');");
						out.println("window.location.href='changePassword'");
						out.println("</script>");
						out.close();
					}
				}
			}

			catch (Exception e) {
				logger.error("Error in ChangePassword" + e);
			}

		}

	}

	@RequestMapping(value = { "/termsNConditions" }, method = RequestMethod.GET)
	public String termsNConditions(HttpServletRequest req, HttpServletResponse response, Model model) {
		String prptyid = req.getParameter("prptyid");
		String userid = req.getParameter("userid");
		String propertyName = req.getParameter("prptyName");

		try {
			TermsAndConditions tcObj = maaService.getTANDCByPrty(prptyid, userid);
			String tandC = null;
			if (tcObj != null) {

				tandC = tcObj.getTandC();
			}
			model.addAttribute("tandC", tandC);

			model.addAttribute("prptyid", prptyid);
			model.addAttribute("prptyName", propertyName);
			model.addAttribute("userid", userid);
		} catch (Exception e) {
			logger.error("Error in termsNConditions" + e);
		}
		return "tearms-conditons";
	}

	@RequestMapping(value = { "/saveTandC" }, method = RequestMethod.POST)
	public String saveTandC(HttpServletRequest req, HttpServletResponse response, Model model) {
		String prptyid = req.getParameter("prptyid");
		System.out.println("saveTandC----------" + prptyid);
		HttpSession session = req.getSession();
		String userid = req.getParameter("userid");
		String terms = req.getParameter("tandc");
		String propertyName = req.getParameter("prptyName");
		Integer user = (Integer) session.getAttribute("userid");
		int role = (int) session.getAttribute("roleid");
		if (user != null) {

			try {
				maaService.getTermsandConditions(prptyid, userid, terms);
				/*
				 * if(tandCObj!=null) { model.addAttribute("tandC",tandCObj.getTandC()); }else {
				 * model.addAttribute("tandC",""); } model.addAttribute("prtyid",prptyid);
				 * model.addAttribute("userid",userid);
				 */

			} catch (Exception e) {
				logger.error("Error in ChangePassword" + e);
			}
			return "redirect:/termsNConditions?prptyid=" + prptyid + "&prptyName=" + propertyName + "&userid=" + userid
					+ "&role=" + role;
		} else {
			return "redirect:/login";
		}
	}

}
