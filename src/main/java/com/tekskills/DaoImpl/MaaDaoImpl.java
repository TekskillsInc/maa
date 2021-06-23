package com.tekskills.DaoImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekskills.DAO.MaaDao;
import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.MeterReadingsDTO;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.DTO.SecurityBean;
import com.tekskills.entity.ApartmentDetialsEntity;
import com.tekskills.entity.ApartmentUserInfoEntity;
import com.tekskills.entity.AptUserProperties;
import com.tekskills.entity.AptUserRoles;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.TermsAndConditions;
import com.tekskills.entity.VendorEntity;

@Repository
public class MaaDaoImpl implements MaaDao {
	@Autowired
	private SessionFactory sessfact;
	  private static final Logger logger = Logger.getLogger(MaaDaoImpl.class);
	  
	@Override
	public int saveRegistration(ApartmentUserInfoEntity aptUserInfo) {
		
		int id=0;
		try {
			Session session=sessfact.getCurrentSession();
			id=(int) session.save(aptUserInfo);
		} catch (Exception e) {
			logger.error("Error in method saveRegistration", e);
		}
		return id;
	}
	@Override
	public int saveBuildingDetails(ApartmentDetialsEntity aptDetailsInfo) {
		int i=0;
	try {
		Session session=sessfact.getCurrentSession();
		i= (int) session.save(aptDetailsInfo);
		
		} catch (Exception e) {
			logger.error("Error in method saveBuildingDetails", e);
		}
	return i;
	}
	@Override
	
	public ApartmentUserInfoEntity getUserDetailsBymail(String username, String password,int roleid) {
		ApartmentUserInfoEntity aptuserObj=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=" from ApartmentUserInfoEntity where email='"+username+"' and password='"+password+"' ";
			aptuserObj= (ApartmentUserInfoEntity) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getUserDetailsBymail", e);
		}
		
		return aptuserObj;
	}
	@Override
	public List<Integer> getPropertListByUserid(int userId,int roleid) {
		List<Integer> tblpk_role=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(roleid==1) {
				 hql="select buildingid from maa_user_details";	
			
			}
			else {
				 hql="select up.prptyid from maa_user_properties up inner join maa_user_roles ur on up.userid=ur.userid and up.role=ur.role where up.userid="+userId+" and ur.role="+roleid+" and up.status=1" + 
							" ";
			}
			
			tblpk_role= session.createSQLQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getPropertListByUserid", e);
		}
		
		return tblpk_role;
	}
	@Override
	public ApartmentDetialsEntity gePropertyDetailsInfoByUserId(int userIdInt, int propertyIdInt) {
		ApartmentDetialsEntity apartmentDetialsObj=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from ApartmentDetialsEntity where userid="+userIdInt+" and buildingid="+propertyIdInt+" ";
			apartmentDetialsObj= (ApartmentDetialsEntity) session.createQuery(hql).uniqueResult();
			//.setResultTransformer(new AliasToBeanResultTransformer(ApartmentDetialsEntity.class))
		}catch (Exception e) {
			logger.error("Error in method getPropertListByUserid", e);
		}
		
		return apartmentDetialsObj;
	}
	@Override
	public int updatePropertyByBuilding(ApartmentDetialsEntity aptDetailsInfo) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(aptDetailsInfo);
		}catch (Exception e) {
			logger.error("Error in method getPropertListByUserid", e);
		}
		return 0;
	}
	@Override
	public PropertyDto getPropertByProptyid(int userid, int propertyId,int roleid) {
		PropertyDto property=null;
		try {
			Session session=sessfact.getCurrentSession();
			
			String hql=null;
			
			 hql="exec getPropertyByprtyid @prptyid ="+propertyId+",@userid ="+userid+",@roleid ="+roleid+"";
			
			property= (PropertyDto) session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(PropertyDto.class)).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getPropertListByUserid", e);
		}
		
		System.out.println("property-------"+property);
		return property;
	}
	@Override
	public int getpropertyIdBtUserid(int userId) {
		int propertyId=0;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select  buildingid from maa_user_details where userid="+userId+" ";
			propertyId= (int) session.createSQLQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getpropertyIdBtUserid", e);
		}
		return propertyId;
	}
	@Override
	public List<AssetDetails> getAssetListByprtyIdTenant(int userId, int prtyId,int tenantid) {
		List<AssetDetails> assetList=null;
		
		try {
			Session session=sessfact.getCurrentSession();
		
			String hql=null;
		if(tenantid==0)
		{
			 hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyId+" and ownerid!=0 and occ_by ='V'";
		}
			else {
				hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyId+" and ownerid!=0 and occ_by='T' and tenantId="+tenantid+"";}
			assetList= session.createQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getPropertListByUserid", e);
		}	
		return assetList;
	}
	@Override
	public List<String> getAssetTenant(int userId, int prtyId,int tenantid) {
		List<String> assetList=null;
		
		try {
			Session session=sessfact.getCurrentSession();
		
			String hql=null;
		
			 hql="select flatno from AssetDetails where userid="+userId+" and prtyid ="+prtyId+"  and occ_by ='T' and tenantId="+tenantid+"";
			assetList= session.createQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getAssetTenant", e);
		}	
		return assetList;
	}
	
	@Override
	public List<AssetDetails> getAssetListByprtyIdOwner(int userId, int prtyId,int ownerid) {
		List<AssetDetails> assetList=null;
		
		
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(ownerid==0) {
			 hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyId+" and ownerid=0 ";
			}
			else 
				 {hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyId+" and ownerid="+ownerid+"";}
			assetList= session.createQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyIdOwner", e);
		}	
		return assetList;
	}
	@Override
	public void saveAssetByProperty(AssetDetails asset) {
	
		try {
			Session session=sessfact.getCurrentSession();
			session.save(asset);
			
		}catch (Exception e) {
			logger.error("Error in method saveAssetByProperty", e);
		}
	}
	@Override
	public AssetDetails getAssetByAssetId(int iprtyid,  int iuserid, int iassetid) {
		AssetDetails asset=null;
		
		try {
			Session session=sessfact.getCurrentSession();
			
			String hql="from AssetDetails where userid="+iuserid+" and prtyid ="+iprtyid+"  and assetid ="+iassetid+"";
			asset= (AssetDetails) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getAssetByAssetId", e);
		}	
		return asset;
	}
	@Override
	public void updateAsset(AssetDetails asset) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(asset);
			
		}catch (Exception e) {
			logger.error("Error in method updateAsset", e);
		}
		
	}
	@Override
	public AssetDetails getAssetIdByFlat(int prtyid, String flatNoVal, int userId,int owner) {
AssetDetails asset=null;
		
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(owner==0) {
			 hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyid+"  and flatno ='"+flatNoVal+"'";
			}
			else {
				hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyid+"  and flatno ='"+flatNoVal+"' and ownerid= "+owner+"";
			}
			asset= (AssetDetails) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getAssetByAssetId", e);
		}	
		return asset;
	}
	@Override
	public AssetDetails getAssetIdByFlatTenanat(int prtyid, String flatNoVal, int userId,int tntId) {
AssetDetails asset=null;
		
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(tntId==0) {
			 hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyid+"  and flatno ='"+flatNoVal+"'";
			}
			else {
				hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyid+"  and flatno ='"+flatNoVal+"' and tenantId= "+tntId+"";
			}
			asset= (AssetDetails) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getAssetByAssetId", e);
		}	
		return asset;
	}
	@Override
	public int saveAptUserRoles(AptUserRoles userRole) {
		int id=0;
		try {
			Session session=sessfact.getCurrentSession();
			id=(int) session.save(userRole);
		} catch (Exception e) {
			logger.error("Error in method saveAptUserRoles", e);
		}
		return id;
	}
	@Override
	public ApartmentUserInfoEntity getUserInfoByUserid(int userIdInt) {
		ApartmentUserInfoEntity userInfo=null;
		try {
			Session session=sessfact.getCurrentSession();
			
			String hql="from ApartmentUserInfoEntity where userid="+userIdInt+" ";
			userInfo= (ApartmentUserInfoEntity) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getAssetByAssetId", e);
		}	
		return userInfo;
	}
	@Override
	public void updateUserInfo(ApartmentUserInfoEntity aptUserInfo) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(aptUserInfo);
			
		} catch (Exception e) {
			logger.error("Error in method updateUserInfo", e);
		}
		
	}
	@Override
	public AptUserRoles getRolesByUseriD(Integer userid,int roleid) {
		AptUserRoles userrole=null;
		try {
		Session session=sessfact.getCurrentSession();
		
		String hql="from AptUserRoles where userid="+userid+" and role="+roleid+"";
		userrole= (AptUserRoles) session.createQuery(hql).uniqueResult();
	}catch (Exception e) {
		logger.error("Error in method getRolesByUseriD", e);
	}	
		return userrole;
	}
	@Override
	public ApartmentUserInfoEntity getUserInfoByMail(String mgr_email) {
		ApartmentUserInfoEntity userInfo=null;
		try {
		Session session=sessfact.getCurrentSession();
		
		String hql="from ApartmentUserInfoEntity where email='"+mgr_email+" '";
		userInfo= (ApartmentUserInfoEntity) session.createQuery(hql).uniqueResult();
	}catch (Exception e) {
		logger.error("Error in method getUserInfoByMail", e);
	}	
		return userInfo;
	}
	@Override
	public AptUserProperties getPropertiesByRole(int tblpk, Integer id) {
		AptUserProperties userrole=null;
		try {
		Session session=sessfact.getCurrentSession();
		
		String hql="from AptUserProperties where userid="+id+" and userrole="+tblpk+"";
		userrole= (AptUserProperties) session.createQuery(hql).uniqueResult();
	}catch (Exception e) {
		logger.error("Error in method getPropertiesByRole", e);
	}	
		return userrole;
	}
	@Override
	public void saveUserProperty(AptUserProperties usrPropObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(usrPropObj);
			
		} catch (Exception e) {
			logger.error("Error in method saveUserProperty", e);
		}
		
	}
	@Override
	public List<AssetDetailsDto> getAssetListByprtyId(int userId, int prtyId, int roleid,int ownerid,int tntid) {
		List<AssetDetailsDto> assetList=null;
		
		try {
			Session session=sessfact.getCurrentSession();
			String hql="exec getAllAssetByPropertyUser @userid="+userId+",@prptyid ="+prtyId+",@ownerid="+ownerid+",@tntid="+tntid+",@roleid="+roleid+"";
			assetList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(AssetDetailsDto.class)).list();
			
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyId", e);
		}	
		return assetList;
	}
	
	@Override
	public List<AssetDetailsDto> getAssetListByprtyIdInvoice(Integer userId, int prtyId, Integer roleid) {
List<AssetDetailsDto> assetList=null;
		
		try {
			Session session=sessfact.getCurrentSession();
		if(roleid==2||roleid==1) {
			String hql="select assetid,flatno,ownerid,tenantId,occ_by from maa_assets_details where userid="+userId+" and prtyid ="+prtyId+" and occ_by in ('O','T','V') ";
		 assetList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(AssetDetailsDto.class)).list();
		}
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyId", e);
		}	
		return assetList;
		
	}

	@Override
	public AptUserProperties getUserPropertiesbyUserid(int ousrid, int propertyId) {
		AptUserProperties userProp=null;
		try {
			Session session=sessfact.getCurrentSession();
		
		String hql="from AptUserProperties where userid="+ousrid+" and prtyid= "+propertyId+" " + 
				" ";
		userProp= (AptUserProperties) session.createQuery(hql).uniqueResult();
	
	}catch (Exception e) {
		logger.error("Error in method getUserPropertiesbyUserid", e);
	}
		return userProp;
	}
	@Override
	public List<String> getFlatNoByOwner(int userId, int prtyid, int onwrId) {
		List<String> assetList =null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(onwrId==0) {
			 hql="select flatno from  AssetDetails where userid="+userId+" and prtyid ="+prtyid+" and ownerid=0 ";
			}
			else 
				 {hql="select flatno from AssetDetails where userid="+userId+" and prtyid ="+prtyid+" and ownerid="+onwrId+"";}
			assetList= session.createQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getFlatNoByOwner", e);
		}	
		return assetList;
	}
	@Override
	public Integer getOwnerid(int userId,int roleid,Integer tntid, int prtyId) {
		Integer ownerid=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(roleid==3) {
			 hql="select ownrid from  OwnerDetails where ousrid="+userId+"  ";
			 ownerid= (Integer) session.createQuery(hql).uniqueResult();
			}
			if(roleid==4 && tntid!=null ) {
				
				 hql="select ownerid from  AssetDetails where tenantId="+tntid+" and prtyid="+prtyId+" ";
				 ownerid= (Integer) session.createQuery(hql).uniqueResult();
			}
			
			
			
		}catch (Exception e) {
			logger.error("Error in method getOwnerid", e);
		}	
		return ownerid;
	}
	@Override
	public Integer getTntid(int userId, int roleid) {
		Integer tntid=null;
		
			Session session=sessfact.getCurrentSession();
			String hql=null;
			try {
				
			 hql="select tbl_id from  TenantDetailsEntity where tusrid="+userId+"  ";
			 tntid= (Integer) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getTntid", e);
		}	
		return tntid;
	}
	@Override
	public List<AssetDetails> getAssetListByprtyIdEdit(int userId, int prtyId, int roleid,int ownerid) {
List<AssetDetails> assetList1=new ArrayList<>();
List<AssetDetails> assetList2=new ArrayList<>();

		
		try {
			Session session=sessfact.getCurrentSession();
			String hql1="from AssetDetails where userid="+userId+" and prtyid="+prtyId+" and ownerid=0 ";
			 assetList1= session.createQuery(hql1).list();
			 String hql2="from AssetDetails where userid="+userId+" and prtyid ="+prtyId+" and  ownerid="+ownerid+"";
			 assetList2= session.createQuery(hql2).list();
			 assetList1.addAll(assetList2);
			
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyIdEdit", e);
		}	
		return assetList1;
	}
	@Override
	public MeterReadingsDTO getMeterReadingsForInvoice(int prtyIdInt, String flatNo, String readingType,String prvMonth,String month,String year) {
		MeterReadingsDTO meter=null;
	
		try {
			Session session=sessfact.getCurrentSession();
			 
			
			String hql1="exec getMeterReadingForInvoice @prtyid ="+prtyIdInt+", @flatno= '"+flatNo+"',@readingType ='"+readingType+"'," + 
					"@month='"+month+"'  ,@prvMonth = '"+prvMonth+"',@year ='"+year+"' ";
			meter= (MeterReadingsDTO) session.createSQLQuery(hql1).setResultTransformer(Transformers.aliasToBean(MeterReadingsDTO.class)).uniqueResult();
	
			
		}catch (Exception e) {
			logger.error("Error in method getMeterReadingsByFlat", e);
		}	
		
		return meter;
		
		
	}
	@Override
	public MeterReadingsEntity getMeterReadingsByFlat(int prtyIdInt, String flatNo,String month,String year) {
		MeterReadingsEntity meter=null;
	
		try {
			Session session=sessfact.getCurrentSession();
			
			String hql1="from MeterReadingsEntity where flatno='"+flatNo+"' and prtyid="+prtyIdInt+" and month='"+month+"' and year='"+year+"'";
			meter= (MeterReadingsEntity) session.createQuery(hql1).uniqueResult();
		
		}catch (Exception e) {
			logger.error("Error in method getMeterReadingsByFlat", e);
		}	
		
		return meter;
		
		
	}
	@Override
	public AssetDetails getAssetByFlat(int iprtyid, int userId, String iflatno) {
		AssetDetails assetList=null;
		
		
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(userId!=0) {
				 hql="from AssetDetails where userid="+userId+" and prtyid ="+iprtyid+" and flatno='"+iflatno+"'";
			}else {
				 hql="from AssetDetails where prtyid ="+iprtyid+" and flatno='"+iflatno+"'";
			}
			
			
			
			assetList= (AssetDetails) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyIdOwner", e);
		}	
		return assetList;
	}
	@Override
	public GSTEntity getGST(int prtyid) {
		GSTEntity gst=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			
			 hql="from GSTEntity where prtyid="+prtyid+"";
			
			 gst= (GSTEntity) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getGST", e);
		}	
		return gst;
	}
	@Override
	public List<ApartmentDetialsEntity> getUserDetails() {
		List<ApartmentDetialsEntity> userList=null;
		try {
			Session session=sessfact.getCurrentSession();
				String hql="from ApartmentDetialsEntity";	
				userList= session.createQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getUserDetails", e);
		}
		
		return userList;
	}
	@Override
	public String updateUserStatus(int stsId, int userId, int buildId) {
		try {
		Session session=sessfact.getCurrentSession();
		ApartmentDetialsEntity detailObj = (ApartmentDetialsEntity)session.get(ApartmentDetialsEntity.class, buildId);
		
		ApartmentUserInfoEntity infoObj = (ApartmentUserInfoEntity)session.get(ApartmentUserInfoEntity.class, userId);
		//String hql="from AptUserProperties where prtyid="+buildId+" and userid="+userId+"";	
		
		
		if(detailObj!=null) {
			detailObj.setStatus(stsId);
			session.update(detailObj);
			
		}
		if(infoObj!=null) {
			infoObj.setActive(stsId);
			session.update(infoObj);
		}
		try {
		String hql="update  maa_user_properties set status="+stsId+" where prptyid="+buildId+"";	
		Query query = session.createSQLQuery(hql);
	    query.executeUpdate();
		}catch(Exception e) {
			logger.error("Error in updating user properties by propertyid "+buildId, e);
		}
		//AptUserProperties proptyObj = (AptUserProperties) session.createQuery(hql).uniqueResult();
		/*if(proptyObj!=null) {
			proptyObj.setStatus(stsId);
			session.update(proptyObj);
			
		}*/
		}catch (Exception e) {
			logger.error("Error in method updateUserStatus", e);
		}
		return null;
	}
	@Override
	public GSTEntity getGSTById(int gstInt) {
		GSTEntity gst=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			
			 hql="from GSTEntity where tbl_pk="+gstInt+" ";
			
			 gst= (GSTEntity) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getGSTById", e);
		}	
		return gst;
	}
	@Override
	public SecurityBean getAllSecuredPwd() {
		SecurityBean sbean=null;
		
		try{
			Session session = sessfact.getCurrentSession();
			String sql="select * from TBL_PWD_SECURITY";
			sbean= (SecurityBean) session.createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SecurityBean.class)).uniqueResult();
			}
		catch (Exception ex) {
			logger.error("Exception raised in the method getAllSecuredPwd:", ex);
		}
		
		return sbean;
	}
	@Override
	public String checkPassword(int userid, String currentPassword) {
		String message=null;
		try {
			Session session = sessfact.getCurrentSession();
			String sql="select email from ApartmentUserInfoEntity  where userid="+userid +" and password='"+currentPassword+"' and active=1";
			message=(String) session.createQuery(sql).uniqueResult();
		}
		catch (Exception ex) {
			logger.error("Error in checkPassword---"+ex);
		}
		return message;
	}
	@Override
	public String changePassword(int userid, String currentPassword, String newPassword, String confirmPassword) {
		String message=null;
		try {
			Session session = sessfact.getCurrentSession();
			Query rs1=session.createQuery("Update  ApartmentUserInfoEntity  set  password='" +confirmPassword+"'  where userid=" + userid + " and active=1");
		    int i= rs1.executeUpdate();
				if(i>0){
					message = "success";
					}
				else {
					message = "Failed";
				} 
		}
		catch (Exception ex) {
			logger.error("Error in changePassword"+ex);
		}
		return message;
	}
	@Override
    public TermsAndConditions getTermsandConditions(int userid, int prptyid) {
           TermsAndConditions tandc=null;
           try {
                  Session session=sessfact.getCurrentSession();
           
           String sql="from TermsAndConditions where userId="+userid+" and prptyId="+prptyid+"";
           tandc= (TermsAndConditions) session.createQuery(sql).uniqueResult();
    
    }catch (Exception e) {
           logger.error("Error in method getTermsandConditions", e);
    }
           return tandc;
    }
    @Override
    public void saveTandC(TermsAndConditions termsObj) {
           try {
                  Session session=sessfact.getCurrentSession();
                  session.save(termsObj);
           } catch (Exception e) {
                  logger.error("Error in method saveTandC", e);
           }
           return ;
    }
    @Override
    public void updateTandC(TermsAndConditions termsObj) {
           try {
                  Session session=sessfact.getCurrentSession();
                  session.update(termsObj);
           } catch (Exception e) {
                  logger.error("Error in method updateTandC", e);
           }
           return ;
    }
    @Override
	public void showUserInWebSite(VendorEntity termsObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(termsObj);
		} catch (Exception e) {
			logger.error("Error in method updateTandC", e);
		}
		
	}
    @Override
	public String getMailByUserid(Integer userId) {
		 String mail=null;
         try {
                Session session=sessfact.getCurrentSession();
         
         String sql="select email from maa_user_info where userid="+userId+" ";
         mail= (String) session.createSQLQuery(sql).uniqueResult();
  
  }catch (Exception e) {
         logger.error("Error in method getTermsandConditions", e);
  }
         return mail;
	}
	@Override
	public String getBuildingNmaeByMail(String buldingMail) {
		 String name=null;
         try {
                Session session=sessfact.getCurrentSession();
         
         String sql="select email from maa_user_info where email='"+buldingMail+"'";
         name= (String) session.createSQLQuery(sql).uniqueResult();
  
  }catch (Exception e) {
         logger.error("Error in method getTermsandConditions", e);
  }
         return name;
	}
	@Override
	public String getOccupiedByFlat(int prtyidInt, String flat, int userId) {
		
		 String occBy=null;
         try {
                Session session=sessfact.getCurrentSession();
         
         String sql="select occ_by from maa_assets_details where prtyid='"+prtyidInt+"' and flatno='"+flat+"' and userid="+userId+"";
         occBy= (String) session.createSQLQuery(sql).uniqueResult();
  
  }catch (Exception e) {
         logger.error("Error in method getOccupiedByFlat", e);
  }
         return occBy;
	}
	@Override
	public String getOwneridArry(int userId, int roleid, int tntid, int prtyId) {
		String ownerid=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			hql="select stuff ((select ','+(cast(ownerid as varchar))  from maa_assets_details where tenantId="+tntid+" and prtyid="+prtyId+" for xml path ('')),1,1,'') as ownerid";
				 ownerid=  (String) session.createSQLQuery(hql).uniqueResult();
			
		}catch (Exception e) {
			logger.error("Error in method getOwnerid", e);
		}	
		return ownerid;
	}
	@Override
	public List<AssetDetails> getAssetListByprtyIdTenantForDelete(int userId, int prtyidInt, int tenantId) {
List<AssetDetails> assetList=null;
		
		try {
			Session session=sessfact.getCurrentSession();
		
			String 	hql="from AssetDetails where userid="+userId+" and prtyid ="+prtyidInt+" and  occ_by='T' and tenantId="+tenantId+"";
			assetList= session.createQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getPropertListByUserid", e);
		}	
		return assetList;
	}
	@Override
	public int getNoOfAssetsByPrty(int prtyid) {
		int unitCount=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select noofflats from ApartmentDetialsEntity where buildingid="+prtyid+"";
        unitCount= (int) session.createQuery(sql).uniqueResult();
 
 }catch (Exception e) {
        logger.error("Error in method getNoOfAssetsByPrty", e);
 }
		return unitCount;
	}
	@Override
	public int getAssetCount(int prtyid) {
		int assetCount=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select count(assetid) from maa_assets_details where prtyid="+prtyid+" ";
        assetCount= (int) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
        logger.error("Error in method getAssetCount", e);
 }
		return assetCount;
	}
	@Override
	public String[] getBankDetailsByProperty(Integer prptyid) {
		String[] stringArray = null ;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select bankAcntNo,ifscCode,accountname,upiid from maa_user_details where buildingid="+prptyid+" ";
    Object[] objectArray=     (Object[]) session.createSQLQuery(sql).uniqueResult();
 		// stringArray = Arrays.copyOf(objectArray,objectArray.length, String[].class);
					
 		stringArray = Arrays.stream(objectArray).toArray(String[]::new);
 }catch (Exception e) {
        logger.error("Error in method getAssetCount", e);
 }
		return stringArray;
	}
	@Override
	public Double getInvoiceAmountPaidByInvid(int invoiceid) {
		Double amountPaid=null;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select sum(paid_amt) from maa_payments where invcid="+invoiceid+" group by  invcid";
        amountPaid= (Double) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
        logger.error("Error in method getInvoiceAmountPaidByInvid", e);
 }
		return amountPaid;
	}
	@Override
	public int getOwnerCountByProperty(int prtyid,Integer userid) {
		int ownrCount=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="\r\n" + 
        		"SELECT  count(o.ownrid)\r\n" + 
        		"\r\n" + 
        		"FROM  maa_owner_details o inner join  maa_user_properties up on o.ousrid=up.userid  where  up.role=3 and up.prptyid="+prtyid+" and o.status=1";
        ownrCount= (int) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
        logger.error("Error in method getOwnerCountByProperty"+e.toString());
 }
		return ownrCount;
	}
	@Override
	public int getTenanantCountByProperty(int prtyid,Integer userid) {
		int tntCount=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="\r\n" + 
        		"\r\n" + 
        		"SELECT count(t.tntid )\r\n" + 
        		"FROM  maa_tenant_details t inner join  maa_user_properties up on t.tusrid=up.userid  where  up.role=4 and up.prptyid="+prtyid+" and t.status=1 ";
        tntCount= (int) session.createSQLQuery(sql).uniqueResult();
 
		}catch (Exception e) {
        logger.error("Error in method getTenanantCountByProperty"+ e.toString());
		}
		return tntCount;
	}
	@Override
	public int getVacanciesByProperty(int prtyid,Integer role) {
		int vacancies=0;
		String sql;
		try {
			Session session=sessfact.getCurrentSession();
        if(role==1) {
         sql="select count(assetid) from maa_assets_details where  (occ_by='V' or occ_by is null)";
        }else {
        	 sql="select count(assetid) from maa_assets_details where prtyid="+prtyid+" and (occ_by='V' or occ_by is null)";
        }
        vacancies= (int) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
        logger.error("Error in method getVacanciesByProperty"+ e.toString());
 }
		return vacancies;
	}
	@Override
	public List<Object[]> getExpenseForYear(int prtyid, String flatno,int role) {
		List<Object[]> newList=null;
		
			try {				
						Session session=sessfact.getCurrentSession();
			
						SQLQuery query = session.createSQLQuery("EXEC [DashboardChartData] @prtyid="+prtyid+",@Flat='"+flatno+"',@role="+role+"");
						
						newList =  query.list();
		}catch (Exception e) {
	        logger.error("Error in method getExpenseForYear", e);
		 }
		return newList;
	}
	@Override
	public List<Object[]> getPaymentsForYear() {
		List<Object[]> newList=null;
		
			try {
					Session session=sessfact.getCurrentSession();
						String Sql="select pmonth,count(*) as paycount from maa_payments where YEAR(pyear) = YEAR(GETDATE()) group by pmonth,pyear\r\n" + 
								"";
						newList= session.createSQLQuery(Sql).list();
			
								
			
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
		 }
		return newList;
	}
	@Override
	public int getClassifiedCountByProperty() {
		int ownrCount=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select count (classified) from Maa_ClassifiedInformation ";
        ownrCount= (int) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
	 logger.error(e.getMessage(),e);
 }
		return ownrCount;

	}
	@Override
	public int getVendorCountByProperty() {
		int count=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select count(vendorid) from maa_vendors";
        count= (int) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
	 logger.error(e.getMessage(),e);
 }
		return count;

	}
	@Override
	public int getBlogCountByProperty() {
		int count=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select count (blogid) from Maa_Blogs ";
        count= (int) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
        logger.error(e.getMessage(),e);
 }
		return count;

	}
	@Override
	public int getPropertyCount() {
		int count=0;
		try {
			Session session=sessfact.getCurrentSession();
        
        String sql="select count (1) from maa_user_details ";
        count= (int) session.createSQLQuery(sql).uniqueResult();
 
 }catch (Exception e) {
        logger.error(e.getMessage(),e);
 }
		return count;
	}
	@Override
	public void hideClasifiedInWebSite(int prpId, int classifiedId,String status) {
		try {
			Session session=sessfact.getCurrentSession();
			String hql="update  Maa_ClassifiedInformation set status='"+status+"' where classified="+classifiedId+"";	
		
		Query query = session.createSQLQuery(hql);
	    query.executeUpdate();
	}catch (Exception e) {
        logger.error(e.getMessage(),e);
 }
	}
}
