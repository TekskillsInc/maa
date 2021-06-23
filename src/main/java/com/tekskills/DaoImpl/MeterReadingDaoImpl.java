package com.tekskills.DaoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekskills.DAO.MeterReadingDao;
import com.tekskills.DTO.AptInvoiceDTO;
import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.OwnerDTo;
import com.tekskills.DTO.TenantDTo;
import com.tekskills.entity.AptPaymentDetails;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.MeterCostsEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.VendorEntity;

@Repository
public class MeterReadingDaoImpl implements MeterReadingDao {
	@Autowired
	private SessionFactory sessfact;
	  private static final Logger logger = Logger.getLogger(MeterReadingDaoImpl.class);
	
	@Override
	public int saveMeterReadings(MeterReadingsEntity readingObj) {
		
		int id=0;
		try {
			Session session=sessfact.getCurrentSession();
			id=(int) session.save(readingObj);
		} catch (Exception e) {
			logger.error("Error in method saveMeterReadings", e);
		}
		return id;
	}

	@Override
	public List<MeterReadingsEntity> getMeterReadingList(int userId, int prtyId,int role) {
		List<MeterReadingsEntity> readingList=null;
		
		try {
			Session session=sessfact.getCurrentSession();
			if(role==1||role==2) {
			String hql="select * from maa_meterreadings where userid="+userId+" and prtyid ="+prtyId+" order by tbl_pk desc";
			readingList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(MeterReadingsEntity.class)).list();
			}
			else if(role==3) {
				 
				String hql=	"select * from maa_meterreadings where flatno in (select flatno from maa_assets_details a inner join  (select ownrid from maa_owner_details where ousrid="+userId+") owner on a.ownerid= owner.ownrid where a.prtyid ="+prtyId+")  and prtyid ="+prtyId+" order by tbl_pk desc";
				readingList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(MeterReadingsEntity.class)).list();
			}
			else if(role==4) {

				String hql= "select * from maa_meterreadings where flatno in (select flatno from maa_assets_details a inner join  (select tntid from maa_tenant_details where tusrid="+userId+") owner on a.tenantId= owner.tntid where a.prtyid ="+prtyId+")  and prtyid ="+prtyId+" order by tbl_pk desc";
				readingList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(MeterReadingsEntity.class)).list();
			}
			
		}catch (Exception e) {
			logger.error("Error in method getMeterReadingList", e);
		}	
		return readingList;
	}

	@Override
	public void updateMeterReading(MeterReadingsEntity readingObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(readingObj);
		} catch (Exception e) {
			logger.error("Error in method updateMeterReading", e);
		}
		
		
	}
	
	@Override
	public MeterReadingsEntity getMeterReadingsBytId(int mtrId) {
		MeterReadingsEntity readingobj = null;
			try {
				Session session = sessfact.getCurrentSession();
				String hql = "from MeterReadingsEntity where  tbl_pk="+mtrId+" ";
				readingobj = (MeterReadingsEntity) session.createQuery(hql).uniqueResult();
			} catch (Exception e) {
				logger.error("Error in method getMeterReadingsBytId", e);
			}
			return readingobj;
		}

	@Override
	public MeterReadingsEntity getMeterDetailsByMonth(String month, String year, String unitNo1,int prtyid,int userid) {
		MeterReadingsEntity readingobj = null;
		try {
			Session session = sessfact.getCurrentSession();
			String hql = "from MeterReadingsEntity where  prtyid="+prtyid+" and userid="+userid+" and month='"+month+"' and year='"+year+"' and flatno='"+unitNo1+"'";
			readingobj = (MeterReadingsEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.error("Error in method getMeterDetailsByMonth", e);
		}
		return readingobj;
		
		
	}

	@Override
	public MeterCostsEntity getMeterCostByPrty(int propertyIdInt) {
		
		MeterCostsEntity meter = null;
		try {
			Session session = sessfact.getCurrentSession();
			String hql = "from MeterCostsEntity where  prtyid="+propertyIdInt+" ";
			meter = (MeterCostsEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.error("Error in method getMeterCostByPrty", e);
		}
		return meter;
	}

	
	@Override
	public void saveMeterCosts(MeterCostsEntity costObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.save(costObj);
		} catch (Exception e) {
			logger.error("Error in method saveMeterCosts", e);
		}
		
	}

	@Override
	public void updateMeterCost(MeterCostsEntity meterObj) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(meterObj);
		} catch (Exception e) {
			logger.error("Error in method updateMeterCost", e);
		}
		
	}

	@Override
	public String deleteReadingsByFlat(int prtyIdInt, String flatNo, String month, String year, int tblpkInt) {
		
		String msg=null;
		try {	
		Session session=sessfact.getCurrentSession();
		MeterReadingsEntity meter= (MeterReadingsEntity) session.get(MeterReadingsEntity.class, tblpkInt);
		if(meter!=null) {
		
		session.delete(meter);
		msg="Success";
		}
		else {
			msg="Fail";
		}
	} catch (Exception e) {
		logger.error("Error in method deleteReadingsByFlat", e);
	}
		return msg;
		
	}

	@Override
	public List<AptInvoiceDTO> getInvoiceListByprtyId(int userId, int prtyId, int roleid, int ownerid, int tntid) {
		List<AptInvoiceDTO> invList=null;

		try {
			Session session=sessfact.getCurrentSession();
			

			String hql="exec getInvoiceProperty @prptyid="+prtyId+",@ownerid="+ownerid+",@tntid="+tntid+",@roleid="+roleid+",@userid="+userId+"";
			invList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(AptInvoiceDTO.class)).list();
			
			
		}catch (Exception e) {
			logger.error("Error in method getInvoiceListByprtyId", e);
		}	
		return invList;
	}

	@Override
	public int saveInvoice(InvoiceEntity invoice) {
		//String message=null;
		int id=0;
		
		try {
			Session session=sessfact.getCurrentSession();
			 id=(int) session.save(invoice);
					} catch (Exception e) {
			logger.error("Error in method saveInvoice DAOIMPL", e);
		}
		return id;
	}

	@Override
	public String deleteInvoice(int invoiceidInt, int userId) {
		String message=null;
		try {
			Session session=sessfact.getCurrentSession();
			InvoiceEntity invoice= (InvoiceEntity) session.get(InvoiceEntity.class, invoiceidInt);
			if(invoice!=null) {
			//String sql="select from apt_meterreadings where tbl_pk="+tblpkInt+" and flatno="+flatNo+" and prtyid="+prtyIdInt+" and month='"+month+"' and year='"+year+"'";
			session.delete(invoice);
			message="Success";
			}
		} catch (Exception e) {
			logger.error("Error in method saveInvoice DAOIMPL", e);
		}
		return message;	}

	@Override
	public InvoiceEntity getInvoiceByInvoiceid(int invoiceidInt, int userId) {
		
		InvoiceEntity invoice=null;
		try {
			Session session=sessfact.getCurrentSession();
			//String hql="from InvoiceEntity where invoiceid="+invoiceidInt+"and userid="+userId+"";
			String hql="from InvoiceEntity where invoiceid="+invoiceidInt+"";
			invoice= (InvoiceEntity) session.createQuery(hql).uniqueResult();
			
		} catch (Exception e) {
			logger.error("Error in method saveInvoice DAOIMPL:"+e.toString());
			e.getStackTrace();
		}
		return invoice;	
		}

	@Override
	public GSTEntity getGstByPrty(int propertyIdInt) {

		GSTEntity gst = null;
		try {
			Session session = sessfact.getCurrentSession();
			String hql = "from GSTEntity where prtyid="+propertyIdInt+"";
			gst = (GSTEntity) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.error("Error in method getGstByPrty", e);
		}
		return gst;
	}

	@Override
	public void saveGst(GSTEntity gst) {

	
		try {
			Session session=sessfact.getCurrentSession();
			 session.save(gst);
		} catch (Exception e) {
			logger.error("Error in method saveMeterReadings", e);
		}
		
	}

	@Override
	public void savePayment(AptPaymentDetails payment) {
		try {
			Session session=sessfact.getCurrentSession();
			 session.save(payment);
		} catch (Exception e) {
			logger.error("Error in method savePayment", e);
		}
		
	}

	@Override
	public void updateInvoice(int invcid, int status) {
		try {
			Session session=sessfact.getCurrentSession();
			InvoiceEntity invoice= (InvoiceEntity) session.get(InvoiceEntity.class, invcid);
			if(invoice!=null) {
				invoice.setStatus(status);
			session.update(invoice);
			
			}
		} catch (Exception e) {
			logger.error("Error in method updateInvoice DAOIMPL", e);
		}
		
	}

	@Override
	public List<AptPaymentsDTO> getpaymentListByprtyId(int userId, int prtyId, int roleid, int ownerid, int tntid) {
		List<AptPaymentsDTO> payList=null;
		
		try {
			
			
			Session session=sessfact.getCurrentSession();
			String hql="exec getAllPaymentProperty  @prptyid="+prtyId+",@ownerid="+ownerid+",@tntid="+tntid+",@roleid="+roleid+",@userid="+userId+" ";
			payList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(AptPaymentsDTO.class)).list();
			
	
			
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyId", e);
		}	
		return payList;
	}

	@Override
	public List<TenantDTo> getTenantInfoByPrtyId(int prtyId, int userId, int roleid) {
		List<TenantDTo> tList=null;
		
		try {
			Session session=sessfact.getCurrentSession();
			String hql="exec TenantInfo @prtyid="+prtyId+",@userid="+userId+"";

			tList=session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(TenantDTo.class)).list();
			
			/*for (int tntid : tenantIdList) {
			}
			*/
			
	
			
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyId", e);
		}	
		return tList;
	}

	@Override
	public List<OwnerDTo> getOwnerInfoByPrtyId(int prtyId, int userId, int roleid) {
		List<OwnerDTo> oList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="exec OwnerInfo_payment @prtyid="+prtyId+",@userid="+userId+"";
			oList= session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(OwnerDTo.class)).list();
			
	
			
		}catch (Exception e) {
			logger.error("Error in method getAssetListByprtyId", e);
		}	
		return oList;
	}

	@Override
	public List<VendorEntity> getAllVendorsByprty(int prtyId,int roleid) {
		List<VendorEntity> vendorList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql=null;
			//if(roleid==2||roleid==1) {
			if(roleid==1) {	
			 hql="from VendorEntity  order by status desc";
			}else if(roleid==2){
				 hql="from VendorEntity where prtyid="+prtyId+" order by status desc";
			}
			else {
				hql="from VendorEntity where prtyid="+prtyId+" and status=1 order by status desc";
			}
			vendorList= session.createQuery(hql).list();
				
		}catch (Exception e) {
			logger.error("Error in method getAllVendorsByprty", e);
		}	
		return vendorList;
	}

	@Override
	public void saveVendor(VendorEntity vendor) {
		try {
			Session session=sessfact.getCurrentSession();
		 session.save(vendor);
		} catch (Exception e) {
			logger.error("Error in method saveVendor----DAO impl", e);
		}
		
	}

	@Override
	public void deleteVendor(int vendorInt) {
		try {	
			Session session=sessfact.getCurrentSession();
			VendorEntity vendor= (VendorEntity) session.get(VendorEntity.class, vendorInt);
			if(vendor!=null) {
			//String sql="select from apt_meterreadings where tbl_pk="+tblpkInt+" and flatno="+flatNo+" and prtyid="+prtyIdInt+" and month='"+month+"' and year='"+year+"'";
			
				vendor.setStatus(0);
				session.update(vendor);
			
			}
		}
			 catch (Exception e) {
					logger.error("Error in method saveVendor----DAO impl", e);
				}
				
		
	
	}

	@Override
	public void updateGst(GSTEntity gst) {
		try {	
			Session session=sessfact.getCurrentSession();
			
			
				session.update(gst);
			
			
		}
			 catch (Exception e) {
					logger.error("Error in method updateGst----DAO impl", e);
				}
				
		
	}

	@Override
	public VendorEntity getVendorByVendorid(int vendorid, int prtyid) {
		VendorEntity vendor= null;
		try {
		Session session=sessfact.getCurrentSession();
		String hql="from VendorEntity where prtyid="+prtyid+" and vendorid="+vendorid+"";
		vendor= (VendorEntity) session.createQuery(hql).uniqueResult();
	
		
			
		
	}
		 catch (Exception e) {
				logger.error("Error in method saveVendor----DAO impl", e);
			}
		return vendor;
	}
	@Override
	public void updateVendor(VendorEntity vendor) {
		try {	
			Session session=sessfact.getCurrentSession();
			
			
				session.update(vendor);
			
			
		}
			 catch (Exception e) {
					logger.error("Error in method updateGst----DAO impl", e);
				}
				
		
	}

	@Override
	public String getTenantEmail(int tenantid) {
		String tenantmail=null;
	
		try {
		Session session=sessfact.getCurrentSession();
		String hql="select concat(tenant_email, '_',tenant_contact, '_',tenant_name) as tmail from TenantDetailsEntity  where tbl_id="+tenantid;
		tenantmail= (String) session.createQuery(hql).uniqueResult();
		}
		catch (Exception e) {
			logger.error("Error in method updateGst----DAO impl", e);
		}
		return tenantmail;
	}

	@Override
	public String getOwnerEmail(int ownerid) {
		String ownermail=null;
		
		try {
		Session session=sessfact.getCurrentSession();
		String hql="select concat(email, '_',contact,'_',name) as omail from OwnerDetails  where ownrid="+ownerid;
		ownermail= (String) session.createQuery(hql).uniqueResult();
		}
		catch (Exception e) {
			logger.error("Error in method updateGst----DAO impl", e);
		}
		return ownermail;
	}

	@Override
	public InvoiceEntity getInvoiceByPrtyid(int prptyid, String month, String year, String flatnoInt, int userId) {
		InvoiceEntity invoice=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from InvoiceEntity where prptyid="+prptyid+"and month='"+month+"' and year='"+year+"' and flano='"+flatnoInt+"' and userid="+userId+"";
			invoice= (InvoiceEntity) session.createQuery(hql).uniqueResult();
			
		} catch (Exception e) {
			logger.error("Error in method saveInvoice DAOIMPL", e);
		}
		return invoice;	
	}

	@Override
	public void updateInvoice(InvoiceEntity invoiceObj) {
		try {	
			Session session=sessfact.getCurrentSession();
			
			
				session.update(invoiceObj);
			
			
		}
			 catch (Exception e) {
					logger.error("Error in method updateInvoice----DAO impl", e);
				}
				
	}

	@Override
	public String getPrtyAdress(int prptyid) {
		String prtyAdd=null;
		
		try {
		Session session=sessfact.getCurrentSession();
		/*String hql="select concat(concat(landmark,',',city, ',',state,',',dist,',',zip),'/',concat('Ph: ',contact,' Email Id: ',buldingmail)) as tmail from ApartmentDetialsEntity  where buildingid="+prptyid;*/
		String hql="select concat(concat(landmark,',',city, ',',state,',',dist,',',zip),'/',concat('Ph: ',contact,' Email Id: ',buldingmail)) as tmail from maa_user_details  where buildingid="+prptyid;
		System.out.println(hql);
		prtyAdd= (String) session.createSQLQuery(hql).uniqueResult();
		}
		catch (Exception e) {
			logger.error("Error in method updateGst----DAO impl", e);
		}
		return prtyAdd;
	}

	@Override
	public String getBuildingMail(Integer prptyid) {
String buildingmail=null;
		
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select buldingmail from ApartmentDetialsEntity where buildingid ="+prptyid+"";
			buildingmail= (String) session.createQuery(hql).uniqueResult();
		}catch (Exception e) {
			logger.error("Error in method getMeterReadingList", e);
		}	
		return buildingmail;
	}

	@Override
	public List<OwnerDTo> getOwnerDetailsByProperty(int prtyIdInt, Integer userId) {
		List<OwnerDTo> ownerList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select o.ownrid as ownerid,o.name as ownername,o.email as email,o.address as address,o.pic as pic,o.contact as contact, a.flatno as flatno from maa_owner_details o inner join maa_assets_details a on o.ownrid=a.ownerid where a.prtyid="+prtyIdInt+"";
			ownerList=  session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(OwnerDTo.class)).list();
		}catch (Exception e) {
			logger.error("Error in method getMeterReadingList", e);
		}	
		return ownerList;
	}
	@Override
	public List<TenantDTo> getTenantDetailsByProperty(int prtyIdInt) {
		List<TenantDTo> tenantList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="select t.tntid as tenantid,t.tenant_name as tenantname,t.tenant_email as email,t.tenant_contact as contact,t.address as address,t.pics as pics,a.flatno as flatno from maa_tenant_details t inner join maa_assets_details a on t.tntid=a.tenantId where a.prtyid="+prtyIdInt+"";
			tenantList=  session.createSQLQuery(hql).setResultTransformer(new AliasToBeanResultTransformer(TenantDTo.class)).list();
		}catch (Exception e) {
			logger.error("Error in method getMeterReadingList", e);
		}	
		return tenantList;
	}
	@Override
	public List<String> getAllMailsByprty(int prtyIdInt) {
		List<String> mailList=null;
		try {
			Session session=sessfact.getCurrentSession();
			String sql="select email from maa_user_info where userid in (select userid from maa_user_properties where prptyid="+prtyIdInt+")";
			mailList= session.createSQLQuery(sql).list();
		}catch (Exception e) {
			logger.error("Error in method getAllMailsByprty", e);
		}	
		return mailList;
	}

	@Override
	public List<VendorEntity> getActveAllVendorsByprty(int prtyId, Integer roleid) {
		List<VendorEntity> vendorList=null;
		try {
			Session session=sessfact.getCurrentSession();
			
			String hql="from VendorEntity where prtyid="+prtyId+" and status=1 order by status desc";
			
			vendorList= session.createQuery(hql).list();
				
		}catch (Exception e) {
			logger.error("Error in method getAllVendorsByprty", e);
		}	
		return vendorList;
	}

	@Override
	public Integer getpaymentTopRowByInvoiceId(int invcid) {
		Integer readingobj = null;
		try {
			Session session = sessfact.getCurrentSession();
			//SELECT TOP 1 * FROM maa_payments where invcid=16 order by tblpk asc
			String hql = "SELECT TOP 1 tblpk FROM maa_payments where invcid="+invcid+" order by tblpk asc";
			//readingobj = (TimesheetDto) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(TimesheetDto.class)).uniqueResult();
			readingobj = (Integer) session.createSQLQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.error("Error in method getpaymentTopRowByInvoiceId", e);
		}
		return readingobj;
	}
	
	@Override
	public AptPaymentsDTO getpaymentLastestRowByInvoiceId(int invcid) {
		AptPaymentsDTO readingobj = null;
		try {
			Session session = sessfact.getCurrentSession();
			String sql = "SELECT TOP 1 tblpk as tblpk,invAmount as totalAmount,paid_amt as amountPaid,dueAmount as due_amt FROM maa_payments where invcid="+invcid+" order by tblpk desc";
			readingobj = (AptPaymentsDTO) session.createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(AptPaymentsDTO.class)).uniqueResult();
			
		} catch (Exception e) {
			logger.error("Error in method getpaymentLastestRowByInvoiceId", e);
		}
		return readingobj;
	}
	
	@Override
	public Integer getTenantIdByFlatNo(String unitNo, int prptyid) {
		Integer readingobj = null;
		try {
			Session session = sessfact.getCurrentSession();
			String hql = "select tenantId from maa_assets_details where flatno='"+unitNo+"' and prtyid="+prptyid+"";
			readingobj = (Integer) session.createSQLQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.error("Error in method getTenantIdByFlatNo", e);
		}
		return readingobj;
	
	}

	@Override
	public AptPaymentDetails getpaymentDetailsByPaymentId(int payment_id) {
		AptPaymentDetails payment=null;
		try {
			Session session=sessfact.getCurrentSession();
			String hql="from AptPaymentDetails where tblpk="+payment_id+"";
			payment= (AptPaymentDetails) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			logger.error("Error in method getpaymentDetailsByPaymentId DAOIMPL:"+e.toString());
			e.getStackTrace();
		}
		return payment;	
	}

	@Override
	public void updatePayment(AptPaymentDetails payment) {
		try {
			Session session=sessfact.getCurrentSession();
			session.update(payment);
		} catch (Exception e) {
			logger.error("Error in method updatePayment", e);
		}
	}
}
