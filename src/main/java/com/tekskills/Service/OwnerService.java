package com.tekskills.Service;

import java.util.List;

import com.tekskills.DTO.OwnerDetailsDTo;
import com.tekskills.DTO.TenantDetailsDTo;

public interface OwnerService {

	List<OwnerDetailsDTo> getOwnerByprtyId(int userId, String propertyId, int roleid);

	void saveOwnerDetails(int userId, String propertyId, String flatno_input, String uPID, String mobile, String ownerName,
			String altMobile, String emailId, String address, String notes, String ownrImgName, String ownrIdImgName,String occ_by, String prptyName);

	void UpdateOwnerDetails(int userId, String propertyId,String ownerid, String flatno_input, String uPID, String mobile,
			String ownerName, String altMobile, String emailId, String address, String notes, String ownrImgName,
			String ownrIdImgName, String occ_by, String chkBox, String[] flatObjArr);

	String deleteOwner(int userId, String propertyId, String iOwnrId);

	List<TenantDetailsDTo> getTenantsByOwner(int userId, String prtyid, int roleid, String ownerid);

	String getPasswordByMail(String mail,String prtyname);

	String validateOwnerMail(String prtyid, String ownermail, String type);

	String getOccupiedByFlat(int userId, String propertyId, String flat);

}
