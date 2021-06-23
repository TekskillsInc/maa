package com.tekskills.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekskills.DAO.TenantDao;
import com.tekskills.DTO.TenantDetailsDTo;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.TenantDetailsEntity;

@Repository
public class TenantDaoImpl implements TenantDao {
	@Autowired
	private SessionFactory sessfact;
	private static final Logger logger = Logger.getLogger(TenantDaoImpl.class);

	@Override
	public int saveTenant(TenantDetailsEntity tenantObj) {
		int tenantId = 0;
		try {
			Session session = sessfact.getCurrentSession();
			tenantId = (int) session.save(tenantObj);

		} catch (Exception e) {
			logger.error("Error in method saveTenant", e);
		}
		return tenantId;
	}

	@Override
	public List<AssetDetails> getTenantAssetListbyPrptyId(int userId, int prtyId, int tenantidInt) {
		
		List<AssetDetails> assetList1=new ArrayList<>();
		List<AssetDetails> assetList2=new ArrayList<>();
		try {
			Session session = sessfact.getCurrentSession();
			
			
			String hql = "from AssetDetails where userid=" + userId + " and prtyid =" + prtyId
					+ " and   occ_by = 'V'";
			assetList1 = session.createQuery(hql).list();
			 String hql2="from AssetDetails where userid="+userId+" and prtyid ="+prtyId+" and  tenantId="+tenantidInt+"";
			 assetList2= session.createQuery(hql2).list();
			 assetList1.addAll(assetList2);
			
			
			
			
			
		} catch (Exception e) {
			logger.error("Error in method getTenantAssetListbyPrptyId", e);
		}
		return assetList1;
	}

	@Override
	public List<TenantDetailsDTo> getTenantListByPrtyId(int prtyId,Integer tntid,int roleid,Integer ownrid) {
		List<TenantDetailsDTo> tenantList = null;
		try {
			Session session = sessfact.getCurrentSession();
			String hql =null;
			
			
			 hql = "exec getAllTenantByProperty @prptyid =" + prtyId + ",@tntid="+tntid+",@roleid="+roleid+",@ownrid="+ownrid+"";
			
			tenantList = session.createSQLQuery(hql)
					.setResultTransformer(new AliasToBeanResultTransformer(TenantDetailsDTo.class)).list();
		} catch (Exception e) {
			logger.error("Error in method getTenantListByPrtyId", e);
		}
		return tenantList;
	}

	@Override
	public TenantDetailsEntity getTenantByTenantId(int tenantId) {
		TenantDetailsEntity owner = null;
		try {
			Session session = sessfact.getCurrentSession();
			String hql = "from TenantDetailsEntity where tbl_id=" + tenantId + " ";
			owner = (TenantDetailsEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.error("Error in method getTenantByTenantId", e);
		}
		return owner;
	}

	@Override
	public void updateTenant(TenantDetailsEntity tenantObj) {
		try {
			Session session = sessfact.getCurrentSession();
			session.update(tenantObj);
		} catch (Exception e) {
			logger.error("Error in method updateTenant", e);
		}

	}

	@Override
	public List<TenantDetailsDTo> getTenantListByPrtyIdOwner(int prtyId, int tntid, int roleid, int owneridint) {
		
		List<TenantDetailsDTo> tenantList = null;
		try {
			Session session = sessfact.getCurrentSession();
			String sql="exec [getAllTenantByOwner] @prptyid ="+prtyId+",@ownerid="+owneridint+"";
		tenantList = session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TenantDetailsDTo.class)).list();
	} catch (Exception e) {
		logger.error("Error in method getTenantListByPrtyId", e);
	}
	return tenantList;
	}

}
