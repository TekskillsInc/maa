package com.tekskills.DAO;

import java.util.List;

import com.tekskills.DTO.TenantDetailsDTo;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.TenantDetailsEntity;

public interface TenantDao {
	int saveTenant(TenantDetailsEntity tenantObj);
	List<AssetDetails> getTenantAssetListbyPrptyId(int userId,int prtyId, int tenantidInt);
	List<TenantDetailsDTo> getTenantListByPrtyId(int prtyId, Integer tntid, int roleid, Integer ownerid);
	TenantDetailsEntity getTenantByTenantId(int tenantId);
	void updateTenant(TenantDetailsEntity tenantObj);
	List<TenantDetailsDTo> getTenantListByPrtyIdOwner(int prtyId, int tntid, int roleid, int owneridint);
	

}
