package com.tekskills.Service;

import java.util.List;

import com.tekskills.DTO.TenantDetailsDTo;
import com.tekskills.entity.AssetDetails;

public interface TenantService {

	void saveTenantDetails(int userId, String assetNo, String name, String email, String phone,
			String paddress, String advamntpaid, String idno, String joiningdate, String endingdate, String comments,
			String tenantImgName, String tenantIdImgName, String occ_by, String prtyId, String prptyName);

	List<AssetDetails> getTenantAssetListbyPrptyId(int userId, String prtyid, String tenantid);

	List<TenantDetailsDTo> getTenantListByPrtyId(String propertyId, int userId, int roleid);


	  void UpdateTenantDetails(int userId, String propertyId, String etenant_name, String prptyName, String email,
				String etenant_contact, String eassetNo, String eaddress, String eadvamount, String idno, String ejoin_date,
				String eend_date, String ecomments, String chkBox,  String tntImgName, String tntIdImgName, String tenantId, String[] flatObjArr);

	
		
	String deleteTenant(String tntId, String prtyid, int userId);

	//List<TenantDetailsEntity> getTenantByprtyId(int userId, String propertyId);

}
