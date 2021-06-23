package com.tekskills.ServiceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.tekskills.DAO.MaaDao;
import com.tekskills.DAO.MeterReadingDao;
import com.tekskills.DTO.AptInvoiceDTO;
import com.tekskills.DTO.AptPaymentsDTO;
import com.tekskills.DTO.OwnerDTo;
import com.tekskills.DTO.TenantDTo;
import com.tekskills.Service.MeterReadingServie;
import com.tekskills.entity.AptPaymentDetails;
import com.tekskills.entity.AssetDetails;
import com.tekskills.entity.GSTEntity;
import com.tekskills.entity.InvoiceEntity;
import com.tekskills.entity.MeterCostsEntity;
import com.tekskills.entity.MeterReadingsEntity;
import com.tekskills.entity.TermsAndConditions;
import com.tekskills.entity.VendorEntity;
import com.tekskills.util.QRCode;
import com.tekskills.util.SendHtmlEmailNew;

@Service
@PropertySource("/WEB-INF/Mail.properties")
public class MeterReadingServiceImpl implements MeterReadingServie {
	@Autowired
	private MeterReadingDao readingDao;

	@Autowired
	private MaaDao maaDao;
	@Autowired
	private Environment env;
	@Autowired
	private SendHtmlEmailNew newEmail;

	private static final Logger logger = Logger.getLogger(MeterReadingServiceImpl.class);

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveMeterReadings(int userId, int roleid, String propertyId, String month, String year, String unitNo,
			String wCost, String wpresent, String cpresent, String ccost, String gpresent, String gcost,
			String dpresent, String dcost, String aCpresent, String aCcost, String otpresent, String otcost,
			String assetid) {

		try {

			int prtyid = 0;
			// int unitNo1 = 0;
			int assetid1 = 0;
			float wCostInt = 0.0f;
			float ccost1 = 0.0f;
			float dcost1 = 0.0f;
			float gcost1 = 0.0f;
			float aCcost1 = 0.0f;
			float otcost1 = 0.0f;
			int wpresentInt = 0, cpresentInt = 0, gpresentInt = 0, dpresentInt = 0, aCpresentInt = 0, otpresentInt = 0;
			if (propertyId != null) {
				prtyid = Integer.parseInt(propertyId);
			}
			if (assetid != null) {
				assetid1 = Integer.parseInt(assetid);
			}

			if (!wCost.isEmpty()) {
				wCostInt = Float.parseFloat(wCost);
			}
			if (!ccost.isEmpty()) {
				ccost1 = Float.parseFloat(ccost);
			}
			if (!wpresent.isEmpty()) {
				wpresentInt = Integer.parseInt(wpresent);
			}

			if (!cpresent.isEmpty()) {
				cpresentInt = Integer.parseInt(cpresent);
			}
			if (!gpresent.isEmpty()) {
				gpresentInt = Integer.parseInt(gpresent);
			}
			if (!dpresent.isEmpty()) {
				dpresentInt = Integer.parseInt(dpresent);
			}
			if (!aCpresent.isEmpty()) {
				aCpresentInt = Integer.parseInt(aCpresent);
			}
			if (!otpresent.isEmpty()) {
				otpresentInt = Integer.parseInt(otpresent);
			}

			if (!dcost.isEmpty()) {
				dcost1 = Float.parseFloat(dcost);
			}
			if (!gcost.isEmpty()) {
				gcost1 = Float.parseFloat(gcost);
			}
			if (!aCcost.isEmpty()) {
				aCcost1 = Float.parseFloat(aCcost);
			}

			if (!otcost.isEmpty()) {
				otcost1 = Float.parseFloat(otcost);
			}
			MeterReadingsEntity meterObj = readingDao.getMeterDetailsByMonth(month, year, unitNo, prtyid, userId);
			if (meterObj != null) {

				if (!wCost.isEmpty()) {
					meterObj.setWater_CPU(wCostInt);
					meterObj.setWater_MR(wpresentInt);
				}
				if (!cpresent.isEmpty()) {
					meterObj.setPower_CPU(ccost1);
					meterObj.setPower_MR(cpresentInt);
				}
				meterObj.setDisel_CPU(dcost1);
				meterObj.setDisel_MR(dpresentInt);

				meterObj.setGas_CPU(gcost1);
				meterObj.setGas_MR(gpresentInt);

				meterObj.setAc_CPU(aCcost1);
				meterObj.setAc_MR(aCpresentInt);
				meterObj.setOther_CPU(otcost1);
				meterObj.setOther_MR(otpresentInt);
				// meterObj.setAssetid(assetid1);
				readingDao.updateMeterReading(meterObj);

			} else {
				MeterReadingsEntity readingObj = new MeterReadingsEntity();
				readingObj.setPrtyid(prtyid);
				readingObj.setUserid(userId);
				readingObj.setMonth(month);
				readingObj.setYear(year);
				readingObj.setFlatno(unitNo);
				readingObj.setWater_CPU(wCostInt);
				readingObj.setWater_MR(wpresentInt);

				readingObj.setPower_CPU(ccost1);
				readingObj.setPower_MR(cpresentInt);

				readingObj.setDisel_CPU(dcost1);
				readingObj.setDisel_MR(dpresentInt);

				readingObj.setGas_CPU(gcost1);
				readingObj.setGas_MR(gpresentInt);

				readingObj.setAc_CPU(aCcost1);
				readingObj.setAc_MR(aCpresentInt);
				readingObj.setOther_CPU(otcost1);
				readingObj.setOther_MR(otpresentInt);
				readingObj.setAssetid(assetid1);
				readingDao.saveMeterReadings(readingObj);
			}

		} catch (Exception e) {
			logger.error("saveMeterReadings in service Impl---", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MeterReadingsEntity> getMeterReadingList(int userId, String propertyId, int role) {
		int prtyId = 0;
		List<MeterReadingsEntity> readingList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);

			}
			readingList = readingDao.getMeterReadingList(userId, prtyId, role);

		} catch (Exception e) {
			logger.error("Error while  getMeterReadingList", e);

		}

		return readingList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateMeterReading(String tbl_pk, int userId, int roleid, String month, String year, String unitNo,
			String wprvious, String wpresent, String cpresent, String ccost, String gpresent, String gcost,
			String dpresent, String dcost, String aCpresent, String aCcost, String otpresent, String otcost) {
		try {

			int prtyid = 0;

			double wprvious1 = 0.0;
			double ccost1 = 0.0;
			float dcost1 = 0.0f, gcost1 = 0.0f, aCcost1 = 0.0f, otcost1 = 0.0f;
			int wpresentInt = 0, cpresentInt = 0, gpresentInt = 0, dpresentInt = 0, aCpresentInt = 0, otpresentInt = 0;
			int mtrId = 0;

			if (!wprvious.isEmpty()) {
				wprvious1 = Float.parseFloat(wprvious);
			}
			if (!ccost.isEmpty()) {
				ccost1 = Float.parseFloat(ccost);
			}
			if (!dcost.isEmpty()) {
				dcost1 = Float.parseFloat(dcost);
			}
			if (!gcost.isEmpty()) {
				gcost1 = Float.parseFloat(gcost);
			}
			if (!aCcost.isEmpty()) {
				aCcost1 = Float.parseFloat(aCcost);
			}

			if (!otcost.isEmpty()) {
				otcost1 = Float.parseFloat(otcost);
			}
			if (!wpresent.isEmpty()) {
				wpresentInt = Integer.parseInt(wpresent);
			}

			if (!cpresent.isEmpty()) {
				cpresentInt = Integer.parseInt(cpresent);
			}
			if (!gpresent.isEmpty()) {
				gpresentInt = Integer.parseInt(gpresent);
			}
			if (!dpresent.isEmpty()) {
				dpresentInt = Integer.parseInt(dpresent);
			}
			if (!aCpresent.isEmpty()) {
				aCpresentInt = Integer.parseInt(aCpresent);
			}
			if (!otpresent.isEmpty()) {
				otpresentInt = Integer.parseInt(otpresent);
			}
			if (!tbl_pk.isEmpty()) {
				mtrId = Integer.parseInt(tbl_pk);
			}

			MeterReadingsEntity readingObj = readingDao.getMeterReadingsBytId(mtrId);
			readingObj.setMonth(month);
			readingObj.setYear(year);
			readingObj.setFlatno(unitNo);
			readingObj.setWater_CPU(wprvious1);
			readingObj.setWater_MR(wpresentInt);

			readingObj.setPower_CPU(ccost1);
			readingObj.setPower_MR(cpresentInt);

			readingObj.setDisel_CPU(dcost1);
			readingObj.setDisel_MR(dpresentInt);

			readingObj.setGas_CPU(gcost1);
			readingObj.setGas_MR(gpresentInt);

			readingObj.setAc_CPU(aCcost1);
			readingObj.setAc_MR(aCpresentInt);
			readingObj.setOther_CPU(otcost1);
			readingObj.setOther_MR(otpresentInt);

			readingDao.updateMeterReading(readingObj);
		} catch (Exception e) {
			logger.error("updateMeterReading in service Impl---", e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MeterCostsEntity getMeterCostsByPrty(String propertyId) {
		int propertyIdInt = 0;
		MeterCostsEntity meter = null;

		if (!propertyId.isEmpty()) {
			propertyIdInt = Integer.parseInt(propertyId);
		}
		try {
			meter = readingDao.getMeterCostByPrty(propertyIdInt);
		} catch (Exception e) {
			logger.error("Error in method getMeterCostByPrty", e);
		}
		return meter;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveMeterCost(String propertyId, String wCost, String ccost, String gcost, String dcost, String aCcost,
			String otcost, int userid) {

		int prtyid = 0;

		float wCostInt = 0.0f;
		float ccost1 = 0.0f;
		float dcost1 = 0.0f;
		float gcost1 = 0.0f;
		float aCcost1 = 0.0f;
		float otcost1 = 0.0f;
		try {
			if (propertyId != null) {
				prtyid = Integer.parseInt(propertyId);
			}

			if (!wCost.isEmpty()) {
				wCostInt = Float.parseFloat(wCost);
				wCostInt = (float) (Math.round(wCostInt * 100.0) / 100.0);
			}
			if (!ccost.isEmpty()) {
				ccost1 = Float.parseFloat(ccost);
				ccost1 = (float) (Math.round(ccost1 * 100.0) / 100.0);
			}

			if (!dcost.isEmpty()) {
				dcost1 = Float.parseFloat(dcost);
				dcost1 = (float) (Math.round(dcost1 * 100.0) / 100.0);
			}
			if (!gcost.isEmpty()) {
				gcost1 = Float.parseFloat(gcost);
				gcost1 = (float) (Math.round(gcost1 * 100.0) / 100.0);
			}
			if (!aCcost.isEmpty()) {
				aCcost1 = Float.parseFloat(aCcost);
				aCcost1 = (float) (Math.round(aCcost1 * 100.0) / 100.0);
			}

			if (!otcost.isEmpty()) {
				otcost1 = Float.parseFloat(otcost);
				otcost1 = (float) (Math.round(otcost1 * 100.0) / 100.0);
			}
			MeterCostsEntity meterObj = readingDao.getMeterCostByPrty(prtyid);
			if (meterObj != null) {
				if (!wCost.isEmpty()) {
					meterObj.setWtrCost(wCostInt);

				}
				if (!ccost.isEmpty()) {
					meterObj.setPwrCost(ccost1);

				}
				if (!ccost.isEmpty()) {
					meterObj.setDslCost(dcost1);
				}
				if (!ccost.isEmpty()) {

					meterObj.setGasCost(gcost1);

				}
				if (!ccost.isEmpty()) {
					meterObj.setAcCost(aCcost1);
				}
				if (!ccost.isEmpty()) {
					meterObj.setOtherCost(otcost1);
				}
				readingDao.updateMeterCost(meterObj);

			} else {
				MeterCostsEntity costObj = new MeterCostsEntity();
				costObj.setPrtyid(prtyid);
				costObj.setCreatedDate(new Date());
				if (!wCost.isEmpty()) {
					costObj.setWtrCost(wCostInt);

				}
				if (!ccost.isEmpty()) {
					costObj.setPwrCost(ccost1);

				}
				if (!gcost.isEmpty()) {
					costObj.setDslCost(dcost1);
				}
				if (!dcost.isEmpty()) {

					costObj.setGasCost(gcost1);

				}
				if (!aCcost.isEmpty()) {
					costObj.setAcCost(aCcost1);
				}
				if (!otcost.isEmpty()) {
					costObj.setOtherCost(otcost1);
				}

				readingDao.saveMeterCosts(costObj);
			}
		} catch (Exception e) {
			logger.error("Exception raised in saveMeterCost------" + e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteMeterReadingsByFlat(String prtyid, String flat, String month, String year, String tblpk) {
		int prtyIdInt = 0, flatNo = 0, tblpkInt = 0;
		String msg = null;
		try {
			System.out.println("prtyid---" + prtyid);
			System.out.println("tblpk---" + tblpk);
			if (!prtyid.isEmpty()) {
				prtyIdInt = Integer.parseInt(prtyid);
			}
			if (!tblpk.isEmpty()) {
				tblpkInt = Integer.parseInt(tblpk);
			}

			msg = readingDao.deleteReadingsByFlat(prtyIdInt, flat, month, year, tblpkInt);
		} catch (Exception e) {
			logger.error("Exception raised in deleteMeterReadingsByFlat------" + e.getMessage());
		}
		return msg;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AptInvoiceDTO> getInvoicesByproperty(int userId, String propertyId, int roleid) {
		int prtyId = 0;
		List<AptInvoiceDTO> invList = null;
		int ownerid = 0, tntid = 0;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
			}

			if (roleid == 3) {
				ownerid = maaDao.getOwnerid(userId, roleid, tntid, prtyId);
			}
			if (roleid == 4) {
				tntid = maaDao.getTntid(userId, roleid);
				ownerid = maaDao.getOwnerid(userId, roleid, tntid, prtyId);
			}
			invList = readingDao.getInvoiceListByprtyId(userId, prtyId, roleid, ownerid, tntid);

		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyId", e);

		}

		return invList;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String saveInvoice(String flatno, int userId, InvoiceEntity invoice, String occBy, String prptyName) {

		String message = null;
		try {

			String tenentmail = null;
			String ownermail = null;
			int invoiceid = 0;
			if (invoice != null) {
				invoiceid = invoice.getInvoiceid();
			}
			String tenant = null;
			String owner = null;
			String tenantCont = null;
			String tenantname = null;
			String ownerCont = null;
			String ownername = null;
			String tomail = null;
			if (invoice.getOwnerid() != 0) {
				owner = readingDao.getOwnerEmail(invoice.getOwnerid());
				String[] ownerArr = owner.split("_");
				ownermail = ownerArr[0];
				ownerCont = ownerArr[1];
				ownername = ownerArr[2];
				tomail = ownermail;
			}
			if (invoice.getTenentid() != 0) {
				tenant = readingDao.getTenantEmail(invoice.getTenentid());
				String[] tntArr = tenant.split("_");
				tenentmail = tntArr[0];
				tenantCont = tntArr[1];
				tenantname = tntArr[2];
				tomail = tenentmail;
			}

			invoice.setUserid(userId);
			String note = invoice.getComment();
			InvoiceEntity invoiceObj = readingDao.getInvoiceByPrtyid(invoice.getPrptyid(), invoice.getMonth(),
					invoice.getYear(), flatno, userId);
			TermsAndConditions termsnCond = maaDao.getTermsandConditions(userId, invoice.getPrptyid());
			String termsNcond = null;
			if (termsnCond != null) {
				termsNcond = termsnCond.getTandC();
			}
			int invid = 0;
			String invoicenumber = null;
			if (invoiceObj == null) {
				invid = readingDao.saveInvoice(invoice);
				if (invid != 0) {
					invoicenumber = "MAA-" + "INVC" + invid;
					message = "Saved Successfully";
					String[] getBankdetails = maaDao.getBankDetailsByProperty(invoice.getPrptyid());
					String payeename = getBankdetails[2];
					String accountNumber = getBankdetails[0];
					String ifscCode = getBankdetails[1];
					String upiid = getBankdetails[3];
					Double dueAmount=null;
					Double invAmount=invoice.getInvoiceAmount();
					Double amountpaid=maaDao.getInvoiceAmountPaidByInvid(invoiceid);
					if(invAmount!=null&&amountpaid!=null) {dueAmount= invAmount-amountpaid;
					invAmount=dueAmount;
					}
					else {
						invAmount=invoice.getInvoiceAmount();
					}
					
					String filename = "QRINV" + invid;
					String qr_Code = env.getProperty("QRImage") + File.separator + filename + ".png";

					String charset = "UTF-8";
					Map<EncodeHintType, ErrorCorrectionLevel> hintMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
					hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
					String qrCodeData = null;
					if(!upiid.isEmpty()) {
						
						logger.info("In upiid!= null---invAmount---"+invAmount);
						/*qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&mam=0.01&am=" + invAmount + "&cu=INR";*/ //prabha
						qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" + invAmount + "&mam=0.01&cu=INR";//rasheeda
						System.out.println("condition 1------"+qrCodeData);
						try {
							QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
						} catch (Exception e) {
							logger.debug("Error while  generating QR code " + e.getMessage());
						}
					}else if (!accountNumber.isEmpty() && !ifscCode.isEmpty()) {
						qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
						try {
							QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
						} catch (Exception e) {
							logger.debug("Error while  generating QR code " + e.getMessage());
						}
						System.out.println("condition 2222------"+qrCodeData);
					}
					
					else if (accountNumber != null &&  ifscCode != null) {
						qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
						try {
							QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
						} catch (Exception e) {
							logger.debug("Error while  generating QR code " + e.getMessage());
						}
						
						System.out.println("condition 3------"+qrCodeData);
					}  else {

						qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" +invAmount+ "&mam=0.01&cu=INR";//rasheeda
						try {
							QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
						} catch (Exception e) {
							logger.debug("Error while  generating QR code " + e.getMessage());
						}
					}
					
					/*if ((accountNumber!="" || accountNumber != null) && (ifscCode!="" || ifscCode != null)) {
						qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename+ "&tn=INV" + invid + "&mam=0.00&am=" + invoice.getInvoiceAmount() + "&cu=INR"; //prabha
						qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename+ "&tn=INV" + invid + "&am=" + invoice.getInvoiceAmount() + "&mam=0.01&cu=INR";//rasheeda
						try {
							QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
						} catch (Exception e) {
							logger.debug("Error while  generating QR code " + e.getMessage());
						}

					} else if (upiid!="" || upiid != null) {
						qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invid + "&mam=0.00&am="+ invoice.getInvoiceAmount() + "&cu=INR"; //prabha
						qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invid + "&am="+ invoice.getInvoiceAmount() + "&mam=0.01&cu=INR";//rasheeda
						try {
							QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
						} catch (Exception e) {
							logger.debug("Error while  generating QR code " + e.getMessage());
						}
					} else {

					}*/
					String buildingMail = readingDao.getBuildingMail(invoice.getPrptyid());
					String subject = "Invoice generated for period " + invoice.getMonth() + "/" + invoice.getYear()
							+ " towards " + flatno;
					String htmlfile = env.getProperty("invoicemail");
					newEmail.sendInvoiceMail(tomail, flatno, invoice, ownermail, ownerCont, tenentmail, tenantCont,
							invoicenumber, htmlfile, subject, prptyName, termsNcond, tenantname, ownername,
							buildingMail, note, qrCodeData,amountpaid,dueAmount,invAmount);
				}
			} else {
				message = "already added please go to Edit";
			}

		} catch (Exception e) {
			logger.error("Error while  save InvoiceServiceImpl", e);

		}

		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String updateInvoice(String flatno, int userId, InvoiceEntity invoice, String prptyName) {

		String message = null;
		try {

			
			String tenentmail = null;
			String ownermail = null;

			String tenant = null;
			String owner = null;
			String tenantCont = null;
			String tenantname = null;
			String ownerCont = null;
			String ownername = null;
			String tomail = null;

			if (invoice.getOwnerid() != 0) {
				owner = readingDao.getOwnerEmail(invoice.getOwnerid());
				String[] ownerArr = owner.split("_");
				ownermail = ownerArr[0];
				ownerCont = ownerArr[1];
				ownername = ownerArr[2];
				tomail = ownermail;
			}
			if (invoice.getTenentid() != 0) {
				tenant = readingDao.getTenantEmail(invoice.getTenentid());
				String[] tntArr = tenant.split("_");
				tenentmail = tntArr[0];
				tenantCont = tntArr[1];
				tenantname = tntArr[2];
				tomail = tenentmail;
			}
			invoice.setUserid(userId);
			InvoiceEntity invoiceObj = readingDao.getInvoiceByInvoiceid(invoice.getInvoiceid(), userId);
			TermsAndConditions termsnCond = maaDao.getTermsandConditions(userId, invoice.getPrptyid());
			String termsNcond = null;
			if (termsnCond != null) {
				termsNcond = termsnCond.getTandC();
			}
			Double invAmount =null;
			if (invoiceObj != null) {
				int invoiceid = 0;
				if (invoice != null) {
					invoiceid = invoice.getInvoiceid();
					 invAmount = invoice.getInvoiceAmount();
					invAmount = Math.round(invAmount * 100.0) / 100.0;
				}
				String invoicenumber = "MAA-" + "INVC" + invoice.getInvoiceid();
				invoiceObj.setAcCost(invoice.getAcCost());
				invoiceObj.setAcGST(invoice.getAcGST());
				invoiceObj.setAcUnits(invoice.getAcUnits());

				invoiceObj.setDslCost(invoice.getDslCost());
				invoiceObj.setDslGST(invoice.getDslGST());
				invoiceObj.setDslUnits(invoice.getDslUnits());

				invoiceObj.setGasCost(invoice.getGasCost());
				invoiceObj.setGasGST(invoice.getGasGST());
				invoiceObj.setGasUnits(invoice.getGasUnits());

				invoiceObj.setWtrCost(invoice.getWtrCost());
				invoiceObj.setWtrGST(invoice.getWtrGST());
				invoiceObj.setWtrUnits(invoice.getWtrUnits());

				invoiceObj.setPwrCost(invoice.getPwrCost());
				invoiceObj.setPwrGST(invoice.getPwrGST());
				invoiceObj.setPwrUnits(invoice.getPwrUnits());

				invoiceObj.setOthrCost(invoice.getOthrCost());
				invoiceObj.setOthrGST(invoice.getOthrGST());
				invoiceObj.setOthrUnits(invoice.getOthrUnits());

				invoiceObj.setRent(invoice.getRent());
				invoiceObj.setRentGST(invoice.getRentGST());
				invoiceObj.setMaintenance(invoice.getMaintenance());
				invoiceObj.setComment(invoice.getComment());
				invoiceObj.setMaintenanceGST(invoice.getMaIntegerenanceGST());
				
				invoiceObj.setInvoiceAmount(invAmount);
				readingDao.updateInvoice(invoiceObj);
				message = "Updated Successfully";

				String[] getBankdetails = maaDao.getBankDetailsByProperty(invoice.getPrptyid());
				String payeename = getBankdetails[2];
				String accountNumber = getBankdetails[0];
				String ifscCode = getBankdetails[1];
				String upiid = getBankdetails[3];
				String qrCodeData = null;
				Double dueAmount=null;
			
				Double amountpaid=maaDao.getInvoiceAmountPaidByInvid(invoiceid);
			
				
				
				
				
				
				
			
				if(invAmount!=null&&amountpaid!=null)
				{dueAmount= invAmount-amountpaid;
				invAmount=dueAmount;
				}
				else {
					invAmount=invoice.getInvoiceAmount();
				}
				
				

				String filename = "QRINV" + invoice.getInvoiceid();
				String qr_Code = env.getProperty("QRImage") + File.separator + filename + ".png";

				String charset = "UTF-8";
				Map<EncodeHintType, ErrorCorrectionLevel> hintMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
				hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
				
				if(!upiid.isEmpty()) {
					
					logger.info("In upiid!= null---invAmount---"+invAmount);
					/*qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&mam=0.01&am=" + invAmount + "&cu=INR";*/ //prabha
					qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" + invAmount + "&mam=0.01&cu=INR";//rasheeda
					System.out.println("condition 1------"+qrCodeData);
					try {
						QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
					} catch (Exception e) {
						logger.debug("Error while  generating QR code " + e.getMessage());
					}
				}else if (!accountNumber.isEmpty() && !ifscCode.isEmpty()) {
					qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
					try {
						QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
					} catch (Exception e) {
						logger.debug("Error while  generating QR code " + e.getMessage());
					}
					System.out.println("condition 2222------"+qrCodeData);
				}
				
				else if (accountNumber != null &&  ifscCode != null) {
					qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename + "&tn=INV"+ invoiceid + "&am=" + invAmount + "&mam=0.01&cu=INR";//Rasheeda
					try {
						QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
					} catch (Exception e) {
						logger.debug("Error while  generating QR code " + e.getMessage());
					}
					
					System.out.println("condition 3------"+qrCodeData);
				}  else {

					qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoiceid+ "&am=" +invAmount+ "&mam=0.01&cu=INR";//rasheeda
					try {
						QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
					} catch (Exception e) {
						logger.debug("Error while  generating QR code " + e.getMessage());
					}
				}

				/*if ((accountNumber!="" || accountNumber != null) && (ifscCode!="" || ifscCode != null)) {
					qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename+ "&tn=INV" + invoice.getInvoiceid() + "&mam=0.00&am=" + invoice.getInvoiceAmount()	+ "&cu=INR"; //prabha
					qrCodeData = "upi://pay?pa=" + accountNumber + "@" + ifscCode + ".ifsc.npci&pn=" + payeename+ "&tn=INV" + invoice.getInvoiceid() + "&am=" + invoice.getInvoiceAmount()+"&mam=0.01&cu=INR";

					try {
						QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
					} catch (Exception e) {
						logger.debug("Error while  generating QR code " + e.getMessage());
					}

				} else if (upiid!="" || upiid != null) {

					qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoice.getInvoiceid()+ "&mam=0.00&am=" + invoice.getInvoiceAmount() + "&cu=INR";//prabha
					qrCodeData = "upi://pay?pa=" + upiid + "&pn=" + payeename + "&tn=INV" + invoice.getInvoiceid()+ "&am=" + invoice.getInvoiceAmount() + "&mam=0.01&cu=INR";

					try {
						QRCode.createQRCode(qrCodeData, qr_Code, charset, hintMap, 300, 300);
					} catch (Exception e) {
						logger.debug("Error while  generating QR code " + e.getMessage());
					}
				} else {

				}*/


				String buildingMail = readingDao.getBuildingMail(invoice.getPrptyid());
				try {

					String subject = "Invoice Updated for period " + invoice.getMonth() + "/" + invoice.getYear()
							+ " towards " + flatno;
					String htmlfile = env.getProperty("invoicemail");
					newEmail.sendInvoiceMail(tomail, flatno, invoiceObj, ownermail, ownerCont, tenentmail, tenantCont,
							invoicenumber, htmlfile, subject, prptyName, termsNcond, tenantname, ownername,
							buildingMail, invoice.getComment(), qrCodeData,amountpaid,dueAmount,invAmount);
					// newEmail.sendInvoiceMail(tomail,flatno,invoice,ownermail,ownerCont,tenentmail,tenantCont,invoicenumber,htmlfile,subject,prptyName,termsNcond,tenantname,ownername);
				} catch (Exception e) {
					logger.error("Error while  send mail expetion", e);

				}
			} else {
				message = "not updated";
			}
		} catch (Exception e) {
			logger.error("Error while  save InvoiceServiceImpl", e);

		}

		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteInvoice(int userId, String invoiceid) {
		int invoiceidInt = 0;
		String message = null;
		try {
			if (!invoiceid.isEmpty()) {
				invoiceidInt = Integer.parseInt(invoiceid);
			}
			message = readingDao.deleteInvoice(invoiceidInt, userId);
		} catch (Exception e) {
			logger.error("Error while  deleteInvoice ServiceImpl", e);

		}

		return message;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public InvoiceEntity getInvoiceByinvoiceId(int userId, String invoiceid) {
		InvoiceEntity invoice = null;

		int invoiceidInt = 0;
		//String message = null;
		try {
			if (!invoiceid.isEmpty()) {
				invoiceidInt = Integer.parseInt(invoiceid);
			}
			invoice = readingDao.getInvoiceByInvoiceid(invoiceidInt, userId);
		} catch (Exception e) {
			logger.error("Error while  deleteInvoice ServiceImpl"+ e.toString());
			 

		}

		return invoice;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public GSTEntity getGstByPrty(String propertyId) {
		int propertyIdInt = 0;
		GSTEntity gst = null;

		if (propertyId != null) {
			propertyIdInt = Integer.parseInt(propertyId);
		}
		try {
			gst = readingDao.getGstByPrty(propertyIdInt);
		} catch (Exception e) {
			logger.error("Error in method getMeterCostByPrty", e);
		}
		return gst;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveGST(String propertyId, String wGst, String cGst, String gGst, String dGst, String aCGst,
			String otGst, String rentGst, String mntGst, int userId) {

		double wGst_d = 0.0, cGst_d = 0.0, gGst_d = 0.0, dGst_d = 0.0, aCGst_d = 0.0, otGst_d = 0.0, rentGst_d = 0.0,
				d_mntGst = 0.0;
		int prtyidInt = 0;
		try {

			if (!wGst.isEmpty()) {
				wGst_d = Double.parseDouble(wGst);
			}
			if (!propertyId.isEmpty()) {
				prtyidInt = Integer.parseInt(propertyId);
			}
			if (!cGst.isEmpty()) {
				cGst_d = Double.parseDouble(cGst);
			}
			if (!gGst.isEmpty()) {
				gGst_d = Double.parseDouble(gGst);
			}
			if (!dGst.isEmpty()) {
				dGst_d = Double.parseDouble(dGst);
			}
			if (!aCGst.isEmpty()) {
				aCGst_d = Double.parseDouble(aCGst);
			}
			if (!otGst.isEmpty()) {
				otGst_d = Double.parseDouble(otGst);
			}
			if (!rentGst.isEmpty()) {
				rentGst_d = Double.parseDouble(rentGst);
			}
			if (!mntGst.isEmpty()) {
				d_mntGst = Double.parseDouble(mntGst);
			}

			Date date = new Date();
			GSTEntity gstObj = maaDao.getGST(prtyidInt);
			if (gstObj == null) {
				GSTEntity gst = new GSTEntity();
				gst.setPrtyid(prtyidInt);
				gst.setAcGST(aCGst_d);
				gst.setDeselGST(dGst_d);
				gst.setGasGST(gGst_d);
				gst.setPowerGST(cGst_d);
				gst.setWaterGST(wGst_d);
				gst.setOther(otGst_d);
				gst.setStatus(1);
				gst.setRentGST(rentGst_d);
				gst.setMaintenanceGST(d_mntGst);
				gst.setAplicableDate(date);
				readingDao.saveGst(gst);
			}

		} catch (Exception e) {
			logger.error("Error in method saveGST", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String savePayment(String unitNo, String payDate, String payPeriod, String invId, String ownerid_pay,
			String tenantid_pay, String invAmount, String amountPaid, String dueAmount, String payType, int userId,
			String prtyid, String paypurpose, String paidBy, String prptyName, String payfrm, String paynote, String paymentdate) {
		int ownerid = 0, tenantid = 0, invcid = 0, prptyid = 0;
		int status = 0;
		double invAmountval = 0.0, amountPaidval = 0.0, dueAmountval = 0.0;
		try {
			String period[] = payPeriod.split("/");

			if (!prtyid.isEmpty()) {
				prptyid = Integer.parseInt(prtyid);
			}

			if (payfrm.equalsIgnoreCase("Ownr")) {
				if (!ownerid_pay.isEmpty() || ownerid_pay != null) {
					ownerid = Integer.parseInt(ownerid_pay);
				}
			}
			if (payfrm.equalsIgnoreCase("Tnt")) {
				if (!tenantid_pay.isEmpty() || tenantid_pay != null) {
					tenantid = Integer.parseInt(tenantid_pay);
				}
			}
			if (payfrm.equalsIgnoreCase("Inv")) {

				if (!ownerid_pay.isEmpty() && ownerid_pay != null) {
					ownerid = Integer.parseInt(ownerid_pay);
				}
				if (!tenantid_pay.isEmpty() && tenantid_pay != null) {
					tenantid = Integer.parseInt(tenantid_pay);
				}
				if (!invId.isEmpty() && invId != null) {
					invcid = Integer.parseInt(invId);
				}

			}
			if (!invAmount.isEmpty()) {
				invAmountval = Double.parseDouble(invAmount);
				invAmountval = Math.round(invAmountval * 100.0) / 100.0;
			}
			if (!amountPaid.isEmpty()) {
				amountPaidval = Double.parseDouble(amountPaid);
				amountPaidval = Math.round(amountPaidval * 100.0) / 100.0;
			}
			if (!dueAmount.isEmpty()) {
				dueAmountval = Double.parseDouble(dueAmount);
				dueAmountval = Math.round(dueAmountval * 100.0) / 100.0;
			}
			Date paymentDate = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
			String strDate = sdf.format(paymentDate);
			String strDate1 = sdf1.format(paymentDate);

			Date paidDate = sdf.parse(strDate);

			String recieptNum = "MAA" + strDate1 + prptyid;
			String tenentmail = null;
			String ownermail = null;

			String tenant = null;
			String owner = null;
			String tenantCont = null;
			String ownerCont = null;

			String tomail = null;
			if (ownerid != 0) {

				owner = readingDao.getOwnerEmail(ownerid);

				String[] ownerArr = owner.split("_");
				ownermail = ownerArr[0];
				ownerCont = ownerArr[1];
				tomail = ownermail;
			}
			if (tenantid != 0) {

				tenant = readingDao.getTenantEmail(tenantid);
				String[] tntArr = tenant.split("_");
				tenentmail = tntArr[0];
				tenantCont = tntArr[1];
				tomail = tenentmail;
			}
			
			Date paymentdate1 = null;
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			if (!paymentdate.isEmpty()) {
				paymentdate1 = sdf2.parse(paymentdate);
			} 
				 
			 
			
			
			AptPaymentDetails payment = new AptPaymentDetails();
			payment.setAmt_due(dueAmountval);
			System.out.println("---------invcid  ..."+invcid);
			if(invcid==0) {
				payment.setInvAmount(invAmountval);
			}else {
				Integer payObj=readingDao.getpaymentTopRowByInvoiceId(invcid);//Rasheeda
				if(payObj==null) {
					payment.setInvAmount(invAmountval);
				}else {
					AptPaymentsDTO payObjnew=readingDao.getpaymentLastestRowByInvoiceId(invcid);//Rasheeda
					payment.setInvAmount(payObjnew.getDue_amt());
				}
				
			}
			//payment.setInvAmount(invAmountval);
			payment.setInvcid(invcid);
			payment.setPmonth(period[0]);
			payment.setPyear(period[1]);
			payment.setPaid_amt(amountPaidval);
			payment.setPrptyid(prptyid);
			payment.setOwnerid(ownerid);
			//select tenantId from maa_assets_details where flatno='102'
			Integer tentId= readingDao.getTenantIdByFlatNo(unitNo,prptyid);
			if(tentId!=0) {
				payment.setTenantid(tentId);
			}
			/*InvoiceEntity invoiceObj=readingDao.getInvoiceByInvoiceid(invcid, userId);
			if(invoiceObj!=null) {
				Integer tenid=invoiceObj.getTenentid();
				if(tenid==0) {
					payment.setTenantid(tenantid);
				}else if(tenid!=0) {
					payment.setTenantid(tenid);
				}
			}*/
			//payment.setTenantid(tenantid);
			payment.setUserid(userId);
			payment.setUnitno(unitNo);
			payment.setPaymode(payType);
			payment.setReceipt_no(recieptNum);
			payment.setPaypurpose(paypurpose);
			payment.setPaiddate(paymentdate1);
			payment.setPaidby(paidBy);
			payment.setNote(paynote);
			//payment.setPaymentdate(paymentdate1);
			if (dueAmountval != 0) {
				status = 2;
			}
			else if ((dueAmountval == 0) && (invAmountval == amountPaidval)) {
				status = 1;
			} else {
				status = 0;
			}
			payment.setStatus(status);
			readingDao.savePayment(payment);

			if (invcid != 0) {
				readingDao.updateInvoice(invcid, status);
			}
			String buildingMail = readingDao.getBuildingMail(prptyid);
			String prtyAddress = readingDao.getPrtyAdress(prptyid);
			String invAmout1 = String.format("%.2f", invAmountval);
			String amountPaid1 = String.format("%.2f", amountPaidval);
			String dueAmount1 = String.format("%.2f", dueAmountval);
			String subject = "Payment received for " + payPeriod + " towards " + paypurpose;
			String htmlfile = env.getProperty("paymentreceipthtml");
			newEmail.sendPaymentMail(tomail, subject, htmlfile, paidBy, strDate, paypurpose, recieptNum, unitNo,
					amountPaid1, dueAmount1, payPeriod, prptyName, tenentmail, tenantCont, ownermail, ownerCont,
					invAmout1, prtyAddress, buildingMail);
			// newEmail.sendUserMail(fromMail, tomail, subject,
			// htmlfile,name,email,assetNo,prtyname,password);
		} catch (Exception e) {
			logger.error("Error in method savePayment", e);
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<AptPaymentsDTO> getPaymentsByproperty(int userId, String propertyId, int roleid) {
		int prtyId = 0;
		List<AptPaymentsDTO> paymentList = null;
		int ownerid = 0, tntid = 0;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
			}
			if (roleid == 3) {
				ownerid = maaDao.getOwnerid(userId, roleid, tntid, prtyId);
			}
			if (roleid == 4) {
				tntid = maaDao.getTntid(userId, roleid);
				ownerid = maaDao.getOwnerid(userId, roleid, tntid, prtyId);
			}
			paymentList = readingDao.getpaymentListByprtyId(userId, prtyId, roleid, ownerid, tntid);

		} catch (Exception e) {
			logger.error("Error while  getAssetListByprtyId", e);

		}

		return paymentList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<TenantDTo> getTenantInfoByPrtyId(String propertyId, int userId, int roleid) {
		List<TenantDTo> tenantList = null;
		int prtyId = 0;

		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
			}
			tenantList = readingDao.getTenantInfoByPrtyId(prtyId, userId, roleid);
		} catch (Exception e) {
			logger.error("Error while  getTenantInfoByPrtyId", e);
		}

		return tenantList;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<OwnerDTo> getOwnerInfoByPrtyId(String propertyId, int userId, int roleid) {
		List<OwnerDTo> ownerList = null;
		int prtyId = 0;

		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
			}
			ownerList = readingDao.getOwnerInfoByPrtyId(prtyId, userId, roleid);
		} catch (Exception e) {
			logger.error("Error while  getTenantInfoByPrtyId", e);
		}

		return ownerList;

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<VendorEntity> getAllVendorsByprty(String propertyId, int roleid) {
		int prtyId = 0;
		List<VendorEntity> vendorList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
				
			}
			vendorList = readingDao.getAllVendorsByprty(prtyId, roleid);

		} catch (Exception e) {
			logger.error("Error while  getAllVendorsByprty", e);

		}

		return vendorList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveVendor(String vendorimg, String vendorname, String profession, String mobile, String altmobile,
			String email, String idtype, String idproof, String idno, String country, int userId, String prtyid,
			String state, String city, String pincode, String address, String status, String prptyName) {
		int prptyid = 0;
		String Vstatus = "No";
		int statusVal = 1;
		try {
			if (!prtyid.isEmpty()) {
				prptyid = Integer.parseInt(prtyid);
			}
			if (status != null) {
				Vstatus = "Yes";
			}
			VendorEntity vendor = new VendorEntity();
			vendor.setVendorimg(vendorimg);
			vendor.setVendorname(vendorname);
			vendor.setCity(city);
			vendor.setAddress(address);
			vendor.setAltmobile(altmobile);
			vendor.setCountry(country);
			vendor.setEmail(email);
			vendor.setIdimg(idproof);
			vendor.setIdtype(idtype);
			vendor.setMobile(mobile);
			vendor.setPincode(pincode);
			vendor.setProfession(profession);
			vendor.setPrtyid(prptyid);
			vendor.setState(state);
			vendor.setIdno(idno);
			vendor.setStatus(statusVal);
			vendor.setVstatus(Vstatus);

			readingDao.saveVendor(vendor);

		} catch (Exception e) {
			logger.error("Error while  saveVendor service impl", e);

		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public String deleteVendor(String vendorid) {
		int vendorInt = 0;
		try {
			if (!vendorid.isEmpty()) {
				vendorInt = Integer.parseInt(vendorid);
			}

			readingDao.deleteVendor(vendorInt);
		} catch (Exception e) {
			logger.error("Error while  deleteVendor", e);
		}
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateGST(String gstid, String propertyId, String wGst, String cGst, String gGst, String dGst,
			String aCGst, String otGst, String rentGst, String mntGst, int userId) {
		int gstInt = 0, prtyidInt = 0;

		double wGst_d = 0.0, cGst_d = 0.0, gGst_d = 0.0, dGst_d = 0.0, aCGst_d = 0.0, otGst_d = 0.0, rentGst_d = 0.0,
				d_mntGst = 0.0;
		try {
			if (!gstid.isEmpty()) {
				gstInt = Integer.parseInt(gstid);
			}
			if (!propertyId.isEmpty()) {
				prtyidInt = Integer.parseInt(propertyId);
			}
			if (!wGst.isEmpty()) {
				wGst_d = Double.parseDouble(wGst);
			}
			if (!cGst.isEmpty()) {
				cGst_d = Double.parseDouble(cGst);
			}
			if (!gGst.isEmpty()) {
				gGst_d = Double.parseDouble(gGst);
			}
			if (!dGst.isEmpty()) {
				dGst_d = Double.parseDouble(dGst);
			}
			if (!aCGst.isEmpty()) {
				aCGst_d = Double.parseDouble(aCGst);
			}
			if (!otGst.isEmpty()) {
				otGst_d = Double.parseDouble(otGst);
			}
			if (!rentGst.isEmpty()) {
				rentGst_d = Double.parseDouble(rentGst);
			}
			if (!mntGst.isEmpty()) {
				d_mntGst = Double.parseDouble(mntGst);
			}
			GSTEntity gst = maaDao.getGSTById(gstInt);
			if (gst != null) {
				gst.setAcGST(aCGst_d);
				gst.setDeselGST(dGst_d);
				gst.setGasGST(gGst_d);
				gst.setPowerGST(cGst_d);
				gst.setWaterGST(wGst_d);
				gst.setOther(otGst_d);
				gst.setRentGST(rentGst_d);
				gst.setMaintenanceGST(d_mntGst);
				gst.setPrtyid(prtyidInt);
				gst.setStatus(1);
				// gst.setAplicableDate(date);

				readingDao.updateGst(gst);
			}
		} catch (Exception e) {
			logger.error("Error while  updateGST ServiceImpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateMeterCost(String costid, String propertyId, String wCost, String ccost, String gcost,
			String dcost, String aCcost, String otcost, int userId) {
		int prtyid = 0;

		float wCostInt = 0.0f;
		float ccost1 = 0.0f;
		float dcost1 = 0.0f;
		float gcost1 = 0.0f;
		float aCcost1 = 0.0f;
		float otcost1 = 0.0f;
		try {
			if (propertyId != null) {
				prtyid = Integer.parseInt(propertyId);
			}

			if (!wCost.isEmpty()) {
				wCostInt = Float.parseFloat(wCost);
			}
			if (!ccost.isEmpty()) {
				ccost1 = Float.parseFloat(ccost);
			}

			if (!dcost.isEmpty()) {
				dcost1 = Float.parseFloat(dcost);
			}
			if (!gcost.isEmpty()) {
				gcost1 = Float.parseFloat(gcost);
			}
			if (!aCcost.isEmpty()) {
				aCcost1 = Float.parseFloat(aCcost);
			}

			if (!otcost.isEmpty()) {
				otcost1 = Float.parseFloat(otcost);
			}
			MeterCostsEntity meterObj = readingDao.getMeterCostByPrty(prtyid);
			if (meterObj != null) {
				if (!wCost.isEmpty()) {
					meterObj.setWtrCost(wCostInt);

				}
				if (!ccost.isEmpty()) {
					meterObj.setPwrCost(ccost1);

				}
				if (!ccost.isEmpty()) {
					meterObj.setDslCost(dcost1);
				}
				if (!ccost.isEmpty()) {

					meterObj.setGasCost(gcost1);

				}
				if (!ccost.isEmpty()) {
					meterObj.setAcCost(aCcost1);
				}
				if (!ccost.isEmpty()) {
					meterObj.setOtherCost(otcost1);
				}
				readingDao.updateMeterCost(meterObj);
			}
		} catch (Exception e) {
			logger.error("Error while  updateMeterCost ServiceImpl", e);
		}

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateVendor(String vendorid, String vendorimg, String vendorname, String profession, String mobile,
			String altmobile, String email, String idtype, String idproof, String idno, String country, int userId,
			int prtyid, String state, String city, String pincode, String address, String status, String prptyName,
			String statusTogle) {

		int activeStatus = 0;
		if (statusTogle != null) {
			activeStatus = 1;
		} else {
			activeStatus = 0;
		}

		String Vstatus = "No";
		int vendoridInt = 0;
		int statusVal = 1;
		try {

			if (status.equalsIgnoreCase("ON")) {
				Vstatus = "Yes";
			}
			if (!vendorid.isEmpty()) {
				vendoridInt = Integer.parseInt(vendorid);
			}
			VendorEntity vendor = readingDao.getVendorByVendorid(vendoridInt, prtyid);
			if (vendor != null) {
				if (vendorimg != null) {
					vendor.setVendorimg(vendorimg);
				}
				vendor.setVendorname(vendorname);
				vendor.setCity(city);
				vendor.setAddress(address);
				vendor.setAltmobile(altmobile);
				vendor.setCountry(country);
				vendor.setEmail(email);
				if (idproof != null) {
					vendor.setIdimg(idproof);
				}
				vendor.setIdtype(idtype);
				vendor.setMobile(mobile);
				vendor.setPincode(pincode);
				vendor.setProfession(profession);
				vendor.setPrtyid(prtyid);
				vendor.setState(state);
				vendor.setIdno(idno);
				vendor.setStatus(statusVal);
				vendor.setVstatus(Vstatus);

				vendor.setStatus(activeStatus);

				readingDao.updateVendor(vendor);
			}

		} catch (Exception e) {
			logger.error("Error while  updateVendor ServiceImpl", e);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<OwnerDTo> getOwnerDetailsByProperty(String propertyId, Integer userId, Integer roleid) {
		int prtyIdInt = 0;
		List<OwnerDTo> ownerList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyIdInt = Integer.parseInt(propertyId);
			}
			ownerList = readingDao.getOwnerDetailsByProperty(prtyIdInt, userId);
		} catch (Exception e) {
			logger.error("Error while  getOwnerDetailsByProperty", e);
		}
		return ownerList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<TenantDTo> geTenantsByProperty(String propertyId) {
		int prtyIdInt = 0;
		List<TenantDTo> tenantList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyIdInt = Integer.parseInt(propertyId);
			}
			tenantList = readingDao.getTenantDetailsByProperty(prtyIdInt);
		} catch (Exception e) {
			logger.error("Error while  getOwnerDetailsByProperty", e);
		}
		return tenantList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<VendorEntity> getAllActiveVendorsByprty(String propertyId, Integer roleid) {
		int prtyId = 0;
		List<VendorEntity> vendorList = null;
		try {
			if (!propertyId.isEmpty()) {
				prtyId = Integer.parseInt(propertyId);
				vendorList = readingDao.getActveAllVendorsByprty(prtyId, roleid);
			}

		} catch (Exception e) {
			logger.error("Error while  getAllActiveVendorsByprty", e);

		}

		return vendorList;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updatePayment(String unitNo, String payPeriod, String tenantid_pay, String invAmount, String amountPaid, String dueAmount, String ownerid_pay, Integer userId,
			String prtyid, String paypurpose, String paidBy, String prptyName, String paymentid, String paymentdate) {
		int ownerid = 0, tenantid = 0, invcid = 0, prptyid = 0,payment_id=0;
			int status = 0;
			double invAmountval = 0.0, amountPaidval = 0.0, dueAmountval = 0.0;
			try {
				String period[] = payPeriod.split("/");

				if (!prtyid.isEmpty()) {
					prptyid = Integer.parseInt(prtyid);
				}
				if (!paymentid.isEmpty()) {
					payment_id = Integer.parseInt(paymentid);
				}
				System.out.println("paymentid*******"+paymentid);

			/*	if (payfrm.equalsIgnoreCase("Ownr")) {  || ownerid_pay != null*/
					if (!ownerid_pay.isEmpty()) {
						ownerid = Integer.parseInt(ownerid_pay);
					}
				/*}*/
			/*	if (payfrm.equalsIgnoreCase("Tnt")) {  || tenantid_pay != null*/
					if (!tenantid_pay.isEmpty()) {
						tenantid = Integer.parseInt(tenantid_pay);
					}
				/*}*/
			/*	if (payfrm.equalsIgnoreCase("Inv")) {

					if (!ownerid_pay.isEmpty() && ownerid_pay != null) {
						ownerid = Integer.parseInt(ownerid_pay);
					}
					if (!tenantid_pay.isEmpty() && tenantid_pay != null) {
						tenantid = Integer.parseInt(tenantid_pay);
					}
					if (!invId.isEmpty() && invId != null) {
						invcid = Integer.parseInt(invId);
					}

				}*/
				if (!invAmount.isEmpty()) {
					invAmountval = Double.parseDouble(invAmount);
					invAmountval = Math.round(invAmountval * 100.0) / 100.0;
				}
				if (!amountPaid.isEmpty()) {
					amountPaidval = Double.parseDouble(amountPaid);
					amountPaidval = Math.round(amountPaidval * 100.0) / 100.0;
				}
				if (!dueAmount.isEmpty()) {
					dueAmountval = Double.parseDouble(dueAmount);
					dueAmountval = Math.round(dueAmountval * 100.0) / 100.0;
				}
				Date paymentDate = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
				String strDate = sdf.format(paymentDate);
				String strDate1 = sdf1.format(paymentDate);

				Date paidDate = sdf.parse(strDate);
				
				Date paymentdate1 = null;
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				if (!paymentdate.isEmpty()) {
					paymentdate1 = sdf2.parse(paymentdate);
				} 

				String recieptNum = "MAA" + strDate1 + prptyid;
				/*	String tenentmail = null;
				String ownermail = null;

				String tenant = null;
				String owner = null;
				String tenantCont = null;
				String ownerCont = null;

				String tomail = null;
				if (ownerid != 0) {

					owner = readingDao.getOwnerEmail(ownerid);

					String[] ownerArr = owner.split("_");
					ownermail = ownerArr[0];
					ownerCont = ownerArr[1];
					tomail = ownermail;
				}
				if (tenantid != 0) {

					tenant = readingDao.getTenantEmail(tenantid);
					String[] tntArr = tenant.split("_");
					tenentmail = tntArr[0];
					tenantCont = tntArr[1];
					tomail = tenentmail;
				}*/
							
				
				AptPaymentDetails payment= readingDao.getpaymentDetailsByPaymentId(payment_id);
				if(payment!=null) {
				
				payment.setAmt_due(dueAmountval);
				System.out.println("---------invcid  ..."+invcid);
				payment.setInvAmount(invAmountval);
			/*	if(invcid==0) {
					payment.setInvAmount(invAmountval);
				}else {
					Integer payObj=readingDao.getpaymentTopRowByInvoiceId(invcid);//Rasheeda
					if(payObj==null) {
						payment.setInvAmount(invAmountval);
					}else {
						AptPaymentsDTO payObjnew=readingDao.getpaymentLastestRowByInvoiceId(invcid);//Rasheeda
						payment.setInvAmount(payObjnew.getDue_amt());
					}
					
				}*/
				//payment.setInvAmount(invAmountval);
				payment.setInvcid(invcid);
				payment.setPmonth(period[0]);
				payment.setPyear(period[1]);
				payment.setPaid_amt(amountPaidval);
				payment.setPrptyid(prptyid);
				payment.setOwnerid(ownerid);
				//select tenantId from maa_assets_details where flatno='102'
				Integer tentId= readingDao.getTenantIdByFlatNo(unitNo,prptyid);
				if(tentId!=0) {
					payment.setTenantid(tentId);
				}
				/*InvoiceEntity invoiceObj=readingDao.getInvoiceByInvoiceid(invcid, userId);
				if(invoiceObj!=null) {
					Integer tenid=invoiceObj.getTenentid();
					if(tenid==0) {
						payment.setTenantid(tenantid);
					}else if(tenid!=0) {
						payment.setTenantid(tenid);
					}
				}*/
				//payment.setTenantid(tenantid);
				payment.setUserid(userId);
				payment.setUnitno(unitNo);
				payment.setReceipt_no(recieptNum);
				payment.setPaypurpose(paypurpose);
				payment.setPaiddate(paymentdate1);
				payment.setPaidby(paidBy);
				if (dueAmountval != 0) {
					status = 2;
				}else if ((dueAmountval == 0) && (invAmountval == amountPaidval)) {
					status = 1;
				} else {
					status = 0;
				}
				payment.setStatus(status);
				readingDao.updatePayment(payment);
			}

				/*if (invcid != 0) {
					readingDao.updateInvoice(invcid, status);
				}
				String buildingMail = readingDao.getBuildingMail(prptyid);
				String prtyAddress = readingDao.getPrtyAdress(prptyid);
				String invAmout1 = String.format("%.2f", invAmountval);
				String amountPaid1 = String.format("%.2f", amountPaidval);
				String dueAmount1 = String.format("%.2f", dueAmountval);
				String subject = "Payment received for " + payPeriod + " towards " + paypurpose;
				String htmlfile = env.getProperty("paymentreceipthtml");
			newEmail.sendPaymentMail(tomail, subject, htmlfile, paidBy, strDate, paypurpose, recieptNum, unitNo,
						amountPaid1, dueAmount1, payPeriod, prptyName, tenentmail, tenantCont, ownermail, ownerCont,
						invAmout1, prtyAddress, buildingMail);*/
				// newEmail.sendUserMail(fromMail, tomail, subject,
				// htmlfile,name,email,assetNo,prtyname,password);
			
			} catch (Exception e) {
				logger.error("Error in method updatePayment", e);
			}
	}
}
