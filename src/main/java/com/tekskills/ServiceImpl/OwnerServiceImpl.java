package com.tekskills.ServiceImpl;

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
import com.tekskills.DTO.OwnerDetailsDTo;
import com.tekskills.DTO.TenantDetailsDTo;
import com.tekskills.Service.OwnerService;
import com.tekskills.entity.ApartmentUserInfoEntity;
import com.tekskills.entity.AptUserProperties;
import com.tekskills.entity.AptUserRoles;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.OwnerDetails;
import com.tekskills.util.SendHtmlEmailNew;

@Service
@PropertySource("/WEB-INF/Mail.properties")
public class OwnerServiceImpl implements OwnerService {
	@Autowired
	private MaaDao maaDao;
	@Autowired
	private OwnerDao ownerDao;
	@Autowired
	private Environment env;
	private static final Logger logger = Logger.getLogger(MaaServiceImpl.class);
	@Autowired
	private TenantDao tenantDao;
	@Autowired
	private SendHtmlEmailNew newEmail;
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<OwnerDetailsDTo> getOwnerByprtyId(int userId, String propertyId,int roleid) {
		int prtyId = 0;
		List<OwnerDetailsDTo> ownerList = null;
		int ownerid=0;
		int tntid=0;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
				if(roleid==3) {
				
				// tntid=maaDao.getTntid(userId,roleid);
				 ownerid=maaDao.getOwnerid(userId,roleid,tntid,prtyId);
				 ownerList = ownerDao.getOwnerListByprtyId(userId, prtyId,ownerid,tntid,roleid);
				}
				else if(roleid==4) {
					 tntid=maaDao.getTntid(userId,roleid);
					//String ownrarr =maaDao.getOwneridArry(userId,roleid,tntid,prtyId);
					ownerList = ownerDao.getOwnerListByTenant(userId, prtyId,0,tntid,roleid);
					
				}
				else {
					ownerList = ownerDao.getOwnerListByprtyId(userId, prtyId,ownerid,tntid,roleid);
				}
				
				
				
			}

		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyId", e);

		}

		return ownerList;
	}

	@Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void saveOwnerDetails(int userId, String propertyId, String flatno, String uPID, String mobile,
                    String ownerName, String altMobile, String emailId, String address, String notes, String ownrImgName,
                    String ownrIdImgName, String occ_by, String prptyName) {
            try {
                    int status = 0;
                    int prtyid = 0, flatNoVal = 0;
                    String password = "123456";
                    Date register_on = new Date();
                    if (!propertyId.isEmpty()) {
                            prtyid = Integer.parseInt(propertyId);
                    }
            
                    
                    ApartmentUserInfoEntity getUser = maaDao.getUserInfoByMail(emailId);
                    if (getUser == null) {
                            ApartmentUserInfoEntity aptUserInfo = new ApartmentUserInfoEntity();
                            aptUserInfo.setActive(1);
                            aptUserInfo.setEmail(emailId);
                            aptUserInfo.setPassword(password);
                            aptUserInfo.setRegister_on(register_on);
                            // aptUserInfo.setRole(4);
                            int own_userid = maaDao.saveRegistration(aptUserInfo);
                   
                            
                            
                            
                            AptUserRoles roleObj=maaDao.getRolesByUseriD(own_userid, 3);
                            if(roleObj==null) {
                           AptUserRoles userRole = new AptUserRoles();
                            
                            userRole.setRole(3); // role 3=owner--
                            userRole.setUserid(own_userid);
                            userRole.setStatus(1);
                            int tblpk_role = maaDao.saveAptUserRoles(userRole);
                            }
            
                    AptUserProperties usrPropObj = new AptUserProperties();
                    usrPropObj.setPrtyid(prtyid);
                    usrPropObj.setUserid(own_userid);
                    usrPropObj.setStatus(1);
                    usrPropObj.setRole(3);
                    maaDao.saveUserProperty(usrPropObj);
                    OwnerDetails owner = new OwnerDetails();
                    owner.setAddress(address);
                    owner.setAltcontact(altMobile);
                    owner.setContact(mobile);
                    owner.setEmail(emailId);
                    owner.setId_pic(ownrIdImgName);
                    owner.setName(ownerName);
                    owner.setNote(notes);
                    owner.setPic(ownrImgName);
                   
                    owner.setUpiid(uPID);
                    owner.setRegister_on(register_on);
                    owner.setUserid(userId);
                    owner.setStatus(1);
                    owner.setOusrid(own_userid);
                    int ownerid = ownerDao.saveOwner(owner);

                    if (flatno != null) {
                            String[] arr = flatno.split(",");
                            for (String flat : arr) {

                                    String unitval = flat;
                                    String[] unitArr = unitval.split("_");

                                    String unitVal = unitArr[0];
                                    String occby_new = unitArr[1];
                                    /*if (uVal != null) {
                                            flatNoVal = Integer.parseInt(uVal);
                                    }*/
                                    if (occby_new.equalsIgnoreCase("O")) {
                                            status = 1;

                                    }
                                    AssetDetails asset = maaDao.getAssetIdByFlat(prtyid, unitVal, userId,0);
                                    if(asset!=null) {
                                    asset.setOwnerid(ownerid);
                                    String occBy=asset.getOcc_by();
                                    
                                    if(occBy!=null) {
                                            if(occBy.equalsIgnoreCase("T")) {
                                                    
                                            }
                                    }else {
                                            asset.setOcc_by(occby_new);
                                    }
                                    asset.setStatus(status);
                                    maaDao.updateAsset(asset);
                                    }

                            }

                    }
                       /*if (own_userid > 0) {
                                    OwnerDetails owner_new = ownerDao.getOwnerByOwnerid(ownerid);
                                    if (owner_new != null) {
                                            owner_new.setOusrid(own_userid);
                                            ownerDao.updateOwner(owner_new);
                                    }
                            }*/
                            
                           
                    } else {
                    	OwnerDetails ownerObj=ownerDao.getownerBymail(emailId);
                    	if(ownerObj!=null) {
                            
                    		ownerObj.setAddress(address);
                    		ownerObj.setAltcontact(altMobile);
                    		ownerObj.setContact(mobile);
                    		ownerObj.setEmail(emailId);
                    		ownerObj.setId_pic(ownrIdImgName);
                    		ownerObj.setName(ownerName);
                    		ownerObj.setNote(notes);
                    		ownerObj.setPic(ownrImgName);
                          
                    		ownerObj.setUpiid(uPID);
                    		ownerObj.setRegister_on(register_on);
                    		ownerObj.setUserid(userId);
                    		ownerObj.setStatus(1);
                    		ownerObj.setOusrid(getUser.getId());
                    		 ownerDao.updateOwner(ownerObj);
                    		 if (flatno != null) {
                                 String[] arr = flatno.split(",");
                                 for (String flat : arr) {

                                         String unitval = flat;
                                         String[] unitArr = unitval.split("_");

                                         String unitVal = unitArr[0];
                                         String occby_new = unitArr[1];
                                         
                                         if (occby_new.equalsIgnoreCase("O")) {
                                                 status = 1;

                                         }
                                         AssetDetails asset = maaDao.getAssetIdByFlat(prtyid, unitVal, userId,0);
                                         asset.setOwnerid(ownerObj.getOwnrid());
                                         asset.setOcc_by(occby_new);
                                         asset.setStatus(status);

                                         maaDao.updateAsset(asset);

                                 }
                    	}
                    		
                          }
                    	else {
                    		OwnerDetails owner = new OwnerDetails();
                            owner.setAddress(address);
                            owner.setAltcontact(altMobile);
                            owner.setContact(mobile);
                            owner.setEmail(emailId);
                            owner.setId_pic(ownrIdImgName);
                            owner.setName(ownerName);
                            owner.setNote(notes);
                            owner.setPic(ownrImgName);
                           
                            owner.setUpiid(uPID);
                            owner.setRegister_on(register_on);
                            owner.setUserid(userId);
                            owner.setStatus(1);
                            owner.setOusrid(0);
                            int ownerid = ownerDao.saveOwner(owner);
                            if (flatno != null) {
                                String[] arr = flatno.split(",");
                                for (String flat : arr) {

                                        String unitval = flat;
                                        String[] unitArr = unitval.split("_");

                                        String unitVal = unitArr[0];
                                        String occby_new = unitArr[1];
                                        
                                        if (occby_new.equalsIgnoreCase("O")) {
                                                status = 1;

                                        }
                                        AssetDetails asset = maaDao.getAssetIdByFlat(prtyid, unitVal, userId,0);
                                        asset.setOwnerid(ownerid);
                                        asset.setOcc_by(occby_new);
                                        asset.setStatus(status);

                                        maaDao.updateAsset(asset);

                                }
                   	}
                    	}
                    	
                    	 AptUserProperties usrPropObj = new AptUserProperties();
                         usrPropObj.setPrtyid(prtyid);
                         usrPropObj.setUserid(getUser.getId());
                         usrPropObj.setRole(3);
                         usrPropObj.setStatus(1);
                         maaDao.saveUserProperty(usrPropObj);
                         AptUserRoles roleObj=maaDao.getRolesByUseriD(getUser.getId(), 3);
                         if(roleObj==null) {
                        AptUserRoles userRole = new AptUserRoles();
                         
                         userRole.setRole(3); // role 3=owner--
                         userRole.setUserid(getUser.getId());
                         userRole.setStatus(1);
                         int tblpk_role = maaDao.saveAptUserRoles(userRole);
                         
                         }
                         
                    } 
                            String tomail=emailId;
                            String subject="Maa property access for owner";
                            String htmlfile=env.getProperty("ownerhtml");
                            
                    
                            newEmail.sendUserMail(tomail, subject, htmlfile,ownerName,emailId,flatno,prptyName,password);
                             } catch (Exception e) {
                    logger.error("Error while  saveOwnerDetails", e);

            }

    }

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void UpdateOwnerDetails(int userId, String propertyId, String ownerid, String flatArr, String uPID,
			String mobile, String ownerName, String altMobile, String emailId, String address, String notes,
			String ownrImgName, String ownrIdImgName, String occ_by, String chkBox,String[] flatObjArr) {
		try {
			int status = 0;
			int ast_status = 0;
			
			int prtyid = 0,  onwrId = 0;
		
			if (!propertyId.isEmpty()) {
				prtyid = Integer.parseInt(propertyId);
			}
			if (!ownerid.isEmpty()) {
				onwrId = Integer.parseInt(ownerid);
			}
			if (chkBox!=null) {
				status = 1;
			} else {
				status = 0;
			}
			
			OwnerDetails owner = ownerDao.getOwnerByOwnerid(onwrId);
			if(owner!=null) {
			owner.setAddress(address);
			owner.setAltcontact(altMobile);
			owner.setContact(mobile);
			owner.setEmail(emailId);
			
			owner.setName(ownerName);
			owner.setNote(notes);
			if(!ownrIdImgName.isEmpty()) {
			owner.setId_pic(ownrIdImgName);
			}
			if(!ownrImgName.isEmpty()) {
			owner.setPic(ownrImgName);
			}
			owner.setUpiid(uPID);
			owner.setStatus(status);
			
			
			ownerDao.updateOwner(owner);
			ownerDao.updateUser(owner.getOusrid(),emailId,status,prtyid);
			}
			
			List<String> unitNoList=new ArrayList<>();
			
			List<String> flatNolist=maaDao.getFlatNoByOwner(userId, prtyid, onwrId);
			
			if (!flatArr.isEmpty()) {
				String[] arr = flatArr.split(",");
				if(arr!=null) {
					//unitNoList = Arrays.asList(arr); 
						for (String flat : arr) {
							
							unitNoList.add(flat.trim());
						}
				}
				
		
			List<String> union = new LinkedList(flatNolist);
			
			if(flatNolist.equals(unitNoList)) {
				for (String flat1 : flatNolist) {
					if (flatObjArr != null) {
						for (String str : flatObjArr) {
							
							String unitval = str;
						String[] unitArr = unitval.split("_");

						String unitVal = unitArr[0];
						AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, unitVal, userId, onwrId);
						asset.setOwnerid(onwrId);
						if(asset.getOcc_by().equalsIgnoreCase("T")) {
						}else {
							String occby_new = unitArr[1];
							asset.setOcc_by(occby_new);
						}
						maaDao.updateAsset(asset);
						}
					}
					
				}
			}
			else {
				
			union.addAll(unitNoList);
			List<String> intersection = new ArrayList(flatNolist);
			intersection.retainAll(unitNoList);
			List<String> unAssignList = new ArrayList(flatNolist);
			unAssignList.removeAll(intersection);
			List<String> assignList = new ArrayList(unitNoList);
			assignList.removeAll(intersection);
			for (String flat1 : unAssignList) {
				AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, flat1, userId, onwrId);
				asset.setOwnerid(0);
				String occBy=asset.getOcc_by();
				if(occBy.equalsIgnoreCase("T")) {
				}else {
					asset.setOcc_by(null);
					asset.setStatus(0);
				}
				maaDao.updateAsset(asset);
			}
			
			
			if(!assignList.isEmpty()) {
			for (String flat1 : assignList) {
				System.out.println("came to assign flat "+flat1);
				AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, flat1, userId, 0);
			
				asset.setOwnerid(onwrId);
				if (flatObjArr != null) {
					for (String str : flatObjArr) {
						
						String unitval = str;
					String[] unitArr = unitval.split("_");

					String unitVal = unitArr[0];
					
					
					if(flat1.equalsIgnoreCase(unitVal)) {
						String occby_new = unitArr[1];
						
						asset.setOcc_by(occby_new);
					
						
					if (occby_new.equalsIgnoreCase("O")) {
						
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
			}else {
				if (flatObjArr != null) {
					for (String str : flatObjArr) {
						
						String unitval = str;
					String[] unitArr = unitval.split("_");

					String unitVal = unitArr[0];
					AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, unitVal, userId, 0);
						String occby_new = unitArr[1];
						asset.setOcc_by(occby_new);
					
					maaDao.updateAsset(asset);
					}
				}
			}
			}
			}
			else {
				
				for (String flat : flatNolist) {
					AssetDetails asset=maaDao.getAssetIdByFlat(prtyid, flat, userId, 0);
					if(asset!=null) {
					asset.setOwnerid(0);
					if(asset.getOcc_by().equalsIgnoreCase("T")) {
					}else {
						String occby_new = null;
						asset.setOcc_by(occby_new);
					}
					
				
				maaDao.updateAsset(asset);
					}
				}
				
			}
			
		} catch (Exception e) {
			logger.error("Error while  UpdateOwnerDetails", e);

		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteOwner(int userId, String propertyId, String iOwnrId) {

		String message = null;
		int onwrId = 0;
		int prtyid=0;
		try {
			
			 if (!propertyId.isEmpty()) { prtyid = Integer.parseInt(propertyId); }
			 
			if (!iOwnrId.isEmpty()) {
				onwrId = Integer.parseInt(iOwnrId);
			}
			OwnerDetails owner = ownerDao.getOwnerByOwnerid(onwrId);
			if(owner!=null) {
				owner.setStatus(0);
				ownerDao.updateOwner(owner);
			}
			
			
			AptUserProperties uprop=maaDao.getUserPropertiesbyUserid(owner.getOusrid(),prtyid);
			if(uprop!=null) {
				uprop.setStatus(0);	
				ownerDao.updateOwnerProp(uprop);
			}
			
			List<AssetDetails> asset=maaDao.getAssetListByprtyIdOwner(userId, prtyid, onwrId);
			for (AssetDetails assetDetails : asset) {
				assetDetails.setOwnerid(0);
				if(assetDetails.getOcc_by().equalsIgnoreCase("O")) {
				assetDetails.setOcc_by(null);
				}
				assetDetails.setStatus(0);
				maaDao.updateAsset(assetDetails);
			}
			try {
				ownerDao.updateOwner(owner);
				message = "Owner deleted successfully";
			} catch (Exception e) {
				logger.error("Error while  updateOwner", e);

			}

		} catch (Exception e) {
			logger.error("Error while  deleteOwner", e);

		}
		return message;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<TenantDetailsDTo> getTenantsByOwner(int userId, String prtyid, int roleid, String ownerid) {
		List<TenantDetailsDTo> tenantList=null;
		int prtyId=0,owneridint=0,tntid=0;
		 
		try {
			if(!prtyid.isEmpty()) {
				prtyId=Integer.parseInt(prtyid);
			}
			if(!ownerid.isEmpty()) {
				owneridint=Integer.parseInt(ownerid);
			}
			//tenantList=tenantDao.getTenantListByPrtyId(prtyId,tntid,roleid,owneridint);
			tenantList=tenantDao.getTenantListByPrtyIdOwner(prtyId,tntid,roleid,owneridint);
				
			
		}
			catch(Exception e){
				logger.error("Error while  getTenantListByPrtyId", e.getCause());
			}
		
		return tenantList;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public String getPasswordByMail(String mail,String prtyname) {
		String password=null;
		try {
			password=ownerDao.getPasswoordByMail(mail);
			String subject="Password Recovery Request";
			 newEmail.sendForgotPasswordMail(mail, subject,password,prtyname);
		}catch(Exception e) {
			logger.error("Error while  getPasswordByMail", e.getCause());
		}
		
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String validateOwnerMail(String prtyid, String ownermail, String type) {
		int prtyidInt=0;
		String message=null;
		try {
			if(!prtyid.isEmpty()) {
				prtyidInt=Integer.parseInt(prtyid);
			}
			message=ownerDao.validateOwnerMail(ownermail,prtyidInt,type);
			
			 
		}catch(Exception e) {
			logger.error("Error while  validateOwnerMail", e.getCause());
		}
		
		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String getOccupiedByFlat(int userId, String propertyId, String flat) {
		String occupiedBy=null;
		int prtyidInt=0;
		try {
			if(!propertyId.isEmpty()) {
				prtyidInt=Integer.parseInt(propertyId);
			}
			occupiedBy = maaDao.getOccupiedByFlat(prtyidInt, flat, userId);
		}catch(Exception e) {
			logger.error("Error while  getOccupiedByFlat", e);
		}
		
		return occupiedBy;
	}
}
