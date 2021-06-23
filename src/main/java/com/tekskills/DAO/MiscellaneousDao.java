package com.tekskills.DAO;

import java.util.List;

import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.ClassifiedDTO;
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

public interface MiscellaneousDao {

	List<ExpenseDTO> getAllExpensesByProperty(int propertyIdInt, int roleid,int ownerid,int tntid,int userId);

	void saveExpense(ExpensesEntity expense);

	ExpensesEntity getExpenseById(int expenseval, int prtyIdInt);

	void updateExpense(ExpensesEntity expense);

	void saveAssociation(AssociationEntity association);

	List<AssociationEntity> getAssociationList(int prtyIdInt);

	AssociationEntity getAssociationByID(int associationidInt);

	void updateAssociation(AssociationEntity association);
	
	void saveNotification(NotificationEntity notifObj);

	NotificationEntity getNotificationById(int notfId);

	String deleteNotification(int id);

	void updateNotification(NotificationEntity notifObj);
	
	void saveVisitorDetails(VisitorsDetailsEntity visitObj);

	VisitorsDetailsEntity getVisitorById(int visitId);

	String deleteVisitor(int id);

	void updateVisitor(VisitorsDetailsEntity visitObj);

	void saveComplaintDetails(ComplaintDetailsEntity compObj);
	
   List<NotificationEntity> getNotificationListByprtyId(Integer userid, int prtyId, Integer roleid, String flatno);
	
	List<VisitorsDetailsEntity> getVisitorListByprtyId(Integer userid, int prtyId);

	List<ComplaintDetailsEntity> getComplaintListByprtyId(Integer userid, int prtyId, String flatno, Integer roleid);

	ComplaintDetailsEntity getComplaintById(int compId);

	void updateComplaintDetails(ComplaintDetailsEntity compObj);

	void saveCommentsOfComplaint(ComplaintHistoryEntity comphistoryObj);

	List<complaintHistoryDto> getAllCommentsByComplaintId(int compIdInt, int userId, int roleid);

	String getOwnerNameByUserId(int userid);

	String getTenantNameByUserId(int userid);

	String deleteComplaint(int id);

	List<ComplaintDetailsEntity> getComplaintCountsByprtyId(Integer userid, int prtyId);

	List<NotificationEntity> getNotificationCountsListByprtyId(Integer userid, int prtyId, Integer roleid);

	List<String> getAssetsByProperty(int prtyId);

	AptPaymentsDTO getPaymentByPaymentId(int paymentidInt, int roleid, Integer userId);

	void saveHHClassified(ClassifiedHouseHunting classifiedObj);

	int saveClassifiedInfo(ClassifiedInformation classifiedInfo);

	void saveClassifiedFeatures(ClassifiedFeatures features);

	void saveImage(ClassifiedImages imagesObj);

	List<ClassifiedInfoDTO> getClassifiedList(int prtyidval);

	List<ClassifiedHouseHunting> getHHclassifieds(int prtyidval);

	ClassifiedInformation getClassfiedInfoById(int id, int prtyidval);

	List<String> getClassifiedImages(int id);

	ClassifiedHouseHunting getHHclasifiedByCid(int id, int prtyidval);

	String getFeaturesByCid(int id);

	void updateClasified(ClassifiedInformation classifiedInfo);

	void updateClasifiedHHunting(ClassifiedHouseHunting classifiedObj);

	ClassifiedFeatures getClassifiedFeaturesByCid(int id);

	void updateClassifiedFeatures(ClassifiedFeatures features);

	List<ClassifiedImages> getClassifiedImagesEdit(int id);

	ClassifiedImages getClassifiedImages(int classified, String classifiedImages);

	void deleteCsfImage(ClassifiedImages csfImage);

	void saveBlog(BlogEntity blog);

	List<BlogEntity> findAllBlogs();

	BlogEntity getBlogById(int blogidVal);

	void updateBlog(BlogEntity blog);

	List<ClassifiedInfoDTO> getClassifiedListByCity(String city,String location, String propType);

	String getThumbnailImage(int id);

	List<VacanciesDto> getAllVacancies();

	List<ClassifiedInfoDTO> adminClassifieds();

	void deleteClassified(int classified, int propertyid);

	void deleteClassifiedHH(int classified, int propertyid);

	void updateClasifiedStatus(int id,String status);

	List<ComplaintDetailsEntity> getComplaintListByUser(Integer userid, int prtyId, Integer roleid, String flatno);

	String getUserFlatByProperty(Integer userid, int prtyId, Integer roleid);

	String deleteBlog(int id);
	
}
