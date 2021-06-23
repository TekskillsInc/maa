package com.tekskills.Service;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.ExpenseChatDto;
import com.tekskills.DTO.MeterReadingsDTO;
import com.tekskills.DTO.PropertyDto;
import com.tekskills.DTO.SecurityBean;
import com.tekskills.DTO.UserInfoDto;
import com.tekskills.entity.ApartmentDetialsEntity;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.TermsAndConditions;

public interface MaaService {

	String saveUserRegistration(String buildingName, String buldingMail, String buldingPhn, String password, String uscNo,
			String pincode);

	UserInfoDto validateUser(String username, String password, String role);

	String saveBuilding(String buildingName, String noOfUnits, String proptype, String blocality, String buldingMail,
			String buldingPhn, String city, String state, String pincode, 
			String altcontact,  String comnCurMeter, String comnWtrMeter, String mgrName, String mgrPhn,
			String mgrAltPhn, String mgrMail, String notes, String upiId,String district,String secName, String secPhn, String secEmail, String prtyImg,String userId, String uscNo, String bAcntNo, String ifscCode, String accountname) throws MessagingException;

	List<PropertyDto> getPropertListByUserid(int userId, int roleid);

	

	PropertyDto getPropertByProptyid(int userid, String propId);

	int getpropertyIdBtUserid(int userId);

	List<AssetDetailsDto> getAssetListByprtyId(int userId, String propertyId, int roleid);

	void saveAssetByPropertyId(int userId, String propertyId, String unitNo, String roomType,
			String prtytax, String areSqft, String rent, String maintanance, String secBill, String wtrMeter,
			String curMeter, String dslMeter, String acMeter, String gasMeter, String othMeter);

	AssetDetails getAssetByAssetid(String prtyid, String userid, String assetid, String flatno);

	void updateAssetByPropertyId(int userId, String propertyId, String assetId, String unitNo, String roomType,
			String prtytax, String areSqft, String rent, String maintanance, String secBill, String wtrMeter,
			String curMeter, String dslMeter, String acMeter, String gasMeter, String othMeter);



	String updateProperty(String propertyId, String buildingName, String noOfUnits, String proptype, String blocality,
			String buldingMail, String buldingPhn, String city, String state, String pincode, String prtyImg,
			String altcontact, String comnCurMeter, String comnWtrMeter, String mgrName, String mgrPhn,
			String mgrAltPhn, String mgrMail, String notes, String upiId, String district, String secName,
			String secPhn, String secEmail, String userId, String ibAcntNo, String ifscCode, String accountname);

	List<AssetDetails> getAssetListByprtyIdOwner(int userId, String propertyId,int ownerid );

	List<AssetDetails> getAssetListByprtyIdTenant(int userId, String propertyId, int tenantid);

	List<AssetDetails> getAssetListByprtyIdEdit(int userId, String prtyid, int roleid,String ownerid);

	MeterReadingsEntity getMeterReadingsByFlat(String prtyid, String flat, String month, String year);

	AssetDetails getAssetByFlat(String prtyid, int userId, String flat);

	GSTEntity getGST(String prtyid);
	
	List<ApartmentDetialsEntity> getUserDetails();

	String updateUserStatus(String statusid, String userid, String buildingid, String buldingmail, String buildName, String uscno);
	
	PropertyDto getPropertByProptyid(int userid, String propId, int roleid);

	SecurityBean getAllSecuredPwd();

	AssetDetails getFlat(String prtyid, String flatno,int userid);

	String changePassword(int userid, String currentPassword, String newPassword, String confirmPassword);

	String checkPassword(int userid, String currentPassword);

	TermsAndConditions getTermsandConditions(String prptyid, String userid, String tblpk);

    void saveTandC(int prptyId, int userId, String terms);

    void updateTandC(int tblpk, String terms);

    TermsAndConditions getTANDCByPrty(String prptyid, String userid);

	List<AssetDetailsDto> getAssetListByprtyIdInvoice(Integer userId, String propertyId, Integer roleid);

	String showUserInWebSite(String propertyId, String vendorId, String flag);

	MeterReadingsDTO getMeterReadingsForInvoice(String prtyid, String flatNo, String readingType, String prvMonth,
			String month, String year);

	String getBuildingNmaeByMail(String buldingMail);

	int getUnitCount(String propertyId);

	int getAssetCount(String propertyId);

	int getOwnerCountByProperty(String propId, Integer userid);

	int getTenanantCountByProperty(String propId, Integer userid);

	int getVacanciesByProperty(String propId, Integer userid, Integer roleid);

	List<ExpenseChatDto> getExpensesForYear(String propId,int userid, Integer roleid);

	Map<String, Integer> getPaymentsForYear();

	String[] getBankDetailsByProperty(int prtyid);

	int getBlogCountByProperty();

	int getVendorCountByProperty();

	int getClassifiedCountByProperty();

	int getPropertyCount();

	String hideClasified(String propertyId, String classified, String status);

}
