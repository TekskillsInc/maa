package com.tekskills.Service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.ClassifedDTO;
import com.tekskills.DTO.ClassifiedDTO;
import com.tekskills.DTO.ClassifiedInfoDTO;
import com.tekskills.DTO.ClassifiedInformationView;
import com.tekskills.DTO.ExpenseDTO;
import com.tekskills.DTO.PaymentDTO;
import com.tekskills.DTO.VacanciesDto;
import com.tekskills.DTO.complaintHistoryDto;
import com.tekskills.entity.AssociationEntity;
import com.tekskills.entity.BlogEntity;
import com.tekskills.entity.ClassifiedHouseHunting;
import com.tekskills.entity.ClassifiedImages;
import com.tekskills.entity.ComplaintDetailsEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.NotificationEntity;
import com.tekskills.entity.VisitorsDetailsEntity;

public interface MiscellaneousService {

	List<ExpenseDTO> getAllExpensesByProperty(String propertyId, int roleid,int userid);

	void saveExpence(String amountspent, String expensedate, String vendor, String expensefor, String flatno,
			String description, String prtyid, String prptyName,int userid, String month);

	void updateExpence(String expenseid, String amountspent, String expensedate, String vendor, String expensefor,
			String flatno, String description, String prtyid, String prptyName, int userid, String month);

	void saveAssoication(String chkbox,String usergroup, String memType, String strtDate,
			String endDate, Integer userId, String prtyid, String flat);

	List<AssociationEntity> getAssociationList(String propertyId, Integer roleid, Integer userId);

	void UpdateAssoication(String associationid, String chkBox, String usergroup, String memType, String strtDate,
			String endDate, Integer userId, String prtyid, String flat);
	

	void saveNotification(String title, String notfDate, String expensefor, String flatno, String description,
			String prtyid, String prptyName, Integer userId);

	NotificationEntity getNotificationById(String id);

	String deleteNotification(String id);

	void updateNotification(String edate, String etitle, String notificfor, String flatno, String flatno2,
			String prtyid, String prptyName, Integer userId, String description, String notfyId);

	void saveVisitorDetails(String prtyid, Integer userId, String visitDate, String name, String mobile, String address,
			String visitfor, String flatno, String personTomeet, String purpose, String intime, String outtime);

	VisitorsDetailsEntity getVisitorById(String id);

	String deleteVisitor(String id);

	void updateVisitor(String prtyid, Integer userId, String visitDate, String name, String mobile, String address,
			String visitfor, String flatno, String personTomeet, String purpose, String intime, String outtime,
			String visitId);

	void saveComplaintDetails(String prtyid, Integer userId, String flatno, String ctitle, String description, Integer roleid,String prtyName);

    List<NotificationEntity> getNotificationListByprtyId(Integer userid, String prtyid, Integer roleid);
	
	List<VisitorsDetailsEntity> getVisitorListByprtyId(Integer userid, String prtyid, Integer roleid);
	
	List<ComplaintDetailsEntity> getComplaintListByprtyId(Integer userid, String prtyid, Integer roleid);

	ComplaintDetailsEntity getComplaintById(String id);

	void updateComplaintDetails(String prtyid, Integer userId, String flatno, String edescription, String estatus,
			String compId,String roleid, String prptyName);

	void saveCommentsOfComplaint(Integer userId, String compId, String comments, Integer roleid);

	List<complaintHistoryDto> getAllCommentsByComplaintId(String compId, int userid, int roleid);

	String getNameByUserIdRoleId(int userid, int roleid);

	String deleteComplaint(String id);

	List<ComplaintDetailsEntity> getComplaintCountsByprtyId(Integer userid, String propId, Integer roleid);

	List<NotificationEntity> getNotificationCountsListByprtyId(Integer userid, String propId, Integer roleid);

	String sendPaymentReciept(PaymentDTO payment);

	List<String> getAssetsByProperty(String prtyid);

	String sendInvoiceMail(InvoiceEntity invoice, String prptyName, Integer userId);

	String downloadPaymentReciept(PaymentDTO payment);

	AptPaymentsDTO getPaymentByPaymentId(String paymentid, int roleid, Integer userId);

	int saveClassifiedOthers(ClassifiedDTO classifiedObj);

	String saveClassified(ClassifiedHouseHunting classifiedObj);

	String saveClassifiedImages(String id, MultipartFile[] files);

	ClassifedDTO getClassifiedsByProperty(String prtyid);

	ClassifiedInformationView getClassifiedInformatioByid(String classifiedid, String prtyid);

	ClassifiedHouseHunting getClassHHuntingByCID(String classifiedid, String prtyid);

	List<String> getClassifiedImages(int id);

	int updateClassifiedOthers(ClassifiedDTO classifiedObj, String classifiedid, String csfCategory);

	String updateClassified(ClassifiedHouseHunting classifiedObj, String classifiedid);

	String updateClassifiedStatus(String id, String csftype, String csfCategory);

	List<ClassifiedImages> getClassifiedImagesEdit(int id);

	String downloadInvoicePdf(InvoiceEntity invoice, Integer userId,String prptyName);

	void saveBlog(String title, String postedby, String postedon, String description, String tags, MultipartFile files);

	List<BlogEntity> getblogs();

	void updateBlog(String blogid, String title, String postedby, String postedon, String description, String tags, MultipartFile files);

	ClassifedDTO getClassifiedsByCity(String city,String location, String proptype);

	String getClassifiedThumbnail(int id);

	BlogEntity getblogInfo(String blog);

	List<VacanciesDto> getAllVacancies();

	ClassifedDTO adminClassifieds();

	String deleteClassified(String classifiedid, String prtyid);

	String deleteClassifiedHH(String classifiedid, String prtyid);

	List<ComplaintDetailsEntity> getComplaintListByUser(Integer userid, String propId, Integer roleid);

	String deleteBlog(String id);
	
}
