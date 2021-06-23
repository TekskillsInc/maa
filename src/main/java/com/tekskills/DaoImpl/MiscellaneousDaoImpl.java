package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekskills.DAO.MiscellaneousDao;
import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.ClassifiedInfoDTO;
import com.tekskills.DTO.ExpenseDTO;
import com.tekskills.DTO.VacanciesDto;
import com.tekskills.DTO.complaintHistoryDto;
import com.tekskills.entity.AssociationEntity;
import com.tekskills.entity.BlogEntity;
import com.tekskills.entity.ClassifiedFeatures;
import com.tekskills.entity.ClassifiedHouseHunting;
import com.tekskills.entity.ClassifiedImages;
import com.tekskills.entity.ClassifiedInformation;
import com.tekskills.entity.ComplaintDetailsEntity;
import com.tekskills.entity.ComplaintHistoryEntity;
import com.tekskills.entity.ExpensesEntity;
import com.tekskills.entity.NotificationEntity;
import com.tekskills.entity.VisitorsDetailsEntity;

@Repository
public class MiscellaneousDaoImpl implements MiscellaneousDao{
	@Autowired
	private SessionFactory sessfact;
	  private static final Logger logger = Logger.getLogger(MeterReadingDaoImpl.class);

	@Override
	public List<ExpenseDTO> getAllExpensesByProperty(int propertyIdInt, int roleid,int ownerid,int tntid,int userId ) {
    List<ExpenseDTO> expenseList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="exec getAllExpensesProperty @prptyid="+propertyIdInt+",@ownerid="+ownerid+",@tntid="+tntid+",@roleid="+roleid+",@userid="+userId+"";
			expenseList=  session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(ExpenseDTO.class)).list();
		}catch (Exception e) {
			logger.error("Error in method getMeterReadingList", e);
		}	
		return expenseList;
	}

	@Override
	public void saveExpense(ExpensesEntity expense) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(expense);
		} catch (Exception e) {
			logger.error("Error in method saveExpense", e);
		}
		
	}

	@Override
	public ExpensesEntity getExpenseById(int expenseval, int prtyIdInt) {
		ExpensesEntity expense= null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from ExpensesEntity where prtyid="+prtyIdInt+" and expenseid="+expenseval+"";
		expense= (ExpensesEntity) session.createQuery(hql).uniqueResult();
	
	}
		 catch (Exception e) {
				logger.error("Error in method saveVendor----DAO impl", e);
			}
		return expense;
	}

	@Override
	public void updateExpense(ExpensesEntity expense) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(expense);
		} catch (Exception e) {
			logger.error("Error in method updateExpense", e);
		}
	}

	@Override
	public void saveAssociation(AssociationEntity association) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(association);
		} catch (Exception e) {
			logger.error("Error in method saveAssociation", e);
		}
		
	}

	@Override
	public List<AssociationEntity> getAssociationList(int prtyIdInt) {
		List<AssociationEntity> associationList= null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from AssociationEntity where prtyid="+prtyIdInt+" ";
		associationList= session.createQuery(hql).list();
	
	}
		 catch (Exception e) {
				logger.error("Error in method getAssociationList----DAO impl", e);
			}
		return associationList;
	}

	@Override
	public AssociationEntity getAssociationByID(int associationidInt) {
		AssociationEntity association= null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from AssociationEntity where id="+associationidInt+"";
		association= (AssociationEntity) session.createQuery(hql).uniqueResult();
	
	}
		 catch (Exception e) {
				logger.error("Error in method getAssociationByID----DAO impl", e);
			}
		return association;
	}

	@Override
	public void updateAssociation(AssociationEntity association) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(association);
		} catch (Exception e) {
			logger.error("Error in method updateAssociation", e);
		}
	}

	 @Override
		public List<NotificationEntity> getNotificationListByprtyId(Integer userid, int prtyId,Integer roleid, String flatno) {
			List<NotificationEntity> ntfnList=null;
			String hql=null;
			//String flatno1="";
			//flatno=flatno+","+flatno1;
			System.out.println("flatno-----"+flatno);
			try{
				Session session=sessfact.getCurrentSession();
				if(roleid==1 || roleid==2) {
					hql="from NotificationEntity where userid="+userid+" and prtyid="+prtyId+" order by notificationdate desc";
					ntfnList= session.createQuery(hql).list();
				}else {
					
					Query query=session.createQuery(" from  NotificationEntity where prtyid="+prtyId+"  and flatno in (:flat) or flatno=:flatno1 order by id desc ");
					 query.setParameter("flat", flatno);
					 
					query.setParameter("flatno1", ""); 
					
					ntfnList= query.list();
				}
			
			}catch (Exception e) {
				logger.error("Error in method getNotificationListByprtyId ----DAO impl", e);
			}
			return ntfnList;
		}
	    @Override
		public List<VisitorsDetailsEntity> getVisitorListByprtyId(Integer userid, int prtyId) {
			List<VisitorsDetailsEntity> visitorList=null;
			try {
				/*userid="+userid+" and*/
				Session session=sessfact.getCurrentSession();
					String hql="from VisitorsDetailsEntity where  prtyid="+prtyId+" order by id desc";	
					visitorList= session.createQuery(hql).list();
			}catch (Exception e) {
				logger.error("Error in method getVisitorListByprtyId ----DAO impl", e);
			}
			return visitorList;
		}
	
	@Override
	public void saveNotification(NotificationEntity expense) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(expense);
		} catch (Exception e) {
			logger.error("Error in method saveNotification ----DAO impl", e);
		}
	}

	@Override
	public NotificationEntity getNotificationById(int notfId) {
		NotificationEntity notifObj= null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from NotificationEntity where id="+notfId+" order by id desc";
		notifObj= (NotificationEntity) session.createQuery(hql).uniqueResult();
	   }
		 catch (Exception e) {
				logger.error("Error in method getNotificationById----DAO impl", e);
			}
		return notifObj;
	}

	@Override
	public String deleteNotification(int id) {
		String Message = "";
		try {
		Session sess = sessfact.getCurrentSession();
	    Query q=sess.createQuery("delete from NotificationEntity where id="+id+"");
	    int i= q.executeUpdate();
			if(i>0){
				Message = "success";
			   }
			else {
				Message = "error";
			} 
		}
		catch (Exception ex) {
				logger.error("Exception raised in the method deleteNotification ----DAO impl:", ex);
			}
			return Message;
	}

	@Override
	public void updateNotification(NotificationEntity notifObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(notifObj);
		} catch (Exception e) {
			logger.error("Error in method updateNotification", e);
		}
	}
	

	@Override
	public void saveVisitorDetails(VisitorsDetailsEntity visitObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(visitObj);
		} catch (Exception e) {
			logger.error("Error in method saveVisitorDetails ----DAO impl", e);
		}
	}

	@Override
	public VisitorsDetailsEntity getVisitorById(int visitId) {
		VisitorsDetailsEntity visitObj= null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from VisitorsDetailsEntity where id="+visitId+" ";
		visitObj= (VisitorsDetailsEntity) session.createQuery(hql).uniqueResult();
	}
		 catch (Exception e) {
				logger.error("Error in method getVisitorById----DAO impl", e);
			}
		return visitObj;
	}

	@Override
	public String deleteVisitor(int id) { 
		String Message = "";
		try {
		Session sess = sessfact.getCurrentSession();
	    Query q=sess.createQuery("delete from VisitorsDetailsEntity where id="+id+"");
	    int i= q.executeUpdate();
			if(i>0){
				Message = "success";
			   }
			else {
				Message = "error";
			} 
		 }
		catch (Exception ex) {
				logger.error("Exception raised in the method deleteVisitor---DAO impl :", ex);
			}
			return Message;
	}

	@Override
	public void updateVisitor(VisitorsDetailsEntity visitObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(visitObj);
		} catch (Exception e) {
			logger.error("Error in method updateVisitor ----DAO impl", e);
		}
	}

	@Override
	public void saveComplaintDetails(ComplaintDetailsEntity compObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(compObj);
		} catch (Exception e) {
			logger.error("Error in method saveComplaintDetails ----DAO impl", e);
		}
	}

	@Override
	public List<ComplaintDetailsEntity> getComplaintListByprtyId(Integer userid, int prtyId, String flatno, Integer roleid) {
		List<ComplaintDetailsEntity> complaintList=null;
		try {
			//userid="+userid+" and 
			Session session=sessfact.getCurrentSession();
			
		/*if( roleid==3||roleid==4) {
			Query query=session.createQuery(" from  ComplaintDetailsEntity where prtyid="+prtyId+" and  userid="+userid+" and flatno in (:flat) order by id desc ");
			 query.setParameter("flat", flatno);
			 complaintList= query.list();
					
		}*/
			/*String flatno=null;
			String[] res = flatnos.split(",");
		       for(String myStr: res) {
		    	   flatno=myStr;
		       }
		System.out.println("...flatno.."+flatno);*/
			
		if(roleid==4) {
			Query query=session.createQuery(" from  ComplaintDetailsEntity where prtyid="+prtyId+" and  userid="+userid+" and flatno in (:flat) order by id desc ");
			 query.setParameter("flat", flatno);
			 complaintList= query.list();
					
		}else if(roleid==3) {
			Query query=session.createQuery(" from  ComplaintDetailsEntity where prtyid="+prtyId+" and  userid="+userid+"  order by id desc ");
			//Query query=session.createQuery(" from  ComplaintDetailsEntity where prtyid="+prtyId+"  and flatno in (:flat) order by id desc ");
			System.out.println("............................"+flatno);
			// query.setParameter("flat", flatno);
			 complaintList= query.list();
					
		}
		else {
			String	hql="from ComplaintDetailsEntity where prtyid="+prtyId+" order by id desc ";
			complaintList= session.createQuery(hql).list();
		}
				
		}catch (Exception e) {
			logger.error("Error in method getComplaintListByprtyId ----DAO impl", e);
		}
		return complaintList;
	}

	@Override
	public ComplaintDetailsEntity getComplaintById(int compId) {
		ComplaintDetailsEntity compObj= null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from ComplaintDetailsEntity where id="+compId+" ";
		compObj= (ComplaintDetailsEntity) session.createQuery(hql).uniqueResult();
	     }
		 catch (Exception e) {
				logger.error("Error in method getComplaintById----DAO impl", e);
			}
		return compObj;
	}

	@Override
	public void updateComplaintDetails(ComplaintDetailsEntity compObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(compObj);
		} catch (Exception e) {
			logger.error("Error in method updateComplaintDetails----DAO impl", e);
		}		
	}

	@Override
	public void saveCommentsOfComplaint(ComplaintHistoryEntity comphistoryObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(comphistoryObj);
		} catch (Exception e) {
			logger.error("Error in method saveExpense", e);
		}
	}

	@Override
	public List<complaintHistoryDto> getAllCommentsByComplaintId(int compIdInt,int userid,int roleid ) {
		List<complaintHistoryDto> comphList= null;
		try {
		Session session=sessfact.getCurrentSession();
	//	exec [getComplaintDetailsById] @compId=2,@roleid=2
		String hql="exec getComplaintDetailsById @compid="+compIdInt+"";
		comphList=  session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(complaintHistoryDto.class)).list();
		//String hql="from ComplaintHistoryEntity where complaintId="+compIdInt+" ";
		//comphList= session.createQuery(hql).list();
	     }
		 catch (Exception e) {
				logger.error("Error in method getAllCommentsByComplaintId----DAO impl", e);
			}
		return comphList;
	}
	@Override
	public String getOwnerNameByUserId(int userid) {
		String oname= null;
		try {
		Session session=sessfact.getCurrentSession();
		String sql="Select name from maa_owner_details  where ousrid="+userid+"";
		oname= (String) session.createSQLQuery(sql).uniqueResult();
	     }
		 catch (Exception e) {
				logger.error("Error in method getOwnerNameByUserId----DAO impl", e);
			}
		return oname;
	}

	@Override
	public String getTenantNameByUserId(int userid) {
		String oname= null;
		try {
		Session session=sessfact.getCurrentSession();
		String sql="Select tenant_name from maa_tenant_details  where tusrid="+userid+"";
		oname= (String) session.createSQLQuery(sql).uniqueResult();
	     }
		 catch (Exception e) {
				logger.error("Error in method getTenantNameByUserId----DAO impl", e);
			}
		return oname;
	}

	@Override
	public String deleteComplaint(int id) {
		String Message = "";
		try {
		Session sess = sessfact.getCurrentSession();
	    Query q=sess.createQuery("delete from ComplaintDetailsEntity where id="+id+"");
	    int i= q.executeUpdate();
			if(i>0){
				Message = "success";
			   }
			else {
				Message = "error";
			} 
		}
		catch (Exception ex) {
				logger.error("Exception raised in the method deleteNotification ----DAO impl:", ex);
			}
			return Message;
	}

	@Override
	public List<ComplaintDetailsEntity> getComplaintCountsByprtyId(Integer userid, int prtyId) {
		List<ComplaintDetailsEntity> complaintList=null;
		try {
			Session session=sessfact.getCurrentSession();
				String hql="from ComplaintDetailsEntity where prtyid="+prtyId+" and status='Open'";	
				complaintList= session.createQuery(hql).list();
		}catch (Exception e) {
			logger.error("Error in method getComplaintCountsByprtyId ----DAO impl", e);
		}
		return complaintList;
	}

	@Override
	public List<NotificationEntity> getNotificationCountsListByprtyId(Integer userid, int prtyId, Integer roleid) {
		List<NotificationEntity> ntfnList=null;
		String hql=null;
		try {
			Session session=sessfact.getCurrentSession();
			if(roleid==1 || roleid==2) {
				hql="from NotificationEntity where userid="+userid+" and prtyid="+prtyId+"";
				ntfnList= session.createQuery(hql).list();
			}else {
				hql="from NotificationEntity where prtyid="+prtyId+"";
				ntfnList= session.createQuery(hql).list();
			}
		
		}catch (Exception e) {
			logger.error("Error in method getNotificationListByprtyId ----DAO impl", e);
		}
		return ntfnList;
	}

	@Override
	public List<String> getAssetsByProperty(int prtyId) {
		String hql=null;
		 List<String> assetList=null;
		try {
			Session session=sessfact.getCurrentSession();
			
				hql="exec getAssetListByPrty @prtyid ="+prtyId+"";
				assetList=  session.createSQLQuery(hql).list();
			
		
		}catch (Exception e) {
			logger.error("Error in method getNotificationListByprtyId ----DAO impl", e);
		}
		return assetList;
	}

	@Override
	public AptPaymentsDTO getPaymentByPaymentId(int paymentidInt,int roleid, Integer userId) {
		AptPaymentsDTO payment=null;
try {
			
			
			Session session=sessfact.getCurrentSession();
			String hql="exec getPaymentPropertyById  @paymentId="+paymentidInt+",@roleid="+roleid+",@userid="+userId+" ";
			payment= (AptPaymentsDTO) session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(AptPaymentsDTO.class)).uniqueResult();
			
	
			
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyId", e);
		}	
		return payment;
		
	}

	@Override
	public void saveHHClassified(ClassifiedHouseHunting classifiedObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(classifiedObj);
			
		} catch (Exception e) {
			logger.error("Error in method saveHHClassified----DAO impl", e);
		}
		
	}

	@Override
	public int saveClassifiedInfo(ClassifiedInformation classifiedInfo) {
		int classifiedId=0;
		try {
			Session session=sessfact.getCurrentSession();
			classifiedId=(int) session.save(classifiedInfo);
			
		} catch (Exception e) {
			logger.error("Error in method saveClassifiedInfo----DAO impl", e);
		}
		return classifiedId;
	}

	@Override
	public void saveClassifiedFeatures(ClassifiedFeatures features) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(features);
			
		} catch (Exception e) {
			logger.error("Error in method saveClassifiedFeatures----DAO impl", e);
		}
		
		
	}

	@Override
	public void saveImage(ClassifiedImages imagesObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(imagesObj);
			
		} catch (Exception e) {
			logger.error("Error in method saveImage----DAO impl", e);
		}
		
		
	}

	@Override
	public List<ClassifiedInfoDTO> getClassifiedList(int prtyidval) {
		List<ClassifiedInfoDTO> classifiedlist=null;
			try {
				
			Session session=sessfact.getCurrentSession();
			
			String hql="exec getClassifiedByProperty  @prtyid="+prtyidval+"";
			
			classifiedlist= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(ClassifiedInfoDTO.class)).list();
			
	
			
		}catch (Exception e) {
			logger.error("Error in method getClassifiedList", e);
		}	
		return classifiedlist;
		
		
	}

	@Override
	public List<ClassifiedHouseHunting> getHHclassifieds(int prtyidval) {
		List<ClassifiedHouseHunting> classifiedlist=null;
		try {
		Session session=sessfact.getCurrentSession();
		if(prtyidval==0) {
			String hql="from ClassifiedHouseHunting where status='Y'";
		classifiedlist= session.createQuery(hql).list();
		}
		else {
			String hql="from ClassifiedHouseHunting where prtyid="+prtyidval+" and  status='Y'";
			
			classifiedlist= session.createQuery(hql).list();
		}
		
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return classifiedlist;
	
	}

	@Override
	public ClassifiedInformation getClassfiedInfoById(int id, int prtyidval) {
		ClassifiedInformation classified=null;
		try {
		Session session=sessfact.getCurrentSession();
		if(prtyidval!=0) {
		String hql="from ClassifiedInformation where prtyid="+prtyidval+" and  status='Yes' and classified="+id+" ";
		classified= (ClassifiedInformation) session.createQuery(hql).uniqueResult();
		}else {
			String hql="from ClassifiedInformation where status='Yes' and classified="+id+"";
			classified= (ClassifiedInformation) session.createQuery(hql).uniqueResult();
		}
		
	}catch (Exception e) {
		logger.error("Error in method getClassfiedInfoById", e);
	}	
	return classified;
	
	}
	

	@Override
	public List<String> getClassifiedImages(int id) {
		List<String> classifiedImglist=null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="select imagename from ClassifiedImages where classified="+id+" ";
		classifiedImglist= session.createQuery(hql).list();
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return classifiedImglist;
	}

	@Override
	public ClassifiedHouseHunting getHHclasifiedByCid(int id, int prtyidval) {
		ClassifiedHouseHunting classified=null;
		try {
		Session session=sessfact.getCurrentSession();
		if(prtyidval!=0) {
		String hql="from ClassifiedHouseHunting where prtyid="+prtyidval+" and  status='Y' and id="+id+" ";
		classified= (ClassifiedHouseHunting) session.createQuery(hql).uniqueResult();
		}else {
			String hql="from ClassifiedHouseHunting where   status='Y' and id="+id+" ";
			classified= (ClassifiedHouseHunting) session.createQuery(hql).uniqueResult();
		}
		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return classified;
	
	}

	@Override
	public String getFeaturesByCid(int id) {
		String feature=null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="select csffeature from ClassifiedFeatures where classified="+id+" ";
		feature= (String) session.createQuery(hql).uniqueResult();
		

		
	}catch (Exception e) {
		logger.error("Error in method getFeaturesByCid", e);
	}	
	return feature;
	}

	@Override
	public void updateClasified(ClassifiedInformation classifiedInfo) {
		
		try {
			Session session=sessfact.getCurrentSession();
			 session.update(classifiedInfo);
			
		} catch (Exception e) {
			logger.error("Error in method updateClasified----DAO impl", e);
		}
		
		
	}

	@Override
	public void updateClasifiedHHunting(ClassifiedHouseHunting classifiedObj) {
		
		try {
			Session session=sessfact.getCurrentSession();
			 session.update(classifiedObj);
			
		} catch (Exception e) {
			logger.error("Error in method updateClasifiedHHunting----DAO impl", e);
		}
		
	}

	@Override
	public ClassifiedFeatures getClassifiedFeaturesByCid(int id) {
		
		ClassifiedFeatures feature=null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from ClassifiedFeatures where classified="+id+" ";
		feature= (ClassifiedFeatures) session.createQuery(hql).uniqueResult();
		

		
	}catch (Exception e) {
		logger.debug("Error in method getFeaturesByCid", e);
	}	
	return feature;
	}

	@Override
	public void updateClassifiedFeatures(ClassifiedFeatures features) {
		try {
			Session session=sessfact.getCurrentSession();
			 session.update(features);
			
		} catch (Exception e) {
			logger.debug("Error in method updateClassifiedFeatures----DAO impl", e);
		}
		
	}

	@Override
	public List<ClassifiedImages> getClassifiedImagesEdit(int id) {
		List<ClassifiedImages> classifiedImglist=null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql=" from ClassifiedImages where classified="+id+" ";
		classifiedImglist= session.createQuery(hql).list();
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return classifiedImglist;
	}

	@Override
	public ClassifiedImages getClassifiedImages(int classified, String image) {
		ClassifiedImages classifiedImg=null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql=" from ClassifiedImages where classified="+classified+" and imagename='"+image+"'";
		classifiedImg= (ClassifiedImages) session.createQuery(hql).uniqueResult();
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return classifiedImg;
	}

	@Override
	public void deleteCsfImage(ClassifiedImages csfImage) {
		try {
		Session session=sessfact.getCurrentSession();
		 session.delete(csfImage);
		
	}catch (Exception e) {
		logger.error("Error in method deleteCsfImage", e);
	}	
		
	}

	@Override
	public void saveBlog(BlogEntity blog) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(blog);
		} catch (Exception e) {
			logger.error("Error in method saveBlog", e);
		}
	}

	@Override
	public List<BlogEntity> findAllBlogs() {
		List<BlogEntity> bloglist=null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql=" from BlogEntity ";
		bloglist=  session.createQuery(hql).list();
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return bloglist;
	}

	@Override
	public BlogEntity getBlogById(int blogidVal) {
		BlogEntity blog=null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql=" from BlogEntity where blogid= "+blogidVal+"";
		blog=  (BlogEntity) session.createQuery(hql).uniqueResult();
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedList", e);
	}	
	return blog;
	}

	@Override
	public void updateBlog(BlogEntity blog) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(blog);
		} catch (Exception e) {
			logger.error("Error in method updateBlog", e);
		}
	}

	@Override
	public List<ClassifiedInfoDTO> getClassifiedListByCity(String city,String location,String propType) {
		List<ClassifiedInfoDTO> classifiedlist=null;
		try {
			
		Session session=sessfact.getCurrentSession();
		
		String hql="exec getClassifiedByLocation  @city='"+city+"',@location='"+location+"',@propType='"+propType+"'";
		
		classifiedlist= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(ClassifiedInfoDTO.class)).list();
		

		
	}catch (Exception e) {
		logger.error("Error in method getClassifiedListByCity", e);
	}	
	return classifiedlist;
	
	

	}

	@Override
	public String getThumbnailImage(int id) {
		String image=null;
		try {
Session session=sessfact.getCurrentSession();
		
		String hql="select top 1 imagename\r\n" + 
				"		from  Maa_ClassifiedImages   where classified= "+id+"";
		
		image= (String) session.createSQLQuery(hql).uniqueResult();
		
		
		}
		catch (Exception e) {
			logger.error("Error in method getThumbnailImage", e);
		}	
		return image;
	}

	@Override
	public List<VacanciesDto> getAllVacancies() {
		List<VacanciesDto> vacancies=null;
		try {
			
		Session session=sessfact.getCurrentSession();
		
		String hql="exec getAllVacancies ";
		
		vacancies= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(VacanciesDto.class)).list();
		

		
	}catch (Exception e) {
		logger.error("Error in method getAllVacancies", e);
	}	
	return vacancies;
	}

	@Override
	public List<ClassifiedInfoDTO> adminClassifieds() {
		List<ClassifiedInfoDTO> classifieds=null;  
		try {
			
			Session session=sessfact.getCurrentSession();
			
			String hql="exec AdminClassifieds ";
			
			classifieds= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(ClassifiedInfoDTO.class)).list();
			

			
		}catch (Exception e) {
			logger.error("Error in method getAllVacancies", e);
		}
		return classifieds;
	}

	@Override
	public void deleteClassified(int classified, int propertyid) {
		// TODO Auto-generated method stub
		try {
			
			Session session=sessfact.getCurrentSession();
			Query q=session.createSQLQuery("delete from  Maa_ClassifiedImages where classified= "+classified+"");
		     q.executeUpdate();
			
		     Query q2=session.createSQLQuery("delete from  Maa_ClassifiedFeatures where classified= "+classified+"");
		     q2.executeUpdate();
			
			Query q1=session.createSQLQuery("delete from  Maa_ClassifiedInformation where classified="+classified+" and prtyid="+propertyid+"");
			
			q1.executeUpdate();
			

			
		}catch (Exception e) {
			logger.error("deleteClassified----"+ e.getMessage());
		}
	}

	@Override
	public void deleteClassifiedHH(int classified, int propertyid) {
		// TODO Auto-generated method stub

			
			Session session=sessfact.getCurrentSession();
			
			
			
Query q1=session.createSQLQuery("delete from  Maa_ClassifiedHHunting where id="+classified+" and prtyid="+propertyid+"");
try {	
			q1.executeUpdate();
			
			
			

			
		}catch (Exception e) {
			logger.error("deleteClassifiedHH----"+ e.getMessage());
		}
	}

	@Override
	public void updateClasifiedStatus(int id,String status) {
		Session session=sessfact.getCurrentSession();
		
		
		
		Query q1=session.createSQLQuery("update  Maa_ClassifiedInformation set csfstatus='"+status+"' where classified="+id+" ");
		try {	
					q1.executeUpdate();
					
				}catch (Exception e) {
					logger.error("deleteClassifiedHH----"+ e.getMessage());
				}

	}

	@Override
	public List<ComplaintDetailsEntity> getComplaintListByUser(Integer userid, int prtyId, Integer roleid, String flatno) {
		List<ComplaintDetailsEntity> complaintList=null;
		try {
			//userid="+userid+" and 
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(roleid>2) {
				Query query=session.createQuery(" from  ComplaintDetailsEntity where prtyid="+prtyId+" and  userid="+userid+"  order by id desc ");
				/*Query query=session.createQuery(" from  ComplaintDetailsEntity where prtyid="+prtyId+" and  userid="+userid+" and flatno in (:flat) order by id desc ");
				 query.setParameter("flat", flatno);*/
				 complaintList= query.setMaxResults(5).list();
			}else {
				 hql="from ComplaintDetailsEntity where prtyid="+prtyId+"  order by id desc ";
				 complaintList= session.createQuery(hql).setMaxResults(5).list();
			}
				
		}catch (Exception e) {
			logger.error("Error in method getComplaintListByprtyId ----DAO impl", e);
		}
		return complaintList;
	}

	@Override
	public String getUserFlatByProperty(Integer userid, int prtyId, Integer roleid) {
		List<String> flatList=null;
		String flat=null;
		//Object obj=null;
		{try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			if(roleid==3) {
				
				//hql="select stuff ((select ','+(cast(flatno as varchar))  from  maa_assets_details  where prtyid="+prtyId+" and ownerid=(select ownrid from maa_owner_details where ousrid="+userid+") for xml path ('')),1,1,'') as flat";
				
				hql="select flatno from  maa_assets_details  where prtyid="+prtyId+" and ownerid=(select ownrid from maa_owner_details where ousrid="+userid+") ";
				System.out.println("------------------>"+hql);
				flatList=  session.createSQLQuery(hql).list();
				flat=String.join(",", flatList);
				
			}else if(roleid==4) {
				
				hql="select flatno  from  maa_assets_details  where prtyid="+prtyId+" and tenantId=(select tntid from maa_tenant_details where tusrid="+userid+") ";
				flatList=  session.createSQLQuery(hql).list();
				flat=String.join(",", flatList);
			}
			
			
		}catch (Exception e) {
			logger.error("Error in method getUserFlatByProperty ----DAO impl", e);
		}
			}
		return flat;
	}

	@Override
	public String deleteBlog(int id) {
		String Message = "";
		try {
		Session sess = sessfact.getCurrentSession();
	    Query q=sess.createQuery("delete from BlogEntity where blogid="+id+"");
	    int i= q.executeUpdate();
			if(i>0){
				Message = "success";
			   }
			else {
				Message = "error";
			} 
		}
		catch (Exception ex) {
				logger.error("Exception raised in the method deleteBlog ----DAO impl:", ex);
			}
			return Message;
	}
}
