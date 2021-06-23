package com.tekskills.DAO;



import java.util.List;
import java.util.Map;

import com.tekskills.DTO.AssetDetailsDto;
import com.tekskills.DTO.ExpenseChatDto;
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

public interface MaaDao {
	
	
	int saveRegistration(ApartmentUserInfoEntity aptUserInfo);

	int saveBuildingDetails(ApartmentDetialsEntity aptDetailsInfo);

	ApartmentUserInfoEntity getUserDetailsBymail(String username, String password, int roleid);

	List<Integer> getPropertListByUserid(int userId, int roleid);

	ApartmentDetialsEntity gePropertyDetailsInfoByUserId(int userIdInt, int propertyIdInt);

	int updatePropertyByBuilding(ApartmentDetialsEntity aptDetailsInfo);

	PropertyDto getPropertByProptyid(int userid, int propertyId, int roleid);

	int getpropertyIdBtUserid(int userId);

	List<AssetDetailsDto> getAssetListByprtyId(int userId, int prtyId, int roleid, int ownerid, int tntid);
	
	List<AssetDetails> getAssetListByprtyIdTenant(int userId, int prtyId, int tenantid);
	
	List<AssetDetails> getAssetListByprtyIdOwner(int userId, int prtyId,int ownerid );
	void saveAssetByProperty(AssetDetails asset);

	AssetDetails getAssetByAssetId(int iprtyid, int iflatno, int iuserid);

	void updateAsset(AssetDetails asset);

	AssetDetails getAssetIdByFlat(int prtyid, String uVal, int userId, int onwrId);

	int saveAptUserRoles(AptUserRoles userRole);

	ApartmentUserInfoEntity getUserInfoByUserid(int userIdInt);

	void updateUserInfo(ApartmentUserInfoEntity aptUserInfo);

	AptUserRoles getRolesByUseriD(Integer id, int roleid);

	ApartmentUserInfoEntity getUserInfoByMail(String mgr_email);

	AptUserProperties getPropertiesByRole(int tblpk, Integer id);

	void saveUserProperty(AptUserProperties usrPropObj);

	AptUserProperties getUserPropertiesbyUserid(int ousrid, int propertyId);

	List<String> getFlatNoByOwner(int userId, int prtyid, int onwrId);

	AssetDetails getAssetIdByFlatTenanat(int prtyid, String flatNoVal, int userId, int tntId);

	List<String> getAssetTenant(int userId, int prtyid, int tntId);

	Integer getOwnerid(int userId, int roleid, Integer tntid, int prtyId);

	Integer getTntid(int userId, int roleid);

	List<AssetDetails> getAssetListByprtyIdEdit(int userId, int prtyId, int roleid,int ownerid);

	MeterReadingsEntity getMeterReadingsByFlat(int prtyIdInt, String flat, String month, String year);

	AssetDetails getAssetByFlat(int iprtyid, int userId, String flatno);

	GSTEntity getGST(int prtyidInt);

	List<ApartmentDetialsEntity> getUserDetails();

	String updateUserStatus(int stsId, int userId, int buildId);

	GSTEntity getGSTById(int gstInt);

	SecurityBean getAllSecuredPwd();

	String checkPassword(int userid, String currentPassword);

	String changePassword(int userid, String currentPassword, String newPassword, String confirmPassword);
	
	TermsAndConditions getTermsandConditions(int userid, int prptyid);

    void saveTandC(TermsAndConditions termsObj);

    void updateTandC(TermsAndConditions termsObj);

	List<AssetDetailsDto> getAssetListByprtyIdInvoice(Integer userId, int prtyId, Integer roleid);

	void showUserInWebSite(VendorEntity vendorObj);

	MeterReadingsDTO getMeterReadingsForInvoice(int prtyIdInt, String flatNo, String readingType, String prvMonth,
			String month, String year);

	String getMailByUserid(Integer userId);

	String getBuildingNmaeByMail(String buldingMail);

	String getOccupiedByFlat(int prtyidInt, String flat, int userId);

	String getOwneridArry(int userId, int roleid, int tntid, int prtyId);

	List<AssetDetails> getAssetListByprtyIdTenantForDelete(int userId, int prtyidInt, int tenantId);

	int getNoOfAssetsByPrty(int prtyid);

	int getAssetCount(int prtyid);

	String[] getBankDetailsByProperty(Integer prptyid);

	Double getInvoiceAmountPaidByInvid(int invoiceid);

	int getOwnerCountByProperty(int prtyid,Integer userid);

	int getTenanantCountByProperty(int prtyid,Integer userid);

	int getVacanciesByProperty(int prtyid, Integer roleid);

	List<Object[]> getExpenseForYear(int prtyintval, String flatno,int role);

	List<Object[]> getPaymentsForYear();

	int getClassifiedCountByProperty();

	int getVendorCountByProperty();

	int getBlogCountByProperty();

	int getPropertyCount();

	void hideClasifiedInWebSite(int prpId, int classifiedId, String status);

}
