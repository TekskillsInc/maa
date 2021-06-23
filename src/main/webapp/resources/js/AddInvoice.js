$(document).ready(function() {
		$('#invoiceGas').attr('disabled', true);
		$('#invoiceWater').attr('disabled', true);
		$('#invoiceCurrent').attr('disabled', true);
		$('#invoiceDissel').attr('disabled', true);
		$('#invoiceAc').attr('disabled', true);
		$('#invoiceOtheRead').attr('disabled', true);
		$("#inlineCheckboxAll").attr('disabled', true);
		$("#inlineCheckRent").attr('disabled', true);
		$("#inlineCheckMain").attr('disabled', true);
		});
	

function appendFlatno(prtyid) {
	var month = $('#month_indv').val();
	var year = $('#year_indv').val();
	var flatnoVal = 0;
	var Cassetid = 0;
	var occby = 0;
	var ownerid = 0, tenantid = 0;
	$("#invoiceInnerAsset tr")
			.each(

					function() {
						var tr = $(this);
						
						
						var chkbox = $(this)
								.find('input[type="radio"]').prop(
										"checked");

						if (chkbox == true) {
							var row = $(this).closest("tr");
						 	var  ownerVal=row.find("p").text();     
							var  tenantVal=row.find("h5").text();  
						
							flatnoVal = $(this).find(
									'input[type="hidden"]').val();
							occby = $(this).find('span').text();
							
							$('#unitNo').val(flatnoVal);
							$('#ast_occ_by').val(occby);
						 	 $('#ownerid_inv').val(ownerVal);
							$('#tenenatid_inv').val(tenantVal); 
													
							
							if (occby != 'O') {
								$("#inlineCheckRent").attr('disabled',
										false);
								//$("#rentDisply").hide();
							} else {
								$("#inlineCheckRent").attr('disabled',
										true);
								//$("#rentDisply").toggle();

							}

							$('#invoiceGas').attr('disabled', false);
							$('#invoiceWater').attr('disabled', false);
							$('#invoiceCurrent').attr('disabled', false);
							$('#invoiceDissel').attr('disabled', false);
							$('#invoiceAc').attr('disabled', false);
							$('#invoiceOtheRead').attr('disabled', false);
							$("#inlineCheckboxAll").attr('disabled', false);
							$("#inlineCheckRent").attr('disabled', false);
							$("#inlineCheckMain").attr('disabled', false);
						}
					});
	
	$("#meterAddIndModal").hide();
	closeInvoiceDiv();
}

function getTotalByReading(mtrReading, mtrCost, mtrGst) {
	var mtrVal = mtrReading * mtrCost;
	var mtrGstVal = 0;
	if (mtrVal != 0) {
		mtrGstVal = (mtrVal * mtrGst) / 100;
	}
	var mtrTotal = mtrVal + mtrGstVal;
	mtrTotal= mtrTotal.toFixed(2);
	return mtrTotal;
}
function getRMTotal(rmval, rmGst) {

	var rm_Val = 0;
	if (rmval != 0) {
		rm_Val = (rmval * rmGst) / 100;
	}
	var rmTotal = rmval + rm_Val;
	rmTotal= rmTotal.toFixed(2);
	return rmTotal;
}

$("#waterdisply").hide();
$("#currentDisplay").hide();
$("#disselDisply").hide();
$("#gasDisply").hide();
$("#acDisply").hide();
$("#otherReadDisply").hide();
$("#rentDisply").hide();

var occ = $('#ast_occ_by').val();
if(occ=='O'){

$("#inlineCheckRent").attr('disabled', true);
}
else{$("#inlineCheckRent").attr('disabled', false);
	}


$("#invoiceWater")
		.click(
				function() {

					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					var wChk = $("#invoiceWater").is(':checked');
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {
							

							if (response != '') {

								$('#wtr_gst').val(response.waterGST);

							} else {
								$('#wtr_gst').val(0);
							}

						},
						error : function() {
						}
					});

					if (wChk == true) {
						if(month!=''&&flatno!=''){
						$
								.ajax({
									type : "post",
									url : "getReadingsByFlatInvoice?flat="	+ flatno + "&prtyid="+ prtyid + "&month="+ month + "&year=" + year+ "&prvmonth="+ prvmonth+"&redingtype=wtr",
									cache : false,
									async : false,
									success : function(response) {
										if (response !=null && response != '') {
											var wCpu=response.water_CPU.toFixed(2);
											
											$('#wtr_mr').text(
													response.water_MR);
											$('#wtr_cost').text(
													wCpu);
											$('#wtr_cost_txt').val(
													wCpu);
											$('#wtr_mr_txt').val(
													response.water_MR);

											$("#invoiceAllRead").attr(
													'disabled', true);

											var wtrMtrcost = parseFloat(response.water_CPU);
											var wtrMtrRead = parseFloat(response.water_MR);
											var wtrMtrGst = parseFloat($(
													'#wtr_gst').val());
											var wtrTotal = getTotalByReading(
													wtrMtrRead,
													wtrMtrcost,
													wtrMtrGst);
											$('#wtrTotaltxt').val(
													wtrTotal);

										}
								else{
								
									$('#wtr_mr').text('');
									$('#wtr_cost').text('');
									$('#wtr_cost_txt').val('');
									$('#wtr_mr_txt').val('');
									$("#invoiceAllRead").attr('disabled', true);
									$('#wtrTotaltxt').val('');
											
								}		
									},
									error : function() {
									}
								});
						$("#waterdisply").toggle();
						}
						else{
							alert("Please choose month and flat no");
							$("#invoiceWater").prop('checked',false);
							}
						
					} else {

						$("#invoiceAllRead").attr('disabled', false);
						
						$('#wtr_mr').text('');
						$('#wtr_cost').text('');
						$('#wtr_cost_txt').val('');
						$('#wtr_mr_txt').val('');
					
						$('#wtrTotaltxt').val('');
						$("#waterdisply").hide();
					}

					
				});

$("#invoiceCurrent")
		.click(
				function() {
					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					var pChk = $("#invoiceCurrent").is(':checked');
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {

							if (response != '') {

								$('#pwr_gst').val(response.powerGST);

							} else {
								$('#pwr_gst').val(0);
								
							}

						},
						error : function() {
						}
					});
					if (pChk == true) {
						if(month!=''&&flatno!=''){
						$
								.ajax({
									type : "post",
									url : "getReadingsByFlatInvoice?flat="
											+ flatno + "&prtyid="
											+ prtyid + "&month="
											+ month + "&year=" + year
											+ "&prvmonth="
											+ prvmonth + "&redingtype=pwr",
									cache : false,
									async : false,
									success : function(response) {

										if (response != null && response != '') {
											var pCpu=response.power_CPU.toFixed(2);
											
										
											$('#pwr_mr').text(
													response.power_MR);
											$('#pwr_mr_txt').val(
													response.power_MR);
											$('#pwr_cost').text(
													pCpu);
											$('#pwr_cost_txt').val(pCpu);
													

											$("#invoiceAllRead").attr(
													'disabled', true);
											var pwrMtrcost = parseFloat(response.power_CPU);
											var pwrMtrRead = parseFloat(response.power_MR);
											var pwrMtrGst = parseFloat($(
													'#pwr_gst').val());
											var pwrTotal = getTotalByReading(
													pwrMtrRead,
													pwrMtrcost,
													pwrMtrGst);
											$('#pwrTotaltxt').val(
													pwrTotal);

										}
											else{
												
												$('#pwr_mr').text('');
												$('#pwr_mr_txt').val('');
												$('#pwr_cost').text('');
														
												$('#pwr_cost_txt').val('');
												$("#invoiceAllRead").attr('disabled', true);
												$('#pwrTotaltxt').val('');
														
											}		
												
											

									},
									error : function() {
									}
								});
						$("#currentDisplay").toggle();
						}else{
						alert("Please select month and flat");
						$("#invoiceCurrent").prop('checked',false);
						}
					} else {

						$("#invoiceAllRead").attr('disabled', false);
						
						$('#pwr_mr').text('');
						$('#pwr_mr_txt').val('');
						
						
						
						$('#pwrTotaltxt').val('');
						$("#currentDisplay").hide();
					}
					
				});

$("#invoiceDissel")
		.click(
				function() {
					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					var pChk = $("#invoiceDissel").is(':checked');
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {

							if (response != '') {

								$('#dsl_gst').val(response.deselGST);

							} else {
								$('#dsl_gst').val(0);
								
								
							}

						},
						error : function() {
						}
					});

					if (pChk == true) {
						if(month!=''&&flatno!=''){
						$
								.ajax({
									type : "post",
									url : "getReadingsByFlatInvoice?flat="
											+ flatno + "&prtyid="
											+ prtyid + "&month="
											+ month + "&year=" + year
											+ "&prvmonth="
											+ prvmonth + "&redingtype=dsl",
									cache : false,
									async : false,
									success : function(response) {

										if (response!=null && response != '') {
											var dCpu=response.disel_CPU.toFixed(2);
											$('#dsl_mr').text(
													response.disel_MR);
											$('#dsl_cost').text(
													dCpu);
											$('#dsl_mr_txt').val(
													response.disel_MR);
											$('#dsl_cost_txt').val(
													dCpu);

											$("#invoiceAllRead").attr(
													'disabled', true);
											var dslMtrcost = parseFloat(response.disel_CPU);
											var dslMtrRead = parseFloat(response.disel_MR);
											var dslMtrGst = parseFloat($(
													'#dsl_gst').val());
											var dslTotal = getTotalByReading(
													dslMtrRead,
													dslMtrcost,
													dslMtrGst);
											$('#dslTotaltxt').val(
													dslTotal);

										}else{
											
											$('#dsl_mr').text('');
											$('#dsl_mr_txt').val('');
											$('#dsl_cost').text('');
											$('#dsl_cost_txt').val('');
											
											$("#invoiceAllRead").attr('disabled', true);
											$('#dslTotaltxt').val('');
													
										}	

									},
									error : function() {
									}
								});
						$("#disselDisply").toggle();

					}else{alert("Please choose month and flatno");
					$("#invoiceDissel").prop('checked',false);
						} 
				}else {

						$("#invoiceAllRead").attr('disabled', false);
						
						$('#dsl_mr').text('');
						$('#dsl_cost').text('');
						$('#dsl_mr_txt').val('');
						$('#dsl_cost_txt').val('');
						
						$('#dslTotaltxt').val('');
						$("#disselDisply").hide();
					}

					
				});

$("#invoiceGas")
		.click(
				function() {
					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					var pChk = $("#invoiceGas").is(':checked');
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {

							if (response != '') {
								$('#gas_gst').val(response.gasGST);
							} else {
								$('#gas_gst').val(0);
								
							}

						},
						error : function() {
						}
					});

					if (pChk == true) {
						if(month!=''&&flatno!=''){
						$
								.ajax({
									type : "post",
									url : "getReadingsByFlatInvoice?flat="
											+ flatno + "&prtyid="
											+ prtyid + "&month="
											+ month + "&year=" + year
											+"&prvmonth="
											+ prvmonth + "&redingtype=gas",
											
									cache : false,
									async : false,
									success : function(response) {

										if (response != null && response != '') {
											var gCpu=response.gas_CPU.toFixed(2);
											$('#gas_mr').text(
													response.gas_MR);
											$('#gas_mr_txt').val(
													response.gas_MR);
											$('#gas_cost').text(gCpu);
											
											$('#gas_cost_txt').val(gCpu);
													
											$("#invoiceAllRead").attr(
													'disabled', true);
											var gasMtrcost = parseFloat(response.gas_CPU);
											var gasMtrRead = parseFloat(response.gas_MR);
											var gasMtrGst = parseFloat($(
													'#gas_gst').val());
											var gasTotal = getTotalByReading(
													gasMtrRead,
													gasMtrcost,
													gasMtrGst);
											$('#gasTotaltxt').val(
													gasTotal);

										}else{
											
											$('#gas_mr').text('');
											$('#gas_mr_txt').val('');
											$('#gas_cost').text('');
											$('#gas_cost_txt').val('');
											
											$("#invoiceAllRead").attr('disabled', true);
											$('#gasTotaltxt').val('');
													
										}	

									},
									error : function() {
									}
								});
						$("#gasDisply").toggle();

					}else{
						alert("please choose month and flat");
						 $("#invoiceGas").prop('checked',false);
						}

					 }
				else {

						$("#invoiceAllRead").attr('disabled', false);
						
						$('#gas_mr').text('');
						$('#gas_mr_txt').val('');
						$('#gas_cost').text('');
						$('#gas_cost_txt').val('');
						
						$('#gasTotaltxt').val('');
						$("#gasDisply").hide();
					}

					
				});

$("#invoiceAc")
		.click(
				function() {
				
					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					var pChk = $("#invoiceAc").is(':checked');
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {

							if (response != '') {
							
								$('#ac_gst').val(response.acGST);
							} else {
								$('#ac_gst').val(0);
								
							}

						},
						error : function() {
						}
					});
					if (pChk == true) {
						if(month!=''&&flatno!=''){
						$
								.ajax({
									type : "post",
									url : "getReadingsByFlatInvoice?flat="
											+ flatno + "&prtyid="
											+ prtyid + "&month="
											+ month + "&year=" + year
											+ "&prvmonth="
											+ prvmonth + "&redingtype=ac",
									cache : false,
									async : false,
									success : function(response) {

										if (response != '') {
											var acCpu=response.ac_CPU.toFixed(2);
											$('#ac_mr').text(
													response.ac_MR);
											$('#ac_mr_txt').val(
													response.ac_MR);
											$('#ac_cost').text(acCpu);
													
											$('#ac_cost_txt').val(acCpu);
													
											$("#invoiceAllRead").attr('disabled', true);
													
											var acMtrcost = parseFloat(response.ac_CPU);
											var acMtrRead = parseFloat(response.ac_MR);
											var acMtrGst = parseFloat($(
													'#ac_gst').val());
											var acTotal = getTotalByReading(
													acMtrRead,
													acMtrcost, acMtrGst);
											$('#acTotaltxt').val(
													acTotal);
										}
										else{
											
											$('#ac_mr').text('');
											$('#ac_mr_txt').val('');
											$('#ac_cost').text('');
											$('#ac_cost_txt').val('');
											
											$("#invoiceAllRead").attr('disabled', true);
											$('#acTotaltxt').val('');
													
										}	

									},
									error : function() {
									}
								});
						$("#acDisply").toggle();
					}else{
						alert("Please choose month and flat no ");
						 $("#invoiceAc").prop('checked',false);
						}
					} else {
						$("#invoiceAllRead").attr('disabled', false);
						var pwrMtrcost = 0;
						var pwrMtrRead = 0;
						var pwrMtrGst = 0;
						$('#ac_mr').text(0);
						$('#ac_mr_txt').val(0);
						$('#ac_cost').text(0);
						$('#ac_cost_txt').val(0);

						var pwrTotal = getTotalByReading(pwrMtrRead,pwrMtrcost, pwrMtrGst);
								
						$('#acTotaltxt').val(pwrTotal);
						$("#acDisply").hide();
					}
					
				});

$("#invoiceOtheRead")
		.click(
				function() {
					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					var pChk = $("#invoiceOtheRead").is(':checked');
			
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {

							if (response != '') {

								$('#wtr_gst').val(response.waterGST);
								$('#pwr_gst').val(response.powerGST);
								$('#gas_gst').val(response.gasGST);
								$('#dsl_gst').val(response.deselGST);
								$('#ac_gst').val(response.acGST);
								$('#oth_gst').val(response.other);

							} else {
								$('#wtr_gst').val(0);
								$('#pwr_gst').val(0);
								$('#gas_gst').val(0);
								$('#dsl_gst').val(0);
								$('#ac_gst').val(0);
								$('#oth_gst').val(0);
								
							}

						},
						error : function() {
						}
					});
					if (pChk == true) {
						if(month!=''&&flatno!=''){
						$
								.ajax({
									type : "post",
									url : "getReadingsByFlatInvoice?flat="
											+ flatno + "&prtyid="
											+ prtyid + "&month="
											+ month + "&year=" + year
											+ "&prvmonth="
											+ prvmonth + "&redingtype=othr",
									cache : false,
									async : false,
									success : function(response) {

										if (response != '') {
											var othCpu=response.other_CPU.toFixed(2);
											$('#oth_cost').text(othCpu);
													
											$('#oth_mr').text(
													response.other_MR);
											$('#oth_mr_txt').val(response.other_MR);
													
											$('#oth_cost_txt').val(othCpu);
													
											$("#invoiceAllRead").attr(
													'disabled', true);
											var oMtrcost = parseFloat(response.other_CPU);
											var oMtrRead = parseFloat(response.other_MR);
											var oMtrGst = parseFloat($(
													'#oth_gst').val());
											var oTotal = getTotalByReading(
													oMtrRead, oMtrcost,
													oMtrGst);
											$('#othTotalTxt').val(
													oTotal);

										}
											else{
											
											$('#oth_mr').text('');
											$('#oth_mr_txt').val('');
											$('#oth_cost').text('');
											$('#oth_cost_txt').val('');
											
											$("#invoiceAllRead").attr('disabled', true);
											$('#othTotalTxt').val('');
													
										}

									},
									error : function() {
									}
								});
						$("#otherReadDisply").toggle();
					}
						else{
							alert("Please choose month and flat no");
							$("#invoiceOtheRead").prop('checked',false);
							}
				} else {
						$("#invoiceAllRead").attr('disabled', false);
						var pwrMtrcost = 0;
						var pwrMtrRead = 0;
						var pwrMtrGst = 0;
						$('#oth_cost').text(0);
						$('#oth_mr').text(0);
						$('#oth_mr_txt').val(0);
						$('#oth_cost_txt').val(0);

						var pwrTotal = getTotalByReading(pwrMtrRead,
								pwrMtrcost, pwrMtrGst);
						$('#othTotalTxt').val(pwrTotal);
						$("#otherReadDisply").hide();
					}
					
				});
$("#invoiceAllRead")
		.click(
				function() {
					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					
					var pChk = $("#invoiceAllRead").is(':checked');
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {
							

							if (response != '') {
								
								$('#wtr_gst').val(response.waterGST);
								$('#pwr_gst').val(response.powerGST);
								$('#gas_gst').val(response.gasGST);
								$('#dsl_gst').val(response.deselGST);
								$('#ac_gst').val(response.acGST);
								$('#oth_gst').val(response.other);

								$('#rentGst').val(response.rentGST);
								$('#mntGst').val(
										response.maintenanceGST);

							} else {
								$('#wtr_gst').val(0);
								$('#pwr_gst').val(0);
								$('#gas_gst').val(0);
								$('#dsl_gst').val(0);
								$('#ac_gst').val(0);
								$('#oth_gst').val(0);
								
								$('#rentGst').val(0);
								$('#mntGst').val(0);
										
								
							}

						},
						error : function() {
						}
					});
					if (pChk == true) {
					
						if(month!=''&&flatno!=''){
						$
								.ajax({
									type : "post",
									url : "getReadingsByFlatInvoice?flat="
											+ flatno + "&prtyid="
											+ prtyid + "&month="
											+ month + "&year=" + year
											+"&prvmonth="
											+ prvmonth + "&redingtype=All",
									cache : false,
									async : false,
									success : function(response) {
									
										

										if (response != null&&response!='') {

											var wCpu=response.water_CPU.toFixed(2);
											var pCpu=response.power_CPU.toFixed(2);
											var gCpu=response.gas_CPU.toFixed(2);
											var dCpu=response.disel_CPU.toFixed(2);
											var acCpu=response.ac_CPU.toFixed(2);
											var othCpu=response.other_CPU.toFixed(2);

											$('#wtr_mr').text(response.water_MR);
													
											$('#wtr_cost').text(wCpu);
													
											$('#wtr_cost_txt').val(wCpu);
													
											$('#wtr_mr_txt').val(response.water_MR);
													
											$('#pwr_mr').text(response.power_MR);
													
											$('#pwr_mr_txt').val(response.power_MR);
													
											$('#pwr_cost').text(pCpu);
													
											$('#pwr_cost_txt').val(pCpu);
													

											$('#gas_mr').text(response.gas_MR);
													
											$('#gas_mr_txt').val(response.gas_MR);
													
											$('#gas_cost').text(gCpu);
													
											$('#gas_cost_txt').val(gCpu);
													

											$('#ac_mr').text(response.ac_MR);
													
											$('#ac_mr_txt').val(response.ac_MR);
													
											$('#ac_cost').text(acCpu);
													
											$('#ac_cost_txt').val(acCpu);
													

											$('#dsl_mr').text(response.disel_MR);
													
											$('#dsl_cost').text(dCpu);
													
											$('#dsl_mr_txt').val(response.disel_MR);
													
											$('#dsl_cost_txt').val(dCpu);
													

											$('#oth_cost').text(othCpu);
													
											$('#oth_mr').text(response.other_MR);
													
											$('#oth_mr_txt').val(response.other_MR);
													
											$('#oth_cost_txt').val(othCpu);
													

											var wtrMtrcost = parseFloat(response.water_CPU);
											var wtrMtrRead = parseFloat(response.water_MR);
											var wtrMtrGst = parseFloat($(
													'#wtr_gst').val());
											var wtrTotal = getTotalByReading(
													wtrMtrRead,
													wtrMtrcost,
													wtrMtrGst);
											$('#wtrTotaltxt').val(wtrTotal);
													
											var pwrMtrcost = parseFloat(response.power_CPU);
											var pwrMtrRead = parseFloat(response.power_MR);
											var pwrMtrGst = parseFloat($('#pwr_gst').val());
													
											var pwrTotal = getTotalByReading(
													pwrMtrRead,
													pwrMtrcost,
													pwrMtrGst);
											$('#pwrTotaltxt').val(pwrTotal);
													
											var dslMtrcost = parseFloat(response.disel_CPU);
											var dslMtrRead = parseFloat(response.disel_MR);
											var dslMtrGst = parseFloat($('#dsl_gst').val());
													
											var dslTotal = getTotalByReading(
													dslMtrRead,
													dslMtrcost,
													dslMtrGst);
											$('#dslTotaltxt').val(dslTotal);
													
											var gasMtrcost = parseFloat(response.gas_MR);
											var gasMtrRead = parseFloat(response.gas_CPU);
											var gasMtrGst = parseFloat($(
													'#gas_gst').val());
											var gasTotal = getTotalByReading(
													gasMtrRead,
													gasMtrcost,
													gasMtrGst);
											$('#gasTotaltxt').val(gasTotal);
													
											var acMtrcost = parseFloat(response.ac_CPU);
											var acMtrRead = parseFloat(response.ac_MR);
											var acMtrGst = parseFloat($(
													'#ac_gst').val());
											var acTotal = getTotalByReading(
													acMtrRead,
													acMtrcost, acMtrGst);
											$('#acTotaltxt').val(
													acTotal);
											var oMtrcost = parseFloat(response.other_CPU);
											var oMtrRead = parseFloat(response.other_MR);
											var oMtrGst = parseFloat($(
													'#oth_gst').val());
											var oTotal = getTotalByReading(
													oMtrRead, oMtrcost,
													oMtrGst);
											$('#othTotalTxt').val(
													oTotal);
											$('#invoiceGas').attr(
													'disabled', true);
											$('#invoiceWater').attr(
													'disabled', true);
											$('#invoiceCurrent').attr(
													'disabled', true);
											$('#invoiceDissel').attr(
													'disabled', true);
											$('#invoiceAc').attr(
													'disabled', true);
											$('#invoiceOtheRead').attr(
													'disabled', true);

										}
										else{
											

											$('#wtr_mr').text('');
											$('#wtr_mr_txt').val('');
													
											$('#wtr_cost').text('');
											$('#wtr_cost_txt').val('');
													
											
													
											$('#pwr_mr').text('');
											$('#pwr_mr_txt').val('');
													
											$('#pwr_cost').text('');
											$('#pwr_cost_txt').val('');
													

											$('#gas_mr').text('');
											$('#gas_mr_txt').val('');
													
											$('#gas_cost').text('');
											$('#gas_cost_txt').val('');
													

											$('#ac_mr').text('');
											$('#ac_mr_txt').val('');
													
											$('#ac_cost').text('');
											$('#ac_cost_txt').val('');
													

											$('#dsl_mr').text('');
											$('#dsl_cost').text('');
													
											$('#dsl_mr_txt').val('');
											$('#dsl_cost_txt').val('');
													

											$('#oth_cost').text('');
											$('#oth_mr').text('');
													
											$('#oth_mr_txt').val('');
											$('#oth_cost_txt').val('');
													

										
											$('#wtrTotaltxt').val('');
													
											
											$('#pwrTotaltxt').val('');
													
											
											$('#dslTotaltxt').val('');
													
										
											$('#gasTotaltxt').val('');
													
										
											$('#acTotaltxt').val('');
													
										
											$('#othTotalTxt').val('');
													
											$('#invoiceGas').attr(
													'disabled', true);
											$('#invoiceWater').attr(
													'disabled', true);
											$('#invoiceCurrent').attr(
													'disabled', true);
											$('#invoiceDissel').attr(
													'disabled', true);
											$('#invoiceAc').attr(
													'disabled', true);
											$('#invoiceOtheRead').attr(
													'disabled', true);
											}

									},
									error : function() {
									}
								});
						$("#currentDisplay").toggle();
						$("#disselDisply").toggle();
						$("#waterdisply").toggle();
						$("#gasDisply").toggle();
						$("#acDisply").toggle();
						$("#otherReadDisply").toggle();

					}else{
						alert("Please choose month and unitno");
						$("#invoiceAllRead").prop('checked',false);
						}
					} else {
						$('#wtr_mr').text('');
						$('#wtr_mr_txt').val('');
								
						$('#wtr_cost').text('');
						$('#wtr_cost_txt').val('');
								
						
								
						$('#pwr_mr').text('');
						$('#pwr_mr_txt').val('');
								
						$('#pwr_cost').text('');
						$('#pwr_cost_txt').val('');
								

						$('#gas_mr').text('');
						$('#gas_mr_txt').val('');
								
						$('#gas_cost').text('');
						$('#gas_cost_txt').val('');
								

						$('#ac_mr').text('');
						$('#ac_mr_txt').val('');
								
						$('#ac_cost').text('');
						$('#ac_cost_txt').val('');
								

						$('#dsl_mr').text('');
						$('#dsl_cost').text('');
								
						$('#dsl_mr_txt').val('');
						$('#dsl_cost_txt').val('');
								

						$('#oth_cost').text('');
						$('#oth_mr').text('');
								
						$('#oth_mr_txt').val('');
						$('#oth_cost_txt').val('');
					
						$('#wtrTotaltxt').val('');
						$('#pwrTotaltxt').val('');
						$('#dslTotaltxt').val('');
						$('#gasTotaltxt').val('');
						$('#acTotaltxt').val('');
						$('#othTotalTxt').val('');
						$('#invoiceGas').attr('disabled', false);
						$('#invoiceWater').attr('disabled', false);
						$('#invoiceCurrent').attr('disabled', false);
						$('#invoiceDissel').attr('disabled', false);
						$('#invoiceAc').attr('disabled', false);
						$('#invoiceOtheRead').attr('disabled', false);
						$("#currentDisplay").hide();
						$("#disselDisply").hide();
						$("#waterdisply").hide();
						$("#gasDisply").hide();
						$("#acDisply").hide();
						$("#otherReadDisply").hide();
					}

					
				});

$("#inlineCheckRent")
.click(
		function() {
			var month = $('#month_indv').val();
		//	var prvmonth=monthNameToNum(month);
			var year = $('#year_indv').val();
			var prtyid = $('#prptyid').val();
			var flatno = $('#unitNo').val();
			var occby = $('#ast_occ_by').val();
			var pChk = $("#inlineCheckRent").is(':checked');

			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

						$('#rentGst').val(response.rentGST);

					} else {
						$('#rentGst').val(0);
						
					}

				},
				error : function() {
				}
			});
			if (pChk == true) {
				$
						.ajax({
							type : "post",
							url : "getAssetByFlat?flat="
									+ flatno + "&prtyid="
									+ prtyid + "",
							cache : false,
							async : false,
							success : function(response) {

								if (response != null) {
											//$('#rentResponse').val(response);
											rent = response.rent,
											maintance = response.maintenance;
									if (occby == 'T') {
										tenantid = response.tenantId;
									} else {
										ownerid = response.ownerid;
									}
									$('#rentTxt').val(
											response.rent);
									$('#mntTxt')
											.val(
													response.maintenance);
									$("#inlineCheckboxAll")
											.attr('disabled',
													true);
									var rent = parseFloat(response.rent);
									var rentGst = parseFloat($(
											'#rentGst').val());
									var rentTotal = getRMTotal(
											rent, rentGst);
									$('#renttotalTxt').val(
											rentTotal);
								} else {
									alert("Rent and maintance not availabe ......");
								}

							},
							error : function() {
							}
						});
				$("#rentDisply").toggle();
			} else {
				$("#inlineCheckboxAll").attr('disabled', false);
				var rent = 0;
				var rentGst = 0;
				var rentTotal = 0;

				$('#rentTxt').val(rent);
				$('#rentGst').val(rentGst);
				$('#renttotalTxt').val(rentTotal);
				$("#rentDisply").hide();
			}
			
		});
$("#invoiceMaintaince").hide();
$("#inlineCheckMain")
		.click(
				function() {
					var month = $('#month_indv').val();
					var prvmonth=monthNameToNum(month);
					var year = $('#year_indv').val();
					var prtyid = $('#prptyid').val();
					var flatno = $('#unitNo').val();
					var occby=$('#ast_occ_by').val();
					$.ajax({
						type : "get",
						url : "getGst",
						cache : false,
						async : false,
						data:{"prtyid":prtyid},
						success : function(response) {

							if (response != '') {

								$('#mntGst').val(response.maintenanceGST);

							} else {
								$('#mntGst').val(0);
							}

						},
						error : function() {
						}
					});
					var pChk = $("#inlineCheckMain").is(':checked');
					if (pChk == true) {
						$
								.ajax({
									type : "post",
									url : "getAssetByFlat?flat="
											+ flatno + "&prtyid="
											+ prtyid + "",
									cache : false,
									async : false,
									success : function(response) {

										if (response != null) {
													//$('#rentResponse').val(response);
													rent = response.rent,
													maintance = response.maintenance;
													
											if (occby == 'T') {
												tenantid = response.tenantId;
											} else {
												ownerid = response.ownerid;
											}

											$('#mntTxt').val(maintance);
													
															
											$("#inlineCheckboxAll").attr('disabled',true);
											var maintenance =0;
													if(maintance!=null||maintance!=''){
											var maintenance = parseFloat(response.maintenance);}
													
											var mntGst = parseFloat($('#mntGst').val());
													
											var mntTotal = getRMTotal(
													maintenance, mntGst);
											$('#mnttotalTxt').val(
													mntTotal);
											$("#inlineCheckboxAll")
													.attr('disabled',
															true);

										} else {
											alert("Rent and maintance not availabe ......");
										}

									},
									error : function() {
									}
								});
						$("#invoiceMaintaince").toggle();
					} else {
						$("#inlineCheckboxAll").attr('disabled', false);
						var maintenance = 0;
						var mntGst = 0;
						var mntTotal = 0;
						$('#mntTxt').val(maintenance);
						$('#mntGst').val(mntGst);
						$('#mnttotalTxt').val(mntTotal);
						$("#invoiceMaintaince").hide();
					}

					
				});


$("#inlineCheckboxAll").click(function() {
	
	var month = $('#month_indv').val();
	var prvmonth=monthNameToNum(month);
	var year = $('#year_indv').val();
	var prtyid = $('#prptyid').val();
	var flatno = $('#unitNo').val();

	
	

	$.ajax({
		type : "get",
		url : "getGst",
		cache : false,
		async : false,
		data:{"prtyid":prtyid},
		success : function(response) {

			if (response != '') {

				
				$('#rentGst').val(response.rentGST);
				$('#mntGst').val(
						response.maintenanceGST);

			} else {
				$('#rentGst').val(0);
				$('#mntGst').val(0);
						

				
			}

		},
		error : function() {
		}
	});
	var pChk = $("#inlineCheckboxAll").is(':checked');
	var occby = $('#ast_occ_by').val();

	if (pChk == true) {
		$
		.ajax({
			type : "post",
			url : "getAssetByFlat?flat="
					+ flatno + "&prtyid="
					+ prtyid + "",
			cache : false,
			async : false,
			success : function(response) {

				if (response != null) {
							//$('#rentResponse').val(response);
							rent = response.rent,
							maintance = response.maintenance;
					if (occby == 'T') {
						tenantid = response.tenantId;
					} else {
						ownerid = response.ownerid;
					}
					$('#rentTxt').val(response.rent);
							
					$('#mntTxt').val(response.maintenance);
						
					
							
					$("#inlineCheckMain").attr('disabled', true);
					$("#inlineCheckRent").attr('disabled', true);
					var rent = parseFloat(response.rent);
					var rentGst = parseFloat($('#rentGst').val());
					var rentTotal = getRMTotal(rent, rentGst);
					var maintenance = parseFloat(response.maintenance);
					var mntGst = parseFloat($('#mntGst').val());
					var mntTotal = getRMTotal(maintenance, mntGst);
					$('#mnttotalTxt').val(mntTotal);
					$('#renttotalTxt').val(rentTotal);
					
				} else {
					alert("Rent and maintance not availabe ......");
				}

			},
			error : function() {
			}
		});
		if (occby == 'O') {
			$('#rentTxt').val(0);
			$('#rentGst').val(0);
			$('#renttotalTxt').val(0);
			$("#rentDisply").hide();
			
		} else {
			$("#rentDisply").toggle();
		}
		
		$("#invoiceMaintaince").toggle();

	

	} else {
		$("#inlineCheckMain").attr('disabled', false);
		$("#inlineCheckRent").attr('disabled', false);
		$("#invoiceMaintaince").hide();

		$("#rentDisply").hide();
	}

	

	
});

	function saveInvoiceFun() {

	var arra1 = [];

	
	var unitNo = $('#unitNo').val();
	var All = document.getElementById("invoiceAllRead").checked;
	var Current = $('#invoiceCurrent').prop("checked");
	var Diesel = $('#invoiceDissel').prop("checked");
	var Water = $('#invoiceWater').prop("checked");
	var Gas = $('#invoiceGas').prop("checked");
	var AC = $('#invoiceAc').prop("checked");
	var Others = $('#invoiceOtheRead').prop("checked");

	var All_rm = document.getElementById("inlineCheckboxAll").checked;
	var rent = $('#inlineCheckRent').prop("checked");
	var maintenance = $('#inlineCheckMain').prop("checked");

	arra1.push(All);
	arra1.push(Current);
	arra1.push(Diesel);
	arra1.push(Water);
	arra1.push(Gas);
	arra1.push(AC);
	arra1.push(Others);
	arra1.push(All_rm);
	arra1.push(rent);
	arra1.push(maintenance);

	if (arra1.includes(true) && unitNo != "") {

		var month = $('#month_indv').val();
		var year = $('#year_indv').val();
		var prptyid = $('#prptyid').val();
		var prptyName = $('#prptyName_inv').val();
		var flatno = $('#unitNo').val();
		var occBy = $('#ast_occ_by').val();

		var wtrMtrRead = parseInt($('#wtr_mr').text())||0;
		
		var pwrMtrRead = parseInt($('#pwr_mr').text())||0;
		var gasMtrRead = parseInt($('#gas_mr').text())||0;
		var acMtrRead = parseInt($('#ac_mr').text())||0;
		var dslMtrRead = parseInt($('#dsl_mr').text())||0;
		var othMtrRead = parseInt($('#oth_mr').text())||0;
		var rent = $('#rentTxt').val();
		var maintenece = $('#mntTxt').val();
		if(wtrMtrRead!=''||pwrMtrRead!=''||gasMtrRead!=''||acMtrRead!=''||dslMtrRead!=''||othMtrRead!=''||rent!=''||maintenece!=''){
		var wtrMtrcost = $('#wtr_cost').text();
		var pwrMtrcost = $('#pwr_cost').text();
		var gasMtrcost = $('#gas_cost').text();
		var acMtrcost = $('#ac_cost').text();
		var dslMtrcost = $('#dsl_cost').text();
		var othMtrcost =$('#oth_cost').text();

		var wtrMtrGst = $('#wtr_gst').val();
		var pwrMtrGst = $('#pwr_gst').val();
		var gasMtrGst = $('#gas_gst').val();
		var dslMtrGst = $('#dsl_gst').val();
		var acMtrGst = $('#ac_gst').val();
		var othMtrGst = $('#oth_gst').val();

		var rentGst = $('#rentGst').val();
		var mntGST = $('#mntGst').val();
		
		var comments = $('#inv_comments').val();
		var ownerid_inv = $('#ownerid_inv').val();
		var tenantid_inv = $('#tenenatid_inv').val();

		var wtrTotal = $('#wtrTotaltxt').val();
		var pwrTotal = $('#pwrTotaltxt').val();
		var gasTotal = $('#gasTotaltxt').val();
		var dslTotal = $('#dslTotaltxt').val();
		var acTotal = $('#acTotaltxt').val();
		var othTotal = $('#othTotalTxt').val();
		var mntTotal = $('#mnttotalTxt').val();
		var rentTotal = $('#renttotalTxt').val();
	
	var invoiceDate = new Date();
	var dd = invoiceDate.getDate();

	var mm = invoiceDate.getMonth()+1; 
	var yyyy = invoiceDate.getFullYear();
	
	invoiceDate =yyyy+'-'+ mm+'-'+dd;
		
			var wtrTotal2 = parseFloat(wtrTotal)||0;
			wtrTotal2= wtrTotal2.toFixed(2);
			var wtrTotal1 = parseFloat(wtrTotal)||0;
			
			var pwrTotal2 = parseFloat(pwrTotal)||0;
			pwrTotal2= pwrTotal2.toFixed(2);
			 var pwrTotal1 = parseFloat(pwrTotal2)||0;
			
			var gasTotal2 = parseFloat(gasTotal)||0;
			gasTotal2= gasTotal2.toFixed(2);
			var gasTotal1 = parseFloat(gasTotal2)||0;
			
			var dslTotal2 = parseFloat(dslTotal)||0;
			dslTotal1= dslTotal2.toFixed(2);
			var dslTotal1 = parseFloat(dslTotal2)||0;
			
			var acTotal2 = parseFloat(acTotal)||0;
			acTotal1= acTotal2.toFixed(2);
			var acTotal1 = parseFloat(acTotal2)||0;
			
			var othTotal2 = parseFloat(othTotal)||0;
			othTotal1= othTotal2.toFixed(2);
			var othTotal1 = parseFloat(othTotal2)||0;
			
			var mntTotal2 = parseFloat(mntTotal)||0;
			mntTotal2= mntTotal2.toFixed(2);
			var mntTotal1= parseFloat(mntTotal2)||0;
			var rentTotal2 = parseFloat(rentTotal)||0;
			rentTotal2= rentTotal2.toFixed(2);
			var  rentTotal1 = parseFloat(rentTotal2)||0;
			
			
		if(wtrTotal1!=''||pwrTotal1!=''||wtrTotal1!=''||gasTotal1!=''||dslTotal1!=''||acTotal1!=''||othTotal1!=''||rentTotal1!=''||mntTotal1!=''){
		var grndTotal = wtrTotal1 + pwrTotal1 + gasTotal1 + dslTotal1
				+ acTotal1 + othTotal1 + rentTotal1 + mntTotal1;
		
		}
		

		var invoice = {
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
			comment : comments,
			wtrtotal:wtrTotal1,
			pwrtotal:pwrTotal1,
			gastotal:gasTotal1,
			dsltotal:dslTotal1,
			actotal:acTotal1,
			othtotal:othTotal1,
			renttotal:rentTotal1,
			mnttotal:mntTotal1,
			invoicedate:invoiceDate,
			status:0
		}
		$
				.ajax({
					type : "Post",
					url : "saveInvoice?flatno=" + flatno + "&occBy="
							+ occBy + "&prptyName=" + prptyName + "",
					cache : false,
					async : false,
					contentType : 'application/json',
					data : JSON.stringify(invoice),
					success : function(response) {

						alert("Invoice for period-" + month + "/"
								+ year + " for asset " + flatno
								+ response);
						window.location.reload();
					},
					error : function() {
					}
				});
		}
		else{
			alert("Meter readings not available for selcted moth and year and unit. please check..");
			}
	}

	else {
		if (unitNo == "") {
			alert("Please select Unit no");
		} else {
			alert("Please select atleast one check box");
		}
	}
}

function payInvoice(invId, flatNo, month, year, invamount, amtPaid,
		due,paidby,ownerid,tenantid) {
	

	var todayTime = new Date();
	var month1 = todayTime.getMonth() + 1;
	var day = todayTime.getDate();
	var year = todayTime.getFullYear();
	
	var payDate = month1 + "/" + day + "/" + year;

	$('#payDate').val(payDate);
	var period = month + '/' + year;
	$('#payPeriod').val(period);
	$('#InvId').val('Invc' + invId);
	$('#InvIdHidden').val(invId);
	$('#paidBy').val(paidby);
	$('#unitNo_pay').val(flatNo);
	$('#invAmount').val(invamount);
	

	
	if (due == '') {
		$('#totalAmount').val(invamount);
	} else {
		$('#totalAmount').val(due);
	}

	$('#ownerid_pay').val(ownerid);
	$('#tenantid_pay').val(tntid);

}

function getDueAmount() {
	var totalAmt = $('#totalAmount').val();
	var amtPaid = $('#amountPaid').val();
	var tVal = parseFloat(totalAmt);
	var aVal = parseFloat(amtPaid);
	var dueAmount = tVal - aVal;
	dueAmount=dueAmount.toFixed(2);
	$('#dueAmount').val(dueAmount);
}

function closeModal(){
	
	location.reload();
	}

function closeInvoiceDiv(){
	
	$("#waterdisply").hide();
	$("#currentDisplay").hide();
	$("#disselDisply").hide();
	$("#gasDisply").hide();
	$("#acDisply").hide();
	$("#otherReadDisply").hide();
	$("#rentDisply").hide();
	$("#invoiceMaintaince").hide();

	 document.getElementById("invoiceAllRead").checked= 

false;
	 $('#invoiceCurrent').prop("checked", false);
	 $('#invoiceDissel').prop("checked", false);
	 $('#invoiceWater').prop("checked", false);
	 $('#invoiceGas').prop("checked", false);
	 $('#invoiceAc').prop("checked", false);
	 $('#invoiceOtheRead').prop("checked", false);

	document.getElementById

("inlineCheckboxAll").checked= false;
	 $('#inlineCheckRent').prop("checked", false);
	 $('#inlineCheckMain').prop("checked", false);
	}
