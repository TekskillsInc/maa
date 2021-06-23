	$("#vi_waterdisply").hide();
		$("#vi_currentDisplay").hide();
		$("#vi_disselDisply").hide();
		$("#vi_gasDisply").hide();
		$("#vi_acDisply").hide();
		$("#vi_otherReadDisply").hide();
		$("#vi_rentDisply").hide();
		$("#vi_invoiceMaintaince").hide();

		
		function viewInvoice(invoiceid, upiid,accountnumber,ifsccde,accountname,dueAmount,invoiceAmount,amountpaid) {
			var wtrMtrRead = 0, pwrMtrRead = 0, dslMtrRead = 0, gasMtrRead = 0, acMtrRead = 0, othMtrRead = 0;
			var wtrMtrcost = 0, pwrMtrcost = 0, dslMtrcost = 0, gasMtrcost = 0, acMtrcost = 0, othMtrcost = 0;
			var wtrMtrGst = 0, pwrMtrGst = 0, dslMtrGst = 0, gasMtrGst = 0, acMtrGst = 0, othMtrGst = 0;
			var rent = 0, maintance = 0, rentGst = 0, maintanceGst = 0;
			
			$('#vi_invid').val(invoiceid);
			$.ajax({
				type : "POST",
				url : "retriveInvoice?invoiceid=" + invoiceid + "",
				cache : false,
				async : false,
				success : function(response) {
					
					if (response != '') {
						var comment=response.comment;
						
						wtrMtrRead = response.wtrUnits;
								pwrMtrRead = response.pwrUnits;
								dslMtrRead = response.dslUnits;
								gasMtrRead = response.gasUnits;
								acMtrRead = response.acUnits;
								othMtrRead = response.othrUnits;

								wtrMtrcost = response.wtrCost;
								pwrMtrcost = response.pwrCost;
								dslMtrcost = response.dslCost;
								gasMtrcost = response.gasCost;
								acMtrcost = response.acCost;
								othMtrcost = response.othrCost;

								wtrMtrGst = response.wtrGST;
								pwrMtrGst = response.pwrGST;
								dslMtrGst = response.dslGST;
								gasMtrGst = response.gasGST;
								 acMtrGst = response.acGST;
								othMtrGst = response.othrGST;
								rentGst = response.rentGST,
								maintanceGst = response.maintenanceGST;
						rent = response.rent, maintance = response.maintenance;
						 var wtrTotal = getTotalByReading(wtrMtrRead,
								wtrMtrcost, wtrMtrGst); 
								
						 wtrTotal=parseFloat(wtrTotal);	
						 var pwrTotal = getTotalByReading(pwrMtrRead,
								pwrMtrcost, pwrMtrGst); 
						 pwrTotal=parseFloat(pwrTotal);	
					var gasTotal = getTotalByReading(gasMtrRead,
								gasMtrcost, gasMtrGst); 
					gasTotal=parseFloat(gasTotal);	
						var acTotal = getTotalByReading(acMtrRead, acMtrcost,
								acMtrGst); 
						acTotal=parseFloat(acTotal);		
						 var dslTotal = getTotalByReading(dslMtrRead,
								dslMtrcost, dslMtrGst); 
						 dslTotal=parseFloat(dslTotal);
						var othTotal = getTotalByReading(othMtrRead,
								othMtrcost, othMtrGst); 
						othTotal=parseFloat(othTotal);
						var rentTotal = getRMTotal(rent, rentGst);
						rentTotal=parseFloat(rentTotal);
						var mntTotal = getRMTotal(maintance, maintanceGst); 
						mntTotal=parseFloat(mntTotal);
					 var grandTotal = wtrTotal + pwrTotal + gasTotal
								+ dslTotal + acTotal + othTotal + rentTotal
								+ mntTotal; 
						$('#vi_month').val(response.month);
						$('#vi_comment').val(comment);
						
						
						$('#vi_year').val(response.year);
						var ownerid=response.ownerid;
						var tntid=response.tenentid;
						$('#vi_ownerid').val(ownerid);
						$('#vi_tntid').val(tntid);
						if (response.wtrUnits != null && response.wtrUnits != 0) {
							
							$('#vi_wtr_mr').text(response.wtrUnits);
							$('#vi_wtr_cost').text(response.wtrCost);
							$('#vi_wtr_mr_txt').val(response.wtrUnits);

							$('#vi_wtr_gst').val(response.wtrGST);
							$('#vi_wtr_cost_txt').val(response.wtrCost);

							$('#vi_wtrTotaltxt').val(wtrTotal);
							$("#vi_waterdisply").toggle();

						}else{
							$('#vi_wtr_mr').text(null);
							$('#vi_wtr_cost').text(null);
							$('#vi_wtr_mr_txt').val(null);

							$('#vi_wtr_gst').val(null);
							$('#vi_wtr_cost_txt').val(null);

							$('#vi_wtrTotaltxt').val(null);
							$("#vi_waterdisply").hide();
						}
						if (response.pwrUnits !=null && response.pwrUnits != 0) {
							$('#vi_pwr_mr').text(response.pwrUnits);
							$('#vi_pwr_mr_txt').val(response.pwrUnits);
							$('#vi_pwr_cost').text(response.pwrCost);
							$('#vi_pwr_cost_txt').val(response.pwrCost);
							$('#vi_pwr_gst').val(response.pwrGST);

							$('#vi_pwrTotaltxt').val(pwrTotal);

							$("#vi_currentDisplay").toggle();

						}else{
							$('#vi_pwr_mr').text(null);
							$('#vi_pwr_mr_txt').val(null);
							$('#vi_pwr_cost').text(null);
							$('#vi_pwr_cost_txt').val(null);
							$('#vi_pwr_gst').val(null);

							$('#vi_pwrTotaltxt').val(null);

							$("#vi_currentDisplay").hide();
						}
if (response.gasUnits != null && response.gasUnits != 0) {
							$('#vi_gas_mr').text(response.gasUnits);
							$('#vi_gas_cost').text(response.gasCost);
							$('#vi_gas_mr_txt').val(response.gasUnits);
							$('#vi_gas_cost_txt').val(response.gasCost);
							$('#vi_gas_gst').val(response.gasGST);

							$('#vi_gasTotaltxt').val(gasTotal);
							$("#vi_gasDisply").toggle();

						}else{
							$('#vi_gas_mr').text(null);
							$('#vi_gas_cost').text(null);
							$('#vi_gas_mr_txt').val(null);
							$('#vi_gas_cost_txt').val(null);
							$('#vi_gas_gst').val(null);

							$('#vi_gasTotaltxt').val(null);
							$("#vi_gasDisply").hide();
						}

						if (response.acUnits != null && response.acUnits != 0) {
							$('#vi_ac_mr').text(response.acUnits);
							$('#vi_ac_cost_txt').val(response.acCost);
							$('#vi_ac_mr_txt').val(response.acUnits);
							$('#vi_ac_cost').text(response.acCost);
							$('#vi_ac_gst').val(response.acGST);

							$('#vi_acTotaltxt').val(acTotal);
							$("#vi_acDisply").show();

						}else{
							$('#vi_ac_mr').text(null);
							$('#vi_ac_cost_txt').val(null);
							$('#vi_ac_mr_txt').val(null);
							$('#vi_ac_cost').text(null);
							$('#vi_ac_gst').val(null);

							$('#vi_acTotaltxt').val(0);
							$("#vi_acDisply").hide();
						}

						if (response.dslUnits != null && response.dslUnits != 0) {
							$('#vi_dsl_cost').text(response.dslCost);
							$('#vi_dsl_mr').text(response.dslUnits);
							$('#vi_dsl_gst').val(response.dslGST);
							$('#vi_dsl_mr_txt').val(response.dslUnits);
							$('#vi_dsl_cost_txt').val(response.dslCost);

							$('#vi_dslTotaltxt').val(dslTotal);

							$("#vi_disselDisply").toggle();
						}else{
							$('#vi_dsl_cost').text(null);
							$('#vi_dsl_mr').text(null);
							$('#vi_dsl_gst').val(null);
							$('#vi_dsl_mr_txt').val(null);
							$('#vi_dsl_cost_txt').val(null);

							$('#vi_dslTotaltxt').val(null);

							$("#vi_disselDisply").hide();
						}

						if (response.othrUnits != null && response.othrUnits != 0) {
							$('#vi_oth_cost_txt').val(response.othrCost);
							$('#vi_oth_mr_txt').val(response.othrUnits);
							$('#vi_oth_mr').text(response.othrUnits);
							$('#vi_oth_cost').text(response.othrCost);
							$('#vi_oth_gst').val(response.othrGST);
							$('#vi_othTotalTxt').val(othTotal);
							$("#vi_otherReadDisply").toggle();

						}else{
							$('#vi_oth_cost_txt').val(null);
							$('#vi_oth_mr_txt').val(null);
							$('#vi_oth_mr').text(null);
							$('#vi_oth_cost').text(null);
							$('#vi_oth_gst').val(null);
							$('#vi_othTotalTxt').val(null);
							$("#vi_otherReadDisply").hide();
						}

						if (response.rent != null&&response.rent != 0) {
							$('#vi_rentTxt').val(response.rent);
							$('#vi_rentGst').val(response.rentGST);
							$('#vi_renttotalTxt').val(rentTotal);
							$("#vi_rentDisply").toggle();

						}else{
							$('#vi_rentTxt').val(null);
							$('#vi_rentGst').val(null);
							$('#vi_renttotalTxt').val(null);
							$("#vi_rentDisply").hide();

						}

						if (response.maintenance != null && response.maintenance != 0) {
							$('#vi_mntGst').val(response.maintenanceGST);
							$('#vi_mntTxt').val(response.maintenance);
							$('#vi_mnttotalTxt').val(mntTotal);
							$("#vi_invoiceMaintaince").toggle();
						}else{
							$('#vi_mntGst').val(null);
							$('#vi_mntTxt').val(null);
							$('#vi_mnttotalTxt').val(null);
							$("#vi_invoiceMaintaince").hide();
						}
						var flatVal = response.flano;
						$('#vi_unitno').val(flatVal);
						var invDate= response.invoicedate;
						
						$('#vi_invDate').val(invDate);
						$('#vi_grandTotalspan').text(grandTotal);
						$('#vi_amountPaidspan').text(amountpaid);
						$('#vi_amountDuespan').text(dueAmount);
						
					$('#vi_grdtotalTxt').val(grandTotal);
					$('#p_upval').val(upiid);
					$('#p_bacnumber').val(accountnumber);
					$('#p_icode').val(ifsccde);
					$('#p_acname').val(accountname);
					
					
					
					$('#p_dueAmount').val(dueAmount);
					$('#p_invoiceAmount').val(invoiceAmount);
					$('#bhimDiv').hide();
					if(upiid!='' || accountnumber!=''){
						$('#bhimDiv').show();
					}else{
						$('#bhimDiv').hide();
						}
					}
				},
				error : function() {
				}
			});
		if(amountpaid==invoiceAmount){
				
			}
			else{
			$( "#qrCode").empty();
    		genQrCode(invoiceid);
    		$('#QRscanDiv').show();
    		$(".bhimupi").show();
		}
		}
		function sendInvoiceMail(){
			
			var month=$('#vi_month').val();
			var year=$('#vi_year').val();
			var ivoiceid=$('#vi_invid').val();
			var flatno=$('#vi_unitno').val();
			var ownerid_inv=$('#vi_ownerid').val();
			var tenantid_inv=$('#vi_tntid').val();
			var wtrMtrRead=	$('#vi_wtr_mr').text();
			var wtrMtrcost =$('#vi_wtr_cost').text();
			var prptyid = $('#vi_prptyid').val();
			var prptyName = $('#vi_prptyName').val();
			var wtrMtrGst=$('#vi_wtr_gst').val();
			var pwrMtrRead=$('#vi_pwr_mr').text();

			var wtrTotal1=	$('#vi_wtrTotaltxt').val();
			var pwrMtrcost=$('#vi_pwr_cost').text();
			var pwrMtrGst=$('#vi_pwr_gst').val();
			var pwrTotal1=$('#vi_pwrTotaltxt').val();
			
			var gasMtrRead=	$('#vi_gas_mr').text();
			var gasMtrcost=	$('#vi_gas_cost').text();
			var gasMtrGst=	$('#vi_gas_gst').val();
			var gasTotal1=	$('#vi_gasTotaltxt').val();
				
				
			var dslMtrcost=	$('#vi_dsl_cost').text();
				var dslMtrRead=$('#vi_dsl_mr').text();
				var dslMtrGst=$('#vi_dsl_gst').val();
				var dslTotal1=$('#vi_dslTotaltxt').val();
				var acMtrRead=$('#vi_ac_mr').text();
				var acMtrcost=$('#vi_ac_cost').text();
				var acMtrGst=$('#vi_ac_gst').val();
				var acTotal1=	$('#vi_acTotaltxt').val();
				
				var othMtrRead=$('#vi_oth_mr').text();
				var othMtrcost=$('#vi_oth_cost').text();
				var othMtrGst=$('#vi_oth_gst').val();
				var othTotal1=$('#vi_othTotalTxt').val();
			

				var rent=$('#vi_rentTxt').val();
				var rentGst=$('#vi_rentGst').val();
				var rentTotal1=$('#vi_renttotalTxt').val();
				
	
				var comment=$('#vi_comment').val();
				var mntGST=$('#vi_mntGst').val();
				var maintenece=$('#vi_mntTxt').val();
				var mntTotal1=$('#vi_mnttotalTxt').val();
				
				var grndTotal=$('#vi_grdtotalTxt').val();
			 	var invoiceDate=$('#vi_invDate').val();
		
				var invoice = {
						invoiceid:ivoiceid,
						month : month,
						year : year,
						flano : flatno,
						prptyid : prptyid,
						wtrUnits : wtrMtrRead,
						wtrCost : wtrMtrcost,
						wtrGST : wtrMtrGst,
						pwrUnits : pwrMtrRead,
						pwrCost : pwrMtrcost,
						pwrGST : pwrMtrGst,
						gasUnits : gasMtrRead,
						gasCost : gasMtrcost,
						gasGST : gasMtrGst,
						dslUnits : dslMtrRead,
						dslCost : dslMtrcost,
						dslGST : dslMtrGst,
						acUnits : acMtrRead,
						acCost : acMtrcost,
						acGST : acMtrGst,
						othrUnits : othMtrRead,
						othrCost : othMtrcost,
						othrGST : othMtrGst,
						rent : rent,
						rentGST : rentGst,
						maintenance : maintenece,
						maintenanceGST : mntGST,
						invoiceAmount : grndTotal,
						ownerid : ownerid_inv,
						tenentid : tenantid_inv,
						wtrtotal: wtrTotal1,
						pwrtotal: pwrTotal1,
						gastotal: gasTotal1,
						dsltotal: dslTotal1,
						actotal: acTotal1,
						othtotal: othTotal1,
						renttotal: rentTotal1,
						mnttotal: mntTotal1,
						invoicedate: invoiceDate,
						comment:comment,
						status:0
					}
					$
							.ajax({
								type : "Post",
								url : "sendInvoiceMail?prptyName="+prptyName+"",
								cache : false,
								async : false,
								contentType : 'application/json',
								data : JSON.stringify(invoice),
								success : function(response) {
									
									if(response='Success'){
										alert("Invoice sent successfully");
										}else{
											alert("Mail server down,receipt failed to send");
											}
									
								},
								error : function() {
								}
							});

			}
		
		
function getInvoicePDF(){
			
			var month=$('#vi_month').val();
			var year=$('#vi_year').val();
			var ivoiceid=$('#vi_invid').val();
			var flatno=$('#vi_unitno').val();
			var ownerid_inv=$('#vi_ownerid').val();
			var tenantid_inv=$('#vi_tntid').val();
			var wtrMtrRead=	$('#vi_wtr_mr').text();
			var wtrMtrcost =$('#vi_wtr_cost').text();
			var prptyid = $('#vi_prptyid').val();
			var prptyName = $('#vi_prptyName').val();
			var wtrMtrGst=$('#vi_wtr_gst').val();
			var pwrMtrRead=$('#vi_pwr_mr').text();

			var wtrTotal1=	$('#vi_wtrTotaltxt').val();
			var pwrMtrcost=$('#vi_pwr_cost').text();
			var pwrMtrGst=$('#vi_pwr_gst').val();
			var pwrTotal1=$('#vi_pwrTotaltxt').val();
			
			var gasMtrRead=	$('#vi_gas_mr').text();
			var gasMtrcost=	$('#vi_gas_cost').text();
			var gasMtrGst=	$('#vi_gas_gst').val();
			var gasTotal1=	$('#vi_gasTotaltxt').val();
				
				
			var dslMtrcost=	$('#vi_dsl_cost').text();
				var dslMtrRead=$('#vi_dsl_mr').text();
				var dslMtrGst=$('#vi_dsl_gst').val();
				var dslTotal1=$('#vi_dslTotaltxt').val();
				var acMtrRead=$('#vi_ac_mr').text();
				var acMtrcost=$('#vi_ac_cost').text();
				var acMtrGst=$('#vi_ac_gst').val();
				var acTotal1=	$('#vi_acTotaltxt').val();
				
				var othMtrRead=$('#vi_oth_mr').text();
				var othMtrcost=$('#vi_oth_cost').text();
				var othMtrGst=$('#vi_oth_gst').val();
				var othTotal1=$('#vi_othTotalTxt').val();
			

				var rent=$('#vi_rentTxt').val();
				var rentGst=$('#vi_rentGst').val();
				var rentTotal1=$('#vi_renttotalTxt').val();
				
	
				var comment=$('#vi_comment').val();
				var mntGST=$('#vi_mntGst').val();
				var maintenece=$('#vi_mntTxt').val();
				var mntTotal1=$('#vi_mnttotalTxt').val();
				
				var grndTotal=$('#vi_grdtotalTxt').val();
			 	var invoiceDate=$('#vi_invDate').val();
		
				var invoice = {
						invoiceid:ivoiceid,
						month : month,
						year : year,
						flano : flatno,
						prptyid : prptyid,
						wtrUnits : wtrMtrRead,
						wtrCost : wtrMtrcost,
						wtrGST : wtrMtrGst,
						pwrUnits : pwrMtrRead,
						pwrCost : pwrMtrcost,
						pwrGST : pwrMtrGst,
						gasUnits : gasMtrRead,
						gasCost : gasMtrcost,
						gasGST : gasMtrGst,
						dslUnits : dslMtrRead,
						dslCost : dslMtrcost,
						dslGST : dslMtrGst,
						acUnits : acMtrRead,
						acCost : acMtrcost,
						acGST : acMtrGst,
						othrUnits : othMtrRead,
						othrCost : othMtrcost,
						othrGST : othMtrGst,
						rent : rent,
						rentGST : rentGst,
						maintenance : maintenece,
						maintenanceGST : mntGST,
						invoiceAmount : grndTotal,
						ownerid : ownerid_inv,
						tenentid : tenantid_inv,
						wtrtotal: wtrTotal1,
						pwrtotal: pwrTotal1,
						gastotal: gasTotal1,
						dsltotal: dslTotal1,
						actotal: acTotal1,
						othtotal: othTotal1,
						renttotal: rentTotal1,
						mnttotal: mntTotal1,
						invoicedate: invoiceDate,
						comment:comment,
						status:0
					}
				
				
				var jsonObj=JSON.stringify(invoice);
				var invoiceObj=btoa(jsonObj);
				window.location.href="downloadInvoicePDF?invoice="+invoiceObj+"&prptyName="+prptyName+"";

			}

		function genQrCode(invid) {
			   var accNumber = $("#p_bacnumber").val();
			   var invAmount = $("#invAmount").val();
			  var accIFSC = $("#p_icode").val();
			  var accName = $("#p_acname").val();
			var upi=$('#p_upval').val();
			var dueAmount=$('#p_dueAmount').val();
			var invoiceAmount=$('#p_invoiceAmount').val();	
			 var tn="Inv"+invid;
var invAmount;
	 var str;
if(dueAmount==0){
	invAmount=invoiceAmount;
}
else{
	invAmount=dueAmount;
}
		  
		  if(accNumber!=''&&accIFSC!=''){
			
		   str="upi://pay?pa=" + accNumber + "@" + accIFSC +".ifsc.npci&pn=" + accName + "&am="+invAmount+"&mam=0.01&tn="+tn+"&cu=INR";
		  }else if(upi!=''){
			 
			   str= "upi://pay?pa=" + upi + "&pn=" + accName + "&tn=" + tn
				+ "&am=" + invAmount + "&mam=0.01&cu=INR"
			   
			   
			  }
		var qrcode = new QRCode(document.getElementById("qrCode"), {
			text: str,
			width: 128,
			height: 128,
			colorDark : "#000000",
			colorLight : "#ffffff",
			correctLevel : QRCode.CorrectLevel.H
		});
		
		
		}	
