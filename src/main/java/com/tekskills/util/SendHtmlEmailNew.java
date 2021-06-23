package com.tekskills.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

import com.google.zxing.WriterException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.tekskills.entity.InvoiceEntity;

@Component

@EnableAsync
public class SendHtmlEmailNew {

	private static final Logger logger = Logger.getLogger(SendHtmlEmailNew.class);
	private static final String UPLOAD_DIRECTORY = "temp_pdf";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	@Autowired
	private Environment env;

	@Autowired
	ServletContext context;

	private static final String frommail = "support@maaproperties.com";
/*	private static final String mailhostTek = "192.168.0.12";
	private static final String mailhost = "mail.maaproperties.com";*/
	private static final String mailhostTek = "192.168.0.12";//Rasheeda
	private static final String mailhost = "192.168.0.12";//Rasheeda
	private static final String password = "Maa@1234@##";
	private static final String username = "support@maaproperties.com";

	@Async
	public void sendMail(String toAddress, String subject, String html, String buldingmail, String buildName,
			String uscno, int stsId) throws MessagingException {
		String tomail=buldingmail; //uncomment when load to production
		//String tomail = "maaservices123@gmail.com";
		//String tomail = "info@maaproperties.com";

		String greetings = "";
		if (stsId == 1) {
			greetings = "Congratulations";
		} else if (stsId == 0) {
			greetings = "Greetings from Maa Properties!";
		}

		try {
		
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/

			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(frommail));
			message.setRecipients(Message.RecipientType.TO,tomail);
			/*message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail)); */
			message.setSubject(subject);
			//message.setReplyTo(new javax.mail.Address[] { new javax.mail.internet.InternetAddress(buldingmail) });
			// message.setReplyTo(buldingmail);
			StringWriter writer = new StringWriter();
			IOUtils.copy(new FileInputStream(new File(html)), writer);

			Map<String, String> input = new HashMap<String, String>();
			input.put("buildName", buildName);
			input.put("buldingmail", buldingmail);
			input.put("greetings", greetings);

			// String bgimage=env.getProperty("bgimage");
			String logo = env.getProperty("logo");
			String icnImage = env.getProperty("icons");
			input.put("uscno", uscno);

			String htmlText = readEmailFromHtml(html, input);

			// creates message part
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			Map<String, String> inlineImages = new HashMap<String, String>();
			inlineImages.put("image1", logo);
			// inlineImages.put("image2", bgimage);
			inlineImages.put("image3", icnImage);

			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();

				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}

					multipart.addBodyPart(imagePart);
				}
			}

			message.setContent(multipart);
			
			Transport.send(message);

		}

		catch (AddressException e) {
			logger.error("AddressException raised while sending property activation----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailedException raised while sending property activation----" + e);

		} catch (Exception e) {
			logger.error("Logic Exception raised while sending property activation----" + e);
		}

	}

	// Method to replace the values for keys
	protected String readEmailFromHtml(String filePath, Map<String, String> input) {

		String msg = readContentFromFile(filePath);
		try {
			Set<Entry<String, String>> entries = input.entrySet();
			for (Map.Entry<String, String> entry : entries) {
				msg = msg.replace(entry.getKey().trim(), entry.getValue().trim());
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return msg;
	}

	// Method to read HTML file as a String
	private String readContentFromFile(String fileName) {

		StringBuffer contents = new StringBuffer();

		try {
			// use buffering, reading one line at a time
			BufferedReader reader = new BufferedReader(new FileReader(fileName));
			try {
				String line = null;
				while ((line = reader.readLine()) != null) {
					contents.append(line);
					contents.append(System.getProperty("line.separator"));
				}
			} finally {
				reader.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return contents.toString();
	}

	@Async
	public void sendUserMail(String tomail1, String subject, String htmlfile, String ownerName, String emailId,
			String flatno, String prptyName, String ownrpassword) {
		//String tomail = "maaservices123@gmail.com";// comment when load to production and change tomail1 to tomail
		String tomail = tomail1;
		try {
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/

			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(frommail, prptyName));
			//message.setFrom(new InternetAddress(frommail));
			message.setRecipients(Message.RecipientType.TO, tomail);
			//message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
			message.setSubject(subject);

			StringWriter writer = new StringWriter();
			IOUtils.copy(new FileInputStream(new File(htmlfile)), writer);

			Map<String, String> input = new HashMap<String, String>();
			input.put("username1", emailId);
			input.put("flatno", flatno);
			input.put("password1", ownrpassword);
			/* String bgimage=env.getProperty("bgimage"); */
			String logo = env.getProperty("logo");
			String icnImage = env.getProperty("icons");
			input.put("ownername", ownerName);
			input.put("prtyname", prptyName);

			String htmlText = readEmailFromHtml(htmlfile, input);

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			Map<String, String> inlineImages = new HashMap<String, String>();
			inlineImages.put("image1", logo);
			/* inlineImages.put("image2", bgimage); */
			inlineImages.put("image3", icnImage);

			// adds inline image attachments
			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();

				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}

					multipart.addBodyPart(imagePart);
				}
			}
			message.setContent(multipart);

			Transport.send(message);
			logger.info("Sent mail to user------");
		} catch (AddressException e) {
			logger.error("AddressException raised while sending user mail----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailedException raised while sending user mail----" + e);

		} catch (Exception e) {
			logger.error("Logic Exception raised while sending user mail----" + e);
		}

	}

	@Async
	public void sendPaymentMail(String tomail1, String subject, String htmlfile, String paidBy, String payDate,
			String paypurpose, String recieptNum, String unitNo, String amountPaid, String dueAmount, String payPeriod,
			String prptyName, String tenentmail, String tenantCont, String ownermail, String ownerCont,
			String invAmountval, String prtyAddress, String buildingMail) {

		//String tomail = "maaservices123@gmail.com";// comment when load to production and change tomail1 to tomail
		String tomail = tomail1;
		NumberToWord num2word = new NumberToWord();

		try {
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/
			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			//message.setFrom(new InternetAddress(frommail));
			message.setFrom(new InternetAddress(frommail, prptyName));
			message.setRecipients(Message.RecipientType.TO,tomail);
			//message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
			message.setSubject(subject);
			message.setReplyTo(new javax.mail.Address[] { new javax.mail.internet.InternetAddress(buildingMail) });

			Map<String, String> input = new HashMap<String, String>();

			// String logo=env.getProperty("logo");
			String quoteimg = env.getProperty("quoteimg");
			Double amountpaidInt = null;
			int amountInInt = 0;
			String numberName = "Zero";
			if (amountPaid != null) {

				numberName = num2word.convertToIndianCurrency(amountPaid);
				System.out.println("numberName--" + numberName);

			}

			input.put("Receipt_No", recieptNum);
			input.put("numberName", numberName);
			input.put("Paid_Date", payDate);
			input.put("Amount_Paid", amountPaid);
			input.put("Due_Amount", dueAmount);
			input.put("Payment_Period", payPeriod);
			input.put("Payment_Purpose", paypurpose);
			input.put("Paid_By", paidBy);
			input.put("Unit_No", unitNo);
			input.put("Payee_Mobile", unitNo);
			input.put("invAmountval", invAmountval);
			String[] strArr = prtyAddress.split("/");
			input.put("prtyAddress", strArr[0]);
			input.put("prtyContact", strArr[1]);
			if (tenentmail != null) {
				input.put("Payee_Mail", tenentmail);
				input.put("Payee_Mobile", tenantCont);
				input.put("Payee_Mobile", tenantCont);
			} else if (ownermail != null) {
				input.put("Payee_Mail", ownermail);
				input.put("Payee_Mobile", ownerCont);
			}
			input.put("prtyname", prptyName);

			String htmlText = readEmailFromHtml(htmlfile, input);

			// String bgimage=env.getProperty("bgimage");

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			Map<String, String> inlineImages = new HashMap<String, String>();
			inlineImages.put("image1", quoteimg);

			// adds inline image attachments
			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();

				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}

					multipart.addBodyPart(imagePart);
				}
			}

			message.setContent(multipart);

			Transport.send(message);

		} catch (AddressException e) {
			logger.error("Address Exception Exception raised while sending payent mail----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailed Exception raised while while sending payent mail----" + e);

		} catch (Exception e) {
			logger.error("Logical Exception raised while while sending payent mail----" + e);
		}

	}

	@Async
	public void sendInvoiceMail(String tomail1, String flatno, InvoiceEntity invoice, String ownermail,
			String ownerCont, String tenentmail, String tenantCont, String invoicenumber, String htmlfile,
			String subject, String prptyName, String termsNcond, String tenantname, String ownername,
			String buildingMail, String note, String payLink, Double amountpaid, Double dueAmount, Double invAmount) {
		String date = "";
		if (invoice.getInvoicedate() != null) {
			date = new SimpleDateFormat("MM/dd/yyyy").format(invoice.getInvoicedate());
		}
		//String tomail = "maaservices123@gmail.com";
		String tomail = tomail1;
		try {
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/

			Session session1 = Session.getDefaultInstance(properties);

			// Session session1 = Session.getDefaultInstance(properties); //local

			int invoiceid = 0;
			int prtyid = 0;
			if (invoice != null) {
				invoiceid = invoice.getInvoiceid();
				prtyid = invoice.getPrptyid();
			}
			String saveimg = env.getProperty("saveimg");
			String upiImg = env.getProperty("upiImg");
			String logo = env.getProperty("logo");

			String publicUrl = env.getProperty("pms");

			String filename = "QRINV" + invoiceid + ".png";
			String pdfFilename = "INV" + invoiceid + ".pdf";
			String qr_Code = env.getProperty("QRImage") + File.separator + filename;
			String name = "", mail = "", phnno = "";
			if (ownermail != null) {
				mail = ownermail;
				phnno = ownerCont;
				name = ownername;
			} else if (tenentmail != null) {
				mail = tenentmail;
				phnno = tenantCont;
				name = tenantname;
			}

			String invRnttotal = "";
			String invAmounttotal = "";
			if (invoice.getInvoiceAmount() != null) {
				invAmounttotal = String.format("%.2f", invoice.getInvoiceAmount());
			}

			MimeMessage message = new MimeMessage(session1);
			//message.setFrom(new InternetAddress(frommail));
			message.setFrom(new InternetAddress(frommail, prptyName));
			message.setRecipients(Message.RecipientType.TO,tomail);
			//message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));

			message.setSubject(subject);
			message.setReplyTo(new javax.mail.Address[] { new javax.mail.internet.InternetAddress(buildingMail) });

			StringBuilder htmlStringBuilder = new StringBuilder();
			String terms;
			if (termsNcond != null) {
				terms = termsNcond;
			} else {
				terms = "NA";
			}
			/*
			 * String htmlnew = generateHtml(invoiceid, mail, phnno, name, terms, note,
			 * prptyName, saveimg, qr_Code, logo, invoice, date, invoicenumber, amountpaid,
			 * dueAmount, payLink, invAmount);
			 */

			htmlStringBuilder.append(
					"<html lang='en'><body width='100%' style='background-color:#e7eaea;margin: 0; padding: 0 !important; mso-line-height-rule: exactly;font-family: 'Roboto', sans-serif; font-size: 13px;'> <div class='mx-5'style='background-color:#e7eaea;border:2px;max-width: 700px;margin: 0 auto;border-radius: 4px;padding-left: 6px;padding-right: 6px;' class='email-container'><div class='row'><div class='col' style='float:left'><h1>INVOICE</h1><p Style='padding: 0px;margin: 0px;'><b>Invoice Number:</b>#"
							+ invoicenumber + "</p> <p Style='padding: 0px;margin: 0px;'><b>Invoice Date: </b>" + date
							+ "</p>	</div>\r\n<div class='col' style='float:right'><h4><b Style='padding: 0px;margin: 0px;'>To Bill:</b></h4><p Style='padding: 0px;margin: 0px;'>"
							+ name + "<br/>Mail id:" + mail + "<br/>\r\nPhone : " + phnno
							+ "\r\n </p></div><div style='clear: both;'></div>	</div><div style='clear: both;'></div><div class='row' style='margin-top:10px;'><div class='col'><table class='table' style='border-collapse: collapse;width:100%;'><thead class='table-dark'><tr>\r\n<th style='background-color:#000;color:#fff;line-height:2'>Particulars</th> <th style='background-color:#000;color:#fff;'>Units</th><th style='background-color:#000;color:#fff;'>Cost/Unit</th>\r\n <th style='background-color:#000;color:#fff;'>GST%</th><th style='background-color:#000;color:#fff;'>Total</th></tr> </thead> ");

			htmlStringBuilder.append("<tbody>");
			if (invoice.getWtrUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Water</td><td>"
								+ invoice.getWtrUnits() + "</td><td>" + invoice.getWtrCost() + "</td><td>"
								+ invoice.getWtrGST() + "</td><td>" + invoice.getWtrtotal() + "</td></tr>");
			}
			if (invoice.getPwrUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Elcetricity</td><td>"
								+ invoice.getPwrUnits() + "</td><td>" + invoice.getPwrCost() + "</td><td>"
								+ invoice.getPwrGST() + "</td><td>" + invoice.getPwrtotal() + "</td></tr>");
			}
			if (invoice.getGasUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Gas</td><td>"
								+ invoice.getGasUnits() + "</td><td>" + invoice.getGasCost() + "</td><td>"
								+ invoice.getGasGST() + "</td><td>" + invoice.getGastotal() + "</td></tr>");
			}
			if (invoice.getDslUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Diesel</td><td>"
								+ invoice.getDslUnits() + "</td><td>" + invoice.getDslCost() + "</td><td>"
								+ invoice.getDslGST() + "</td><td>" + invoice.getDsltotal() + "</td></tr>");
			}
			if (invoice.getAcUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>AC</td><td>"
								+ invoice.getAcUnits() + "</td><td>" + invoice.getAcCost() + "</td><td>"
								+ invoice.getAcGST() + "</td><td>" + invoice.getActotal() + "</td></tr>");
			}
			if (invoice.getOthrUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Other Detials</td><td>"
								+ invoice.getOthrUnits() + "</td><td>" + invoice.getOthrCost() + "</td><td>"
								+ invoice.getOthrGST() + "</td><td>" + invoice.getOthtotal() + "</td></tr>");
			}
			if (invoice.getRent() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Rent</td><td>"
								+ invoice.getRent() + "</td><td></td><td>" + invoice.getRentGST() + "</td><td>"
								+ invRnttotal + "</td></tr>");
			}

			if (invoice.getMaintenance() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Maintenance</td><td>"
								+ invoice.getMaintenance() + "</td><td></td><td>" + invoice.getMaintenanceGST()
								+ "</td><td>" + invoice.getMnttotal() + "</td></tr>");
			}
			htmlStringBuilder.append(
					"<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px;'> <td></td><td></td><td></td><td><b>Total</b></td><td><b>"
							+ invAmounttotal + "</b></td></tr>");

			if (amountpaid != null) {
				htmlStringBuilder.append(
						"<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px;'> <td></td><td></td><td></td><td><font color='darkgreen'><b>Recieved</b></font></td><td>"
								+ amountpaid + "</td></tr>");
			}
			if (dueAmount != null) {
				htmlStringBuilder.append(
						"<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px;'> <td></td><td></td><td></td><td><font color='red'>Due</font></td><td>"
								+ dueAmount + "</td></tr>");
			}
			htmlStringBuilder.append("</tbody></table></div></div>");
			if(!invAmount.equals(amountpaid)) {
			htmlStringBuilder.append(
					"<div class='row'><div class='col'><h4>Scan</h4><img src=\'cid:image\' style='height: 150px;width:200px'/></div></div>");

			htmlStringBuilder.append(" <a href='" + publicUrl + "/apinew?prtyid=" + prtyid + "&invoiceid=" + invoiceid
					+ "&invoiceamt=" + invAmount + "' ><img src=\'cid:image3\' style='height:21px;width:100px'/></a>");
			}
			htmlStringBuilder.append(
					"<div class='row'><div class='col'><h4>Terms and Conditions:</h4>" + terms + "</div></div>");
			htmlStringBuilder.append("<div class='row'><div class='col'><p><b>Note</b>:" + note + "</p></div></div>");
			htmlStringBuilder
					.append("<div class='row mt-3'><div class='col' style='float:left'><h4>Authorized Signatory</h4><p>"
							+ prptyName
							+ "</p></div><div class='col' style='float:right'><h4>Genarated By</h4><img src=\'cid:image2\'style='height: 70px;'/></div></div>");
			htmlStringBuilder.append(
					"<div style='clear: both;'></div><div class='row'><div class='col'><div class='quote text-center'><img src=\'cid:image1\' style='max-width:700px;'/></div></div></div>");
			htmlStringBuilder.append(
					" <div class='row ' ><div class='col' style='float:left;text-align:center;'><p class='text-center' style='border-top:1px solid #ccc;'>This is Computer Generated Invoice</p></div>	<div class='col' style='float:right;text-align:center;'>"
							+ "<p style='border-top:1px solid #ccc;'>E.&O.E</p></div></div></div></body></html>");

			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();

			messageBodyPart.setContent(htmlStringBuilder.toString(), "text/html");

			multipart.addBodyPart(messageBodyPart);
			MimeBodyPart messageBodyPart1 = new MimeBodyPart();
			String dest = getInvoicePdf(htmlStringBuilder.toString(), invoiceid, mail, phnno, name, terms, note,
					prptyName, saveimg, qr_Code, logo, invoice, date, invoicenumber, amountpaid, dueAmount, payLink,
					invAmount);

			DataSource source = new FileDataSource(dest);
			messageBodyPart1.setDataHandler(new DataHandler(source));
			messageBodyPart1.setFileName(pdfFilename);
			multipart.addBodyPart(messageBodyPart1);
			Map<String, String> inlineImages = new HashMap<String, String>();

			inlineImages.put("image1", saveimg);
			inlineImages.put("image", qr_Code);
			inlineImages.put("image2", logo);
			inlineImages.put("image3", upiImg);

			// adds inline image attachments
			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();
				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
						logger.error("Invoice Mail sent" + ex.getCause().getMessage());
					}

					multipart.addBodyPart(imagePart);
				}

			}

			message.setContent(multipart);
			try {
				Transport.send(message);
				logger.info("Invoice Mail sent");
			} catch (AddressException e) {
				logger.error("Address Exception Exception raised while sending Invoice mail----" + e.toString());

			} catch (SendFailedException e) {
				logger.error("SendFailed Exception raised while while sending Invoice mail----" + e.toString());

			}
		} catch (Exception e) {
			logger.error("Logical Exception raised while while sending sendInvoice mail----" + e.toString());
		}

	}

	private String getInvoicePdf(String html, int invoiceid, String mail, String phnno, String name, String terms,
			String note, String prptyName, String saveimg, String qr_Code, String logo, InvoiceEntity invoice,
			String date, String invoicenumber, Double amountpaid, Double dueAmount, String payLink, Double invAmount) {
		String desFile = null;

		try {

			String htmlnew = generateHtml(invoiceid, mail, phnno, name, terms, note, prptyName, saveimg, qr_Code, logo,
					invoice, date, invoicenumber, amountpaid, dueAmount, payLink, invAmount);
			if (!htmlnew.isEmpty()) {
				byte[] bytes = htmlnew.getBytes();
				String filetitle = "INV" + invoiceid;
				String filename = filetitle + ".html";
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(THRESHOLD_SIZE);
				factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setFileSizeMax(MAX_FILE_SIZE);
				upload.setSizeMax(MAX_REQUEST_SIZE);
				// constructs the directory path to store upload file
				String uploadPath = context.getRealPath("") + UPLOAD_DIRECTORY;

				if (!new File(uploadPath).exists()) {
					new File(uploadPath).mkdir();
					logger.info("directory created  ");
				}
				desFile = uploadPath + File.separator + filetitle;
				File dest = new File(uploadPath + File.separator + filename);
				FileOutputStream fileOuputStream = null;
				try {
					fileOuputStream = new FileOutputStream(dest);
					fileOuputStream.write(bytes);
					logger.info("File created with content ");
				} catch (IOException e) {
					e.printStackTrace();
				}
				try {
					Document document = new Document();
					PdfWriter writer = null;
					try {
						writer = PdfWriter.getInstance(document, new FileOutputStream(desFile + ".pdf"));

					} catch (FileNotFoundException | DocumentException e1) {
						logger.error("Exception due to:" + e1.toString());
						e1.printStackTrace();
					}
					document.open();
					try {
						XMLWorkerHelper.getInstance().parseXHtml(writer, document, new FileInputStream(dest));
					} catch (IOException e) {
						logger.error("Exception due to:" + e.toString());

						e.printStackTrace();
					}
					document.close();
				} catch (Exception ex) {
					logger.error("Exception due to:" + ex.toString());
					ex.printStackTrace();
				}
				System.out.println("pdf file created" + desFile);
				// file =new File(desFile+".pdf");
				desFile = desFile + ".pdf";
				System.out.println("path for file" + desFile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return desFile;
	}

	private Map<String, String> getInvoiceMap(InvoiceEntity invoice, String ownermail, String ownerCont,
			String tenentmail, String tenantCont, String Invoicenumber, String flatno, String prptyName,
			String termsNcond, String tenantname, String ownername, String note) throws WriterException, IOException {

		Map<String, String> inputStr = new HashMap<String, String>();

		if (ownermail != null) {
			inputStr.put("mail", ownermail);
			inputStr.put("phnno", ownerCont);
			inputStr.put("name", ownername);
		} else if (tenentmail != null) {
			inputStr.put("mail", tenentmail);
			inputStr.put("phnno", tenantCont);
			inputStr.put("name", tenantname);

		}
		inputStr.put("invno", Invoicenumber);

		if (invoice.getComment() != null) {
			inputStr.put("note", invoice.getComment());
		} else {
			inputStr.put("note", "NA");
		}
		inputStr.put("generatedto", flatno);
		if (invoice.getInvoicedate() != null) {
			inputStr.put("invdate", invoice.getInvoicedate().toString());
		} else {
			inputStr.put("invdate", "-");
		}
		if (termsNcond != null) {
			inputStr.put("termsNcond", termsNcond);
		} else {

			inputStr.put("termsNcond", "NA");
		}

		if (invoice.getWtrUnits() != null) {
			inputStr.put("wunit", invoice.getWtrUnits().toString());
		} else {
			inputStr.put("wunit", "-");
		}

		if (invoice.getWtrCost() != null) {
			inputStr.put("wcost", invoice.getWtrCost().toString());
		} else {
			inputStr.put("wcost", "-");
		}
		if (invoice.getWtrGST() != null) {
			inputStr.put("wgst", invoice.getWtrGST().toString());
		} else {
			inputStr.put("wgst", "-");
		}

		if (invoice.getWtrtotal() != null) {
			String invwtrtotal = String.format("%.2f", invoice.getWtrtotal());
			inputStr.put("wtotal", invwtrtotal);
		} else {
			inputStr.put("wtotal", "-");
		}
		// power details
		if (invoice.getPwrUnits() != null) {

			inputStr.put("punit", invoice.getPwrUnits().toString());
		} else {
			inputStr.put("punit", "-");
		}

		if (invoice.getPwrCost() != null) {

			inputStr.put("pcost", invoice.getPwrCost().toString());
		} else {
			inputStr.put("pcost", "-");
		}
		if (invoice.getPwrGST() != null) {
			inputStr.put("pgst", invoice.getPwrGST().toString());
		} else {
			inputStr.put("pgst", "-");
		}
		if (invoice.getPwrtotal() != null) {
			String invpwrtotal = String.format("%.2f", invoice.getPwrtotal());
			inputStr.put("ptotal", invpwrtotal);
		} else {
			inputStr.put("ptotal", "-");
		}

		// gas details
		if (invoice.getGasUnits() != null) {
			inputStr.put("gunit", invoice.getGasUnits().toString());
		} else {
			inputStr.put("gunit", "-");
		}

		if (invoice.getGasCost() != null) {
			inputStr.put("gcost", invoice.getGasCost().toString());
		} else {
			inputStr.put("gcost", "-");
		}
		if (invoice.getGasGST() != null) {
			inputStr.put("ggst", invoice.getGasGST().toString());
		} else {
			inputStr.put("ggst", "-");
		}
		if (invoice.getGastotal() != null) {
			String invgastotal = String.format("%.2f", invoice.getGastotal());
			inputStr.put("gtotal", invgastotal);
		} else {
			inputStr.put("gtotal", "-");
		}

		// dessiel details
		if (invoice.getDslUnits() != null) {
			inputStr.put("dunit", invoice.getDslUnits().toString());
		} else {
			inputStr.put("dunit", "-");
		}

		if (invoice.getDslCost() != null) {
			inputStr.put("dcost", invoice.getDslCost().toString());
		} else {
			inputStr.put("dcost", "-");
		}
		if (invoice.getDslGST() != null) {
			inputStr.put("dgst", invoice.getDslGST().toString());
		} else {
			inputStr.put("dgst", "-");
		}
		if (invoice.getDsltotal() != null) {
			String invdsltotal = String.format("%.2f", invoice.getDsltotal());
			inputStr.put("dtotal", invdsltotal);
		} else {
			inputStr.put("dtotal", "-");
		}

		if (invoice.getAcUnits() != null) {
			inputStr.put("aunit", invoice.getAcUnits().toString());
		} else {
			inputStr.put("aunit", "-");
		}

		if (invoice.getAcCost() != null) {
			inputStr.put("acost", invoice.getAcCost().toString());
		} else {
			inputStr.put("acost", "-");
		}
		if (invoice.getAcGST() != null) {
			inputStr.put("agst", invoice.getAcGST().toString());
		} else {
			inputStr.put("agst", "-");
		}
		if (invoice.getActotal() != null) {
			String invactotal = String.format("%.2f", invoice.getActotal());
			inputStr.put("atotal", invactotal);
		} else {
			inputStr.put("atotal", "-");
		}

		if (invoice.getOthrUnits() != null) {
			inputStr.put("ounit", invoice.getOthrUnits().toString());
		} else {
			inputStr.put("ounit", "-");
		}

		if (invoice.getOthrCost() != null) {
			inputStr.put("ocost", invoice.getOthrCost().toString());
		} else {
			inputStr.put("ocost", "-");
		}
		if (invoice.getOthrGST() != null) {
			inputStr.put("ogst", invoice.getOthrGST().toString());
		} else {
			inputStr.put("ogst", "-");
		}
		if (invoice.getOthtotal() != null) {
			String invOthtotal = String.format("%.2f", invoice.getOthtotal());
			inputStr.put("ototal", invOthtotal);
		} else {
			inputStr.put("ototal", "-");
		}

		if (invoice.getRent() != null) {
			inputStr.put("rent", invoice.getRent().toString());
		} else {
			inputStr.put("rent", "-");
		}
		if (invoice.getRentGST() != null) {
			inputStr.put("rgst", invoice.getRentGST().toString());
		} else {
			inputStr.put("rgst", "-");
		}
		if (invoice.getRenttotal() != null) {
			String invRnttotal = String.format("%.2f", invoice.getRenttotal());
			inputStr.put("rtotal", invRnttotal);
		} else {
			inputStr.put("rtotal", "-");
		}

		if (invoice.getMaintenance() != null) {
			inputStr.put("maintenance", invoice.getMaintenance().toString());
		} else {
			inputStr.put("maintenance", "-");
		}
		if (invoice.getMaIntegerenanceGST() != null) {
			inputStr.put("mgst", invoice.getMaIntegerenanceGST().toString());
		} else {
			inputStr.put("mgst", "-");
		}
		if (invoice.getMnttotal() != null) {
			String invMnttotal = String.format("%.2f", invoice.getMnttotal());
			inputStr.put("mtotal", invMnttotal);
		} else {
			inputStr.put("mtotal", "-");
		}
		if (invoice.getInvoiceAmount() != null) {
			String invAmounttotal = String.format("%.2f", invoice.getInvoiceAmount());

			inputStr.put("InvoiceTotal", invAmounttotal);
		} else {
			inputStr.put("InvoiceTotal", "-");
		}

		inputStr.put("prtyname", prptyName);

		return inputStr;
	}

	@Async

	public void sendNotificationMail(String title, String description, String prptyName, String tenantname,
			String ownername, String tenentmail, String ownermail, String htmlfile, String subject,
			String buildingMail) {
		//String tomail = "maaservices123@gmail.com";// comment when load to production and change tomail1 to tomail
		String tomail = "maaservices123@gmail.com";
		try {
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/
			Session session1 = Session.getDefaultInstance(properties);
			// Session session1 = Session.getInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			//message.setFrom(new InternetAddress(frommail));
			message.setFrom(new InternetAddress(frommail, prptyName));
			//message.setRecipients(Message.RecipientType.TO,tomail);
			message.setRecipients(Message.RecipientType.TO,ownermail);
			//message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
			message.setSubject(subject);
			message.setReplyTo(new javax.mail.Address[] { new javax.mail.internet.InternetAddress(buildingMail) });
			Map<String, String> input = new HashMap<String, String>();
			String greetName = "Dear All";
			input.put("Title", title);
			input.put("prtyname", prptyName);
			input.put("Description", description);
			input.put("Name", greetName);

			String htmlText = readEmailFromHtml(htmlfile, input);

			// String saveimg=env.getProperty("saveimg");

			String fb = env.getProperty("fbImg");
			String tweet = env.getProperty("tweetImg");
			String insta = env.getProperty("instaImg");
			String pint = env.getProperty("pintImg");
			String bell = env.getProperty("bellImg");

			String logo = env.getProperty("logo");

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			Map<String, String> inlineImages = new HashMap<String, String>();

			inlineImages.put("logo", logo);
			inlineImages.put("fb", fb);
			inlineImages.put("tweet", tweet);
			inlineImages.put("insta", insta);
			inlineImages.put("pint", pint);
			inlineImages.put("bell", bell);

			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();

				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}

					multipart.addBodyPart(imagePart);
				}
			}

			message.setContent(multipart);

			Transport.send(message);

		} catch (AddressException e) {
			logger.error("Address Exception Exception raised while sending sendNotificationMail mail----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailed Exception raised while while sending sendNotificationMail mail----" + e);

		} catch (Exception e) {
			logger.error("Logical Exception raised while while sending sendNotificationMail mail----" + e);
		}

	}

	@Async
	public void sendForgotPasswordMail(String mail, String subject, String password2, String prtyname) {
		try {
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/

			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(frommail));
			//message.setFrom(new InternetAddress(frommail, prtyname));
			message.setRecipients(Message.RecipientType.TO, mail);
			//message.setRecipient(Message.RecipientType.TO, new InternetAddress(mail));
			message.setSubject(subject);

			StringBuilder sb = new StringBuilder();
			sb.append("Hi,<br>");
			sb.append("<br>");
			sb.append("<br>");
			sb.append("Mail:" + mail);
			sb.append("<br>");
			sb.append("Password:" + password2);
			sb.append("<br>");
			sb.append("<br>");
			sb.append("Thanks & Regards");
			sb.append("<br>");

			sb.append("Maa Properties");
			// message.setSubject(subject);
			message.setContent(sb.toString(), "text/html");
			Transport.send(message);

			Transport.send(message);
			logger.info("Password sent to mail");

		} catch (AddressException e) {
			logger.error("Address Exception Exception raised while sending sendNotificationMail mail----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailed Exception raised while while sending sendNotificationMail mail----" + e);

		} catch (Exception e) {
			logger.error("Logical Exception raised while while sending sendNotificationMail mail----" + e);
		}

	}

	@Async
	public void sendComplaintMail(String fromail, String ctitle, String description, String prtyName,
			String buildingMail, String htmlfile, String subject, String ccmail) {
		try {

			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/
			System.out.println(fromail+"mail Owner-------"+buildingMail+"========"+ccmail);
			

			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(frommail, fromail));
		//	message.setRecipient(Message.RecipientType.TO, new InternetAddress(buildingMail));
			message.setRecipients(Message.RecipientType.TO, buildingMail);
			if(ccmail!=null) {
				message.setRecipients(Message.RecipientType.CC, ccmail);
			}
			message.setSubject(subject);
			//message.setReplyTo(new javax.mail.Address[] { new javax.mail.internet.InternetAddress(buildingMail) });
			Map<String, String> input = new HashMap<String, String>();
			String greetName = prtyName;
			input.put("Title", ctitle);
			input.put("prtyname", prtyName);
			input.put("Description", description);
			input.put("Name", greetName);

			String htmlText = readEmailFromHtml(htmlfile, input);

			String fb = env.getProperty("fbImg");
			String tweet = env.getProperty("tweetImg");
			String insta = env.getProperty("instaImg");
			String pint = env.getProperty("pintImg");
			String bell = env.getProperty("bellImg");

			String logo = env.getProperty("logo");
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			Map<String, String> inlineImages = new HashMap<String, String>();

			inlineImages.put("logo", logo);
			inlineImages.put("fb", fb);
			inlineImages.put("tweet", tweet);
			inlineImages.put("insta", insta);
			inlineImages.put("pint", pint);
			inlineImages.put("bell", bell);

			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();

				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}

					multipart.addBodyPart(imagePart);
				}
			}

			message.setContent(multipart);

			Transport.send(message);
			System.out.println("Mail Transefered--------------");

		} catch (AddressException e) {
			logger.error("Address Exception Exception raised while sending sendNotificationMail mail----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailed Exception raised while while sending sendNotificationMail mail----" + e);

		} catch (Exception e) {
			logger.error("Logical Exception raised while while sending sendNotificationMail mail----" + e);
		}

	}

	@Async
	public String sendReceipt(String tomail1, String subject, String htmlfile, String paidBy, String payDate,
			String paypurpose, String recieptNum, String unitNo, String amountPaid1, String dueAmount1,
			String payPeriod, String prptyName, String payeeCont, String invAmout1, String prtyAddress,
			String buildingMail) {
		String tomail = "maaservices123@gmail.com";// comment when load to production and change tomail1 to tomail

		NumberToWord num2word = new NumberToWord();
		String sucMessage = null;
		try {
			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/

			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(frommail));
			//message.setFrom(new InternetAddress(frommail, prptyName));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
			message.setSubject(subject);
			message.setReplyTo(new javax.mail.Address[] { new javax.mail.internet.InternetAddress(buildingMail) });

			Map<String, String> input = new HashMap<String, String>();

			// String logo=env.getProperty("logo");
			String quoteimg = env.getProperty("quoteimg");
			String numberName = "Zero";
			if (amountPaid1 != null) {

				numberName = num2word.convertToIndianCurrency(amountPaid1);

			}

			input.put("Receipt_No", recieptNum);
			input.put("numberName", numberName);
			input.put("Paid_Date", payDate);
			input.put("Amount_Paid", amountPaid1);
			input.put("Due_Amount", dueAmount1);
			input.put("Payment_Period", payPeriod);
			input.put("Payment_Purpose", paypurpose);
			input.put("Paid_By", paidBy);
			input.put("Unit_No", unitNo);
			input.put("Payee_Mobile", unitNo);
			input.put("invAmountval", invAmout1);
			String[] strArr = prtyAddress.split("/");
			input.put("prtyAddress", strArr[0]);
			input.put("prtyContact", strArr[1]);
			input.put("Payee_Mail", tomail1);
			input.put("Payee_Mobile", payeeCont);
			input.put("prtyname", prptyName);

			String htmlText = readEmailFromHtml(htmlfile, input);

			// String bgimage=env.getProperty("bgimage");

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			Map<String, String> inlineImages = new HashMap<String, String>();
			inlineImages.put("image1", quoteimg);

			// adds inline image attachments
			if (inlineImages != null && inlineImages.size() > 0) {
				Set<String> setImageID = inlineImages.keySet();

				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = inlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}

					multipart.addBodyPart(imagePart);
				}
			}

			message.setContent(multipart);
			try {
				Transport.send(message);
				sucMessage = "Success";
			} catch (AddressException e) {
				logger.error("Address Exception Exception raised ----" + e);

			} catch (SendFailedException e) {
				logger.error("SendFailed Exception raised----" + e);

			} catch (Exception e) {
				logger.error("Logical Exception raised ----" + e);
			}
		} catch (Exception e) {
			logger.error("Address Exception Exception raised while sending payent mail----" + e);

		}

		return sucMessage;

	}

	public String downloadPaymentReciept(String tomail, String subject, String htmlfile, String paidBy, String payDate,
			String paypurpose, String recieptNum, String unitNo, String amountPaid1, String dueAmount1,
			String payPeriod, String prptyName, String payeeCont, String invAmout1, String prtyAddress,
			String buildingMail) {
		NumberToWord num2word = new NumberToWord();

		String htmlText = null;
		String quoteimg = env.getProperty("quoteimg");
		try {
			Map<String, String> input = new HashMap<String, String>();
			String numberName = "Zero";
			if (amountPaid1 != null) {
				numberName = num2word.convertToIndianCurrency(amountPaid1);
			}

			input.put("Receipt_No", recieptNum);
			input.put("numberName", numberName);
			input.put("Paid_Date", payDate);
			input.put("Amount_Paid", amountPaid1);
			input.put("Due_Amount", dueAmount1);
			input.put("Payment_Period", payPeriod);
			input.put("Payment_Purpose", paypurpose);
			input.put("Paid_By", paidBy);
			input.put("Unit_No", unitNo);
			input.put("Payee_Mobile", unitNo);
			input.put("invAmountval", invAmout1);
			System.out.println("------------------"+prtyAddress);
			String[] strArr = prtyAddress.split("/");
			input.put("prtyAddress", strArr[0]);
			input.put("prtyContact", strArr[1]);
			System.out.println("-------------strArr[0]-----"+strArr[0]);
			input.put("Payee_Mobile", payeeCont);

			input.put("prtyname", prptyName);
			input.put("image1", quoteimg);

			htmlText = readEmailFromHtml(htmlfile, input);

			// generatePDFFromHTML(htmlText,recieptNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return htmlText;
	}

	@Async
	public void sendEnquiryMail(String tomail, String name, String phone, String email, String description,
			String enquiryType, String prptyType, String htmlfile, String subject, String userType) {
		try {

			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/

			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(frommail, email));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
			message.setSubject(subject);
			Date enqDate = new Date();
			Map<String, String> input = new HashMap<String, String>();
			String greetName = "Sir";
			input.put("enqName", name);
			input.put("enqContact", phone);
			input.put("enqType", enquiryType);
			input.put("enqDescription", description);
			input.put("enqDate", enqDate.toString());
			input.put("usertype", userType);

			input.put("prtyType", prptyType);
			input.put("greetName", greetName);

			String htmlText = readEmailFromHtml(htmlfile, input);

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			message.setContent(multipart);

			Transport.send(message);
			System.out.println("Mail Transefered--------------");

		} catch (AddressException e) {
			logger.error("Address Exception Exception raised while sending sendEnquiryMail mail----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailed Exception raised while while sending sendEnquiryMail mail----" + e);

		} catch (Exception e) {
			logger.error("Logical Exception raised while while sending sendEnquiryMail mail----" + e);
		}

	}

	@Async
	public void sendClassifiedEnquiryMail(String tomail, String name, String phone, String email, String description,
			String csfTitle, String htmlfile, String subject, String greetName) {
		try {

			java.util.Properties properties = System.getProperties();
			properties.setProperty("mail.smtp.host", env.getProperty("mailhost"));
			properties.put("mail.smtp.port", env.getProperty("port"));
			/*properties.setProperty("mail.smtp.host", mailhost);
			properties.put("mail.smtp.port", 25);*/
			properties.put("mail.smtp.auth", "false");//production
			/*Session session1 = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});*/

			Session session1 = Session.getDefaultInstance(properties);

			MimeMessage message = new MimeMessage(session1);
			message.setFrom(new InternetAddress(frommail, email));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
			message.setSubject(subject);
			Date enqDate = new Date();
			Map<String, String> input = new HashMap<String, String>();

			input.put("enqName", name);
			input.put("enqContact", phone);
			input.put("csfTitle", csfTitle);
			input.put("enqDescription", description);
			input.put("enqDate", enqDate.toString());

			// if(greetName!=null) {
			input.put("greetName", greetName);
			/*
			 * }else { input.put("greetName", "Sir"); }
			 */

			String htmlText = readEmailFromHtml(htmlfile, input);

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlText, "text/html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			message.setContent(multipart);

			Transport.send(message);
			System.out.println("Mail Transefered--------------");

		} catch (AddressException e) {
			logger.error("Address Exception Exception raised while sending sendEnquiryMail ----" + e);

		} catch (SendFailedException e) {
			logger.error("SendFailed Exception raised while while sending sendEnquiryMail ----" + e);

		} catch (Exception e) {
			logger.error("Logical Exception raised while while sending sendEnquiryMail ----" + e);
		}

	}

	String generateHtml(int invoiceid, String mail, String phnno, String name, String terms, String note,
			String prptyName, String saveimg, String qr_Code, String logo, InvoiceEntity invoice, String date,
			String invoicenumber, Double amountpaid, Double dueAmount, String payLink2, Double invAmount) {
		StringBuilder htmlStringBuilder = new StringBuilder();
		String htmlText = "";
		try {
			String invRnttotal = "";
			String upiImg = env.getProperty("upiImg");
			String publicUrl = env.getProperty("pms");
			/*if (invoice.getRenttotal() != null) {
				invRnttotal = String.format("%.2f", invoice.getRenttotal());
			}*/
			int prtyid = 0;
			if (invoice != null) {
				prtyid = invoice.getPrptyid();
			}
			String invAmounttotal = "";
			if (invoice.getInvoiceAmount() != null) {
				invAmounttotal = String.format("%.2f", invoice.getInvoiceAmount());
			}

			htmlStringBuilder.append(
					"<html lang='en'><body width='100%' style='margin: 0; padding: 0 !important; mso-line-height-rule: exactly;font-family: 'Roboto', sans-serif; font-size: 13px;'> <div class='mx-5'style='max-width: 700px;margin: 0 auto;border-radius: 4px;padding-left: 6px;padding-right: 6px;' class='email-container'><div class='row'><div class='col' style='float:left'><h1><font color='red'>INVOICE</font></h1><p Style='padding: 0px;margin: 0px;'><b>Invoice Number:</b>#"
							+ invoicenumber + "</p> <p Style='padding: 0px;margin: 0px;'><b>Invoice Date: </b>" + date
							+ "</p>	</div>\r\n<div class='col' style='float:right'><h4><b Style='padding: 0px;margin: 0px;'>To Bill:</b></h4><p Style='padding: 0px;margin: 0px;'>"
							+ name + "<br/>Mail id: <font color='blue' style='text-decoration:underline'>" + mail
							+ "</font><br/>\r\nPhone : " + phnno
							+ "\r\n </p></div><div style='clear: both;'></div>	</div><div style='clear: both;'></div><br/><div class='row' style='margin-top:10px;'><div class='col'><table class='table' style='border-collapse: collapse;width:100%;'><thead class='table-dark'><tr>\r\n<th style='background-color:#000;color:#fff;line-height:2;'>Particulars</th> <th style='background-color:#000;color:#fff;'>Units</th><th style='background-color:#000;color:#fff;'>Cost/Unit</th>\r\n <th style='background-color:#000;color:#fff;'>GST%</th><th style='background-color:#000;color:#fff;'>Total</th></tr> </thead> ");

			htmlStringBuilder.append("<tbody>");
			if (invoice.getWtrUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Water</td><td>"
								+ invoice.getWtrUnits() + "</td><td>" + invoice.getWtrCost() + "</td><td>"
								+ invoice.getWtrGST() + "</td><td>" + invoice.getWtrtotal() + "</td></tr>");
			}
			if (invoice.getPwrUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Elcetricity</td><td>"
								+ invoice.getPwrUnits() + "</td><td>" + invoice.getPwrCost() + "</td><td>"
								+ invoice.getPwrGST() + "</td><td>" + invoice.getPwrtotal() + "</td></tr>");
			}
			if (invoice.getGasUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Gas</td><td>"
								+ invoice.getGasUnits() + "</td><td>" + invoice.getGasCost() + "</td><td>"
								+ invoice.getGasGST() + "</td><td>" + invoice.getGastotal() + "</td></tr>");
			}
			if (invoice.getDslUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Diesel</td><td>"
								+ invoice.getDslUnits() + "</td><td>" + invoice.getDslCost() + "</td><td>"
								+ invoice.getDslGST() + "</td><td>" + invoice.getDsltotal() + "</td></tr>");
			}
			if (invoice.getAcUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>AC</td><td>"
								+ invoice.getAcUnits() + "</td><td>" + invoice.getAcCost() + "</td><td>"
								+ invoice.getAcGST() + "</td><td>" + invoice.getActotal() + "</td></tr>");
			}
			if (invoice.getOthrUnits() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Other Detials</td><td>"
								+ invoice.getOthrUnits() + "</td><td>" + invoice.getOthrCost() + "</td><td>"
								+ invoice.getOthrGST() + "</td><td>" + invoice.getOthtotal() + "</td></tr>");
			}
			if (invoice.getRent() != null) {
				if (invoice.getRenttotal() != null) {
					invRnttotal = String.format("%.2f", invoice.getRenttotal());
						logger.info("..................Rent "+invRnttotal);
				}
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'><td>Rent</td><td>"
								+ invoice.getRent() + "</td><td></td><td>" + invoice.getRentGST() + "</td><td>"+invRnttotal+ "</td></tr>");
			}

			if (invoice.getMaintenance() != null) {
				htmlStringBuilder.append(
						"<tr style='border-bottom: 1px solid #dee2e6;text-align: center;padding:7px;line-height:2;height:30px;'> <td>Maintenance</td><td>"
								+ invoice.getMaintenance() + "</td><td></td><td>" + invoice.getMaintenanceGST()
								+ "</td><td>" + invoice.getMnttotal() + "</td></tr>");
			}
			htmlStringBuilder.append(
					"<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px;'> <td></td><td></td><td></td><td><b>Total</b></td><td><b>"
							+ invAmounttotal + "</b></td></tr>");
			htmlStringBuilder.append("<tr> <th colspan='5'></th></tr>");
			if (amountpaid != null) {
				htmlStringBuilder.append(
						"<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px;'> <td></td><td></td><td></td><td><font color='darkgreen'><b>Recieved</b></font></td><td>"
								+ amountpaid + "</td></tr>");
			}
			if (dueAmount != null) {
				htmlStringBuilder.append(
						"<tr style='border: 1px solid #dee2e6;text-align: left;padding:7px;line-height:2;height:30px;'> <td></td><td></td><td></td><td><font color='red'>Due</font></td><td>"
								+ dueAmount + "</td></tr>");
			}
			htmlStringBuilder.append("</tbody></table></div></div>");

			htmlStringBuilder.append("<div class='row'><div class='col'><h4>Scan</h4><img src='" + qr_Code
					+ "' style='height: 150px;width:200px'/></div></div>");

			htmlStringBuilder.append(
					" <a href='" + publicUrl + "/apinew?prtyid=" + prtyid + "&invoiceid=" + invoiceid + "&invoiceamt="
							+ invAmount + "' ><img src='" + upiImg + "' style='height:21px;width:100px'/></a>");

			htmlStringBuilder.append(
					"<div class='row'><div class='col'><h4>Terms and Conditions:</h4>" + terms + "</div></div>");
			htmlStringBuilder.append("<div class='row'><div class='col'><p><b>Note</b>:" + note + "</p></div></div>");
			htmlStringBuilder
					.append("<div class='row mt-3'><div class='col' style='float:left'><h4>Authorized Signatory</h4><p>"
							+ prptyName
							+ "</p></div><div class='col' style='float:right'><h4>Genarated By</h4><img src=\'" + logo
							+ "'style='height: 70px;'/></div></div>");
			htmlStringBuilder.append(
					"<div style='clear: both;'></div><div class='row'><div class='col'><div class='quote text-center'><img src=\'"
							+ saveimg + "'/></div></div></div>");
			htmlStringBuilder.append(
					" <div class='row ' ><div class='col' style='float:left;text-align:center;'><p class='text-center' style='border-top:1px solid #ccc;'>This is Computer Generated Invoice</p></div>	<div class='col' style='float:right;text-align:center;'>"
							+ "<p style='border-top:1px solid #ccc;'>E.&O.E</p></div></div></div></body></html>");
			htmlText = htmlStringBuilder.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return htmlText;
	}
}
