package com.tekskills.ServiceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.tekskills.DAO.MaaDao;
import com.tekskills.DAO.MeterReadingDao;
import com.tekskills.DAO.MiscellaneousDao;
import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.DTO.ClassifiedDTO;
import com.tekskills.DTO.ClassifiedInfoDTO;
import com.tekskills.DTO.ClassifiedInformationView;
import com.tekskills.DTO.ExpenseDTO;
import com.tekskills.DTO.PaymentDTO;
import com.tekskills.DTO.VacanciesDto;
import com.tekskills.DTO.complaintHistoryDto;
import com.tekskills.Service.MiscellaneousService;
import com.tekskills.entity.AptUserRoles;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.AssociationEntity;
import com.tekskills.entity.BlogEntity;
import com.tekskills.entity.ClassifiedFeatures;
import com.tekskills.entity.ClassifiedHouseHunting;
import com.tekskills.entity.ClassifiedImages;
import com.tekskills.entity.ClassifiedInformation;
import com.tekskills.entity.ComplaintDetailsEntity;
import com.tekskills.entity.ComplaintHistoryEntity;
import com.tekskills.entity.ExpensesEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.NotificationEntity;
import com.tekskills.entity.TermsAndConditions;
import com.tekskills.entity.VisitorsDetailsEntity;
import com.tekskills.util.QRCode;
import com.tekskills.util.SendHtmlEmailNew;

@Service
@PropertySource("/WEB-INF/Mail.properties")
@EnableAsync
public class MiscellaneousServiceImpl implements MiscellaneousService {
	@Autowired
	private SendHtmlEmailNew newEmail;
	@Autowired
	private MiscellaneousDao misDao;
	@Autowired
	private MaaDao maaDao;
	@Autowired
	private Environment env;
	@Autowired
	private MeterReadingDao readingDao;
	private static final Logger logger = Logger.getLogger(MiscellaneousServiceImpl.class);

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ExpenseDTO> getAllExpensesByProperty(String propertyId, int roleid, int userid) {
		List<ExpenseDTO> expenseList = null;
		int propertyIdInt = 0;
		int ownerid = 0, tntid = 0;
		try {
			if (!propertyId.isEmpty()) {
				propertyIdInt = Integer.parseInt(propertyId);
			}
			if (roleid == 3) {
				ownerid = maaDao.getOwnerid(userid, roleid, tntid, propertyIdInt);
			}
			if (roleid == 4) {
				tntid = maaDao.getTntid(userid, roleid);
				ownerid = maaDao.getOwnerid(userid, roleid, tntid, propertyIdInt);
			}
			expenseList = misDao.getAllExpensesByProperty(propertyIdInt, roleid, ownerid, tntid, userid);

		} catch (Exception e) {
			logger.error("Error in getAllExpensesByProperty Serrvie iMpl", e);
		}
		return expenseList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveExpence(String amountspent, String expensedate, String vendor, String expensefor, String flatno,
			String description, String prtyid, String prptyName, int userid, String month) {
		int prtyIdInt = 0, vendorid = 0;
		float expenseAmt = 0.0f;
		int flag = 0;
		try {

			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);

			}
			String vendorName = null;
			String purpose = null;
			if (!vendor.isEmpty()) {
				String[] ven = vendor.split("/");
				String vendorVal = ven[0];

				vendorid = Integer.parseInt(vendorVal);
				vendorName = ven[1];
				purpose = ven[2];
			}
			if (!expensefor.isEmpty()) {
				flag = Integer.parseInt(expensefor);

			}

			if (!amountspent.isEmpty()) {
				expenseAmt = Float.parseFloat(amountspent);
			}
			Date expensedate1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!expensedate.isEmpty()) {
				expensedate1 = sdf.parse(expensedate);
			}
			ExpensesEntity expense = new ExpensesEntity();
			expense.setDescription(description);
			expense.setExpenseamount(expenseAmt);
			expense.setExpensedate(expensedate1);
			expense.setFlag(flag);
			expense.setFlatno(flatno);
			expense.setPrtyid(prtyIdInt);
			expense.setVendorid(vendorid);
			expense.setUserid(userid);
			expense.setVendorname(vendorName);
			expense.setPurpose(purpose);
			expense.setEmonth(month);
			misDao.saveExpense(expense);

		} catch (Exception e) {
			logger.error("Error in saveExpence Serrvie iMpl", e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateExpence(String expenseid, String amountspent, String expensedate, String vendor,
			String expensefor, String flatno, String description, String prtyid, String prptyName,
			int userid, String month) {
		int prtyIdInt = 0, vendorid = 0, expenseval = 0;
		float expenseAmt = 0.0f;
		int flag = 0;
		try {

			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);

			}
			if (!expenseid.isEmpty()) {
				expenseval = Integer.parseInt(expenseid);

			}
			String vendorName = null;
			String purpose = null;
			if (!vendor.isEmpty()) {
				String[] ven = vendor.split("/");
				String vendorVal = ven[0];

				vendorid = Integer.parseInt(vendorVal);
				vendorName = ven[1];
				purpose = ven[2];
			}
			if (!expensefor.isEmpty()) {
				flag = Integer.parseInt(expensefor);

			}

			if (!amountspent.isEmpty()) {
				expenseAmt = Float.parseFloat(amountspent);
			}
			Date expensedate1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!expensedate.isEmpty()) {
				expensedate1 = sdf.parse(expensedate);
			}

			ExpensesEntity expense = misDao.getExpenseById(expenseval, prtyIdInt);
			if (expense != null) {
				expense.setDescription(description);
				expense.setExpenseamount(expenseAmt);
				expense.setExpensedate(expensedate1);
				expense.setFlag(flag);
				expense.setFlatno(flatno);
				expense.setPrtyid(prtyIdInt);
				expense.setVendorid(vendorid);
				expense.setUserid(userid);
				expense.setVendorname(vendorName);
				expense.setPurpose(purpose);
				expense.setEmonth(month);
				misDao.updateExpense(expense);
			}
		} catch (Exception e) {
			logger.error("Error in saveExpence Serrvie iMpl", e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveAssoication(String chkBox, String usergroup, String memType, String strtDate, String endDate,
			Integer userId, String prtyid, String flat) {
		int owneridInt = 0, tenantidInt = 0, prtyIdInt = 0;
		try {
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);

			}

			Date strtDate1 = null;
			Date endDate1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!strtDate.isEmpty()) {
				strtDate1 = sdf.parse(strtDate);

			}
			if (!endDate.isEmpty()) {
				endDate1 = sdf.parse(endDate);

			}
			String[] usrGrpArr = usergroup.split("_");
			if (chkBox.equalsIgnoreCase("O")) {
				String ownerid = usrGrpArr[0];
				if (!ownerid.isEmpty()) {
					owneridInt = Integer.parseInt(ownerid);

				}
			} else if (chkBox.equalsIgnoreCase("T")) {
				String tenantid = usrGrpArr[0];
				if (!tenantid.isEmpty()) {
					tenantidInt = Integer.parseInt(tenantid);

				}
			}
			AssociationEntity association = new AssociationEntity();
			association.setOwnerid(owneridInt);
			association.setTenantid(tenantidInt);
			association.setMemType(memType);
			association.setPrtyid(prtyIdInt);
			association.setStatus(1);
			association.setStartdate(strtDate1);
			association.setEnddate(endDate1);
			association.setContact(usrGrpArr[3]);
			association.setEmail(usrGrpArr[1]);
			association.setName(usrGrpArr[2]);
			association.setPic(usrGrpArr[5]);
			association.setFlat(flat);
			misDao.saveAssociation(association);
		} catch (Exception e) {
			logger.error("Error in saveExpence Serrvie iMpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AssociationEntity> getAssociationList(String propertyId, Integer roleid, Integer userId) {
		int prtyIdInt = 0;
		List<AssociationEntity> assoicationList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyIdInt = Integer.parseInt(propertyId);

			}
			assoicationList = misDao.getAssociationList(prtyIdInt);

		} catch (Exception e) {
			logger.error("Error in getAssociationList Serrvie iMpl", e);
		}

		return assoicationList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void UpdateAssoication(String associationid, String chkBox, String usergroup, String memType,
			String strtDate, String endDate, Integer userId, String prtyid, String flat) {
		int owneridInt = 0, tenantidInt = 0, prtyIdInt = 0, associationidInt = 0;
		try {
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);

			}
			if (!associationid.isEmpty()) {
				associationidInt = Integer.parseInt(associationid);

			}

			Date strtDate1 = null;
			Date endDate1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!strtDate.isEmpty()) {
				strtDate1 = sdf.parse(strtDate);

			}
			if (!endDate.isEmpty()) {
				endDate1 = sdf.parse(endDate);

			}
			String[] usrGrpArr = usergroup.split("_");

			if (usrGrpArr.length <= 6) {
				AssociationEntity association = misDao.getAssociationByID(associationidInt);
				if (chkBox.equalsIgnoreCase("O")) {
					String ownerid = usrGrpArr[0];
					if (!ownerid.isEmpty()) {
						owneridInt = Integer.parseInt(ownerid);
					}

				} else if (chkBox.equalsIgnoreCase("T")) {
					String tenantid = usrGrpArr[0];
					if (!tenantid.isEmpty()) {
						tenantidInt = Integer.parseInt(tenantid);
					}

				}
				if (association != null) {

					association.setMemType(memType);
					association.setPrtyid(prtyIdInt);
					association.setStatus(1);
					association.setStartdate(strtDate1);
					association.setEnddate(endDate1);
					association.setOwnerid(owneridInt);
					association.setTenantid(tenantidInt);
					association.setContact(usrGrpArr[3]);
					association.setEmail(usrGrpArr[1]);
					association.setName(usrGrpArr[2]);
					association.setPic(usrGrpArr[5]);
					association.setFlat(usrGrpArr[4]);
					misDao.updateAssociation(association);
				}
			}
		} catch (Exception e) {
			logger.error("Error in UpdateAssoication Serrvie iMpl", e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveNotification(String title, String notfDate, String expensefor, String flatno, String description,
			String prtyid, String prptyName, Integer userId) {
		int prtyIdInt = 0, vendorid = 0;
		float expenseAmt = 0.0f;
		int flag = 0;
		try {
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}
			if (!expensefor.isEmpty()) {
				flag = Integer.parseInt(expensefor);
			}

			Date expensedate1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!notfDate.isEmpty()) {
				expensedate1 = sdf.parse(notfDate);
			}
			NotificationEntity notifObj = new NotificationEntity();
			notifObj.setTitle(title);
			notifObj.setDescription(description);
			notifObj.setNotificationdate(expensedate1);
			notifObj.setFlag(flag);
			notifObj.setFlatno(flatno);
			notifObj.setPrtyid(prtyIdInt);
			notifObj.setUserid(userId);
			misDao.saveNotification(notifObj);

			String subject = "New Notification Raised";
			String htmlfile = env.getProperty("notificatonmail");

			String tenentmail = null;
			String ownermail = null;
			String tenant = null;
			String owner = null;
			String tenantname = null;
			String ownername = null;
			String tomail = null;
			String buildingMail = readingDao.getBuildingMail(prtyIdInt);
			if (flag == 0) {
				AssetDetails assetObj = maaDao.getAssetByFlat(prtyIdInt, userId, flatno);
				
				if (assetObj.getOwnerid() != 0) {
					owner = readingDao.getOwnerEmail(assetObj.getOwnerid());
					String[] ownerArr = owner.split("_");
					ownermail = ownerArr[0];
					ownername = ownerArr[2];
					tomail = ownermail;
				}
				if (assetObj.getTenantId() != 0) {
					tenant = readingDao.getTenantEmail(assetObj.getTenantId());
					String[] tntArr = tenant.split("_");
					tenentmail = tntArr[0];
					tenantname = tntArr[2];
					tomail = tenentmail;
				}

				newEmail.sendNotificationMail(title, description, prptyName, tenantname, ownername, tenentmail,
						ownermail, htmlfile, subject, buildingMail);
			} else {
				List<String> allEmails = readingDao.getAllMailsByprty(prtyIdInt);
				for (String mail : allEmails) {
					ownername = "Mr";
					tenantname = "Mrs";
					newEmail.sendNotificationMail(title, description, prptyName, tenantname, ownername, null, mail,
							htmlfile, subject, buildingMail);
				}

			}

		} catch (Exception e) {
			logger.error("Error in saveNotification Serrvie iMpl", e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public NotificationEntity getNotificationById(String id) {
		int notfId = 0;
		NotificationEntity notfiObj = null;
		try {
			if (!id.isEmpty()) {
				notfId = Integer.parseInt(id);
			}
			notfiObj = misDao.getNotificationById(notfId);

		} catch (Exception e) {
			logger.error("Error in getNotificationById Serrvie iMpl", e);
		}

		return notfiObj;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteNotification(String id) {
		String message = null;
		int Id = 0;
		try {
			if (!id.isEmpty()) {
				Id = Integer.parseInt(id);
			}
			message = misDao.deleteNotification(Id);
		} catch (Exception e) {
			logger.error("Error while  deleteNotification", e);

		}
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateNotification(String edate, String etitle, String notificfor, String flatno, String flatno2,
			String prtyid, String prptyName, Integer userId, String description, String notfyId) {
		int prtyIdInt = 0;
		int nId = 0;
		int flag = 0;
		if (flatno.isEmpty()) {
			flag = 1;
		}
		try {
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}

			if (!notfyId.isEmpty()) {
				nId = Integer.parseInt(notfyId);
			}

			Date notficatdate1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!edate.isEmpty()) {
				notficatdate1 = sdf.parse(edate);
			}

			NotificationEntity notifObj = misDao.getNotificationById(nId);

			if (notifObj != null) {
				notifObj.setTitle(etitle);
				notifObj.setDescription(description);
				notifObj.setNotificationdate(notficatdate1);

				notifObj.setFlag(flag);
				notifObj.setFlatno(flatno);
				notifObj.setPrtyid(prtyIdInt);
				notifObj.setUserid(userId);
				misDao.updateNotification(notifObj);
			}
		} catch (Exception e) {
			logger.error("Error in updateNotification Serrvie iMpl", e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveVisitorDetails(String prtyid, Integer userId, String visitDate, String name, String mobile,
			String address, String visitfor, String flatno, String personTomeet, String purpose, String intime,
			String outtime) {
		int prtyIdInt = 0;
		int flag = 0;
		try {
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}
			if (!visitfor.isEmpty()) {
				flag = Integer.parseInt(visitfor);
			}

			Date visitDate1 = null;
			/*
			 * SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			 * if(!visitDate.isEmpty()) { visitDate1 =sdf.parse(visitDate); }
			 */
			VisitorsDetailsEntity visitObj = new VisitorsDetailsEntity();

			visitObj.setVisitdate(visitDate1);
			visitObj.setVname(name);
			visitObj.setPrtyid(prtyIdInt);
			visitObj.setUserid(userId);
			visitObj.setMobile(mobile);
			visitObj.setAddress(address);
			visitObj.setFlag(flag);
			visitObj.setFlatno(flatno);
			visitObj.setPersontomeet(personTomeet);
			visitObj.setPurpose(purpose);
			visitObj.setIntime(intime);
			visitObj.setOuttime(outtime);

			misDao.saveVisitorDetails(visitObj);

		} catch (Exception e) {
			logger.error("Error in saveVisitorDetails Serrvie iMpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public VisitorsDetailsEntity getVisitorById(String id) {
		int visitId = 0;
		VisitorsDetailsEntity visitObj = null;
		try {
			if (!id.isEmpty()) {
				visitId = Integer.parseInt(id);
			}
			visitObj = misDao.getVisitorById(visitId);

		} catch (Exception e) {
			logger.error("Error in getVisitorById Serrvie iMpl", e);
		}
		return visitObj;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteVisitor(String id) {
		String message = null;
		int Id = 0;
		try {
			if (!id.isEmpty()) {
				Id = Integer.parseInt(id);
			}
			message = misDao.deleteVisitor(Id);
		} catch (Exception e) {
			logger.error("Error while  deleteVisitor Serrvie iMpl", e);
		}
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateVisitor(String prtyid, Integer userId, String visitDate, String name, String mobile,
			String address, String visitfor, String flatno, String personTomeet, String purpose, String intime,
			String outtime, String visitId) {
		int prtyIdInt = 0;
		int vId = 0;
		int flag = 0;
		try {
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}

			if (!visitId.isEmpty()) {
				vId = Integer.parseInt(visitId);
			}

			Date visitDate1 = null;

			if (!visitfor.isEmpty()) {
				flag = Integer.parseInt(visitfor);
			}
			VisitorsDetailsEntity visitObj = misDao.getVisitorById(vId);

			if (visitObj != null) {
				visitObj.setVisitdate(visitDate1);
				visitObj.setVname(name);
				visitObj.setPrtyid(prtyIdInt);
				visitObj.setUserid(userId);
				visitObj.setMobile(mobile);
				visitObj.setAddress(address);
				visitObj.setFlag(flag);
				if (visitfor.equalsIgnoreCase("1")) {
					visitObj.setPersontomeet(personTomeet);
					visitObj.setFlatno(null);
				} else {
					visitObj.setPersontomeet(null);
					visitObj.setFlatno(flatno);
				}
				visitObj.setPurpose(purpose);
				visitObj.setIntime(intime);
				visitObj.setOuttime(outtime);
				misDao.updateVisitor(visitObj);
			}
		} catch (Exception e) {
			logger.error("Error in updateVisitor Serrvie iMpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveComplaintDetails(String prtyid, Integer userId, String flatno, String ctitle, String description,
			Integer roleid, String prtyName) {
		int prtyIdInt = 0;
		try {
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}
			Date cdate = new Date();
			ComplaintDetailsEntity compObj = new ComplaintDetailsEntity();
			compObj.setUserid(userId);
			compObj.setPrtyid(prtyIdInt);
			compObj.setFlatno(flatno);
			compObj.setTitle(ctitle);
			compObj.setDescription(description);
			compObj.setCdate(cdate);
			compObj.setStatus("Open");
			compObj.setRoleid(roleid);
			misDao.saveComplaintDetails(compObj);
			String subject = "New Complaint Raised from " + flatno;
			String htmlfile = env.getProperty("notificatonmail");

			String tenentmail = null;
			String ownermail = null;
			String tenant = null;
			String owner = null;

			String buildingMail = readingDao.getBuildingMail(prtyIdInt);
			
			String mail = maaDao.getMailByUserid(userId);
				
			if (roleid == 3) {
				newEmail.sendComplaintMail(mail, ctitle, description, prtyName, buildingMail, htmlfile, subject, null);

			} else if (roleid == 4) {
				Integer user_Id=0;
				
				AssetDetails assetObj = maaDao.getAssetByFlat(prtyIdInt, user_Id, flatno);
				System.out.println("getOwnerid-------"+assetObj.getOwnerid());
				System.out.println("buildingMail-----"+buildingMail);
				System.out.println("mail-----"+mail);
				if (assetObj.getOwnerid() != 0) {
					owner = readingDao.getOwnerEmail(assetObj.getOwnerid());
					String[] ownerArr = owner.split("_");
					ownermail = ownerArr[0];
				}
				
				System.out.println("mail Owner-------"+ownermail);

				newEmail.sendComplaintMail(mail, ctitle, description, prtyName, buildingMail, htmlfile, subject,
						ownermail);
			}
		} catch (Exception e) {
			logger.error("Error in saveComplaintDetails Serrvie iMpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<NotificationEntity> getNotificationListByprtyId(Integer userid, String prtyid, Integer roleid) {
		int prtyId = 0;
		List<NotificationEntity> notifiList = null;
		String flatno=null;
		try {
			if (!prtyid.isEmpty()) {
				prtyId = Integer.parseInt(prtyid);
			}
			if(roleid==3||roleid==4) {
				flatno=misDao.getUserFlatByProperty(userid, prtyId, roleid);
			}
			notifiList = misDao.getNotificationListByprtyId(userid, prtyId, roleid,flatno);
		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyId", e);
		}
		return notifiList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<VisitorsDetailsEntity> getVisitorListByprtyId(Integer userid, String prtyid, Integer roleid) {
		int prtyId = 0;
		List<VisitorsDetailsEntity> visitorList = null;
		try {
			if (!prtyid.isEmpty()) {
				prtyId = Integer.parseInt(prtyid);
			}
			visitorList = misDao.getVisitorListByprtyId(userid, prtyId);
		} catch (Exception e) {
			logger.error("Error while  getVisitorListByprtyId", e);

		}
		return visitorList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ComplaintDetailsEntity> getComplaintListByprtyId(Integer userid, String prtyid, Integer roleid) {
		int prtyId = 0;
		List<ComplaintDetailsEntity> complaintList = null;
		String flatno=null;
		try {
			if (!prtyid.isEmpty()) {
				prtyId = Integer.parseInt(prtyid);
			}
			if(roleid==3||roleid==4) {
				flatno=misDao.getUserFlatByProperty(userid, prtyId, roleid);
			}
			System.out.println("------------flatno-------"+flatno);
			complaintList = misDao.getComplaintListByprtyId(userid, prtyId,flatno,roleid);
		} catch (Exception e) {
			logger.error("Error while  getComplaintListByprtyId", e);
		}
		return complaintList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public ComplaintDetailsEntity getComplaintById(String id) {
		int compId = 0;
		ComplaintDetailsEntity compObj = null;
		try {
			if (!id.isEmpty()) {
				compId = Integer.parseInt(id);
			}
			compObj = misDao.getComplaintById(compId);

		} catch (Exception e) {
			logger.error("Error in getComplaintById Serrvie iMpl", e);
		}
		return compObj;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateComplaintDetails(String prtyid, Integer userId, String flatno, String edescription,
			String estatus, String compId, String roleid, String prtyName) {
		int cId = 0;
		int rId = 0;
		String subject =null;
		Integer user_Id=0;
		try {
			if (!compId.isEmpty()) {
				cId = Integer.parseInt(compId);
			}
			if (!roleid.isEmpty()) {
				rId = Integer.parseInt(roleid);
			}
			System.out.println("rId**********" + rId);
			// Date date1=new Date();
			ComplaintDetailsEntity compObj = misDao.getComplaintById(cId);
			if (compObj != null) {
				if (rId == 1 || rId == 2) {
					user_Id=userId;
					compObj.setStatus(estatus);
					subject = "Your Complaint for Flatno " + flatno + " Status has been changed To "+estatus+" ";
				} else {
					user_Id=0;
					compObj.setFlatno(flatno);
					// compObj.setTitle(etitle);
					compObj.setDescription(edescription);
					subject = "Complaint Raised from " + flatno;
				}
				misDao.updateComplaintDetails(compObj);
				
				
				
				String htmlfile = env.getProperty("notificatonmail");

				String tenentmail = null;
				String ownermail = null;
				String tenant = null;
				String owner = null;

				int prtyIdInt = 0;
				if (!prtyid.isEmpty()) {
					prtyIdInt = Integer.parseInt(prtyid);
				}
				
				String buildingMail = readingDao.getBuildingMail(prtyIdInt);
				
				String mail = maaDao.getMailByUserid(userId);
				
				AssetDetails assetObj = maaDao.getAssetByFlat(prtyIdInt, user_Id, flatno);
				System.out.println("getOwnerid-------"+assetObj.getOwnerid());
				System.out.println("getTenantId-------"+assetObj.getTenantId());
				if (assetObj.getOwnerid() != 0) {
					owner = readingDao.getOwnerEmail(assetObj.getOwnerid());
					String[] ownerArr = owner.split("_");
					ownermail = ownerArr[0];
				}
				
				if (assetObj.getTenantId() != 0) {
					tenant = readingDao.getTenantEmail(assetObj.getTenantId());
					String[] tenantArr = tenant.split("_");
					tenentmail = tenantArr[0];
				}
				
				if (rId == 2) {
					if(compObj.getRoleid()==3) {
						newEmail.sendComplaintMail(mail, compObj.getTitle(), compObj.getDescription(), prtyName, ownermail, htmlfile, subject, null);
					}else {
						newEmail.sendComplaintMail(mail, compObj.getTitle(), compObj.getDescription(), prtyName, ownermail, htmlfile, subject, tenentmail);	
					}
				}else if (rId == 3) {
					
					newEmail.sendComplaintMail(mail, compObj.getTitle(), compObj.getDescription(), prtyName, buildingMail, htmlfile, subject, null);
				
				} else if (rId == 4) {
					newEmail.sendComplaintMail(mail, compObj.getTitle(), compObj.getDescription(), prtyName, buildingMail, htmlfile, subject,
							ownermail);
				}
			}
		} catch (Exception e) {
			logger.error("Error in updateComplaintDetails Serrvie iMpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveCommentsOfComplaint(Integer userId, String compId, String comments, Integer roleid) {
		int compIdInt = 0;
		try {
			if (!compId.isEmpty()) {
				compIdInt = Integer.parseInt(compId);
			}
			Date cdate = new Date();
			ComplaintHistoryEntity comphistoryObj = new ComplaintHistoryEntity();
			comphistoryObj.setCommentgivenby(userId);
			comphistoryObj.setDescription(comments);
			comphistoryObj.setComplaintId(compIdInt);
			comphistoryObj.setCommentedDate(cdate);
			comphistoryObj.setRoleid(roleid);
			misDao.saveCommentsOfComplaint(comphistoryObj);
		} catch (Exception e) {
			logger.error("Error in saveCommentsOfComplaint Serrvie iMpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<complaintHistoryDto> getAllCommentsByComplaintId(String compId, int userId, int roleid) {
		int compIdInt = 0;
		List<complaintHistoryDto> comphistoryList = null;
		try {
			if (!compId.isEmpty()) {
				compIdInt = Integer.parseInt(compId);
			}
			comphistoryList = misDao.getAllCommentsByComplaintId(compIdInt, userId, roleid);

		} catch (Exception e) {
			logger.error("Error in getAllCommentsByComplaintId Serrvie iMpl", e);
		}
		return comphistoryList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String getNameByUserIdRoleId(int userid, int roleid) {
		String name = null;
		try {
			if (roleid == 3) {
				name = misDao.getOwnerNameByUserId(userid);
			} else {
				name = misDao.getTenantNameByUserId(userid);
			}
		} catch (Exception e) {
			logger.error("Error in getNameByUserIdRoleId Serrvie iMpl", e);
		}
		return name;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteComplaint(String id) {
		String message = null;
		int Id = 0;
		try {
			if (!id.isEmpty()) {
				Id = Integer.parseInt(id);
			}
			message = misDao.deleteComplaint(Id);
		} catch (Exception e) {
			logger.error("Error while  deleteComplaint Serrvie iMpl", e);
		}
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ComplaintDetailsEntity> getComplaintCountsByprtyId(Integer userid, String propId, Integer roleid) {
		int prtyId = 0;
		List<ComplaintDetailsEntity> complaintList = null;
		try {
			if (!propId.isEmpty()) {
				prtyId = Integer.parseInt(propId);
			}
			complaintList = misDao.getComplaintCountsByprtyId(userid, prtyId);
		} catch (Exception e) {
			logger.error("Error while  getComplaintCountsByprtyId", e);
		}
		return complaintList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<NotificationEntity> getNotificationCountsListByprtyId(Integer userid, String propId, Integer roleid) {
		int prtyId = 0;
		List<NotificationEntity> notifiList = null;
		try {
			if (!propId.isEmpty()) {
				prtyId = Integer.parseInt(propId);
			}
			notifiList = misDao.getNotificationCountsListByprtyId(userid, prtyId, roleid);
		} catch (Exception e) {
			logger.error("Error while  getNotificationCountsListByprtyId", e);
		}
		return notifiList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String sendPaymentReciept(PaymentDTO payment) {
		String prtyid = payment.getPrtyid();
		String message = null;
		int prptyid = 0;
		if (!prtyid.isEmpty()) {
			prptyid = Integer.parseInt(prtyid);
		}
		String buildingMail = readingDao.getBuildingMail(prptyid);
		String prtyAddress = readingDao.getPrtyAdress(prptyid);
		String invAmout1 = payment.getTotalAmount();
		String amountPaid1 = payment.getAmountPaid();
		String dueAmount1 = payment.getDueAmount();

		String recieptNum = payment.getReceiptNo();
		String paypurpose = payment.getPaymentPurpose();
		String payDate = payment.getPaymentDate();
		String paidBy = payment.getPayeeName();
		String payPeriod = payment.getPayperiod();
		String unitNo = payment.getUnitNo();
		String prptyName = payment.getPrtyname();
		String tomail = payment.getPayeeEmail();
		String payeeCont = payment.getPayeeMobile();
		String subject = "Payment received for " + payPeriod + " towards " + paypurpose;
		String htmlfile = env.getProperty("paymentreceipthtml");
		try {
			message = newEmail.sendReceipt(tomail, subject, htmlfile, paidBy, payDate, paypurpose, recieptNum, unitNo,
					amountPaid1, dueAmount1, payPeriod, prptyName, payeeCont, invAmout1, prtyAddress, buildingMail);

		} catch (Exception e) {
			logger.error("Error while  sendReceipt", e);
		}
		return message;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<String> getAssetsByProperty(String prtyid) {

		int prtyId = 0;
		List<String> assetMap = null;
		try {
			if (!prtyid.isEmpty()) {
				prtyId = Integer.parseInt(prtyid);
			}
			assetMap = misDao.getAssetsByProperty(prtyId);
		} catch (Exception e) {
			logger.error("Error while  getAssetsByProperty", e);
		}
		return assetMap;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String sendInvoiceMail(InvoiceEntity invoice, String prptyName, Integer userId) {
		String invmessage = null;
		try {
			String tenentmail = null;
			String ownermail = null;
			int invoiceid = 0;
			if (invoice != null) {
				invoiceid = invoice.getInvoiceid();
			}
			String tenant = null;
			String owner = null;
			String tenantCont = null;
			String tenantname = null;
			String ownerCont = null;
			String ownername = null;
			String tomail = null;
			if (invoice.getOwnerid() != 0) {
				owner = readingDao.getOwnerEmail(invoice.getOwnerid());
				String[] ownerArr = owner.split("_");
				ownermail = ownerArr[0];
				ownerCont = ownerArr[1];
				ownername = ownerArr[2];
				tomail = ownermail;
			}
			if (invoice.getTenentid() != 0) {
				tenant = readingDao.getTenantEmail(invoice.getTenentid());
				String[] tntArr = tenant.split("_");
				tenentmail = tntArr[0];
				tenantCont = tntArr[1];
				tenantname = tntArr[2];
				tomail = tenentmail;
			}
			TermsAndConditions termsnCond = maaDao.getTermsandConditions(userId, invoice.getPrptyid());
			String[] getBankdetails = maaDao.getBankDetailsByProperty(invoice.getPrptyid());

			String payeename = getBankdetails[2];
			String accountNumber = getBankdetails[0];
			String ifscCode = getBankdetails[1];
			String upiid = getBankdetails[3];
			
			Double amountpaid=maaDao.getInvoiceAmountPaidByInvid(invoiceid);
					//select paid_amt from maa_payments where invcid=1016
			String termsNcond = null;
			if (termsnCond != null) {
				termsNcond = termsnCond.getTandC();
			}
			Double dueAmount=null;
			Double invAmount=invoice.getInvoiceAmount();
			String token =null;
			if(invAmount.equals(amountpaid)) {}else {
			if(invAmount!=null&&amountpaid!=null)
			{dueAmount= invAmount-amountpaid;
			invAmount=dueAmount;
			}
			else {
				invAmount=invoice.getInvoiceAmount();
			}
			
			String filename = "QRINV" + invoiceid;
			logger.info("filename " + filename);
			
			String qr_Code = env.getProperty("QRImage") + File.separator + filename + ".png";
			
			logger.info("qr_Code" + qr_Code);
			String charset = "UTF-8";
			Map<EncodeHintType, ErrorCorrectionLevel> hintMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
			hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);//for QR Code image size
			String qrCodeData = null;
if(invAmount==amountpaid) {}
else {
	
	if(!upiid.isEmpty()) {
		
		logger.info("In upiid!= null---invAmount---"+invAmount);
		/*qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&mam=0.01&am=" + invAmount + "&cu=INR";*/ //prabha
		qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" + invAmount + "&mam=0.01&cu=INR";//rasheeda
		System.out.println("condition 1------"+qrCodeData);
		try {
			QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
		} catch (Exception e) {
			logger.debug("Error while  generating QR code " + e.getMessage());
		}
	}else if (!accountNumber.isEmpty() && !ifscCode.isEmpty()) {
		qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
		try {
			QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
		} catch (Exception e) {
			logger.debug("Error while  generating QR code " + e.getMessage());
		}
		System.out.println("condition 2222------"+qrCodeData);
	}
	
	else if (accountNumber != null &&  ifscCode != null) {
		qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
		try {
			QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
		} catch (Exception e) {
			logger.debug("Error while  generating QR code " + e.getMessage());
		}
		
		System.out.println("condition 3------"+qrCodeData);
	}  else {

		qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" +invAmount+ "&mam=0.01&cu=INR";//rasheeda
		try {
			QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
		} catch (Exception e) {
			logger.debug("Error while  generating QR code " + e.getMessage());
		}
	}
	/*if ((accountNumber!="" || accountNumber != null) && (ifscCode!="" || ifscCode != null)) {
				qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&mam=0.01&am=" + invAmount + "&cu=INR";//Rasheeda
				logger.info("qrCodeData---accountNumber---" + qrCodeData);
				try {
					QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
				} catch (Exception e) {
					logger.debug("Error while  generating QR code " + e.getMessage());
				}
			} else if (upiid!="" || upiid != null) {
				qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&mam=0.01&am=" + invAmount +"&cu=INR";
				try {
					QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
				} catch (Exception e) {
					logger.debug("Error while  generating QR code " + e.getMessage());
				}
			} 
	else {
				logger.info("came to else in QR Data---");
			}*/
			 
}
token=qrCodeData;
			}		 
			String invoicenumber = "MAA-" + "INVC" + invoiceid;
			String buildingMail = readingDao.getBuildingMail(invoice.getPrptyid());

			String subject = "Invoice  for period " + invoice.getMonth() + "/" + invoice.getYear() + " towards "
					+ invoice.getFlano();
			String htmlfile = env.getProperty("invoicemail");
			try {
				newEmail.sendInvoiceMail(tomail, invoice.getFlano(), invoice, ownermail, ownerCont, tenentmail,
						tenantCont, invoicenumber, htmlfile, subject, prptyName, termsNcond, tenantname, ownername,
						buildingMail, invoice.getComment(), token,amountpaid,dueAmount,invAmount);
				invmessage = "Success";
			} catch (Exception e) {
				logger.debug("Error while  sendInvoiceMail service impl" + e.getMessage());
			}
		}

		catch (Exception e) {
			logger.debug("Error while  sendInvoiceMail", e);
		}
		return invmessage;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String downloadPaymentReciept(PaymentDTO payment) {

		String prtyid = payment.getPrtyid();
		String message = null;
		int prptyid = 0;
		if (!prtyid.isEmpty()) {
			prptyid = Integer.parseInt(prtyid);
		}

		String htmlfileNew = null;

		String buildingMail = readingDao.getBuildingMail(prptyid);
		System.out.println("buildingMail------"+buildingMail);
		String prtyAddress = readingDao.getPrtyAdress(prptyid);
		System.out.println("prtyAddress------"+prtyAddress);
		String invAmout = payment.getTotalAmount();
		String amountPaid = payment.getAmountPaid();
		String dueAmount = payment.getDueAmount();

		String recieptNum = payment.getReceiptNo();
		String paypurpose = payment.getPaymentPurpose();
		String payDate = payment.getPaymentDate();
		String paidBy = payment.getPayeeName();

		String payPeriod = payment.getPayperiod();
		String unitNo = payment.getUnitNo();
		String prptyName = payment.getPrtyname();
		String tomail = payment.getPayeeEmail();
		String payeeCont = payment.getPayeeMobile();
		String subject = "Payment received for " + payPeriod + " towards " + paypurpose;
		String htmlfile = env.getProperty("paymentReceipt");
		try {
			htmlfileNew = newEmail.downloadPaymentReciept(tomail, subject, htmlfile, paidBy, payDate, paypurpose,
					recieptNum, unitNo, amountPaid, dueAmount, payPeriod, prptyName, payeeCont, invAmout, prtyAddress,
					buildingMail);

		} catch (Exception e) {
			logger.error("Error while  sendReceipt", e);
		}
		return htmlfileNew;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public AptPaymentsDTO getPaymentByPaymentId(String paymentid, int roleid, Integer userId) {
		AptPaymentsDTO payment = null;
		int paymentidInt = 0;
		try {
			if (!paymentid.isEmpty()) {
				paymentidInt = Integer.parseInt(paymentid);

			}
			payment = misDao.getPaymentByPaymentId(paymentidInt, roleid, userId);

		} catch (Exception e) {
			logger.error("Error while  getPaymentByPaymentId", e);
		}
		return payment;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int saveClassifiedOthers(ClassifiedDTO claasifiedObj) {
		int id = 0;
		try {
			if (claasifiedObj != null) {
				ClassifiedInformation classifiedInfo = claasifiedObj.getClassifiedInfo();
				if (classifiedInfo != null) {
					id = misDao.saveClassifiedInfo(classifiedInfo);

					if (!claasifiedObj.getClassifiedFetures().isEmpty()) {
						ClassifiedFeatures features = new ClassifiedFeatures();
						features.setClassified(id);
						features.setCsffeature(claasifiedObj.getClassifiedFetures());
						misDao.saveClassifiedFeatures(features);
					}
				}

			}
		} catch (Exception e) {
			logger.error("Error while  saveClassified", e);
		}
		return id;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String saveClassified(ClassifiedHouseHunting classifiedObj) {
		String message = null;
		try {
			misDao.saveHHClassified(classifiedObj);
			message = "Success";
		} catch (Exception e) {
			logger.error("Error while  saveClassified", e);
		}
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String saveClassifiedImages(String id, MultipartFile[] files) {
		String message = null;
		try {
			int idval = 0;
			if (!id.isEmpty()) {
				idval = Integer.parseInt(id);
			}
			String directorypath = env.getProperty("classifiedImages");
			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();
			}
			if (null != files && files.length > 0) {
				for (MultipartFile multipartFile : files) {
					if (!multipartFile.isEmpty()) {
						

						String imageName = multipartFile.getOriginalFilename();
						String image = imageName.replaceAll(" ", "_");
						ClassifiedImages imagesObj = new ClassifiedImages();
						imagesObj.setClassified(idval);
						imagesObj.setImagename(image);
						try {
							misDao.saveImage(imagesObj);

						} catch (Exception e) {
							logger.error("Error while  saving image", e);
						}
						File dest = new File(directorypath.trim()+ File.separator +image);
						try {
							if(dest.exists()!=true)

							{
								System.out.println("file saving while--------"+image);
								multipartFile.transferTo(dest);}

						} catch (Exception ex) {
							logger.error("Exception due to:", ex);
						}
					
						/*
						 * InputStream input = multipartFile.getInputStream(); Path path =
						 * Paths.get(directorypath + File.separator + image);//check path OutputStream
						 * output = Files.newOutputStream(path); IOUtils.copy(input, output);
						 *///org.apache.commons.io.IOUtils or you can create IOUtils.copy
							 message = "Success";
							
					}
					else {
						
						System.out.println("nskbsgbsdgksd ---Not interested goself");
						message = "Failed";
					}

				}
			}
		} catch (Exception e) {
			logger.error("Error while  saveClassifiedImages", e);
		}

		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public ClassifedDTO getClassifiedsByProperty(String prtyid) {

		int prtyidval = 0;
		ClassifedDTO cDto = new ClassifedDTO();
		if (prtyid != null && !prtyid.isEmpty()) {

			prtyidval = Integer.parseInt(prtyid);
		}

		try {

			List<ClassifiedInfoDTO> classifiedList = misDao.getClassifiedList(prtyidval);

			cDto.setClassifiedList(classifiedList);
			List<ClassifiedHouseHunting> hhList = misDao.getHHclassifieds(prtyidval);
			cDto.setHhClassifiedList(hhList);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}

		return cDto;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public ClassifiedInformationView getClassifiedInformatioByid(String classifiedid, String prtyid) {
		int prtyidval = 0, id = 0;
		ClassifiedInformationView csfInfoView = new ClassifiedInformationView();
		System.out.println("prtyid=getClassifiedInformatioByid===="+prtyid);
		try {
			if (!prtyid.isEmpty()) {
				prtyidval = Integer.parseInt(prtyid);
			}
			if (!classifiedid.isEmpty()) {
				id = Integer.parseInt(classifiedid);
			}
			ClassifiedInformation csfInfo = misDao.getClassfiedInfoById(id, prtyidval);
			// List<String> images=misDao.getClassifiedImages(id);
			String feature = misDao.getFeaturesByCid(id);
			List<String> al = new ArrayList<String>();
			if (feature != null) {
				String str[] = feature.split(",");

				al = Arrays.asList(str);
			}
			csfInfoView.setCsfinfo(csfInfo);
			// csfInfoView.setImages(images);
			csfInfoView.setFeatures(al);
		} catch (Exception e) {
			logger.error("Error while  getClassifiedInformatioByid", e);
		}
		return csfInfoView;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public ClassifiedHouseHunting getClassHHuntingByCID(String classifiedid, String prtyid) {
		int prtyidval = 0, id = 0;
		ClassifiedHouseHunting hhuntingObj = new ClassifiedHouseHunting();
		try {
			if (!prtyid.isEmpty()) {
				prtyidval = Integer.parseInt(prtyid);
			}
			if (!classifiedid.isEmpty()) {
				id = Integer.parseInt(classifiedid);
			}
			hhuntingObj = misDao.getHHclasifiedByCid(id, prtyidval);
		} catch (Exception e) {
			logger.error("Error while  getClassifiedInformatioByid", e);
		}
		return hhuntingObj;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<String> getClassifiedImages(int id) {
		List<String> images = null;
		try {
			images = misDao.getClassifiedImages(id);
		} catch (Exception e) {
			logger.error("Error while  getClassifiedImages", e);
		}
		return images;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int updateClassifiedOthers(ClassifiedDTO classifiedObj, String classifiedid, String csfCategory) {
		int id = 0;
		System.out.println("csfCategory--in edit category--" + csfCategory);

		try {
			if (!classifiedid.isEmpty()) {
				id = Integer.parseInt(classifiedid);
			}
			ClassifiedInformation csfInfo = misDao.getClassfiedInfoById(id, 0);
			if (csfInfo != null) {
				if (classifiedObj != null) {
					ClassifiedInformation classifiedInfo = classifiedObj.getClassifiedInfo();

					if (classifiedInfo != null) {
						
						csfInfo.setAdvance(classifiedInfo.getAdvance());
						csfInfo.setAmount(classifiedInfo.getAmount());
						csfInfo.setAreaSqft(classifiedInfo.getAreaSqft());
						csfInfo.setCity(classifiedInfo.getCity());
						// csfInfo.setClassified(classifiedInfo.getClassified());
						csfInfo.setCsfDesription(classifiedInfo.getCsfDesription());
						csfInfo.setCsfPrtytype(classifiedInfo.getCsfPrtytype());
						csfInfo.setCsfTitle(classifiedInfo.getCsfTitle());
						csfInfo.setEmail(classifiedInfo.getEmail());
						csfInfo.setFacing(classifiedInfo.getFacing());
						csfInfo.setGmapLink(classifiedInfo.getGmapLink());
						csfInfo.setLoanfacility(classifiedInfo.getLoanfacility());
						csfInfo.setName(classifiedInfo.getName());
						csfInfo.setNofofparking(classifiedInfo.getNofofparking());
						csfInfo.setNoofbaths(classifiedInfo.getNoofbaths());
						csfInfo.setNoofBeds(classifiedInfo.getNoofBeds());
						csfInfo.setPhone(classifiedInfo.getPhone());
						csfInfo.setPrtyAddress(classifiedInfo.getPrtyAddress());
						csfInfo.setPrtyid(classifiedInfo.getPrtyid());
						csfInfo.setState(classifiedInfo.getState());
						csfInfo.setPrtyavialbleon(classifiedInfo.getPrtyavialbleon());
						csfInfo.setTags(classifiedInfo.getTags());
						if (!csfCategory.isEmpty() && csfCategory.equalsIgnoreCase("Avail")) {
							csfInfo.setPostedon(classifiedInfo.getUpdatedon());
							csfInfo.setCsfstatus("");
							csfInfo.setUpdatedon("");
						} else {
							csfInfo.setUpdatedon(classifiedInfo.getUpdatedon());
						}
						csfInfo.setCsfType(classifiedInfo.getCsfType());
						try {
							misDao.updateClasified(csfInfo);
						} catch (Exception e) {

							logger.error("Error while  updateClasified", e);

						}
					}
					ClassifiedFeatures features = misDao.getClassifiedFeaturesByCid(id);
					if (features != null) {

						features.setCsffeature(classifiedObj.getClassifiedFetures());
						misDao.updateClassifiedFeatures(features);
					} else {
						if (!classifiedObj.getClassifiedFetures().isEmpty()) {
							ClassifiedFeatures featuresNew = new ClassifiedFeatures();
							featuresNew.setClassified(id);
							featuresNew.setCsffeature(classifiedObj.getClassifiedFetures());
							misDao.saveClassifiedFeatures(featuresNew);
						}
					}
					String imageRemoveArr = classifiedObj.getImageRemoveArr();
					if (!imageRemoveArr.isEmpty() && imageRemoveArr != null) {
						String[] imageRemove = imageRemoveArr.split(",");
						for (String classifiedImages : imageRemove) {
							if (!classifiedImages.isEmpty()) {
								ClassifiedImages csfImage = misDao.getClassifiedImages(id, classifiedImages);
								if (csfImage != null) {
									misDao.deleteCsfImage(csfImage);

									String directorypath = env.getProperty("classifiedImages");

									File f = new File(directorypath + File.separator + classifiedImages); // file to be
																											// delete
									if (f.delete()) // returns Boolean value
									{
										// getting and printing the file name
									} else {

									}
								}
							}
						}

					} else {

					}

				}

			}
		} catch (Exception e) {
			logger.error("Error while  updateClassifiedOthers", e);
		}
		return id;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String updateClassified(ClassifiedHouseHunting classifiedObj, String classifiedid) {
		int id = 0;
		try {
			if (!classifiedid.isEmpty()) {
				id = Integer.parseInt(classifiedid);
			}
			ClassifiedHouseHunting csfHHunting = misDao.getHHclasifiedByCid(id, 0);
			if (csfHHunting != null) {
				misDao.updateClasifiedHHunting(classifiedObj);
			}
		} catch (Exception e) {
			logger.error("Error while  getClassifiedImages", e);
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String updateClassifiedStatus(String csfid, String csftype, String csfCategory) {
		int id = 0;
		String csfStatus = "";
		try {

			if (!csfid.isEmpty()) {
				id = Integer.parseInt(csfid);
			}
			if (csftype.equalsIgnoreCase("Rent")) {
				csfStatus = "Rented";
			} else {
				csfStatus = "Sold";
			}
			if (!csfCategory.isEmpty() && csfCategory.equalsIgnoreCase("Avail")) {
				csfStatus = "";
			}
			//ClassifiedInformation csfInfo = misDao.getClassfiedInfoById(id, 0);
			//if (csfInfo != null) {
				//csfInfo.setCsfstatus(csfStatus);
				try {
					misDao.updateClasifiedStatus(id,csfStatus);
					if (csftype.equalsIgnoreCase("Rent")) {
						csfStatus = "Rented";
					} else {
						csfStatus = "Sold";
					}
				} catch (Exception e) {
					logger.error("Error while  updateClasified", e);
				}

			//}

		} catch (Exception e) {
			logger.error("Error while  updateClassifiedStatus", e);
		}
		return csfStatus;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ClassifiedImages> getClassifiedImagesEdit(int id) {
		List<ClassifiedImages> images = null;
		try {
			images = misDao.getClassifiedImagesEdit(id);
		} catch (Exception e) {
			logger.error("Error while  getClassifiedImages", e);
		}
		return images;
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String downloadInvoicePdf(InvoiceEntity invoice,Integer userid,String prptyName) {
		System.out.println("downloadInvoicePdf");
		int invoiceid = 0;String qrCodeData = null;
		if (invoice != null) {
			invoiceid = invoice.getInvoiceid();
		}
		String tenant = null;
		String owner = null;
		
		String phn = null;
		String name = null;
		String mail = null;
		if (invoice.getOwnerid() != 0) {
			owner = readingDao.getOwnerEmail(invoice.getOwnerid());
			String[] ownerArr = owner.split("_");
			mail = ownerArr[0];
			phn = ownerArr[1];
			name = ownerArr[2];
			
		}
		if (invoice.getTenentid() != 0) {
			tenant = readingDao.getTenantEmail(invoice.getTenentid());
			String[] tntArr = tenant.split("_");
			mail = tntArr[0];
			phn = tntArr[1];
			name = tntArr[2];
			
		}
		String date="";
		if(invoice.getInvoicedate()!=null) {
			date=new SimpleDateFormat("MM/dd/yyyy").format(invoice.getInvoicedate());
		}
		TermsAndConditions termsnCond = maaDao.getTermsandConditions(userid, invoice.getPrptyid());
		String[] getBankdetails = maaDao.getBankDetailsByProperty(invoice.getPrptyid());

		String payeename = getBankdetails[2];
		String accountNumber = getBankdetails[0];
		String ifscCode = getBankdetails[1];
		String upiid = getBankdetails[3];
		
		Double amountpaid=maaDao.getInvoiceAmountPaidByInvid(invoiceid);
		System.out.println("------------"+amountpaid);
		String termsNcond = null;
		if (termsnCond != null) {
			termsNcond = termsnCond.getTandC();
		} int prtyid=0;
		Double invAmount=null;
		if(invoice!=null) {
			prtyid=invoice.getPrptyid();
			invAmount=invoice.getInvoiceAmount();
		}
		Double dueAmount=null;
		
		String qr_Code =null;
		if(invAmount.equals(amountpaid)) {System.out.println("invAmount==amountpaid");}
		else {
			System.out.println("invAmount not same amountpaid");
		if((invAmount!=null&&amountpaid!=null) )
		{
		dueAmount= invAmount-amountpaid;
		invAmount=dueAmount;
		System.out.println(dueAmount+"----DUE Amount----"+invAmount);
		}
		else {
			invAmount=invoice.getInvoiceAmount();
			
		}
		
		/*
		 * if(dueAmount!=null) { invAmount=dueAmount;}
		 */
		
		String filename = "QRINV" + invoiceid;
		 logger.info("filename---"+filename);
		 qr_Code = env.getProperty("QRImage") + "/" + filename + ".png";
		 logger.info("qr_Code---"+qr_Code);
		
		String charset = "UTF-8";
		Map<EncodeHintType, ErrorCorrectionLevel> hintMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		System.out.println("a/c"+accountNumber+"-----ifsc"+ifscCode+"-------------uuuuupi"+upiid);
		//if (accountNumber != null && ifscCode != null) {
		
		if(!upiid.isEmpty()) {
			
			logger.info("In upiid!= null---invAmount---"+invAmount);
			/*qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&mam=0.01&am=" + invAmount + "&cu=INR";*/ //prabha
			qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" + invAmount + "&mam=0.01&cu=INR";//rasheeda
			System.out.println("condition 1------"+qrCodeData);
			try {
				QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
			} catch (Exception e) {
				logger.debug("Error while  generating QR code " + e.getMessage());
			}
		}else if (!accountNumber.isEmpty() && !ifscCode.isEmpty()) {
			qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
			try {
				QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
			} catch (Exception e) {
				logger.debug("Error while  generating QR code " + e.getMessage());
			}
			System.out.println("condition 2222------"+qrCodeData);
		}
		
		else if (accountNumber != null &&  ifscCode != null) {
			qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
			try {
				QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
			} catch (Exception e) {
				logger.debug("Error while  generating QR code " + e.getMessage());
			}
			
			System.out.println("condition 3------"+qrCodeData);
		}  else {

			qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" +invAmount+ "&mam=0.01&cu=INR";//rasheeda
			try {
				QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
			} catch (Exception e) {
				logger.debug("Error while  generating QR code " + e.getMessage());
			}
			
			System.out.println("condition else--====------"+qrCodeData);
		}
		 String token =qrCodeData;
		 System.out.println("qrCodeData---"+qrCodeData);
		// logger.info("qrCodeData---"+qrCodeData);
			
		}
		//String charset = "UTF-8";
		/*Map<EncodeHintType, ErrorCorrectionLevel> hintMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);*/
		
		StringBuilder htmlStringBuilder=new StringBuilder();
    	String htmlText="";
    	try {
    		String invRnttotal ="";
    		String upiImg = env.getProperty("upiImg");
    		if (invoice.getRenttotal() != null) {
    			 invRnttotal = String.format("%.2f", invoice.getRenttotal());
    			
    		}
    		String invAmounttotal ="";
    			if(invoice.getInvoiceAmount()!=null) {
    				invAmounttotal= String.format("%.2f", invoice.getInvoiceAmount());
    			}
    			String terms;
    			if(termsNcond!=null) {
    				terms=	termsNcond;
    			}else {
    				terms="NA";
    			}
    			String invoicenumber = "MAA-" + "INVC" + invoiceid;
    			String note=invoice.getComment();
    			String saveimg = env.getProperty("saveimg");
    			//	String upiImg = env.getProperty("upiImg");
    				  String logo = env.getProperty("logo");
    				String publicUrl=env.getProperty("pms");
    					

    	htmlStringBuilder.append("<html lang='en'><body width='100%' style='margin: 0; padding: 0 !important; mso-line-height-rule: exactly;font-family: 'Roboto', sans-serif; font-size: 13px;'> <div class='mx-5'style='max-width: 700px;margin: 0 auto;border-radius: 4px;padding-left: 6px;padding-right: 6px;' class='email-container'><div class='row'><div class='col' style='float:left'><h1><font color='red'>INVOICE</font></h1><p Style='padding: 0px;margin: 0px;'><b>Invoice Number:</b>#"+invoicenumber+"</p> <p Style='padding: 0px;margin: 0px;'><b>Invoice Date: </b>"+date+"</p>	</div>\r\n<div class='col' style='float:right'><h4><b Style='padding: 0px;margin: 0px;'>To Bill:</b></h4><p Style='padding: 0px;margin: 0px;'>"+name+"<br/>Mail id: <font color='blue' style='text-decoration:underline'>"+mail+"</font><br/>\r\nPhone : "+phn+"\r\n </p></div><div style='clear: both;'></div>	</div><div style='clear: both;'></div><br/><div class='row' style='margin-top:10px;'><div class='col'><table class='table' style='border-collapse: collapse;width:100%;'><thead class='table-dark'><tr>\r\n<th style='background-color:#000;color:#fff;'>Particulars</th> <th style='background-color:#000;color:#fff;'>Units</th><th style='background-color:#000;color:#fff;'>Cost/Unit</th>\r\n <th style='background-color:#000;color:#fff;'>GST%</th><th style='background-color:#000;color:#fff;'>Total</th></tr> </thead> ");
		 
			htmlStringBuilder.append("<tbody>");
			   if (invoice.getWtrUnits() != null) {				
				    htmlStringBuilder.append("<tr style='border-bottom: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px'> <td>Water</td><td>"+invoice.getWtrUnits()+"</td><td>"+invoice.getWtrCost()+"</td><td>"+invoice.getWtrGST()+"</td><td>"+invoice.getWtrtotal()+"</td></tr>");
				    }
				    if (invoice.getPwrUnits() != null) {				
					    htmlStringBuilder.append("<tr style='border-bottom: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px'> <td>Elcetricity</td><td>"+invoice.getPwrUnits()+"</td><td>"+invoice.getPwrCost()+"</td><td>"+invoice.getPwrGST()+"</td><td>"+invoice.getPwrtotal()+"</td></tr>");
					    }
				    if (invoice.getGasUnits() != null) {				
					    htmlStringBuilder.append("<tr style='border-bottom: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px'> <td>Gas</td><td>"+invoice.getGasUnits()+"</td><td>"+invoice.getGasCost()+"</td><td>"+invoice.getGasGST()+"</td><td>"+invoice.getGastotal()+"</td></tr>");
					    }
				    if (invoice.getDslUnits() != null) {				
					    htmlStringBuilder.append("<tr style='border-bottom: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px'> <td>Diesel</td><td>"+invoice.getDslUnits()+"</td><td>"+invoice.getDslCost()+"</td><td>"+invoice.getDslGST()+"</td><td>"+invoice.getDsltotal()+"</td></tr>");
					    }
				    if (invoice.getAcUnits() != null) {				
					    htmlStringBuilder.append("<tr style='border-bottom: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px'> <td>AC</td><td>"+invoice.getAcUnits()+"</td><td>"+invoice.getAcCost()+"</td><td>"+invoice.getAcGST()+"</td><td>"+invoice.getActotal()+"</td></tr>");
					    }
				    if (invoice.getOthrUnits() != null) {				
					    htmlStringBuilder.append("<tr style='border-bottom: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px'> <td>Other Detials</td><td>"+invoice.getOthrUnits()+"</td><td>"+invoice.getOthrCost()+"</td><td>"+invoice.getOthrGST()+"</td><td>"+invoice.getOthtotal()+"</td></tr>");
					    }
				    if (invoice.getRent() != null) {				
					    htmlStringBuilder.append("<tr style='border-bottom: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px'> <td>Rent</td><td>"+invoice.getRent()+"</td><td></td><td>"+invoice.getRentGST()+"</td><td>"+invRnttotal+"</td></tr>");
					    }
				    
				    if (invoice.getMaintenance() != null) {				
					    htmlStringBuilder.append("<tr style='border-bottom: 5px solid black;text-align: left;padding:7px;line-height:2.5;height:30px'> <td>MaintenanceNew</td><td>"+invoice.getMaintenance()+"</td><td></td><td>"+invoice.getMaintenanceGST()+"</td><td>"+invoice.getMnttotal()+"</td></tr>");
					    }
				 	
				  
				    htmlStringBuilder.append("<tr> <th colspan='5'></th></tr>");
				    htmlStringBuilder.append("<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:1.5;height:30px'> <td></td><td></td><td></td><td><b>Total</b></td><td><b>"+invAmounttotal+"</b></td></tr>");
				    htmlStringBuilder.append("<tr> <th colspan='5'></th></tr>");
				    if(amountpaid!=null) {
				    	htmlStringBuilder.append("<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:1.5;height:30px'> <td></td><td></td><td></td><td><font color='darkgreen'><b>Recieved</b></font></td><td>"+amountpaid+"</td></tr>");
				    }
				    if(dueAmount!=null) {
				    	htmlStringBuilder.append("<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:1.5;height:30px'> <td></td><td></td><td></td><td><font color='red'>Due</font></td><td>"+dueAmount+"</td></tr>");
				    }
				    
	    htmlStringBuilder.append("</tbody></table></div></div>");
	    
	    if(qr_Code!=null) {
	    	
	  	htmlStringBuilder.append("<div class='row'><div class='col'><h4>Scan</h4><img src='"+qr_Code+"' style='height: 150px;width:200px'/></div></div><br/>");
	    htmlStringBuilder.append(" <a href='"+publicUrl+"/apinew?prtyid="+prtyid+"&invoiceid="+invoiceid+"&invoiceamt="+invAmount+"'><img src='"+upiImg+"' style='height:30px;width:180px'/></a>"); 
	    //htmlStringBuilder.append("<a href='"+qrCodeData+"' id='__UPI_BUTTON__' target='_blank' ><img src='"+upiImg+"' style='height:30px;width:180px'/></a>");
	  	 //htmlStringBuilder.append(" <a href='"+publicUrl+""+qrCodeData+"'><img src='"+upiImg+"' style='height:30px;width:180px'/></a>");
	    }
	    htmlStringBuilder.append("<div class='row'><div class='col'><h4>Terms and Conditions:</h4>"+terms+"</div></div>");    
	  	htmlStringBuilder.append("<div class='row'><div class='col'><p><b>Note</b>:"+note+"</p></div></div>");
	  	htmlStringBuilder.append("<div class='row mt-3'><div class='col' style='float:left'><h4>Authorized Signatory</h4><p>"+prptyName+"</p></div><div class='col' style='float:right'><h4>Genarated By</h4><img src=\'"+logo+"'style='height: 70px;'/></div></div>");
	    htmlStringBuilder.append("<div style='clear: both;'></div><div class='row'><div class='col'><div class='quote text-center'><img src=\'"+saveimg+"'/></div></div></div>");
	    htmlStringBuilder.append(" <div class='row ' ><div class='col' style='float:left;text-align:center;'><p class='text-center' style='border-top:1px solid #ccc;'>This is Computer Generated Invoice</p></div>	<div class='col' style='float:right;text-align:center;'>" + 
	    		"<p style='border-top:1px solid #ccc;'>E.&O.E</p></div></div></div></body></html>" );
	    htmlText=htmlStringBuilder.toString();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
		return htmlText;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveBlog(String title, String postedby, String postedon, String description, String tags, MultipartFile files) {
		try {
		BlogEntity blog = new BlogEntity();
		blog.setDescription(description);
		blog.setTitle(title);
		blog.setTags(tags);
		blog.setPostedby(postedby);
		blog.setPostedon(postedon);
		if (!files.isEmpty()) {
			

			String imageName = files.getOriginalFilename();
			//String image = imageName.replaceAll(" ", "_");
			blog.setImage(imageName);}
		String directorypath = env.getProperty("blogimages");
		if (!new File(directorypath).exists()) {
			new File(directorypath).mkdir();
		}
		misDao.saveBlog(blog);	
				if (!files.isEmpty()) {
					String imageName = files.getOriginalFilename();
					File dest = new File(directorypath.trim()+ File.separator +imageName);
					try {
						if(dest.exists()!=true)

						{
							files.transferTo(dest);}

					} catch (Exception ex) {
						logger.error("Exception due to:", ex);
					}}

			
		}catch(Exception e) {
    		e.printStackTrace();
    	}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<BlogEntity> getblogs() {
		List<BlogEntity> bloglist = null;
		
		try {
			
			bloglist = misDao.findAllBlogs();

		} catch (Exception e) {
			logger.error("Error in getblogs Serrvie iMpl", e);
		}
		return bloglist;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateBlog(String blogid, String title, String postedby, String postedon, String description,
			String tags, MultipartFile files) {
		try {
			int blogidVal=0;
			if(!blogid.isEmpty()) {
				blogidVal=Integer.parseInt(blogid);
			}
			BlogEntity blog = misDao.getBlogById(blogidVal);
			System.out.println("blog"+blog);
			if(blog!=null) {
			blog.setDescription(description);
			blog.setTitle(title);
			blog.setTags(tags);
			blog.setPostedby(postedby);
			blog.setPostedon(postedon);
			
if (!files.isEmpty()) {
				

				String imageName = files.getOriginalFilename();
				//String image = imageName.replaceAll(" ", "_");
				blog.setImage(imageName);}
			misDao.updateBlog(blog);
			
			String directorypath = env.getProperty("blogimages");
			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();
			}
			misDao.saveBlog(blog);	
					if (!files.isEmpty()) {
						String imageName = files.getOriginalFilename();
						File dest = new File(directorypath.trim()+ File.separator +imageName);
						try {
							if(dest.exists()!=true)

							{
								files.transferTo(dest);}

						} catch (Exception ex) {
							logger.error("Exception due to:", ex);
						}}
			}
			}catch(Exception e) {
	    		e.printStackTrace();
	    	}
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public ClassifedDTO getClassifiedsByCity(String city,String location,String propType) {
			ClassifedDTO cDto = new ClassifedDTO();
			try {
				List<ClassifiedInfoDTO> classifiedList = misDao.getClassifiedListByCity(city,location,propType);
				cDto.setClassifiedList(classifiedList);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}

			return cDto;
		}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String getClassifiedThumbnail(int id) {
		try {
			String image=misDao.getThumbnailImage(id);
			return image;
		}
		catch(Exception e) {
			
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public BlogEntity getblogInfo(String blog) {
		try {
			int blogid=0;
			if(!blog.isEmpty()) {
				blogid=Integer.parseInt(blog);
			}
				BlogEntity blogInfo=misDao.getBlogById(blogid);
			return blogInfo;
		}
		catch(Exception e) {
			logger.error(e.getMessage(),e);
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<VacanciesDto> getAllVacancies() {
		try {
			List<VacanciesDto> vacanices=misDao.getAllVacancies();
				
			return vacanices;
		}
		catch(Exception e) {
			logger.error(e.getMessage(),e);
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public ClassifedDTO adminClassifieds() {
		ClassifedDTO cDto = new ClassifedDTO();
		try {

			List<ClassifiedInfoDTO> classifiedList = misDao.adminClassifieds();

			cDto.setClassifiedList(classifiedList);
			List<ClassifiedHouseHunting> hhList = misDao.getHHclassifieds(0);
			cDto.setHhClassifiedList(hhList);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}

		return cDto;
	}

	@Override
	
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteClassified(String classifiedid, String prtyid) {
		int propertyid=0,classified=0;
		String message=null;
		try {
		if(!prtyid.isEmpty()) {
			propertyid=Integer.parseInt(prtyid);
		}
		
		if(!classifiedid.isEmpty()) {
			classified=Integer.parseInt(classifiedid);
		}
		try {
		
		misDao.deleteClassified(classified,propertyid);
		message="Success";
		}
		catch (Exception e) {
			logger.info(e.getMessage());
			
		}
		}
		 catch (Exception e) {
				logger.info(e.getMessage());
			}
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteClassifiedHH(String classifiedid, String prtyid) {
		int propertyid=0,classified=0;
		String message=null;
		try {
		if(!prtyid.isEmpty()) {
			propertyid=Integer.parseInt(prtyid);
		}
		
		if(!classifiedid.isEmpty()) {
			classified=Integer.parseInt(classifiedid);
		}
		try {
		misDao.deleteClassifiedHH(classified,propertyid);
		message="Success";
		}
		 catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		 catch (Exception e) {
				logger.info(e.getMessage());
			}
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ComplaintDetailsEntity> getComplaintListByUser(Integer userid, String propId, Integer roleid) {
		int prtyId = 0;
		List<ComplaintDetailsEntity> complaintList = null;
		try {
			if (!propId.isEmpty()) {
				prtyId = Integer.parseInt(propId);
			}
			String flatno=misDao.getUserFlatByProperty(userid,prtyId,roleid);
			complaintList = misDao.getComplaintListByUser(userid, prtyId,roleid,flatno);
		} catch (Exception e) {
			logger.error("Error while  getComplaintListByprtyId", e);
		}
		return complaintList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteBlog(String id) {
		String message = null;
		int Id = 0;
		try {
			if (!id.isEmpty()) {
				Id = Integer.parseInt(id);
			}
			message = misDao.deleteBlog(Id);
		} catch (Exception e) {
			logger.error("Error while  deleteBlog", e);

		}
		return message;
	}
}
