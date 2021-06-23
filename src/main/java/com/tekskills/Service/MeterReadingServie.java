package com.tekskills.Service;

import java.util.List;

import com.tekskills.DTO.AptInvoiceDTO;
import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.OwnerDTo;
import com.tekskills.DTO.TenantDTo;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.MeterCostsEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.VendorEntity;

public interface MeterReadingServie {

	void saveMeterReadings(int userId, int roleid, String propertyId, String month, String year, String unitNo,
			String wprvious, String wpresent, String cprvious, String ccost, String gpresent,
			String gcost, String dpresent, String dcost, String aCpresent, String aCcost, String otpresent, String otcost, String assetid);

	List<MeterReadingsEntity> getMeterReadingList(int userId, String propertyId,int roleid);

	void updateMeterReading(String tbl_pk, int userId, int roleid, String month, String year, String unitNo,
			String wprvious, String wpresent, String cprvious, String ccost, String gpresent, String gcost,
			String dpresent, String dcost, String aCpresent, String aCcost, String otpresent, String otcost);

	MeterCostsEntity getMeterCostsByPrty(String propertyId);

	void saveMeterCost(String propertyId, String wCost, String ccost, String gcost, String dcost, String aCcost,
			String otcost, int userId);



	String deleteMeterReadingsByFlat(String prtyid, String flat, String month, String year, String tblpk);

	List<AptInvoiceDTO> getInvoicesByproperty(int userId, String propertyId, int roleid);

	String saveInvoice(String flatno, int userId, InvoiceEntity invoice, String occBy, String prptyName);

	String deleteInvoice(int userId, String invoiceid);

	InvoiceEntity getInvoiceByinvoiceId(int userId, String invoiceid);

	GSTEntity getGstByPrty(String propertyId);

	void saveGST(String propertyId, String wGst, String cGst, String gGst, String dGst, String aCGst, String otGst,
			String rentGst, String mntGst, int userId);

	String savePayment(String unitNo, String payDate, String payPeriod, String invId, String ownerid_pay,
			String tenantid_pay, String invAmount, String amountPaid, String dueAmount, String payType, int userId, 
			String prtyid, String paypurpose, String paidBy, String prptyName, String payFrom, String paynote, String paymentdate);

	List<AptPaymentsDTO> getPaymentsByproperty(int userId, String propertyId, int roleid);

	List<TenantDTo> getTenantInfoByPrtyId(String propertyId, int userId, int roleid);

	List<OwnerDTo> getOwnerInfoByPrtyId(String propertyId, int userId, int roleid);

	List<VendorEntity> getAllVendorsByprty(String propertyId, int roleid);

	void saveVendor(String vendorimg, String vendorname, String profession, String mobile, String altmobile,
			String email, String idtype, String idproof, String idno, String country, int userId, String prtyid,
			String state, String city, String pincode, String address, String status, String prptyName);

	String deleteVendor(String vendorid);

	void updateGST(String gstid, String propertyId, String wGst, String cGst, String gGst, String dGst, String aCGst,
			String otGst, String rentGst, String mntGst, int userId);

	void updateMeterCost(String costid, String propertyId, String wCost, String ccost, String gcost, String dcost,
			String aCcost, String otcost, int userId);

	void updateVendor(String vendorid, String vendorimg, String vendorname, String profession, String mobile,
			String altmobile, String email, String idtype, String idproof, String idno, String country, int userId,
			int prtyid, String state, String city, String pincode, String address, String status, String prptyName, String statusTogle);

	String updateInvoice(String flatno, int userId, InvoiceEntity invoice, String prptyName);

	List<OwnerDTo> getOwnerDetailsByProperty(String propertyId, Integer userId, Integer roleid);

	List<TenantDTo> geTenantsByProperty(String propertyId);

	List<VendorEntity> getAllActiveVendorsByprty(String propertyId, Integer roleid);

	void updatePayment(String unitNo,String payPeriod, 	String tenantid_pay, String invAmount, 
			String amountPaid, String dueAmount, String ownr_id_pay, Integer userId,
			String prtyid, String paypurpose, String paidBy, String prptyName, String paymentid,String paymentdate);
}
