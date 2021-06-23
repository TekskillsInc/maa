package com.tekskills.ServiceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tekskills.DAO.MaaDao;
import com.tekskills.DAO.OwnerDao;
import com.tekskills.DAO.TenantDao;
import com.tekskills.DTO.TenantDetailsDTo;
import com.tekskills.Service.TenantService;
import com.tekskills.entity.ApartmentUserInfoEntity;
import com.tekskills.entity.AptUserProperties;
import com.tekskills.entity.AptUserRoles;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.TenantDetailsEntity;
import com.tekskills.util.SendHtmlEmailNew;

@Service
@PropertySource("/WEB-INF/Mail.properties")
public class TenantServiceImpl implements TenantService{
	@Autowired
	private MaaDao maaDao;
	@Autowired
	private TenantDao tenantDao;
	@Autowired
	private Environment env;
	@Autowired
	private SendHtmlEmailNew newEmail;
	@Autowired
	private OwnerDao ownerDao;
	private static final Logger logger = Logger.getLogger(TenantServiceImpl.class);
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveTenantDetails(int userId, String assetNo, String name, String email, String phone, 
			String paddress, String advamntpaid, String idno, String joiningdate, String endingdate, String comments,
			String tenantImgName, String tenantIdImgName, String occ_by,String propertyId,String prtyname) {
		
		
		
		try {
			int prtyid = 0, flatNoVal = 0; int phoneno = 0,advamntpaidint=0;
			int status = 0;
			String password = "123456";
			Date register_on = new Date();
			if(!advamntpaid.isEmpty()) {
				advamntpaidint=Integer.parseInt(advamntpaid);
			}
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date endingdate1=null;
			java.util.Date date = sdf.parse(joiningdate);
			java.sql.Date joiningdate1= new java.sql.Date(date.getTime());
			
			
			if (!propertyId.isEmpty()) {
				prtyid = Integer.parseInt(propertyId);
			}
			ApartmentUserInfoEntity getTenant = maaDao.getUserInfoByMail(email);
			if (getTenant == null) {
				ApartmentUserInfoEntity aptUserInfo = new ApartmentUserInfoEntity();
				aptUserInfo.setActive(1);
				aptUserInfo.setEmail(email);
				aptUserInfo.setPassword(password);
				aptUserInfo.setRegister_on(register_on);
				//aptUserInfo.setRole(4);
				int tnt_userid= maaDao.saveRegistration(aptUserInfo);
				
				
				
			TenantDetailsEntity tenantObj = new TenantDetailsEntity();
			tenantObj.setUserid(userId);
			tenantObj.setPics(tenantImgName);
			tenantObj.setTenant_name(name);
			tenantObj.setTenant_contact(phone);
			tenantObj.setTenant_email(email);
			tenantObj.setId_pics(tenantIdImgName);
			tenantObj.setComments(comments);
			tenantObj.setPics(tenantImgName);
			tenantObj.setRegister_on(register_on);
			tenantObj.setJoin_date(joiningdate1);
			
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsedDate = format.parse(endingdate);
				endingdate1 = new java.sql.Date(parsedDate.getTime());
				if(!endingdate.isEmpty() || endingdate!="") {
					tenantObj.setEnd_date(endingdate1);
				}
			} catch (Exception e) {
				logger.error("Exception in date in tenant format :", e);
			}
			
			
			tenantObj.setId_number(idno);
			tenantObj.setAddress(paddress);
			tenantObj.setStatus(1);
			tenantObj.setTusrid(tnt_userid);
			tenantObj.setAdvamount(advamntpaidint);
			 int tntid=tenantDao.saveTenant(tenantObj);
			 
			
			
			if (assetNo != null) {
				String[] arr = assetNo.split(",");
				for (String flat : arr) {

					String unitval = flat;
					String[] unitArr = unitval.split("_");
						String unitVal = unitArr[0];
						String occby_new = unitArr[1];
						
						if (occby_new.equalsIgnoreCase("T")) {
							status = 1;

						}
						AssetDetails asset = maaDao.getAssetIdByFlat(prtyid, unitVal, userId,0);
						 asset.setTenantId(tntid);
						asset.setOcc_by(occby_new);
						asset.setStatus(status);
						maaDao.updateAsset(asset);
				}
			}
			
			//aptUserInfo.setRole(4);
			
		
			//String fromMail=env.getProperty("frommail");
			String tomail=email;
			String subject="Maa property access for Tenant";
			String htmlfile=env.getProperty("tenanthtml");
			newEmail.sendUserMail(tomail, subject, htmlfile,name,email,assetNo,prtyname,password);
			/* AptUserRoles userRole=new AptUserRoles();
				//userRole.setPrtyid(prtyid);
				userRole.setRole(4);  //role 3=owner--
				userRole.setUserid(tnt_userid);
				userRole.setStatus(1);
				maaDao.saveAptUserRoles(userRole);*/
			 AptUserRoles roleObj=maaDao.getRolesByUseriD(tnt_userid, 3);
             if(roleObj==null) {
            AptUserRoles userRole = new AptUserRoles();
             
             userRole.setRole(4); // role 3=owner--
             userRole.setUserid(tnt_userid);
             userRole.setStatus(1);
             int tblpk_role = maaDao.saveAptUserRoles(userRole);
             }
				AptUserProperties usrPropObj = new AptUserProperties();
				usrPropObj.setPrtyid(prtyid);
				usrPropObj.setUserid(tnt_userid);
				usrPropObj.setRole(4);
				// usrPropObj.setUserrole(tblpk_role);
				usrPropObj.setStatus(1);
				maaDao.saveUserProperty(usrPropObj);
			}else {
				
				
				TenantDetailsEntity tntObj=ownerDao.getTenantByMail(email);
				if(tntObj==null) {
					TenantDetailsEntity newTnt=new TenantDetailsEntity();
					newTnt.setUserid(userId);
					newTnt.setPics(tenantImgName);
					newTnt.setTenant_name(name);
					newTnt.setTenant_contact(phone);
					newTnt.setTenant_email(email);
					newTnt.setId_pics(tenantIdImgName);
					newTnt.setComments(comments);
					newTnt.setPics(tenantImgName);
					newTnt.setRegister_on(register_on);
					newTnt.setJoin_date(joiningdate1);
					newTnt.setEnd_date(endingdate1);
					newTnt.setId_number(idno);
					newTnt.setAddress(paddress);
					newTnt.setStatus(1);
					newTnt.setTusrid(getTenant.getId());
					 int tntid=tenantDao.saveTenant(newTnt);
					 if (assetNo != null) {
							String[] arr = assetNo.split(",");
							for (String flat : arr) {

								String unitval = flat;
								String[] unitArr = unitval.split("_");
									String unitVal = unitArr[0];
									String occby_new = unitArr[1];
									
									if (occby_new.equalsIgnoreCase("T")) {
										status = 1;

									}
									AssetDetails asset = maaDao.getAssetIdByFlat(prtyid, unitVal, userId,0);
									 asset.setTenantId(tntid);
									asset.setOcc_by(occby_new);
									asset.setStatus(status);
									maaDao.updateAsset(asset);
							}
						}
				}
				else {
					tntObj.setUserid(userId);
					tntObj.setPics(tenantImgName);
					tntObj.setTenant_name(name);
					tntObj.setTenant_contact(phone);
					tntObj.setTenant_email(email);
					tntObj.setId_pics(tenantIdImgName);
					tntObj.setComments(comments);
					tntObj.setPics(tenantImgName);
					tntObj.setRegister_on(register_on);
					tntObj.setJoin_date(joiningdate1);
					tntObj.setEnd_date(endingdate1);
					tntObj.setId_number(idno);
					tntObj.setAddress(paddress);
					tenantDao.updateTenant(tntObj);
					if (assetNo != null) {
						String[] arr = assetNo.split(",");
						for (String flat : arr) {

							String unitval = flat;
							String[] unitArr = unitval.split("_");
								String unitVal = unitArr[0];
								String occby_new = unitArr[1];
								
								if (occby_new.equalsIgnoreCase("T")) {
									status = 1;

								}
								AssetDetails asset = maaDao.getAssetIdByFlat(prtyid, unitVal, userId,0);
								 asset.setTenantId(tntObj.getTbl_id());
								asset.setOcc_by(occby_new);
								asset.setStatus(status);
								maaDao.updateAsset(asset);
						}
					}
					
				}
				int tntid=ownerDao.getTenanatByUserid(getTenant.getId());
				
				AptUserProperties usrPropObj = new AptUserProperties();
				usrPropObj.setPrtyid(prtyid);
				usrPropObj.setUserid(getTenant.getId());
				usrPropObj.setRole(4);
				// usrPropObj.setUserrole(tblpk_role);
				usrPropObj.setStatus(1);
				maaDao.saveUserProperty(usrPropObj);
				 AptUserRoles roleObj=maaDao.getRolesByUseriD(getTenant.getId(), 3);
                 if(roleObj==null) {
                AptUserRoles userRole = new AptUserRoles();
                 
                 userRole.setRole(3); // role 3=owner--
                 userRole.setUserid(getTenant.getId());
                 userRole.setStatus(1);
                 int tblpk_role = maaDao.saveAptUserRoles(userRole);
                 }
				
			}

		} catch (Exception e) {
			logger.error("Error while  saveTenantDetails", e);

		}
		
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AssetDetails> getTenantAssetListbyPrptyId(int userId, String prtyid, String tenantid) {
		int prtyId=0,tenantidInt=0;
		List<AssetDetails> assetList=null;
		try {
			if(!prtyid.isEmpty()) {
				prtyId=Integer.parseInt(prtyid);
				
			}
			if(!tenantid.isEmpty()) {
				tenantidInt=Integer.parseInt(tenantid);
				
			}
			assetList=tenantDao.getTenantAssetListbyPrptyId(userId,prtyId,tenantidInt);
		}
			catch(Exception e){
				logger.error("Error while  getTenantAssetListbyPrptyId", e);
				
			}
		
		return assetList;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<TenantDetailsDTo> getTenantListByPrtyId(String propertyId, int userId,int roleid) {
		List<TenantDetailsDTo> tenantList=null;
		int prtyId=0;
		Integer ownerid=null,tntid=null;
		 
		try {
			if(!propertyId.isEmpty()) {
				prtyId=Integer.parseInt(propertyId);
			}
			if(roleid==3) {
				
				 tntid=maaDao.getTntid(userId,roleid);
				 ownerid=maaDao.getOwnerid(userId,roleid,tntid,prtyId);
				 tenantList=tenantDao.getTenantListByPrtyId(prtyId,tntid,roleid,ownerid);
				 }
			else if(roleid==4) {
				tntid=maaDao.getTntid(userId,roleid);
				 ownerid=maaDao.getOwnerid(userId,roleid,tntid,prtyId);
				tenantList=tenantDao.getTenantListByPrtyId(prtyId,tntid,roleid,ownerid);
			}else {
				tenantList=tenantDao.getTenantListByPrtyId(prtyId,null,roleid,null);
			}
			//tenantList=tenantDao.getTenantListByPrtyId(prtyId,tntid,roleid,ownerid);
				
			
			
		}
			catch(Exception e){
				logger.error("Error while  getTenantListByPrtyId", e);
			}
		
		return tenantList;
	}
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteTenant(String tntId,String prtptyid,int userId) {

		String message = null;
		int tenantId = 0,prtyidInt=0;
		try {
			
			if (!tntId.isEmpty()) {
				tenantId = Integer.parseInt(tntId);
			}
			if (!prtptyid.isEmpty()) {
				prtyidInt = Integer.parseInt(prtptyid);
			}
			TenantDetailsEntity tenantObj = tenantDao.getTenantByTenantId(tenantId);
if(tenantObj!=null) {
			tenantObj.setStatus(0);
			try {
				tenantDao.updateTenant(tenantObj);
				message = "Tenant deleted successfully";
			} catch (Exception e) {
				logger.error("Error while  deleteTenant", e);

			}
}
			AptUserProperties uprop=maaDao.getUserPropertiesbyUserid(tenantObj.getTusrid(),prtyidInt);
			if(uprop!=null) {
				uprop.setStatus(0);	
				ownerDao.updateOwnerProp(uprop);
			}
			
			//List<AssetDetails> asset1=maaDao.getAssetListByprtyIdTenant(userId, prtyidInt, tenantId);
			List<AssetDetails> asset=maaDao.getAssetListByprtyIdTenantForDelete(userId, prtyidInt, tenantId);
			for (AssetDetails assetDetails : asset) {
				assetDetails.setTenantId(0);
				assetDetails.setOcc_by("V");
				assetDetails.setStatus(0);
				maaDao.updateAsset(assetDetails);
			}
			


		} catch (Exception e) {
			logger.error("Error while  deleteTenant", e);

		}
		return message;

	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void UpdateTenantDetails(int userId, String propertyId, String etenant_name, String prptyName, String email,
			String etenant_contact, String eassetNo, String eaddress, String eadvamount, String idno, String ejoin_date,
			String eend_date, String ecomments, String chkBox, String tntImgName,
			String tntIdImgName,String tenantId,String[] flatObjArr) {
		try {
			int status = 0;
			int ast_status = 0;
			if (chkBox!=null) {
				status = 1;
			} else {
				status = 0;
			}
			int prtyid = 0,  tntId = 0, advamount=0;
			
			if (!propertyId.isEmpty()) {
				prtyid = Integer.parseInt(propertyId);
			}
			if (!tenantId.isEmpty()) {
				tntId = Integer.parseInt(tenantId);
			}
			if (!eadvamount.isEmpty()) {
				advamount = Integer.parseInt(eadvamount);
			}
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date joindate = sdf.parse(ejoin_date);
			java.util.Date enddate = sdf.parse(eend_date);
			
			
			
			TenantDetailsEntity tenantObj=tenantDao.getTenantByTenantId(tntId);
			if(tenantObj!=null) {
			tenantObj.setTenant_name(etenant_name);
			tenantObj.setTenant_email(email);
			tenantObj.setTenant_contact(etenant_contact);
			tenantObj.setAddress(eaddress);
			tenantObj.setAdvamount(advamount);
			tenantObj.setId_number(idno);
			tenantObj.setJoin_date(joindate);
			tenantObj.setEnd_date(enddate);
			tenantObj.setComments(ecomments);
			if(!tntImgName.isEmpty()) {
			tenantObj.setPics(tntImgName);
			}
			if(!tntIdImgName.isEmpty()) {
			tenantObj.setId_pics(tntIdImgName);
			}
			tenantObj.setStatus(status);
			tenantDao.updateTenant(tenantObj);
			ownerDao.updateUser(tenantObj.getTusrid(),email,status,prtyid);
			}
			
			List<String> unitNoList=new LinkedList();
			
			List<String> flatNolist=maaDao.getAssetTenant(userId, prtyid, tntId);
				
					if (!eassetNo.isEmpty()) {
						String[] arr = eassetNo.split(",");
						
								for (String flat : arr) {
									unitNoList.add(flat.trim());
								}
								if(flatNolist.equals(unitNoList)) {
									for (String flat1 : flatNolist) {
										AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, flat1, userId, 0);
										asset.setTenantId(tntId);
										if (flatObjArr != null) {
											for (String str : flatObjArr) {
												
												String unitval = str;
											String[] unitArr = unitval.split("_");

											String unitVal = unitArr[0];
											if(flat1.equalsIgnoreCase(unitVal)) {
												String occby_new = unitArr[1];
												asset.setOcc_by(occby_new);
											if (occby_new.equalsIgnoreCase("T")) {
													ast_status = 1;
													asset.setStatus(ast_status);
												}else {
													ast_status = 0;
													asset.setStatus(ast_status);
												}
											}
											maaDao.updateAsset(asset);
											}
											}
									}
								}
								else {		
								
					List<String> union = new ArrayList(flatNolist);
					union.addAll(unitNoList);
					List<String> intersection = new ArrayList(flatNolist);
					intersection.retainAll(unitNoList);
					List<String> unAssignList = new ArrayList(flatNolist);
					unAssignList.removeAll(intersection);
					List<String> assignList = new ArrayList(unitNoList);
					assignList.removeAll(intersection);
					for (String flat1 : unAssignList) {
						AssetDetails asset=maaDao.getAssetIdByFlatTenanat(prtyid, flat1, userId, tntId);
						asset.setTenantId(0);
						String occBy=asset.getOcc_by();
						
						if(occBy.equalsIgnoreCase("T")) {
							asset.setOcc_by("V");
							asset.setStatus(0);
						}else {
							
						}
						maaDao.updateAsset(asset);
					}
					
					
					for (String flat1 : assignList) {
						
						AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, flat1, userId, 0);
						asset.setTenantId(tntId);
						if (flatObjArr != null) {
							for (String str : flatObjArr) {
								
								String unitval = str;
							String[] unitArr = unitval.split("_");

							String unitVal = unitArr[0];
							
							
							if(flat1.equalsIgnoreCase(unitVal)) {
								String occby_new = unitArr[1];
								asset.setOcc_by(occby_new);
							
								
							if (occby_new.equalsIgnoreCase("T")) {
								
									ast_status = 1;
									asset.setStatus(ast_status);

								}else {
									ast_status = 0;
									asset.setStatus(ast_status);
								}
							}
							maaDao.updateAsset(asset);
							}
								
							}
					

				}

								//	if(eassetNo.isEmpty()&&unAssignList.isEmpty()) {
						//System.out.println("came to no asset selected..");
					}
					}
								
					else {
						for (String flat : flatNolist) {
							AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, flat, userId, 0);
							if(null!=asset) {
								asset.setTenantId(0);
								asset.setOcc_by("V");
								maaDao.updateAsset(asset);
							}
						}
					}
		} catch (Exception e) {
			logger.error("Error while  saveOwnerDetails", e);

		}
	}
	
	
	
}
