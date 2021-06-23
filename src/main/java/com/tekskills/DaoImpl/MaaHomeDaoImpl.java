package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekskills.DAO.MaaHomeDao;
import com.tekskills.DTO.ClassifiedInfoDTO;
import com.tekskills.entity.EnquiryFormEntity;
import com.tekskills.entity.VendorEntity;

@Repository
public class MaaHomeDaoImpl implements MaaHomeDao {
	@Autowired
	private SessionFactory sessfact;
	private static final Logger logger = Logger.getLogger(MaaHomeDaoImpl.class);
	
	@Override
	public List<VendorEntity> getAllVendors() {
		List<VendorEntity> vendorList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from VendorEntity where flag='YES'";
			vendorList= session.createQuery(hql).list();
				
		}catch (Exception e) {
			logger.error("Error in method getAllVendors", e);
		}	
		return vendorList;
	}
	@Override
	public List<VendorEntity> getAllHomeVendors(String profession,String location) {
		List<VendorEntity> vendorList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="Exec getAllHomeVendors @profession='"+profession+"',@location='"+location+"' ";
			vendorList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(VendorEntity.class)).list();
				
		}catch (Exception e) {
			logger.error("Error in method getAllHomeVendors", e);
		}	
		return vendorList;
	}
	
	@Override
	public int saveEnquiryForm(EnquiryFormEntity enqObj) {
		int id=0;
		try {
             Session session=sessfact.getCurrentSession();
             id=(int) session.save(enqObj);
      } catch (Exception e) {
             logger.error("Error in method saveEnquiryForm", e);
      }
      return id;
	}
	@Override
	public List<ClassifiedInfoDTO> getRecentClassifieds() {
		List<ClassifiedInfoDTO> classifiedlist=null;
		try {
			
		Session session=sessfact.getCurrentSession();
		
		String hql="exec [getRecentClassifieds] ";
		
		classifiedlist= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(ClassifiedInfoDTO.class)).list();
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return classifiedlist;
	}
}
