package com.tekskills.DAO;

import java.util.List;

import com.tekskills.DTO.OwnerDetailsDTo;
import com.tekskills.entity.AptUserProperties;
import com.tekskills.entity.OwnerDetails;
import com.tekskills.entity.TenantDetailsEntity;

public interface OwnerDao {
	List<OwnerDetailsDTo> getOwnerListByprtyId(int userId, int prtyId, int ownerid, int tntid, int roleid);

	int saveOwner(OwnerDetails owner);

	//void updateAsset(AssetDetails asset);

	OwnerDetails getOwnerByOwnerid(int onwrId);

	void updateOwner(OwnerDetails owner);

	int getOwnerByUserid(Integer id);

	void updateOwnerProp(AptUserProperties uprop);

	void updateUser(int ousrid, String emailId, int status, int prtyid);

	String getPasswoordByMail(String mail);

	OwnerDetails getownerBymail(String emailId);

	String validateOwnerMail(String ownermail, int prtyidInt, String type);

	int getTenanatByUserid(Integer id);

	TenantDetailsEntity getTenantByMail(String email);

	List<OwnerDetailsDTo> getOwnerListByTenant(int userId, int prtyId, int i, int tntid, int roleid);
}
