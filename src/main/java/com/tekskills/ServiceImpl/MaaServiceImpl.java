package com.tekskills.ServiceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tekskills.DAO.MaaDao;
import com.tekskills.DAO.MeterReadingDao;
import com.tekskills.DAO.MiscellaneousDao;
import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.ExpenseChatDto;
import com.tekskills.DTO.MeterReadingsDTO;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.DTO.SecurityBean;
import com.tekskills.DTO.UserInfoDto;
import com.tekskills.Service.MaaService;
import com.tekskills.entity.ApartmentDetialsEntity;
import com.tekskills.entity.ApartmentUserInfoEntity;
import com.tekskills.entity.AptUserProperties;
import com.tekskills.entity.AptUserRoles;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.TermsAndConditions;
import com.tekskills.entity.VendorEntity;
import com.tekskills.util.SendHtmlEmailNew;

@Service
@PropertySource("/WEB-INF/Mail.properties")
public class MaaServiceImpl implements MaaService {
	@Autowired
	private MaaDao maaDao;
	@Autowired
	private MeterReadingDao readingDao;
	
	@Autowired
	private MiscellaneousDao misDao;
	@Autowired
	private Environment env;
	@Autowired
	private SendHtmlEmailNew newEmail;
	private static final Logger logger = Logger.getLogger(MaaServiceImpl.class);

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String saveUserRegistration(String buildingName, String buldingMail, String buldingPhn, String password,
			String uscNo, String pincode) {
		String message = null;
		Date register_on = new Date();
		try {
			ApartmentUserInfoEntity aptUserInfoObj= maaDao.getUserInfoByMail(buldingMail);
			if(aptUserInfoObj!=null) {}else {
			ApartmentUserInfoEntity aptUserInfo = new ApartmentUserInfoEntity();
			aptUserInfo.setActive(0);
			aptUserInfo.setEmail(buldingMail);
			aptUserInfo.setPassword(password);
			aptUserInfo.setRegister_on(register_on);
			// aptUserInfo.setRole(2);
			
			int userid = maaDao.saveRegistration(aptUserInfo);
			
			if (userid > 0) {
				ApartmentDetialsEntity aptDetailsInfo = new ApartmentDetialsEntity();
				aptDetailsInfo.setRegister_on(register_on);
				aptDetailsInfo.setBuild_name(buildingName);
				aptDetailsInfo.setBuldingmail(buldingMail);
				aptDetailsInfo.setContact(buldingPhn);
				aptDetailsInfo.setUserid(userid);
				aptDetailsInfo.setStatus(0);
				aptDetailsInfo.setUscno(uscNo);
				aptDetailsInfo.setZip(pincode);
				int prtyid = maaDao.saveBuildingDetails(aptDetailsInfo);
				AptUserRoles userRole = new AptUserRoles();
				userRole.setRole(2);
				userRole.setUserid(userid);
				userRole.setStatus(1);
				int tblpk_role = maaDao.saveAptUserRoles(userRole);
				AptUserProperties usrPropObj = new AptUserProperties();
				usrPropObj.setPrtyid(prtyid);
				usrPropObj.setUserid(userid);
				usrPropObj.setStatus(0);
				usrPropObj.setRole(2);
				maaDao.saveUserProperty(usrPropObj);
				String tomail=buldingMail;
				String subject="User Resistration";
				String htmlfile=env.getProperty("resistrationhtml");
				newEmail.sendMail( tomail, subject, htmlfile,buldingMail,buildingName,uscNo,0);
				//newEmail.sendUserMail(fromMail, tomail, subject, htmlfile,name,email,assetNo,prtyname,password);
				if (prtyid > 0) {
					message = "Success";
				} else {
					message = "Failure";
				}
			}
			}

		} catch (Exception e) {
			logger.error("saveRegistration in service Impl---", e);
		}

		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public UserInfoDto validateUser(String username, String password, String role) {
		ApartmentUserInfoEntity apptObj = null;
		AptUserRoles roleObj = null;

		UserInfoDto infoDto = null;
		try {
			int roleid = 0;
			if (!role.isEmpty()) {
				roleid = Integer.parseInt(role);
			}
			apptObj = maaDao.getUserDetailsBymail(username, password,roleid);
			
			if (apptObj != null) {
				infoDto =new UserInfoDto();
				infoDto.setEmail(apptObj.getEmail());
				infoDto.setUserid(apptObj.getId());
				
				infoDto.setRegister_on(apptObj.getRegister_on());
				infoDto.setStatus(apptObj.getActive());
				roleObj = maaDao.getRolesByUseriD(apptObj.getId(), roleid);
				if (roleObj != null) {
					infoDto.setRoleid(roleObj.getRole());
					
				}
			}
		} catch (Exception e) {
			logger.error("Error while getting user info in validateUser", e);

		}

		return infoDto;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	
	

		
	public String saveBuilding(String buildingName, String noOfUnits, String proptype, String blocality,
			String buldingMail, String buldingPhn, String city, String state, String pincode, String altcontact,
			String comnCurMeter, String comnWtrMeter, String mgrName, String mgrPhn, String mgrAltPhn, String mgrMail,
			String notes, String upiId, String district, String secName, String secPhn, String secEmail, String prtyImg,
			String userId, String uscNo, String bAcntNo, String ifscCode,String accountname) throws MessagingException {

		int userIdInt = 0,  noOfUnitsInt = 0;
		if (!userId.isEmpty()) {
			userIdInt = Integer.parseInt(userId);
		}
		if (!noOfUnits.isEmpty()) {
			noOfUnitsInt = Integer.parseInt(noOfUnits);
		}

		
		String password = "123456";
		Date register_on = new Date();

		// aptUserInfo.setRole(3);
		ApartmentDetialsEntity aptDetailsInfo = new ApartmentDetialsEntity();

		aptDetailsInfo.setBuild_name(buildingName);
		aptDetailsInfo.setBuldingmail(buldingMail);
		aptDetailsInfo.setNoofflats(noOfUnitsInt);
		aptDetailsInfo.setProptype(proptype);
		aptDetailsInfo.setLandmark(blocality);
		aptDetailsInfo.setCity(city);
		aptDetailsInfo.setContact(buldingPhn);
		aptDetailsInfo.setUserid(userIdInt);
		aptDetailsInfo.setState(state);
		aptDetailsInfo.setDist(district);
		aptDetailsInfo.setUscno(uscNo);
		aptDetailsInfo.setZip(pincode);
		aptDetailsInfo.setAccountname(accountname);
		aptDetailsInfo.setIfscCode(ifscCode);
		aptDetailsInfo.setAltcontact(altcontact);
		aptDetailsInfo.setMeterno(comnCurMeter);
		aptDetailsInfo.setWatermeterno(comnWtrMeter);
		aptDetailsInfo.setMgr_alt_phone(mgrAltPhn);
		aptDetailsInfo.setMgr_email(mgrMail);
		aptDetailsInfo.setMgr_name(mgrName);
		aptDetailsInfo.setMgr_phone(mgrPhn);
		aptDetailsInfo.setNote(notes);
		aptDetailsInfo.setUpiid(upiId);
		aptDetailsInfo.setSecemail(secEmail);
		aptDetailsInfo.setSecphn(secPhn);
		aptDetailsInfo.setSecname(secName);
		aptDetailsInfo.setStatus(0);
		aptDetailsInfo.setPrtyimg(prtyImg);
		String message = null;
		int prtyid = maaDao.saveBuildingDetails(aptDetailsInfo);
		if (prtyid > 0) {
			message = "Success";
		} else {
			message = "Failure";
		}
		if(!mgrMail.isEmpty()) {
		ApartmentUserInfoEntity managerInfo = new ApartmentUserInfoEntity();
		
		managerInfo.setActive(1);
		managerInfo.setEmail(mgrMail);
		managerInfo.setPassword(password);
		managerInfo.setRegister_on(register_on);
		int Mgrid = maaDao.saveRegistration(managerInfo);
		AptUserRoles mgrRole = new AptUserRoles();

		mgrRole.setRole(5);// role 5= manager/Employee
		mgrRole.setUserid(Mgrid);
		mgrRole.setStatus(1);
		int tblpk_role_mgr = maaDao.saveAptUserRoles(mgrRole);
		}
		
		//String fromMail="maheshwar.k@tekskills.in";
		String tomail=buldingMail;
		String subject="Property Activation";
		String htmlfile=env.getProperty("resistrationhtml");
		
	
		newEmail.sendMail(tomail, subject, htmlfile,buldingMail,buildingName,uscNo,0);
		
		
		
		
		

		
		AptUserProperties usrPropObj = new AptUserProperties();
		usrPropObj.setPrtyid(prtyid);
		usrPropObj.setUserid(userIdInt);
		usrPropObj.setRole(2);
		// usrPropObj.setUserrole(tblpk_role_mgr);
		usrPropObj.setStatus(0);
		maaDao.saveUserProperty(usrPropObj);
		if (!secEmail.isEmpty()) {
			ApartmentUserInfoEntity secInfo = new ApartmentUserInfoEntity();
			secInfo.setActive(1);
			secInfo.setEmail(secEmail);
			secInfo.setPassword(password);
			secInfo.setRegister_on(register_on);
			int secid = maaDao.saveRegistration(secInfo);
			AptUserRoles secRole = new AptUserRoles();

			secRole.setRole(6);// role 5= manager/Employee
			secRole.setUserid(secid);
			secRole.setStatus(1);

			int tblpk_role_sec = maaDao.saveAptUserRoles(secRole);
			AptUserProperties usrPropObj_sec = new AptUserProperties();
			usrPropObj_sec.setPrtyid(prtyid);
			usrPropObj_sec.setUserid(userIdInt);
			// usrPropObj_sec.setUserrole(tblpk_role_sec);
			usrPropObj_sec.setStatus(0);
			maaDao.saveUserProperty(usrPropObj_sec);
		}
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<PropertyDto> getPropertListByUserid(int userId, int roleid) {
		List<Integer> properties = null;
		List<PropertyDto> propertyList = new LinkedList<>();

		try {
			properties = maaDao.getPropertListByUserid(userId, roleid);

			for (Integer property : properties) {
				if(property!=null) {
				
				PropertyDto propObj = maaDao.getPropertByProptyid(userId, property,roleid);
				propertyList.add(propObj);
				}
			}
		} catch (Exception e) {
			logger.error("Error while getting user info in getPropertListByUserid", e);

		}

		return propertyList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String updateProperty(String propertyId, String buildingName, String noOfUnits, String proptype,
			String blocality, String buldingMail, String buldingPhn, String city, String state, String pincode,
			String bImage, String altcontact, String usc, String comnWtrMeter, String mgrName, String mgrPhn,
			String mgrAltPhn, String mgrMail, String notes, String upiId, String district, String secName,
			String secPhn, String secEmail, String userId,String bankAcount,String ifscCode, String accountname)

	{
		try {
			String password = "123456";
			Date register_on = new Date();
		
			int userIdInt = 0, propertyIdInt = 0, noOfUnitsInt = 0;
			if (!userId.isEmpty()) {
				userIdInt = Integer.parseInt(userId);
			}
			if (!noOfUnits.isEmpty()) {
				noOfUnitsInt = Integer.parseInt(noOfUnits);
			}
			if (!propertyId.isEmpty()) {
				propertyIdInt = Integer.parseInt(propertyId);
			}
			/*if (!pincode.isEmpty()) {
				pincodeInt = Integer.parseInt(pincode);
			}*/

			ApartmentDetialsEntity aptDetailsInfo = maaDao.gePropertyDetailsInfoByUserId(userIdInt, propertyIdInt);
			if(aptDetailsInfo!=null) {
			String magrEmailDb = aptDetailsInfo.getMgr_email();
			String secEmailDb = aptDetailsInfo.getSecemail();
			aptDetailsInfo.setBuild_name(buildingName);
			aptDetailsInfo.setNoofflats(noOfUnitsInt);
			aptDetailsInfo.setProptype(proptype);
			aptDetailsInfo.setLandmark(blocality);
			aptDetailsInfo.setCity(city);
			aptDetailsInfo.setContact(buldingPhn);

			aptDetailsInfo.setState(state);
			aptDetailsInfo.setDist(district);
			aptDetailsInfo.setZip(pincode);
			aptDetailsInfo.setAltcontact(altcontact);
			aptDetailsInfo.setUscno(usc);
			aptDetailsInfo.setMeterno(usc);
			aptDetailsInfo.setWatermeterno(comnWtrMeter);
			aptDetailsInfo.setMgr_alt_phone(mgrAltPhn);
			aptDetailsInfo.setMgr_email(mgrMail);
			aptDetailsInfo.setMgr_name(mgrName);
			aptDetailsInfo.setMgr_phone(mgrPhn);
			
			aptDetailsInfo.setAccountname(accountname);
			aptDetailsInfo.setSecemail(secEmail);
			aptDetailsInfo.setSecphn(secPhn);
			aptDetailsInfo.setSecname(secName);
			aptDetailsInfo.setNote(notes);
			aptDetailsInfo.setUpiid(upiId);
			aptDetailsInfo.setBankAcntNo(bankAcount);
			aptDetailsInfo.setIfscCode(ifscCode);
		
			if(bImage!=null) {
			aptDetailsInfo.setPrtyimg(bImage);
			}

			maaDao.updatePropertyByBuilding(aptDetailsInfo);

			
			if (magrEmailDb!=null) {
				if (!secEmail.isEmpty()) {
				ApartmentUserInfoEntity aptUserInfo = maaDao.getUserInfoByMail(magrEmailDb);
				if (!mgrMail.isEmpty()) {
					aptUserInfo.setEmail(mgrMail);
					maaDao.updateUserInfo(aptUserInfo);
				}
				}
			} else {
				ApartmentUserInfoEntity managerInfo = new ApartmentUserInfoEntity();
				managerInfo.setActive(1);
				managerInfo.setEmail(mgrMail);
				managerInfo.setPassword(password);
				managerInfo.setRegister_on(register_on);
				int Mgrid = maaDao.saveRegistration(managerInfo);
				AptUserRoles mgrRole = new AptUserRoles();
				// mgrRole.setPrtyid(propertyIdInt);
				mgrRole.setRole(5);// role 5= manager/Employee
				mgrRole.setUserid(Mgrid);
				mgrRole.setStatus(1);
				// mgrRole.setPrtyid(propertyIdInt);
				maaDao.saveAptUserRoles(mgrRole);

			}

			if (secEmailDb !=null) {
				if (!secEmail.isEmpty()) {
					ApartmentUserInfoEntity secInfo = maaDao.getUserInfoByMail(secEmailDb);
					secInfo.setEmail(secEmail);
					maaDao.updateUserInfo(secInfo);
				}
			} else {
				if (!secEmail.isEmpty()) {
					ApartmentUserInfoEntity secInfo = new ApartmentUserInfoEntity();
					secInfo.setActive(1);
					secInfo.setEmail(secEmail);
					secInfo.setPassword(password);
					secInfo.setRegister_on(register_on);
					int secid = maaDao.saveRegistration(secInfo);
					AptUserRoles secRole = new AptUserRoles();
					// secRole.setPrtyid(propertyIdInt);
					secRole.setRole(6);// role 5= manager/Employee
					secRole.setUserid(secid);
					secRole.setStatus(1);
					// secRole.setPrtyid(propertyIdInt);
					maaDao.saveAptUserRoles(secRole);
				}

			}
			}

		} catch (Exception e) {
			logger.error("Error while getting user info in getPropertListByUserid", e);

		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PropertyDto getPropertByProptyid(int userid, String propId) {
		PropertyDto property = null;
		try {
			int propertyId = 0;
			if ((!propId.isEmpty()) || (propId != null)) {
				propertyId = Integer.parseInt(propId);
			}
			property = maaDao.getPropertByProptyid(userid, propertyId,0);
		} catch (Exception e) {
			logger.error("Error while getting user info in getPropertListByUserid", e);

		}
		return property;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int getpropertyIdBtUserid(int userId) {
		int propertyId = 0;
		try {

			propertyId = maaDao.getpropertyIdBtUserid(userId);
		} catch (Exception e) {
			logger.error("Error while getting user info in getPropertListByUserid", e);

		}
		return propertyId;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AssetDetailsDto> getAssetListByprtyId(int userId, String propertyId,int roleid) {
		int prtyId = 0;
		List<AssetDetailsDto> assetList = null;
		int ownerid=0, tntid=0;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
			}
				
				if (roleid == 3 ) {
					ownerid = maaDao.getOwnerid(userId, roleid,tntid,prtyId);
				}
				if(roleid == 4)
				{   tntid = maaDao.getTntid(userId, roleid);
					ownerid = maaDao.getOwnerid(userId, roleid,tntid,prtyId);
				}
				 assetList = maaDao.getAssetListByprtyId(userId, prtyId,roleid,ownerid,tntid);

		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyId", e);

		}

		return assetList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveAssetByPropertyId(int userId, String propertyId, String unitNo, String roomType, String prtytax,
			String areSqft, String rent, String maintanance, String secBill, String wtrMeter, String curMeter,
			String dslMeter, String acMeter, String gasMeter, String othMeter) {
		try {
			int prtyid = 0, iunitNo = 0, iprtytax = 0, iareSqft = 0, irent = 0, imaintanance = 0, isecBill = 0,
					iroomType = 0, iwtrMeter = 0, icurMeter = 0, idslMeter = 0, iacMeter = 0, igasMeter = 0,
					iothMeter = 0;
			if (!propertyId.isEmpty()) {
				prtyid = Integer.parseInt(propertyId);
			}
			/*if (!unitNo.isEmpty()) {
				iunitNo = Integer.parseInt(unitNo);
			}*/
			if (!prtytax.isEmpty()) {
				iprtytax = Integer.parseInt(prtytax);
			}
			if (!areSqft.isEmpty()) {
				iareSqft = Integer.parseInt(areSqft);
			}
			if (!rent.isEmpty()) {
				irent = Integer.parseInt(rent);
			}
			if (!roomType.isEmpty()) {
				iroomType = Integer.parseInt(roomType);
			}

			if (!maintanance.isEmpty()) {
				imaintanance = Integer.parseInt(maintanance);
			}

			/*if (!secBill.isEmpty()) {
				isecBill = Integer.parseInt(secBill);
			}
*/
		
			Date register_on = new Date();
			AssetDetails asset = new AssetDetails();
			asset.setPrtyid(prtyid);
			asset.setUserd(userId);
			asset.setAreasqft(iareSqft);
			asset.setAsttype(iroomType);
			asset.setCurmeterno(curMeter);
			asset.setDesselmeter(dslMeter);
			asset.setFlatno(unitNo);
			asset.setGasmeter(gasMeter);
			asset.setMaintenance(imaintanance);
			asset.setOthMeter(othMeter);
			asset.setPrtytax(iprtytax);
			asset.setRegister_on(register_on);
			asset.setRent(irent);
			//asset.setSecBill(isecBill);
			asset.setStatus(1);

			asset.setWatermeter(wtrMeter);
			asset.setAcmeter(acMeter);
			maaDao.saveAssetByProperty(asset);
		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyId", e);

		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public AssetDetails getAssetByAssetid(String prtyid, String userid, String assetid, String flatno) {
		AssetDetails asset = null;
		try {
			int iprtyid = 0, iflatno = 0, iuserid = 0, iassetid = 0;

			if (!prtyid.isEmpty()) {
				iprtyid = Integer.parseInt(prtyid);
			}
			if (!flatno.isEmpty()) {
				iflatno = Integer.parseInt(flatno);
			}
			if (!userid.isEmpty()) {
				iuserid = Integer.parseInt(userid);
			}
			if (!assetid.isEmpty()) {
				iassetid = Integer.parseInt(assetid);
			}
			asset = maaDao.getAssetByAssetId(iprtyid, iuserid, iassetid);

		} catch (Exception e) {
			logger.error("Error while  getAssetByAssetid", e);

		}
		return asset;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateAssetByPropertyId(int userId, String propertyId, String assetId, String unitNo, String roomType,
			String prtytax, String areSqft, String rent, String maintanance, String secBill, String wtrMeter,
			String curMeter, String dslMeter, String acMeter, String gasMeter, String othMeter) {
		try {
			int prtyid = 0, iprtytax = 0, iareSqft = 0, irent = 0, imaintanance = 0, 
					iassetId = 0, iroomType = 0;
					
			if (!propertyId.isEmpty()) {
				prtyid = Integer.parseInt(propertyId);
			}
			if (!assetId.isEmpty()) {
				iassetId = Integer.parseInt(assetId);
			}
			/*if (!unitNo.isEmpty()) {
				iunitNo = Integer.parseInt(unitNo);
			}*/
			if (!prtytax.isEmpty()) {
				iprtytax = Integer.parseInt(prtytax);
			}
			if (!areSqft.isEmpty()) {
				iareSqft = Integer.parseInt(areSqft);
			}
			if (!rent.isEmpty()) {
				irent = Integer.parseInt(rent);
			}
			if (!roomType.isEmpty()) {
				iroomType = Integer.parseInt(roomType);
			}

			if (!maintanance.isEmpty()) {
				imaintanance = Integer.parseInt(maintanance);
			}

			
			AssetDetails asset = maaDao.getAssetByAssetId(prtyid, userId, iassetId);
			asset.setPrtyid(prtyid);
			asset.setUserd(userId);
			asset.setAreasqft(iareSqft);
			asset.setAsttype(iroomType);
			asset.setCurmeterno(curMeter);
			asset.setDesselmeter(dslMeter);
			asset.setFlatno(unitNo);
			asset.setGasmeter(gasMeter);
			asset.setMaintenance(imaintanance);
			asset.setOthMeter(othMeter);
			asset.setPrtytax(iprtytax);
			
			asset.setRent(irent);
			
			asset.setStatus(1);

			asset.setWatermeter(wtrMeter);
			asset.setAcmeter(acMeter);
			maaDao.updateAsset(asset);
		} catch (Exception e) {
			logger.error("Error while  updateAssetByPropertyId", e);

		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AssetDetails> getAssetListByprtyIdOwner(int userId, String propertyId,int ownerid ) {
		int prtyId = 0;
		List<AssetDetails> assetList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
				assetList = maaDao.getAssetListByprtyIdOwner(userId, prtyId,ownerid);
			}

		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyIdOwner", e);

		}

		return assetList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AssetDetails> getAssetListByprtyIdTenant(int userId, String propertyId, int tenantid) {
		int prtyId = 0;
		List<AssetDetails> assetList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
				assetList = maaDao.getAssetListByprtyIdTenant(userId, prtyId,tenantid);
			}

		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyIdTenant", e);

		}

		return assetList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AssetDetails> getAssetListByprtyIdEdit(int userId, String prtyid, int roleid,String ownerid) {

		int prtyId = 0,owneridInt=0;
		List<AssetDetails> assetList = null;
		
		try {
			if (!prtyid.isEmpty()) {
				prtyId = Integer.parseInt(prtyid);
			}
			if (!ownerid.isEmpty()) {
				owneridInt = Integer.parseInt(ownerid);
			}
			
					assetList = maaDao.getAssetListByprtyIdEdit(userId, prtyId,roleid, owneridInt);
			
			

		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyIdEdit", e);

		}

		return assetList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MeterReadingsEntity getMeterReadingsByFlat(String prtyid, String flat,String month,String year) {
		int prtyIdInt = 0,flatNo=0;
		MeterReadingsEntity meter=null;
		try {
			
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}
			
			
			meter=maaDao.getMeterReadingsByFlat(prtyIdInt,flat,month,year);
		}catch (Exception e) {
			logger.error("Error while  getMeterReadingsByFlat", e);

		}
		return meter;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MeterReadingsDTO getMeterReadingsForInvoice(String prtyid, String flatNo, String readingType,String prvMonth,String month,String year) {
		int prtyIdInt = 0;
		MeterReadingsDTO meter=null;
		try {
			
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}
			System.out.println("readingType------"+readingType+"-----prvMonth-----"+prvMonth);
			
			meter=maaDao.getMeterReadingsForInvoice( prtyIdInt, flatNo, readingType,prvMonth, month, year);
		}catch (Exception e) {
			logger.error("Error while  getMeterReadingsByFlat", e);

		}
		return meter;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public AssetDetails getAssetByFlat(String prtyid, int userId, String flat) {
		AssetDetails asset = null;
		try {
			int iprtyid = 0, iflatno = 0;

			if (!prtyid.isEmpty()) {
				iprtyid = Integer.parseInt(prtyid);
			}
			/*if (!flat.isEmpty()) {
				iflatno = Integer.parseInt(flat);
			}*/
			
			asset = maaDao.getAssetByFlat(iprtyid, userId, flat);

		} catch (Exception e) {
			logger.error("Error while  getAssetByAssetid", e);

		}
		return asset;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public GSTEntity getGST(String prtyid) {
		GSTEntity gst = null;
		int prtyidInt=0;
		if(!prtyid.isEmpty()) {
			prtyidInt=Integer.parseInt(prtyid);
		}
		try {
			gst = maaDao.getGST(prtyidInt);

		} catch (Exception e) {
			logger.error("Error while  getAssetByAssetid", e);

		}
		return gst;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PropertyDto getPropertByProptyid(int userid, String propId,int roleid) {
		PropertyDto property = null;
		try {
			int propertyId = 0;
			if ((!propId.isEmpty()) || (propId != null)) {
				propertyId = Integer.parseInt(propId);
			}
			property = maaDao.getPropertByProptyid(userid, propertyId,roleid);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);

		}
		return property;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ApartmentDetialsEntity> getUserDetails() {
		List<ApartmentDetialsEntity> userList = null;
		try {
			userList = maaDao.getUserDetails();
		} catch (Exception e) {
			logger.error("Error while  getUserDetails", e);
		}
		return userList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String updateUserStatus(String statusid, String userid, String buildingid, String buldingmail, String buildName, String uscno) {
		int stsId=0;int userId=0;int buildId=0;
		String msg=null;
		try {
			if(statusid!=null)   {stsId=Integer.parseInt(statusid);}
			if(userid!=null)     {userId=Integer.parseInt(userid);}
			if(buildingid!=null) {buildId=Integer.parseInt(buildingid);}
			
			
			msg=maaDao.updateUserStatus(stsId,userId,buildId);
			
				
			
				String tomail=buldingmail;
				String subject="Property Activation";
				String htmlfile=env.getProperty("PropApproved");
				
			
				newEmail.sendMail(tomail, subject, htmlfile,buldingmail,buildName,uscno,stsId);
			
		} catch (Exception e) {
			logger.error("Error while  updateUserStatus", e);
		}
		return msg;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public SecurityBean getAllSecuredPwd() {
		SecurityBean security=null;
		try {
			security=maaDao.getAllSecuredPwd();
		}
		catch (Exception e) {
			logger.error("Error while  getAllSecuredPwd", e);
		}
		return security;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public AssetDetails getFlat(String prtyid, String flatno,int userid) {
		AssetDetails asset =null;
		int prtyint=0,flatnoint=0;
		if(!prtyid.isEmpty()) {
			prtyint=Integer.parseInt(prtyid);
		}
		
		try {
			asset=maaDao.getAssetByFlat(prtyint, userid, flatno);
		}
		catch (Exception e) {
			logger.error("Error while  getFlat", e);
		}
		
		
		// TODO Auto-generated method stub
		return asset;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String checkPassword(int userid, String currentPassword) {
		String message=null;
		try {
            message=maaDao.checkPassword(userid,currentPassword);
		}
		catch(Exception e) {
			logger.error("Error in checkPassword"+e);
		}
		return message;
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String changePassword(int userid, String currentPassword, String newPassword, String confirmPassword) {
		String message=null;
		try {
		message=maaDao.changePassword(userid,currentPassword,newPassword,confirmPassword);
		}
		catch(Exception e) {
			logger.error("Error in changePassword"+e);
		}
		return message;
	}
	@Override
    @Transactional(propagation = Propagation.REQUIRED)
    public TermsAndConditions getTermsandConditions(String prptyid, String userid,  String terms) {
           int prptyId = 0;int userId = 0;

           if (!prptyid.isEmpty()) {
                  prptyId = Integer.parseInt(prptyid);
           }
           if (!userid.isEmpty() ) {
                  userId = Integer.parseInt(userid);
           }
           TermsAndConditions tandCObj = null;
           try {
                  tandCObj = maaDao.getTermsandConditions(userId, prptyId);
                  
                  if (tandCObj!= null) {
                        if(terms!=null || terms!="") {
                               tandCObj.setTandC(terms);
                        maaDao.updateTandC(tandCObj);
                        }
                  } else {
                        tandCObj = new TermsAndConditions();
                        tandCObj.setPrptyId(prptyId);
                        tandCObj.setUserId(userId);
                        tandCObj.setTandC(terms);
                        maaDao.saveTandC(tandCObj);
                  }
           } catch (Exception e) {
                  logger.error("Error in getTermsandConditions" + e);
           }
           return tandCObj;
    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public TermsAndConditions getTANDCByPrty(String prptyid, String userid) {
           int prptyId = 0;int userId = 0;
           if ( !prptyid.isEmpty() ) {
                  prptyId = Integer.parseInt(prptyid);
           }
           if (!userid.isEmpty()) {
                  userId = Integer.parseInt(userid);
           }
           TermsAndConditions tandCObj = null;
           try {
           tandCObj = maaDao.getTermsandConditions(userId, prptyId);
           }
           catch (Exception e) {
                  logger.error("Error in getTANDCByPrty" + e);
           }
           return tandCObj;
           
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void saveTandC(int prptyId, int userId, String terms) {
           TermsAndConditions termsObj = new TermsAndConditions();
           try {
                  if (termsObj != null) {
                        termsObj.setPrptyId(prptyId);
                        termsObj.setUserId(userId);
                        termsObj.setTandC(terms);
                        maaDao.saveTandC(termsObj);
                  }
           } catch (Exception e) {
                  logger.error("Error in saveTandC" + e);
           }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void updateTandC(int tblpk, String terms) {
           TermsAndConditions termsObj = new TermsAndConditions();
           try {
                  if (termsObj != null) {
                        termsObj.setTandC(terms);
                        maaDao.updateTandC(termsObj);
                  }
           } catch (Exception e) {
                  logger.error("Error in updateTandC" + e);
           }

    }

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AssetDetailsDto> getAssetListByprtyIdInvoice(Integer userId, String propertyId, Integer roleid) {
		
			int prtyId = 0;
			List<AssetDetailsDto> assetList = null;
			
			try {
				if (!propertyId.isEmpty()) {
					prtyId = Integer.parseInt(propertyId);
				}
					
					 assetList = maaDao.getAssetListByprtyIdInvoice(userId, prtyId,roleid);

			} catch (Exception e) {
				logger.error("Error while  getAssetListByprtyId", e);

			}

			return assetList;
		}

	

	


	@Override
	       @Transactional(propagation = Propagation.REQUIRED)
	       public String showUserInWebSite(String propertyId, String vendorId, String flag) {
	              String msg = null;
	              try {
	                     int venId=0;
	                     if (vendorId != null || vendorId != "") {
	                           venId = Integer.parseInt(vendorId);
	                     }
	                     int prpId=0;
	                     if (propertyId != null || propertyId != "") {
	                           prpId = Integer.parseInt(propertyId);
	                     }
	                     VendorEntity vendorObj=readingDao.getVendorByVendorid(venId,prpId);
	                     if(vendorObj!=null) {
	                           vendorObj.setFlag(flag);
	                     maaDao.showUserInWebSite(vendorObj);
	                     msg="updated";
	                     }

	              } catch (Exception e) {
	                     logger.error("Error while  showUserInWebSite", e);
	              }
	              return msg;
	       }

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String getBuildingNmaeByMail(String buldingMail) {
		String name=null;
		try {
			name=maaDao.getBuildingNmaeByMail(buldingMail);
			
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		return name;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int getUnitCount(String propertyId) {
		int unitCount=0,prtyid=0;
		try {
			if (!propertyId.isEmpty()) {
				prtyid = Integer.parseInt(propertyId);
          }
			unitCount=maaDao.getNoOfAssetsByPrty(prtyid);
			
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		return unitCount;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int getAssetCount(String propertyId) {
		int assetCount=0,prtyid=0;
		try {
			if (!propertyId.isEmpty()) {
				prtyid = Integer.parseInt(propertyId);
          }
			assetCount=maaDao.getAssetCount(prtyid);
			System.out.println("assetCount"+assetCount);
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		return assetCount;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public int getOwnerCountByProperty(String propId, Integer userid) {
		int ownercoutn=0,prtyid=0;
		try {
			if (!propId.isEmpty()) {
				prtyid = Integer.parseInt(propId);
          }
			ownercoutn=maaDao.getOwnerCountByProperty(prtyid,userid);
			System.out.println("ownercoutn---"+ownercoutn);
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		System.out.println("ownercoutn"+ownercoutn);
		return ownercoutn;
		
	}
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public int getTenanantCountByProperty(String propId, Integer userid) {
		int tenenatCount=0,prtyid=0;
		try {
			if (!propId.isEmpty()) {
				prtyid = Integer.parseInt(propId);
          }
			tenenatCount=maaDao.getTenanantCountByProperty(prtyid,userid);
			System.out.println("tenenatCount---"+tenenatCount);
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		System.out.println("tenenatCount"+tenenatCount);
		return tenenatCount;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public int getVacanciesByProperty(String propId, Integer userid,Integer roleid) {
		int vacancies=0,prtyid=0;
		try {
			if (!propId.isEmpty()) {
				prtyid = Integer.parseInt(propId);
          }
			vacancies=maaDao.getVacanciesByProperty(prtyid,roleid);
			
		}
		catch (Exception e) {
            logger.error("Error while  getVacanciesByProperty", e);
     }
		System.out.println("vacancies"+vacancies);
		return vacancies;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public List<ExpenseChatDto> getExpensesForYear(String prtyid,int userid, Integer roleid) {
		
		int prtyintval=0;
		if(!prtyid.isEmpty()) {
			prtyintval=Integer.parseInt(prtyid);
		}
		
		List<ExpenseChatDto> expensList=new ArrayList<ExpenseChatDto>();
		String flatno=misDao.getUserFlatByProperty(userid,prtyintval,roleid);
		System.out.println("----000000000--"+flatno);
		try {
			List<Object[]> newList=maaDao.getExpenseForYear(prtyintval,flatno,roleid);
			
			System.out.println("----000000000--"+newList.size());
			 
			
			 for (Object[] o : newList) {
				 ExpenseChatDto expenseDto=new ExpenseChatDto();
			 String month=(String) o[0];
			 Integer eCount=0;
			 Integer pCount=0;
					 if( o[1]!=null) {
						 eCount	 = (Integer) o[1];
					 }
					 if( o[2]!=null) {
						 pCount	 = (Integer) o[2];
					 }
					
				
				expenseDto.setMonths(month);
				expenseDto.setExpenseCount(eCount);
				expenseDto.setPaymentCount(pCount);
				expensList.add(expenseDto);
				 
				 }
			
			/*
			 * System.out.println(expensList.size());
			 * 
			 * for (Object[] o : expensList) {
			 * 
			 * resultsMap.put( (String) o[0],(Integer) o[1]);
			 * 
			 * }
			 * 
			 * Map<String, Integer> paymnetsMap = new HashMap<String, Integer>();
			 * 
			 * List<Object[]> paymnets=maaDao.getPaymentsForYear();
			 * 
			 * for (Object[] o : paymnets) { paymnetsMap.put( (String) o[0],(Integer) o[1]);
			 * 
			 * } for (Entry<String, Integer> entry : paymnetsMap.entrySet()) {
			 * ExpenseChatDto expense=new ExpenseChatDto();
			 * expense.setMonth(entry.getKey()); expense.setPaymentCount(entry.getValue());
			 * System.out.println(entry.getValue()+"----------abc----------"+entry.getKey())
			 * ; expense.setExpenseCount(2); list.add(expense);
			 * 
			 * }
			 */
	               
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return expensList;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public Map<String, Integer> getPaymentsForYear() {
		Map<String, Integer> resultsMap = new HashMap<String, Integer>();
		try {
		List<Object[]> paymnets=maaDao.getPaymentsForYear();
		
		
		
		for (Object[] o : paymnets) {
			resultsMap.put( (String) o[0],(Integer) o[1]);
		}
		
               
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String[] getBankDetailsByProperty(int prtyid) {
		String[] getBankdetails =null;
		try {
			getBankdetails =  maaDao.getBankDetailsByProperty(prtyid);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return getBankdetails;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int getBlogCountByProperty() {
		int blog=0;
		try {
			
			blog=maaDao.getBlogCountByProperty();
			
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		return blog;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int getVendorCountByProperty() {
		int vendor=0;
		try {
			
			vendor=maaDao.getVendorCountByProperty();
			
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		return vendor;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int getClassifiedCountByProperty() {
		int classified=0;
		try {
			
			classified=maaDao.getClassifiedCountByProperty();
			
		}
		catch (Exception e) {
            logger.error("Error while  getBuildingNmaeByMail", e);
     }
		return classified;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int getPropertyCount() {
		int count=0;
		try {
			
			count=maaDao.getPropertyCount();
			
		}
		catch (Exception e) {
            logger.error("Error while  getPropertyCount", e);
     }
		return count;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String hideClasified(String propertyId, String classified,String status) {
		String msg = null;
       
               int classifiedId=0;
               if (!classified.isEmpty()) {
            	   classifiedId = Integer.parseInt(classified);
               }
               int prpId=0;
               if (!propertyId.isEmpty()) {
                     prpId = Integer.parseInt(propertyId);
               }
               try {    
              
               maaDao.hideClasifiedInWebSite(prpId,classifiedId, status);
               msg="updated";
               

        } catch (Exception e) {
               logger.error("Error while  hideClasified", e);
        }
        return msg;
	}



	


	

}
