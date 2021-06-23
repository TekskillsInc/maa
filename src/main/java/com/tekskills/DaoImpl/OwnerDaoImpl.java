package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekskills.DAO.OwnerDao;
import com.tekskills.DTO.OwnerDetailsDTo;
import com.tekskills.entity.ApartmentUserInfoEntity;
import com.tekskills.entity.AptUserProperties;
import com.tekskills.entity.OwnerDetails;
import com.tekskills.entity.TenantDetailsEntity;

@Repository
public class OwnerDaoImpl implements OwnerDao{
	@Autowired
	private SessionFactory sessfact;
	  private static final Logger logger = Logger.getLogger(MaaDaoImpl.class);
	  
	@Override

	public List<OwnerDetailsDTo> getOwnerListByprtyId(int userId, int prtyId,int ownerid,int tntid,int roleid) {
		List<OwnerDetailsDTo> ownerList=null;
		
		try {
	

			Session session=sessfact.getCurrentSession();
			String hql="exec getAllOwnnerByProperty @userid="+userId+",@prptyid ="+prtyId+",@ownerid="+ownerid+",@tntid="+tntid+",@roleid="+roleid+"";
			ownerList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(OwnerDetailsDTo.class)).list();
		}catch (Exception e) {
			logger.error("Error in method getOwnerListByprtyId", e);
		}	
		return ownerList;
	}

	@Override
	public int saveOwner(OwnerDetails owner) {
		
		int onwerid=0;
			try {
				Session session=sessfact.getCurrentSession();
				onwerid=(int) session.save(owner);
				
			}catch (Exception e) {
				logger.error("Error in method saveOwner", e);
			}
			return onwerid;
		
	}

	/*@Override
	public void updateAsset(AssetDetails asset) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(asset);
			
		}catch (Exception e) {
			logger.error("Error in method updateAsset", e);
		}
	}
*/
	@Override
	public OwnerDetails getOwnerByOwnerid(int onwrId) {
		OwnerDetails owner=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from OwnerDetails where ownrid="+onwrId+" ";
			owner= (OwnerDetails) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getOwnerListByprtyId", e);
		}
		return owner;	
	}

	@Override
	public  void updateOwner(OwnerDetails owner) {
		
		try {
			Session session=sessfact.getCurrentSession();
			session.update(owner);
			
		}catch (Exception e) {
			logger.error("Error in method updateAsset", e);
		}
		
	}

	@Override
	public int getOwnerByUserid(Integer id) {
		int ownerid=0;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select ownrid from OwnerDetails where ousrid="+id+" ";
			ownerid= (int) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getOwnerListByprtyId", e);
		}
		return ownerid;	
		
	}

	@Override
	public void updateOwnerProp(AptUserProperties uprop) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(uprop);
			
		}catch (Exception e) {
			logger.error("Error in method updateOwnerProp", e);
		}
		
		
	}

	@Override
	public void updateUser(int ousrid,String emailId, int status, int prtyid) {
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from ApartmentUserInfoEntity  where id="+ousrid+" ";
			ApartmentUserInfoEntity userinfo=  (ApartmentUserInfoEntity) session.createQuery(hql).uniqueResult();
			if(userinfo!=null) {
			userinfo.setEmail(emailId);
			session.update(userinfo);
			}
			String hql1="from AptUserProperties  where userid="+ousrid+" and  prtyid="+prtyid+"";
			AptUserProperties userprop=  (AptUserProperties) session.createQuery(hql1).uniqueResult();
			if(userprop!=null) {
				userprop.setStatus(status);
			session.update(userinfo);
			}
		}catch (Exception e) {
			logger.error("Error in method updateUser", e);
		}
	}

	@Override
	public String getPasswoordByMail(String mail) {
		String password=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select password from maa_user_info  where email='"+mail+"' ";
			password=  (String) session.createSQLQuery(hql).uniqueResult();
			logger.info("password by email---"+password);
		}catch (Exception e) {
			logger.error("Error in method getPasswoordByMail", e.getCause());
		}
		return password;
	}
	@Override
	public OwnerDetails getownerBymail(String emailId) {
		OwnerDetails owner=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from OwnerDetails where email='"+emailId+"' ";
			owner= (OwnerDetails) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getownerBymail", e);
		}
		return owner;	
	}

	@Override
	public String validateOwnerMail(String email, int prtyidInt, String type) {
		String password=null;
		String email1=null;
		String newVal=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select email from maa_user_info u inner join maa_user_properties p on u.userid=p.userid where u.email='"+email+"' and p.prptyid="+prtyidInt+" ";
			password=  (String) session.createSQLQuery(hql).uniqueResult();
			if(password!=null) {
				if(type.equalsIgnoreCase("O")) {
				String hql1="select email from maa_owner_details where email='"+email+"' ";
				email1=  (String) session.createSQLQuery(hql1).uniqueResult();
				if(email1==null) {
					newVal="";
				}else {
					newVal="Exists";
				}
				}else if(type.equalsIgnoreCase("T")){
					String hql1="select tenant_email from maa_tenant_details where tenant_email='"+email+"' ";
					email1=  (String) session.createSQLQuery(hql1).uniqueResult();
					if(email1==null) {
						newVal="";
					}else {
						newVal="Exists";
					}
				}
			}
		}catch (Exception e) {
			logger.error("Error in method validateOwnerMail", e.getCause());
		}
		return newVal;
	}

	@Override
	public int getTenanatByUserid(Integer id) {
		int tntid=0;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select tbl_id from TenantDetailsEntity where tusrid="+id+" ";
			tntid= (int) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getOwnerListByprtyId", e);
		}
		return tntid;	
	}

	@Override
	public TenantDetailsEntity getTenantByMail(String email) {
		TenantDetailsEntity tenent=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from TenantDetailsEntity where tenant_email='"+email+"' ";
			tenent= (TenantDetailsEntity) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getownerBymail", e);
		}
		return tenent;	
	}

	@Override
	public List<OwnerDetailsDTo> getOwnerListByTenant(int userId, int prtyId, int ownrarr, int tntid, int roleid) {
List<OwnerDetailsDTo> ownerList=null;
		
		try {
	

			Session session=sessfact.getCurrentSession();
			String hql="exec getAllOwnnerByTenant @userid="+userId+",@prptyid ="+prtyId+",@ownerid="+ownrarr+",@tntid="+tntid+",@roleid="+roleid+"";
			ownerList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(OwnerDetailsDTo.class)).list();
		}catch (Exception e) {
			logger.error("Error in method getOwnerListByprtyId", e);
		}	
		return ownerList;
	}
}
