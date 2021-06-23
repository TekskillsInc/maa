package com.tekskills.DAO;

import java.util.List;

import com.tekskills.DTO.AptInvoiceDTO;
import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.OwnerDTo;
import com.tekskills.DTO.TenantDTo;
import com.tekskills.entity.AptPaymentDetails;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.MeterCostsEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.VendorEntity;

public interface MeterReadingDao {

	int saveMeterReadings(MeterReadingsEntity readingObj);

	List<MeterReadingsEntity> getMeterReadingList(int userId, int prtyId,int role);

	void updateMeterReading(MeterReadingsEntity readingObj);

	MeterReadingsEntity getMeterReadingsBytId(int mtrId);

	MeterReadingsEntity getMeterDetailsByMonth(String month, String year, String unitNo, int prtyid, int userId);

	MeterCostsEntity getMeterCostByPrty(int propertyIdInt);

	

	void saveMeterCosts(MeterCostsEntity costObj);

	void updateMeterCost(MeterCostsEntity meterObj);

	String deleteReadingsByFlat(int prtyIdInt, String flat, String month, String year, int tblpkInt);

	List<AptInvoiceDTO> getInvoiceListByprtyId(int userId, int prtyId, int roleid, int ownerid, int tntid);

	int saveInvoice(InvoiceEntity invoice);

	String deleteInvoice(int invoiceidInt, int userId);

	InvoiceEntity getInvoiceByInvoiceid(int invoiceidInt, int userId);

	GSTEntity getGstByPrty(int propertyIdInt);

	void saveGst(GSTEntity gst);

	void savePayment(AptPaymentDetails payment);

	void updateInvoice(int invcid, int status);

	List<AptPaymentsDTO> getpaymentListByprtyId(int userId, int prtyId, int roleid, int ownerid, int tntid);

	List<TenantDTo> getTenantInfoByPrtyId(int prtyId, int userId, int roleid);

	List<OwnerDTo> getOwnerInfoByPrtyId(int prtyId, int userId, int roleid);

	List<VendorEntity> getAllVendorsByprty(int prtyId, int roleid);

	void saveVendor(VendorEntity vendor);

	void deleteVendor(int vendorInt);

	void updateGst(GSTEntity gst);

	VendorEntity getVendorByVendorid(int vendorid, int prtyid);

	void updateVendor(VendorEntity vendor);

	String getTenantEmail(int tenantid);

	String getOwnerEmail(int ownerid);

	InvoiceEntity getInvoiceByPrtyid(int prptyid, String month, String year, String flatno, int userId);

	void updateInvoice(InvoiceEntity invoiceObj);

	String getPrtyAdress(int prptyid);

	String getBuildingMail(Integer prptyid);

	List<OwnerDTo> getOwnerDetailsByProperty(int prtyIdInt, Integer userId);

	List<TenantDTo> getTenantDetailsByProperty(int prtyIdInt);

	List<String> getAllMailsByprty(int prtyIdInt);

	List<VendorEntity> getActveAllVendorsByprty(int prtyId, Integer roleid);

	Integer getpaymentTopRowByInvoiceId(int invcid);

	AptPaymentsDTO getpaymentLastestRowByInvoiceId(int invcid);

	Integer getTenantIdByFlatNo(String unitNo, int prptyid);

	AptPaymentDetails getpaymentDetailsByPaymentId(int payment_id);

	void updatePayment(AptPaymentDetails payment);
	
}
