package com.tekskills.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.xmp.impl.Base64;
import com.tekskills.DTO.AptInvoiceDTO;
import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.DTO.ExpenseDTO;
import com.tekskills.DTO.OwnerDTo;
import com.tekskills.DTO.PaymentDTO;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.DTO.TenantDTo;
import com.tekskills.DTO.complaintHistoryDto;
import com.tekskills.Service.MaaService;
import com.tekskills.Service.MeterReadingServie;
import com.tekskills.Service.MiscellaneousService;
import com.tekskills.entity.AssociationEntity;
import com.tekskills.entity.ComplaintDetailsEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.MeterCostsEntity;
import com.tekskills.entity.NotificationEntity;
import com.tekskills.entity.VendorEntity;
import com.tekskills.entity.VisitorsDetailsEntity;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class MiscellaneousController {
	@Autowired
	private MaaService maaService;
	@Autowired
	private Environment env;
	@Autowired
	private MeterReadingServie readingService;
	@Autowired
	private MiscellaneousService misService;
	private static final Logger logger = Logger.getLogger(InvoiceController.class);
	private static final String UPLOAD_DIRECTORY = "temp_pdf";
	private static final int THRESHOLD_SIZE 	= 1024 * 1024 * 3; 	// 3MB
	private static final int MAX_FILE_SIZE 		= 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE 	= 1024 * 1024 * 50; // 50MB
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = { "/ExpenseDetails" }, method = RequestMethod.GET)
	public String ExpenseDetails(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");
		List<ExpenseDTO> expenseList = null;
		List<PropertyDto> propertyList = null;
		List<AssetDetailsDto> assetList = null;
		
		List<VendorEntity> vendorList = null;
		List<VendorEntity> activeVendorList = null;

		// int tenantid = 0;
		if (userId != null) {
			try {
				vendorList = readingService.getAllVendorsByprty(propertyId,roleid);
				activeVendorList=readingService.getAllActiveVendorsByprty(propertyId,roleid);
				assetList = maaService.getAssetListByprtyId(userId, propertyId, roleid);
				propertyList = maaService.getPropertListByUserid(userId, roleid);
				expenseList = misService.getAllExpensesByProperty(propertyId, roleid,userId);
				MeterCostsEntity meterCost = readingService.getMeterCostsByPrty(propertyId);
				List<AptInvoiceDTO> invoiceList = readingService.getInvoicesByproperty(userId, propertyId, roleid);
				model.addAttribute("propertyList", propertyList);
				model.addAttribute("prptyid", propertyId);
				model.addAttribute("prptyName", prptyName);
				model.addAttribute("assetList", assetList);
				// model.addAttribute("readingList", readingList);
				model.addAttribute("meterCost", meterCost);
				model.addAttribute("invoiceList", invoiceList);
				model.addAttribute("vendorList", vendorList);
				model.addAttribute("activeVendorList", activeVendorList);
				model.addAttribute("expenseList", expenseList);
				session.setAttribute("prptyid", propertyId);
			} catch (Exception e) {
				logger.error("Error occured in Invoice ---", e);

			}
			return "expence-details";
		} else {
			return "redirect:/login";
		}
		
		
	}
	
	

	@RequestMapping(value = { "/saveExpense" }, method = RequestMethod.POST)

	public String saveExpense(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);

		// int roleid=(int) session.getAttribute("roleid");
		Integer userId = (Integer) session.getAttribute("userid");

		String amountspent = request.getParameter("amountspent");
		String expensedate = request.getParameter("expensedate");
		String vendor = request.getParameter("vendor");
		String expensefor = request.getParameter("expensefor");
		String flatno = request.getParameter("flatno");
		String description = request.getParameter("description");
		String prtyid = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		String month = request.getParameter("month_tnt"); 

if(userId!=null) {
		try {
			misService.saveExpence(amountspent, expensedate, vendor, expensefor, flatno, description, prtyid, prptyName,
					userId,month);

		} catch (Exception e) {
			logger.error("Error occured in saveExpence ---", e);

		}
		return "redirect:/ExpenseDetails?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
}
else {
	return "redirect:/login";
}
	}

	@RequestMapping(value = { "/updateExpense" }, method = RequestMethod.POST)

	public String updateExpense(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);

		
		Integer userId = (Integer) session.getAttribute("userid");
		String expenseid = request.getParameter("expenseId_ed");
		String amountspent = request.getParameter("amountspent_ed");
		String expensedate = request.getParameter("expensedate_ed");
		String vendor = request.getParameter("vendor_ed");
		String expensefor = request.getParameter("expensefor_ed");
		String flatno = request.getParameter("flatno_ed");
		String description = request.getParameter("description_ed");
		String prtyid = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		String ed_month = request.getParameter("ed_month"); 
if(userId!=null) {
		try {
			misService.updateExpence(expenseid, amountspent, expensedate, vendor, expensefor, flatno, description,
					prtyid, prptyName, userId,ed_month);

		} catch (Exception e) {
			logger.error("Error occured in saveExpence ---", e);

		}
		return "redirect:/ExpenseDetails?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
	}
else {
	return "redirect:/login";
}
	}
	
	@RequestMapping(value = { "/AssociationDetails" }, method = RequestMethod.GET)
	public String AssociationDetails(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid = (Integer) session.getAttribute("roleid");
		String propertyId = request.getParameter("prtyid");
		String prptyName = request.getParameter("prptyName");
		List<PropertyDto> propertyList = null;
		
		List<AssociationEntity> assoiciationList = null;
		if (userId != null) {
			try {
				assoiciationList = misService.getAssociationList(propertyId, roleid,userId);
				propertyList = maaService.getPropertListByUserid(userId, roleid);
				
				
				model.addAttribute("propertyList", propertyList);
				model.addAttribute("assoiciationList", assoiciationList);
				model.addAttribute("prptyid", propertyId);
				model.addAttribute("prptyName", prptyName);
	
			} catch (Exception e) {
				logger.error("Error occured in association details ---", e);

			}
			return "association";
		} else {
			return "redirect:/login";
		}
		
		
	}
	
	@RequestMapping(value = { "/getownersByProperty" }, method = RequestMethod.POST)
	@ResponseBody
	public List<OwnerDTo> getownersByProperty(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		List<OwnerDTo> ownerList=null;
		try {
			Integer userId = (Integer) session.getAttribute("userid");
			Integer roleid = (Integer) session.getAttribute("roleid");
			String propertyId = request.getParameter("prtyid");
			ownerList=readingService.getOwnerDetailsByProperty(propertyId,userId,roleid);
			
		}catch (Exception e) {
			logger.error("Error occured in getownersByProperty  ---", e);

		}
		
		return ownerList;

	}
	@RequestMapping(value = { "/geTenantsByProperty" }, method = RequestMethod.POST)
	@ResponseBody
	public List<TenantDTo> geTenantsByProperty(HttpServletRequest request, Model model, HttpServletResponse response) {
		//HttpSession session = request.getSession(true);
		List<TenantDTo> tenantList=null;
		try {
			
			String propertyId = request.getParameter("prtyid");
			tenantList=readingService.geTenantsByProperty(propertyId);
			
		}catch (Exception e) {
			logger.error("Error occured in getownersByProperty  ---", e);

		}
		
		return tenantList;

	}
	@RequestMapping(value = { "/SaveAssoiciationUser" }, method = RequestMethod.POST)

	public String SaveAssoiciationUser(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);

		Integer userId = (Integer) session.getAttribute("userid");

		String chkBox = request.getParameter("chkBox");
		String usergroup = request.getParameter("usergroup");
		String memType = request.getParameter("memType");
		String strtDate = request.getParameter("strtDate");
		String endDate = request.getParameter("endDate");
		
		String prtyid = request.getParameter("prtyId");
		String flat = request.getParameter("flatno");
		System.out.println("flat---"+flat);
		String prptyName = request.getParameter("prtyName");
if(userId!=null) {
		try {
		
			misService.saveAssoication(chkBox,usergroup, memType, strtDate, endDate, userId,prtyid,flat);
				

		} catch (Exception e) {
			logger.error("Error occured in SaveAssoiciationUser ---", e);

		}
		return "redirect:/AssociationDetails?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
}
else {
	return "redirect:/login";
}
	}
	
	@RequestMapping(value = { "/updateAssoiciationUser" }, method = RequestMethod.POST)

	public String updateAssoiciationUser(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);

		// int roleid=(int) session.getAttribute("roleid");
		Integer userId = (Integer) session.getAttribute("userid");

		String chkBox = request.getParameter("Ed_chkBox");
		String associationid = request.getParameter("Ed_associationId");
		String usergroup = request.getParameter("Ed_usergroup");
		String memType = request.getParameter("Ed_memType");
		
		String strtDate = request.getParameter("Ed_strtDate");
		String endDate = request.getParameter("Ed_endDate");
		
		String prtyid = request.getParameter("Ed_prtyId");
		String prptyName = request.getParameter("Ed_prtyName");
		String flat = request.getParameter("Ed_flat");
if(userId!=null) {
		try {
		
			misService.UpdateAssoication(associationid,chkBox,usergroup, memType, strtDate, endDate, userId,prtyid,flat);
				

		} catch (Exception e) {
			logger.error("Error occured in SaveAssoiciationUser ---", e);

		}
		return "redirect:/AssociationDetails?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
}
else {
	return "redirect:/login";
}
	}
	@RequestMapping(value = { "/notification" }, method = RequestMethod.GET)
	public String notification(HttpServletRequest request, HttpServletResponse response,Model model) {
		HttpSession session = request.getSession(true);
		String prtyid=request.getParameter("prtyid"); 
		String prtyName=request.getParameter("prptyName"); 
		Integer userid=(Integer) session.getAttribute("userid");
		Integer roleid=(Integer) session.getAttribute("roleid");
		List<AssetDetailsDto> assetList=null;
		List<NotificationEntity> notificationList=null;
		List<PropertyDto> propertyList = null;
		if (userid != null) {
			try {
				 assetList=maaService.getAssetListByprtyId(userid,prtyid,roleid);
				 notificationList=misService.getNotificationListByprtyId(userid,prtyid,roleid);
				propertyList = maaService.getPropertListByUserid(userid, roleid);
				model.addAttribute("propertyList", propertyList);
				model.addAttribute("notificationList", notificationList);
				model.addAttribute("assetList", assetList);
				model.addAttribute("prptyid", prtyid);
				model.addAttribute("userid", userid);
				model.addAttribute("prptyName", prtyName);
				model.addAttribute("roleid", roleid);
			}
			catch (Exception e) {
				logger.error("Error occured in notification ---", e);
			}
			return "notification";
		  }
		else {
				return "redirect:/login";
	}
}
		

	@RequestMapping(value = { "/saveNotification" }, method = RequestMethod.POST)
	public String saveNotification(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);

		// int roleid=(int) session.getAttribute("roleid");
		Integer userId = (Integer) session.getAttribute("userid");

		String title = request.getParameter("title");
		String notfDate = request.getParameter("notfDate");
		String expensefor = request.getParameter("expensefor");
		String flatno = request.getParameter("flatno");
		String description = request.getParameter("description");
		String prtyid = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
if(userId!=null) {
		try {
			misService.saveNotification(title, notfDate, expensefor, flatno, description, prtyid, prptyName,userId);
		} catch (Exception e) {
			logger.error("Error occured in saveNotification ---", e);

		}
		return "redirect:/notification?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
}
else {
	return "redirect:/login";
}
	}
	
	@RequestMapping(value = { "/getNotificationById" }, method = RequestMethod.GET)
	@ResponseBody
	public NotificationEntity getNotificationById(HttpServletRequest request, Model model, HttpServletResponse response
			) {
		HttpSession session = request.getSession(true);
		
		String id = request.getParameter("id");
		NotificationEntity notfObj=misService.getNotificationById(id);
		
		return notfObj;
	}
	@RequestMapping(value = { "/sendPaymentReciept" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public String sendPaymentReciept(HttpServletRequest request, HttpServletResponse response
			,@RequestBody PaymentDTO payment) {
		
		
		String message=null;
		
		try {
		 message=misService.sendPaymentReciept(payment);
		
		}
		catch (Exception e) {
			logger.error("Error occured in sendPaymentReciept ---", e);

		}
		return message;
	}
	@RequestMapping(value = { "/downloadPaymentReciept" }, method = RequestMethod.GET)
	
	public void downloadPaymentReciept(HttpServletRequest request, HttpServletResponse response, Model model) {
			
		
		
		HttpSession session = request.getSession(true);

		 int roleid=(int) session.getAttribute("roleid");
		Integer userId = (Integer) session.getAttribute("userid");
		
		try {
			String payObj = request.getParameter("payObj");
			String decode=Base64.decode(payObj);
			PaymentDTO payment = new ObjectMapper().readValue(decode, PaymentDTO.class);
			if(payment!=null) {
			String htmlText= misService.downloadPaymentReciept(payment);
			byte[] bytes=htmlText.getBytes();
			String recieptNum1=payment.getReceiptNo();
			
			String filename = recieptNum1+".html";
			String directorypath = env.getProperty("maa-receipts");
			
			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();
				 logger.info("directory created  ");
				}

			
			String desFile=directorypath + File.separator +recieptNum1;
			
			 File dest = new File(directorypath + File.separator + filename);
			 FileOutputStream fileOuputStream = null;

		        try {
		            fileOuputStream = new FileOutputStream(dest);
		            fileOuputStream.write(bytes);
		            logger.info("File created with content ");
		        } catch (IOException e) {
		            e.printStackTrace();
		        } 
				try {
						Document document = new Document();
					    PdfWriter writer = null;
						try {
							writer = PdfWriter.getInstance(document,new FileOutputStream(desFile+".pdf"));
						} catch (FileNotFoundException | DocumentException e1) {
							e1.printStackTrace();
						}
					    document.open();
					    try {
							XMLWorkerHelper.getInstance().parseXHtml(writer, document,new FileInputStream(dest));
						} catch (IOException e) {
							e.printStackTrace();
						}
					    document.close();
					    writer.flush();
					    writer.close();
					   // output.close();

				} catch (Exception ex) {
					logger.error("Exception due to:", ex);
				}
			
	       
			
		    
			
			File file =new File(desFile+".pdf");
	        InputStream in = new FileInputStream(file);

	        response.setContentType("application/pdf");
	        response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
	        response.setHeader("Content-Length", String.valueOf(file.length()));
	        FileCopyUtils.copy(in, response.getOutputStream());
				}
		
		
		
		}
		catch (Exception e) {
			logger.error("Error occured in sendPaymentReciept ---", e);

		}
		
	}
	
	@RequestMapping(value = { "/sendInvoiceMail" }, method = RequestMethod.POST,consumes="application/json")
	@ResponseBody
	public String sendInvoiceMail(HttpServletRequest request, HttpServletResponse response
			,@RequestBody InvoiceEntity invoice,@RequestParam String prptyName) {
		
		
		String message=null;
		
		try {
			HttpSession session = request.getSession(true);
			
			Integer userId = (Integer) session.getAttribute("userid");
		 message=misService.sendInvoiceMail(invoice,prptyName,userId);
		
		}
		catch (Exception e) {
			logger.error("Error occured in sendInvoiceMail ---", e);

		}
		return message;
	}
	
	
	
	@RequestMapping(value = { "/downloadInvoicePDF" }, method = RequestMethod.GET)

	public void downloadInvoicePdf(HttpServletRequest request, HttpServletResponse response, Model model) {
			
		
		
		HttpSession session = request.getSession(true);

		 int roleid=(int) session.getAttribute("roleid");
		Integer userId = (Integer) session.getAttribute("userid");
		String desFile=null;
		try {
			String invoiceObj = request.getParameter("invoice");
			String prtyname = request.getParameter("prptyName");
			String decode=Base64.decode(invoiceObj);
			InvoiceEntity invoice = new ObjectMapper().readValue(decode, InvoiceEntity.class);
			if(invoice!=null) {
			String htmlText= misService.downloadInvoicePdf(invoice,userId,prtyname);
			if(htmlText!=null) {
			byte[] bytes=htmlText.getBytes();
	        String filetitle="INV"+invoice.getInvoiceid();
	        String filename = filetitle+".html";
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        factory.setSizeThreshold(THRESHOLD_SIZE);
	         factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        upload.setFileSizeMax(MAX_FILE_SIZE);upload.setSizeMax(MAX_REQUEST_SIZE);
	        // constructs the directory path to store upload file
	        String uploadPath = context.getRealPath("")+ UPLOAD_DIRECTORY;
	        
	        if (!new File(uploadPath).exists()) {
	               new File(uploadPath).mkdir();
	               logger.info("directory created  ");
	               }
	         desFile=uploadPath + File.separator +filetitle;
	        File dest = new File(uploadPath + File.separator + filename);
	        FileOutputStream fileOuputStream = null;
	          try {
	              fileOuputStream = new FileOutputStream(dest);
	              fileOuputStream.write(bytes);
	              logger.info("File created with content ");
	          } catch (IOException e) {
	              e.printStackTrace();
	          } 
	               try {
	                             Document document = new Document();
	                          PdfWriter writer = null;
	                             try {
	                                    writer = PdfWriter.getInstance(document,
	                                      new FileOutputStream(desFile+".pdf"));
	                                    
	                             } catch (FileNotFoundException | DocumentException e1) {
	                                    logger.error("Exception due to:"+ e1.toString());
	                                    e1.printStackTrace();
	                             }
	                          document.open();
	                          try {
	                                    XMLWorkerHelper.getInstance().parseXHtml(writer, document,
	                                      new FileInputStream(dest));
	                             } catch (IOException e) {
	                                    logger.error("Exception due to:"+ e.toString());
	                                    
	                                    e.printStackTrace();
	                             }
	                          document.close();
	               } catch (Exception ex) {
	                      logger.error("Exception due to:"+ ex.toString());
	                      ex.printStackTrace();
	               }
	       
	        // file =new File(desFile+".pdf");
	            
	               File file =new File(desFile+".pdf");
	   	        InputStream in = new FileInputStream(file);

	   	        response.setContentType("application/pdf");
	   	        response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
	   	        response.setHeader("Content-Length", String.valueOf(file.length()));
	   	        FileCopyUtils.copy(in, response.getOutputStream());
		}
		
				
				}
		
		}
		catch (Exception e) {
			logger.error("Error occured in sendPaymentReciept ---", e);

		}
		
	}
	
	
	
	
	
	@RequestMapping(value = { "/deleteNotification" }, method = RequestMethod.GET)
	@ResponseBody
	public String deleteNotification(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String id = request.getParameter("id");
		String message = null;
		try {
			message = misService.deleteNotification(id);
		} catch (Exception e) {
			logger.error("Error occured in deleteNotification ---", e);

		}

		return message;
		

	}
	
	@RequestMapping(value = { "/getAssetsByProperty" }, method = RequestMethod.GET)
	@ResponseBody
	public  List<String> getAssetsByProperty(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String prtyid = request.getParameter("prtyid");
		 List<String> assetList= null;
		try {
			assetList = misService.getAssetsByProperty(prtyid);
		} catch (Exception e) {
			logger.error("Error occured in deleteNotification ---", e);

		}

		return assetList;
		

	}
	
	@RequestMapping(value = { "/updateNotification" }, method = RequestMethod.POST)

	public String updateNotification(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		Integer userId = (Integer) session.getAttribute("userid");
		String notfyId = request.getParameter("notfyId");
		
		String edate = request.getParameter("edate");
		String etitle = request.getParameter("etitle");
		String notificfor = request.getParameter("notificfor");
		String flatno = request.getParameter("flatno");
		String description = request.getParameter("description");
		
		String prtyid = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
if(userId!=null) {
		try {
			misService.updateNotification(edate, etitle, notificfor, flatno, flatno, prtyid, prptyName,
					userId,description,notfyId);

		} catch (Exception e) {
			logger.error("Error occured in updateNotification ---", e);

		}
		return "redirect:/notification?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
	}
else {
	return "redirect:/login";
}
	}
	
	@RequestMapping(value = { "/sendNotificationMail" }, method = RequestMethod.GET)
	@ResponseBody
	public String sendNotificationMail(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		/*Integer userId = (Integer) session.getAttribute("userid");
		String title = request.getParameter("title");
		String notfDate = request.getParameter("notfDate");
		String notiftnfor = request.getParameter("notiftnfor");
		String flatno = request.getParameter("flatno");
		String description = request.getParameter("description");
		String prtyid = request.getParameter("prptyid");
		String prptyName = request.getParameter("prptyName");
		*/
		String message = null;
		try {
			//message = misService.sendNotificationMail();
		} catch (Exception e) {
			logger.error("Error occured in sendNotificationMail ---", e);
		}
		return message;
		

	}

	@RequestMapping(value = { "/visitors" }, method = RequestMethod.GET)
    public String visitors(HttpServletRequest request, HttpServletResponse response,Model model) {
           HttpSession session = request.getSession(true);
           String prtyid=request.getParameter("prtyid"); 
           String prtyName=request.getParameter("prptyName"); 
           Integer userid=(Integer) session.getAttribute("userid");
           Integer roleid=(Integer) session.getAttribute("roleid");
           List<PropertyDto> propertyList = null;
           List<AssetDetailsDto> assetList=null;
           List<VisitorsDetailsEntity> visitorList=null;
           if (userid != null) {
   			try {
   			  assetList=maaService.getAssetListByprtyId(userid,prtyid,roleid);
              visitorList=misService.getVisitorListByprtyId(userid,prtyid,roleid);
              propertyList = maaService.getPropertListByUserid(userid, roleid);
 			 model.addAttribute("propertyList", propertyList);
             model.addAttribute("visitorList", visitorList);
             model.addAttribute("assetList", assetList);
             model.addAttribute("prptyid", prtyid);
             model.addAttribute("userid", userid);
             model.addAttribute("prptyName", prtyName);
             model.addAttribute("roleid", roleid);
   			}
   			catch (Exception e) {
   				logger.error("Error occured in visitors ---", e);
   			}
   		  return "visitors";
   		  }
   		else {
   				return "redirect:/login";
   	}
    }
	
	@RequestMapping(value = { "/saveVisitorDetails" }, method = RequestMethod.POST)
	public String saveVisitorDetails (HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		String prtyid = request.getParameter("prptyid");
		String visitDate = null;
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String visitfor = request.getParameter("visitfor");
		String flatno = request.getParameter("flatno");
		String personTomeet = request.getParameter("personTomeet");
		String purpose = request.getParameter("purpose");
		String intime = request.getParameter("intime");
		String outtime = request.getParameter("outtime");
		String prptyName = request.getParameter("prptyName");
		          
     if(userId!=null) {
		try {
			misService.saveVisitorDetails(prtyid,userId, visitDate, name,mobile,address, visitfor,flatno, personTomeet,purpose,intime,outtime);
		} catch (Exception e) {
			logger.error("Error occured in saveNotification ---", e);

		}
		return "redirect:/visitors?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
     }
else {
	return "redirect:/login";
      }
   }
	
	@RequestMapping(value = { "/getVisitorById" }, method = RequestMethod.GET)
	@ResponseBody
	public VisitorsDetailsEntity getVisitorById(HttpServletRequest request, Model model, HttpServletResponse response) {
		VisitorsDetailsEntity visitObj=null;
		try {
			String id = request.getParameter("id");
			visitObj=misService.getVisitorById(id);
		} catch (Exception e) {
			logger.error("Error occured in getVisitorById ---", e);
		}
		return visitObj;
	}
	
	@RequestMapping(value = { "/deleteVisitor" }, method = RequestMethod.GET)
	@ResponseBody
	public String deleteVisitor(HttpServletRequest request, Model model, HttpServletResponse response) {
		String id = request.getParameter("id");
		String message = null;
		try {
			message = misService.deleteVisitor(id);
		} catch (Exception e) {
			logger.error("Error occured in deleteVisitor ---", e);
		}
		return message;
	}
	
	@RequestMapping(value = { "/updateVisitor" }, method = RequestMethod.POST)
	public String updateVisitor(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		
		Integer userId = (Integer) session.getAttribute("userid");
		String visitId = request.getParameter("visitId");
		String prtyid = request.getParameter("prptyid");
		String visitDate = null;
		String name = request.getParameter("ename");
		String mobile = request.getParameter("emobile");
		String address = request.getParameter("eaddress");
		String visitfor = request.getParameter("evisitfor");
		String flatno = request.getParameter("eflatno");
		String personTomeet = request.getParameter("epersonTomeet");
		String purpose = request.getParameter("epurpose");
		String intime = request.getParameter("eintime");
		String outtime = request.getParameter("eouttime");
		String prptyName = request.getParameter("prptyName");
		
		
		
if(userId!=null) {
		try {
			misService.updateVisitor(prtyid,userId, visitDate, name,mobile,address, visitfor,flatno, personTomeet,purpose,intime,outtime,visitId);

		} catch (Exception e) {
			logger.error("Error occured in updateVisitor ---", e);

		}
		return "redirect:/visitors?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
	}
else {
	return "redirect:/login";
   }
}
	
	@RequestMapping(value = { "/complaints" }, method = RequestMethod.GET)
    public String complaints(HttpServletRequest request, HttpServletResponse response,Model model) {
           HttpSession session = request.getSession(true);
           String prtyid=request.getParameter("prtyid"); 
           String prtyName=request.getParameter("prptyName"); 
           Integer userid=(Integer) session.getAttribute("userid");
           Integer roleid=(Integer) session.getAttribute("roleid");
           List<PropertyDto> propertyList = null;
           List<AssetDetailsDto> assetList=null;
           List<ComplaintDetailsEntity> complaintList=null;
     if (userid != null) {
   	     try {
 			assetList=maaService.getAssetListByprtyId(userid,prtyid,roleid);
            complaintList=misService.getComplaintListByprtyId(userid,prtyid,roleid);
            System.out.println("complaintList--------=====--------------"+complaintList.size());
            propertyList = maaService.getPropertListByUserid(userid, roleid);
            model.addAttribute("propertyList", propertyList);
            model.addAttribute("complaintList", complaintList);
            model.addAttribute("assetList", assetList);
            model.addAttribute("prptyid", prtyid);
            model.addAttribute("userid", userid);
            model.addAttribute("prptyName", prtyName);
            model.addAttribute("roleid", roleid);
   			}
   			catch (Exception e) {
   				logger.error("Error occured in complaints ---", e);
   			}
   		      return "complaints";
   		  }
   		else {
   			return "redirect:/login";
   	}
}

	@RequestMapping(value = { "/addcomplaints" }, method = RequestMethod.GET)
    public String addcomplaints(HttpServletRequest request, HttpServletResponse response,Model model) {
           HttpSession session = request.getSession(true);
           String prtyid=request.getParameter("prtyid"); 
           String prtyName=request.getParameter("prptyName"); 
           Integer userid=(Integer) session.getAttribute("userid");
           Integer roleid=(Integer) session.getAttribute("roleid");
           List<PropertyDto> propertyList = null;
           List<AssetDetailsDto> assetList=null;
     if (userid != null) {
            try {
                    assetList=maaService.getAssetListByprtyId(userid,prtyid,roleid);
            propertyList = maaService.getPropertListByUserid(userid, roleid);
            model.addAttribute("propertyList", propertyList);
            model.addAttribute("assetList", assetList);
            model.addAttribute("prptyid", prtyid);
            model.addAttribute("userid", userid);
            model.addAttribute("prptyName", prtyName);
            model.addAttribute("roleid", roleid);
                     }
                     catch (Exception e) {
                           logger.error("Error occured in addcomplaints ---", e);
                     }
                    return "addcomplaints";
                }
              else {
                     return "redirect:/login";
       }
}      

    @RequestMapping(value = { "/EditComplaints" }, method = RequestMethod.GET)
    public String EditComplaints(HttpServletRequest request, HttpServletResponse response,Model model) {
           HttpSession session = request.getSession(true);
           String prtyid=request.getParameter("prtyid"); 
           String prtyName=request.getParameter("prptyName"); 
           Integer roleid=(Integer) session.getAttribute("roleid");
           Integer userid=(Integer) session.getAttribute("userid");
           List<PropertyDto> propertyList = null;
           List<AssetDetailsDto> assetList=null;
     if (userid != null) {
        complaintHistoryDto compObj=new complaintHistoryDto();
              try {
                     String id = request.getParameter("id");
                     
                     ComplaintDetailsEntity compObj1=misService.getComplaintById(id);
                     String name=misService.getNameByUserIdRoleId(compObj1.getUserid(),compObj1.getRoleid());
                     List<complaintHistoryDto> historyObj=misService.getAllCommentsByComplaintId(id,compObj1.getUserid(),compObj1.getRoleid());
                     compObj.setName(name);
                     compObj.setComplaints(compObj1);
                     compObj.setComphlist(historyObj);
                     
                     assetList=maaService.getAssetListByprtyId(userid,prtyid,roleid);
                propertyList = maaService.getPropertListByUserid(userid, roleid);
                model.addAttribute("propertyList", propertyList);
                model.addAttribute("assetList", assetList);
                
                     model.addAttribute("compObj", compObj);
                     model.addAttribute("prptyid", prtyid);
                model.addAttribute("userid", userid);
                model.addAttribute("prptyName", prtyName);
                model.addAttribute("roleid", roleid);
              } catch (Exception e) {
                     logger.error("Error occured in getComplaintById ---", e);
              }
                    return "editcomplaint";
                }
              else {
                     return "redirect:/login";
       }
}    

@RequestMapping(value = { "/saveComplaintDetails" }, method = RequestMethod.POST)
	public String saveComplaintDetails (HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid=(Integer) session.getAttribute("roleid");
		String prtyid = request.getParameter("prptyid");
		String flatno = request.getParameter("flatno");
		String ctitle = request.getParameter("ctitle");
		String description = request.getParameter("description");
		String prptyName = request.getParameter("prptyName");
     if(userId!=null) {
		try {
			misService.saveComplaintDetails(prtyid,userId,flatno,ctitle,description,roleid,prptyName);
		} catch (Exception e) {
			logger.error("Error occured in saveComplaintDetails ---", e);
		}
		return "redirect:/complaints?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
     }
else {
	return "redirect:/login";
      }
   }

@RequestMapping(value = { "/getComplaintById" }, method = RequestMethod.GET)
@ResponseBody
public complaintHistoryDto getComplaintById(HttpServletRequest request, Model model, HttpServletResponse response) {
	complaintHistoryDto compObj=new complaintHistoryDto();
	try {
		String id = request.getParameter("id");
		ComplaintDetailsEntity compObj1=misService.getComplaintById(id);
		String name=misService.getNameByUserIdRoleId(compObj1.getUserid(),compObj1.getRoleid());
		List<complaintHistoryDto> historyObj=misService.getAllCommentsByComplaintId(id,compObj1.getUserid(),compObj1.getRoleid());
		compObj.setName(name);
		compObj.setComplaints(compObj1);
		compObj.setComphlist(historyObj);
		
	} catch (Exception e) {
		logger.error("Error occured in getComplaintById ---", e);
	}
	return compObj;
}

@RequestMapping(value = { "/updateComplaintDetails" }, method = RequestMethod.POST)
public String updateComplaintDetails(HttpServletRequest request, Model model, HttpServletResponse response) {
	HttpSession session = request.getSession(true);
	Integer userId = (Integer) session.getAttribute("userid");
	String prtyid = request.getParameter("prptyid");
	String prptyName = request.getParameter("prptyName");
	String roleid = request.getParameter("roleid");
	String compId = request.getParameter("compId");
	String flatno = request.getParameter("eflatno");
//	String etitle = request.getParameter("etitle");
	String edescription = request.getParameter("edescription");
	String estatus = request.getParameter("estatus");
	
if(userId!=null) {
	try {
		misService.updateComplaintDetails(prtyid,userId,flatno,edescription,estatus,compId,roleid,prptyName);
	} catch (Exception e) {
		logger.error("Error occured in updateComplaintDetails ---", e);
	}
	return "redirect:/complaints?prtyid=" + prtyid + "&prptyName=" + prptyName + "";
   }
else {
   return "redirect:/login";
  }
}

@RequestMapping(value = { "/addComment" }, method = RequestMethod.GET)
@ResponseBody
public complaintHistoryDto addComment(HttpServletRequest request, Model model, HttpServletResponse response) {
	complaintHistoryDto compObj=new complaintHistoryDto();
	try {
		HttpSession session = request.getSession(true);
		Integer userId = (Integer) session.getAttribute("userid");
		Integer roleid=(Integer) session.getAttribute("roleid");
		String compId=request.getParameter("compId");
		String comments=request.getParameter("comments");
		misService.saveCommentsOfComplaint(userId,compId,comments,roleid);
		ComplaintDetailsEntity compObj1=misService.getComplaintById(compId);
		List<complaintHistoryDto> historyObj=misService.getAllCommentsByComplaintId(compId,compObj1.getUserid(),compObj1.getRoleid());
		compObj.setComphlist(historyObj);
	} catch (Exception e) {
		logger.error("Error occured in addComment ---", e);
	}
	return compObj;
  }

@RequestMapping(value = { "/deleteComplaint" }, method = RequestMethod.GET)
@ResponseBody
public String deleteComplaint(HttpServletRequest request, Model model, HttpServletResponse response) {
	String id = request.getParameter("id");
	String message = null;
	try {
		message = misService.deleteComplaint(id);
	} catch (Exception e) {
		logger.error("Error occured in deleteComplaint ---", e);
	}
	return message;
}

@RequestMapping(value = { "/propertyclassifides" }, method = RequestMethod.GET)
public String classifides(HttpServletRequest request, HttpServletResponse response,Model model) {
       HttpSession session = request.getSession(true);
      
		Integer userId = (Integer) session.getAttribute("userid");
		List<PropertyDto> propertyList = null;
		if(userId!=null) {
			try {
		
       String prtyid=request.getParameter("prtyid"); 
       
       String prtyName=request.getParameter("prptyName"); 
       Integer userid=(Integer) session.getAttribute("userid");
       Integer roleid=(Integer) session.getAttribute("roleid");
       ClassifedDTO classified=misService.getClassifiedsByProperty(prtyid);
       propertyList = maaService.getPropertListByUserid(userId, roleid);
       model.addAttribute("propertyList", propertyList);
       model.addAttribute("classified", classified);
       model.addAttribute("prptyid", prtyid);
       model.addAttribute("userid", userid);
       model.addAttribute("prptyName", prtyName);
       model.addAttribute("roleid", roleid);
      
			}
			catch (Exception e) {
				logger.error("Error occured in propertyclassifides ---", e);

			}
			return "classifides";
		} 
		 
		else {
			return "redirect:/login";
		}
}

@RequestMapping(value = { "/classifidesAdd" }, method = RequestMethod.GET)
public String classifidesAdd(HttpServletRequest request, HttpServletResponse response,Model model) {
       HttpSession session = request.getSession(true);
       String prtyid=request.getParameter("prtyid"); 
       String prtyName=request.getParameter("prptyName"); 
       Integer userid=(Integer) session.getAttribute("userid");
       Integer roleid=(Integer) session.getAttribute("roleid");
       
   
       model.addAttribute("prptyid", prtyid);
       model.addAttribute("userid", userid);
       model.addAttribute("prptyName", prtyName);
       model.addAttribute("roleid", roleid);
       return "classifidesAdd";
}
@RequestMapping(value = { "/addNotificationPage" }, method = RequestMethod.GET)
public String addNotificationPage(HttpServletRequest request, HttpServletResponse response,Model model) {
       HttpSession session = request.getSession(true);
       String prtyid=request.getParameter("prtyid"); 
       String prtyName=request.getParameter("prptyName"); 
       Integer userid=(Integer) session.getAttribute("userid");
       Integer roleid=(Integer) session.getAttribute("roleid");
       List<AssetDetailsDto> assetList=null;
              List<NotificationEntity> notificationList=null;
              List<PropertyDto> propertyList = null;
              if (userid != null) {
                     try {
                           assetList=maaService.getAssetListByprtyId(userid,prtyid,roleid);
                           notificationList=misService.getNotificationListByprtyId(userid,prtyid,roleid);
                           propertyList = maaService.getPropertListByUserid(userid, roleid);
                           model.addAttribute("propertyList", propertyList);
                           model.addAttribute("notificationList", notificationList);
                           model.addAttribute("assetList", assetList);
                           model.addAttribute("prptyid", prtyid);
                           model.addAttribute("userid", userid);
                           model.addAttribute("prptyName", prtyName);
                           model.addAttribute("roleid", roleid);
                     }
                     catch (Exception e) {
                           logger.error("Error occured in addNotificationPage ---", e);
                     }
                     return "AddNotification";
                }
              else {
                           return "redirect:/login";
       }
       
}


@RequestMapping(value = { "/editNotificationPage" }, method = RequestMethod.GET)
public String editNotificationPage(HttpServletRequest request, HttpServletResponse response,Model model
              ) {
       HttpSession session = request.getSession(true);
       String prtyid=request.getParameter("prtyid"); 
       String prtyName=request.getParameter("prptyName"); 
       Integer userid=(Integer) session.getAttribute("userid");
       Integer roleid=(Integer) session.getAttribute("roleid");
       String id=request.getParameter("notfId"); 
       
              
       List<AssetDetailsDto> assetList=null;
              List<NotificationEntity> notificationList=null;
              List<PropertyDto> propertyList = null;
              if (userid != null) {
                     try {
                           NotificationEntity notfObj=misService.getNotificationById(id);
                           
                           
                           assetList=maaService.getAssetListByprtyId(userid,prtyid,roleid);
                           notificationList=misService.getNotificationListByprtyId(userid,prtyid,roleid);
                           propertyList = maaService.getPropertListByUserid(userid, roleid);
                           
                           model.addAttribute("title", notfObj.getTitle());
                           model.addAttribute("desc", notfObj.getDescription());
                           model.addAttribute("notficationdate", notfObj.getNotificationdate());
                           model.addAttribute("flatno", notfObj.getFlatno());
                           model.addAttribute("flag", notfObj.getFlag());
                           model.addAttribute("id", notfObj.getId());
                           
                           model.addAttribute("propertyList", propertyList);
                           model.addAttribute("notificationList", notificationList);
                           model.addAttribute("assetList", assetList);
                           model.addAttribute("prptyid", prtyid);
                           model.addAttribute("userid", userid);
                           model.addAttribute("prptyName", prtyName);
                           model.addAttribute("roleid", roleid);
                     }
                     catch (Exception e) {
                           logger.error("Error occured in EditNotification ---", e);
                     }
                     return "EditNotification";
                }
              else {
                           return "redirect:/login";
       }
}


}
