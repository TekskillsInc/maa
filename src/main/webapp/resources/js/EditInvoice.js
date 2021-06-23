	$("#Ed_waterEditdisply").hide();
		$("#Ed_currentEditDisplay").hide();
		$("#Ed_disselEditDisply").hide();
		$("#Ed_gasEditDisply").hide();
		$("#Ed_acEditDisply").hide();
		$("#Ed_otherReadEditDisply").hide();
		$("#Ed_invoiceEditMaintaince").hide();
		$("#Ed_rentEditDisply").hide();
		
		$("#Ed_invoiceEditWater").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			var wChk = $("#Ed_invoiceEditWater").is(':checked');
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

						$('#Ed_wtr_gst').val(response.waterGST);

					} else {
						$('#Ed_wtr_gst').val(0);
					}

				},
				error : function() {
				}
			});

			if (wChk == true) {
				$
						.ajax({
							type : "post",
							url : "getReadingsByFlatInvoice?flat="
								+ flatno + "&prtyid="
								+ prtyid + "&month="
								+ month + "&year=" + year
								+ "&prvmonth="
									+ prvmonth+"&redingtype=wtr",
							cache : false,
							async : false,
							success : function(response) {
								if (response != '') {
									var wCpu=response.water_CPU.toFixed(2);
									$('#Ed_wtr_mr').text(
											response.water_MR);
									$('#Ed_wtr_cost').text(
											wCpu);
									$('#Ed_wtr_cost_txt').val(
											wCpu);
									$('#Ed_wtr_mr_txt').val(
											response.water_MR);

									

									var wtrMtrcost = parseFloat(response.water_CPU);
									var wtrMtrRead = parseFloat(response.water_MR);
									var wtrMtrGst = parseFloat($(
											'#Ed_wtr_gst').val());
									var wtrTotal = getTotalByReading(
											wtrMtrRead,
											wtrMtrcost,
											wtrMtrGst);
									$('#Ed_wtrTotaltxt').val(
											wtrTotal);

								}

							},
							error : function() {
							}
						});
				$("#Ed_waterEditdisply").toggle();
			} else {

				/* $("#invoiceAllRead").attr('disabled', false); */
				var wtrMtrRead = 0;
				var wtrMtrcost = 0;
				var wtrMtrGst = 0;
				$('#Ed_wtr_mr').text(wtrMtrRead);
				$('#Ed_wtr_cost').text(wtrMtrcost);
				$('#Ed_wtr_cost_txt').val(wtrMtrcost);
				$('#Ed_wtr_mr_txt').val(wtrMtrRead);
				var wtrTotal = getTotalByReading(wtrMtrRead,
						wtrMtrcost, wtrMtrGst);
				$('#Ed_wtrTotaltxt').val(wtrTotal);
				$("#Ed_waterEditdisply").hide();
			}

			
			
		});
		$("#Ed_invoiceEditCurrent").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			var pChk = $("#Ed_invoiceEditCurrent").is(':checked');
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

						$('#Ed_pwr_gst').val(response.powerGST);

					} else {
						$('#Ed_pwr_gst').val(0);
					}

				},
				error : function() {
				}
			});
			if (pChk == true) {
				$
						.ajax({
							type : "post",
							url : "getReadingsByFlatInvoice?flat="
								+ flatno + "&prtyid="
								+ prtyid + "&month="
								+ month + "&year=" + year
								+ "&prvmonth="
									+ prvmonth+"&redingtype=pwr",
							cache : false,
							async : false,
							success : function(response) {

								if (response != '') {
									var pCpu=response.power_CPU.toFixed(2);
									$('#Ed_pwr_mr').text(
											response.power_MR);
									$('#Ed_pwr_mr_txt').val(
											response.power_MR);
									$('#Ed_pwr_cost').text(
											pCpu);
									$('#Ed_pwr_cost_txt').val(
											pCpu);

									
									var pwrMtrcost = parseFloat(response.power_CPU);
									var pwrMtrRead = parseFloat(response.power_MR);
									var pwrMtrGst = parseFloat($(
											'#Ed_pwr_gst').val());
									var pwrTotal = getTotalByReading(
											pwrMtrRead,
											pwrMtrcost,
											pwrMtrGst);
									$('#Ed_pwrTotaltxt').val(
											pwrTotal);

								}

							},
							error : function() {
							}
						});
				$("#Ed_currentEditDisplay").toggle();
			} else {

				
			
				$('#Ed_pwr_mr').text('');
				$('#Ed_pwr_mr_txt').val('');
				$('#Ed_pwr_cost').text('');
				$('#Ed_pwr_cost_txt').val('');
				
				$('#Ed_pwrTotaltxt').val('');
				$("#Ed_currentEditDisplay").hide();
			}
			
			
		});
		$("#Ed_invoiceEditDissel").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			var pChk = $("#Ed_invoiceEditDissel").is(':checked');
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

						$('#Ed_dsl_gst').val(response.deselGST);

					} else {
						$('#Ed_dsl_gst').val(0);
					}

				},
				error : function() {
				}
			});

			if (pChk == true) {
				$
						.ajax({
							type : "post",
							url : "getReadingsByFlatInvoice?flat="
								+ flatno + "&prtyid="
								+ prtyid + "&month="
								+ month + "&year=" + year
								+ "&prvmonth="
									+ prvmonth+"&redingtype=dsl",
							cache : false,
							async : false,
							success : function(response) {

								if (response != '') {
									
									var dCpu=response.disel_CPU.toFixed(2);
									$('#Ed_dsl_mr').text(response.disel_MR);
											
									$('#Ed_dsl_cost').text(dCpu);
											
									$('#Ed_dsl_mr_txt').val(response.disel_MR);
											
									$('#Ed_dsl_cost_txt').val(dCpu);
											

									
									var dslMtrcost = parseFloat(response.disel_CPU);
									var dslMtrRead = parseFloat(response.disel_MR);
									var dslMtrGst = parseFloat($(
											'#Ed_dsl_gst').val());
									var dslTotal = getTotalByReading(
											dslMtrRead,
											dslMtrcost,
											dslMtrGst);
									$('#Ed_dslTotaltxt').val(
											dslTotal);

								}

							},
							error : function() {
							}
						});
				$("#Ed_disselEditDisply").toggle();
			} else {

				
				
				$('#Ed_dsl_mr').text('');
				$('#Ed_dsl_cost').text('');
				$('#Ed_dsl_mr_txt').val('');
				$('#Ed_dsl_cost_txt').val('');
				
				$('#Ed_dslTotaltxt').val(''); 
				$("#Ed_disselEditDisply").hide();
			}

			
		});
		$("#Ed_invoiceEditGas").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			
			var flatno = $('#ed_unitno').val();
			
			var pChk = $("#Ed_invoiceEditGas").is(':checked');
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {
						$('#Ed_gas_gst').val(response.gasGST);
					} else {
						$('#Ed_gas_gst').val(0);
					}

				},
				error : function() {
				}
			});

			if (pChk == true) {
				$
						.ajax({
							type : "post",
							url : "getReadingsByFlatInvoice?flat="
								+ flatno + "&prtyid="
								+ prtyid + "&month="
								+ month + "&year=" + year
								+ "&prvmonth="
									+ prvmonth+"&redingtype=gas",
							cache : false,
							async : false,
							success : function(response) {

								if (response != '') {
									var gCpu=response.gas_CPU.toFixed(2);
									$('#Ed_gas_mr').text(
											response.gas_MR);
									$('#Ed_gas_mr_txt').val(
											response.gas_MR);
									$('#Ed_gas_cost').text(
											gCpu);
									$('#Ed_gas_cost_txt').val(
											gCpu);
								
									var gasMtrcost = parseFloat(response.gas_CPU);
									var gasMtrRead = parseFloat(response.gas_MR);
									var gasMtrGst = parseFloat($(
											'#Ed_gas_gst').val());
									var gasTotal = getTotalByReading(
											gasMtrRead,
											gasMtrcost,
											gasMtrGst);
									$('#Ed_gasTotaltxt').val(
											gasTotal);

								}

							},
							error : function() {
							}
						});
			
				$("#Ed_gasEditDisply").toggle();
			} else {

				
				$('#Ed_gas_mr').text('');
				$('#Ed_gas_mr_txt').val('');
				$('#Ed_gas_cost').text('');
				$('#Ed_gas_cost_txt').val('');
				
				$('#Ed_gasTotaltxt').val(''); 
				$("#Ed_gasEditDisply").hide();
			}

			
			
		});
		$("#Ed_invoiceEditAc").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			var pChk = $("#Ed_invoiceEditAc").is(':checked');
		
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {
						$('#Ed_ac_gst').val(response.acGST);
					} else {
						$('#Ed_ac_gst').val(0);
					}

				},
				error : function() {
				}
			});
			if (pChk == true) {
				$
						.ajax({
							type : "post",
							url : "getReadingsByFlatInvoice?flat="
								+ flatno + "&prtyid="
								+ prtyid + "&month="
								+ month + "&year=" + year
								+ "&prvmonth="
									+ prvmonth+"&redingtype=ac",
							cache : false,
							async : false,
							success : function(response) {

								if (response != '') {
									var acCpu=response.ac_CPU.toFixed(2);
									$('#Ed_ac_mr').text(
											response.ac_MR);
									$('#Ed_ac_mr_txt').val(
											response.ac_MR);
									$('#Ed_ac_cost').text(
											acCpu);
									$('#Ed_ac_cost_txt').val(
											acCpu);
									
									var acMtrcost = parseFloat(response.ac_CPU);
									var acMtrRead = parseFloat(response.ac_MR);
									var acMtrGst = parseFloat($(
											'#Ed_ac_gst').val());
									var acTotal = getTotalByReading(
											acMtrRead,
											acMtrcost, acMtrGst);
									$('#Ed_acTotaltxt').val(
											acTotal);
								}

								else {

									
									$('#Ed_ac_mr').text('');
									$('#Ed_ac_mr_txt').val('');
									$('#Ed_ac_cost').text('');
									$('#Ed_ac_cost_txt').val('');
									
									$('#Ed_acTotaltxt').val(''); 
									$("#Ed_acEditDisply").hide();
								}

							},
							error : function() {
							}
						});
				$("#Ed_acEditDisply").toggle();
			} else {
			
				$('#Ed_ac_mr').text('');
				$('#Ed_ac_mr_txt').val('');
				$('#Ed_ac_cost').text('');
				$('#Ed_ac_cost_txt').val('');

				
				$('#Ed_acTotaltxt').val('');
				$("#Ed_acEditDisply").hide();
			}
			
			
		});
		$("#Ed_invoiceEditOtheRead").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			var pChk = $("#Ed_invoiceEditOtheRead").is(':checked');
	
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

					
						$('#Ed_oth_gst').val(response.other);

					} else {
						$('#Ed_oth_gst').val(0);
					}

				},
				error : function() {
				}
			});
			if (pChk == true) {
				$
						.ajax({
							type : "post",
							url : "getReadingsByFlatInvoice?flat="
								+ flatno + "&prtyid="
								+ prtyid + "&month="
								+ month + "&year=" + year
								+ "&prvmonth="
									+ prvmonth+"&redingtype=othr",
							cache : false,
							async : false,
							success : function(response) {

								if (response != '') {
									var othCpu=response.other_CPU.toFixed(2);
									$('#Ed_oth_cost').text(
											othCpu);
									$('#Ed_oth_mr').text(
											response.other_MR);
									$('#Ed_oth_mr_txt').val(
											response.other_MR);
									$('#Ed_oth_cost_txt').val(
											othCpu);
									
									var oMtrcost = parseFloat(response.other_CPU);
									var oMtrRead = parseFloat(response.other_MR);
									var oMtrGst = parseFloat($(
											'#Ed_oth_gst').val());
									var oTotal = getTotalByReading(
											oMtrRead, oMtrcost,
											oMtrGst);
									$('#Ed_othTotalTxt').val(
											oTotal);

								}

							},
							error : function() {
							}
						});
				$("#Ed_otherReadEditDisply").toggle();

			} else {
				
				
				$('#Ed_oth_cost').text('');
				$('#Ed_oth_mr').text('');
				$('#Ed_oth_mr_txt').val('');
				$('#Ed_oth_cost_txt').val('');

				
				$('#Ed_othTotalTxt').val('');
				$("#Ed_otherReadEditDisply").hide();
			}
		
			
		});
	
		$("#Ed_inlineEditCheckMain").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

						
						
						$('#Ed_mntGst').val(
								response.maintenanceGST);

					} else {
						$('#Ed_mntGst').val(
								0);
					}

				},
				error : function() {
				}
			});
			var pChk = $("#Ed_inlineEditCheckMain").is(':checked');
			
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
									
									rent = response.rent,
									maintance = response.maintenance;
							
						
							$('#Ed_mntTxt').val(response.maintenance);
							var maintenance = parseFloat($('#Ed_mntTxt').val());
							var mntGst = parseFloat($('#Ed_mntGst').val());
							var mntTotal = getRMTotal(maintenance, mntGst);
							$('#Ed_mnttotalTxt').val(mntTotal);
							
							
						} else {
							alert("Rent and maintance not availabe ......");
						}

					},
					error : function() {
					}
				});
				$("#Ed_invoiceEditMaintaince").toggle();
				
			

			} else {
			
				$('#Ed_mntTxt').val('');
				$('#Ed_mnttotalTxt').val('');
				$("#Ed_invoiceEditMaintaince").hide();
			}
			
			
		});

		$("#Ed_inlineEditCheckRent").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

						
						$('#Ed_rentGst').val(response.rentGST);
						

					} else {
						$('#Ed_rentGst').val(0);
					}

				},
				error : function() {
				}
			});
			var pChk = $("#Ed_inlineEditCheckRent").is(':checked');
			
			
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
						
							$('#Ed_rentTxt').val(response.rent);
							$("#Ed_inlineEditCheckboxAll").attr('disabled', true);
							var rent = parseFloat(response.rent);
							var rentGst = parseFloat($('#Ed_rentGst').val());
							var rentTotal = getRMTotal(rent, rentGst);
							
							$('#Ed_renttotalTxt').val(rentTotal);
							
						} else {
							alert("Rent and maintance not availabe ......");
						}

					},
					error : function() {
					}
				});
				
				$("#Ed_rentEditDisply").toggle();
			

			} else {
				$('#Ed_rentTxt').val('');
				$('#Ed_renttotalTxt').val('');
				
				$("#Ed_rentEditDisply").hide();
				
			}

			
			
		});

		
		$("#Ed_inlineEditCheckboxAll").click(function() {
			var month = $('#ed_month').val();
			var prvmonth=monthNameToNum(month);
			var year = $('#Ed_year').val();
			var prtyid = $('#Ed_prptyid').val();
			var flatno = $('#ed_unitno').val();
			$.ajax({
				type : "get",
				url : "getGst",
				cache : false,
				async : false,
				data:{"prtyid":prtyid},
				success : function(response) {

					if (response != '') {

						
						$('#Ed_rentGst').val(response.rentGST);
						$('#Ed_mntGst').val(
								response.maintenanceGST);

					} else {
						$('#Ed_rentGst').val(0);
						$('#Ed_mntGst').val(0);
								
					}

				},
				error : function() {
				}
			});
			var pChk = $("#Ed_inlineEditCheckboxAll").is(':checked');
			
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
							
							$('#Ed_rentTxt').val(
									response.rent);
							$('#Ed_mntTxt')
									.val(
											response.maintenance);
							
							$("#Ed_inlineEditCheckMain").attr('disabled', true);
							$("#Ed_inlineEditCheckRent").attr('disabled', true);
							var rent = parseFloat(response.rent);
							
							var rentGst = parseFloat($('#Ed_rentGst').val());
							var rentTotal = getRMTotal(rent, rentGst);
							var maintenance = parseFloat(response.maintenance);
							var mntGst = parseFloat($('#Ed_mntGst').val());
							var mntTotal = getRMTotal(maintenance, mntGst);
							$('#Ed_mnttotalTxt').val(mntTotal);
							$('#Ed_renttotalTxt').val(rentTotal);
							
						} else {
							
							alert("Rent and maintance not availabe ......");
						}

					},
					error : function() {
					}
				});
				$("#Ed_invoiceEditMaintaince").toggle();
				$("#Ed_rentEditDisply").toggle();

				$('#Ed_rentTxt').val('');
				$('#Ed_mntTxt').val('');
				$('#Ed_mnttotalTxt').val('');
				$('#Ed_renttotalTxt').val('');
			

			} else {
				$("#Ed_inlineEditCheckMain").attr('disabled', false);
				$("#Ed_inlineEditCheckRent").attr('disabled', false);
			}

			
		});

		function updateInvoiceFun() {
		//	alert("updateInvoiceFun");

			var arra1 = [];

			var unitNo = $('#ed_unitno').val();
		/* 	var All = document.getElementById("Ed_invoiceEditRead").checked; */
			var Current = $('#Ed_invoiceEditCurrent').prop("checked");
			var Diesel = $('#Ed_invoiceEditDissel').prop("checked");
			var Water = $('#Ed_invoiceEditWater').prop("checked");
			var Gas = $('#Ed_invoiceEditGas').prop("checked");
			var AC = $('#Ed_invoiceEditAc').prop("checked");
			var Others = $('#Ed_invoiceEditOtheRead').prop("checked");
			var invoiceid=$('#Ed_invoiceid').val();
			var rent = $('#Ed_rentEditDisply').prop("checked");
			var maintenance = $('#Ed_invoiceEditMaintaince').prop("checked");

			arra1.push(Current);
			arra1.push(Diesel);
			arra1.push(Water);
			arra1.push(Gas);
			arra1.push(AC);
			arra1.push(Others);
			arra1.push(rent);
			arra1.push(maintenance);

			if (arra1.includes(true) && unitNo != "") {

				var month = $('#ed_month').val();
				var prvmonth=monthNameToNum(month);
				var year = $('#Ed_year').val();
				var prptyid = $('#Ed_prptyid').val();
				var prptyname = $('#Ed_prtyname').val();
				
				var flatno = $('#ed_unitno').val();
			

				var wtrMtrRead = $('#Ed_wtr_mr').text();
				
				var pwrMtrRead = $('#Ed_pwr_mr').text();
				
				var gasMtrRead = $('#Ed_gas_mr').text();
				var dslMtrRead = $('#Ed_dsl_mr').text();
				var acMtrRead = $('#Ed_ac_mr').text();
				var othMtrRead = $('#Ed_oth_mr').text();

				var wtrMtrcost = $('#Ed_wtr_cost').text();
				var pwrMtrcost = $('#Ed_pwr_cost').text();
				var gasMtrcost = $('#Ed_gas_cost').text();
				var acMtrcost = $('#Ed_ac_cost').text();
				var dslMtrcost = $('#Ed_dsl_cost').text();
				var othMtrcost = $('#Ed_oth_cost').text();
				var wtrMtrGst = $('#Ed_wtr_gst').val();
				var pwrMtrGst = $('#Ed_pwr_gst').val();
				var gasMtrGst = $('#Ed_gas_gst').val();
				var dslMtrGst = $('#Ed_dsl_gst').val();
				var acMtrGst = $('#Ed_ac_gst').val();
				var othMtrGst = $('#Ed_oth_gst').val();

				var rentGst = $('#Ed_rentGst').val();
				var mntGST = $('#Ed_mntGst').val();
				var rent = $('#Ed_rentTxt').val();
				
				var maintenece = $('#Ed_mntTxt').val();
				var comments = $('#Ed_inv_comments').val();
				var ownerid_inv = $('#Ed_ownerid_inv').val();
				
				var tenantid_inv = $('#Ed_tenenatid_inv').val();
				
				var wtrTotal = $('#Ed_wtrTotaltxt').val();
				var pwrTotal = $('#Ed_pwrTotaltxt').val();
				var gasTotal = $('#Ed_gasTotaltxt').val();
				var dslTotal = $('#Ed_dslTotaltxt').val();
				var acTotal = $('#Ed_acTotaltxt').val();
				var othTotal = $('#Ed_othTotalTxt').val();
				var mntTotal = $('#Ed_mnttotalTxt').val();
				var rentTotal = $('#Ed_renttotalTxt').val();

				var updateddate = new Date();
				var dd = updateddate.getDate();

				var mm = updateddate.getMonth()+1; 
				var yyyy = updateddate.getFullYear();
				
				updateddate =yyyy+'-'+ mm+'-'+dd;

				if (wtrTotal != '') {
					var wtrTotal1 = parseFloat(wtrTotal);
				} else {
					var pwrTotal1 = 0;
				}
				if (pwrTotal != '') {
					var pwrTotal1 = parseFloat(pwrTotal);
				} else {
					var pwrTotal1 = 0;
				}
				if (gasTotal != '') {
					var gasTotal1 = parseFloat(gasTotal);
				} else {
					var gasTotal1 = 0;
				}
				if (dslTotal != '') {
					var dslTotal1 = parseFloat(dslTotal);
				} else {
					var dslTotal1 = 0;
				}
				if (acTotal != '') {
					var acTotal1 = parseFloat(acTotal);
				} else {
					var acTotal1 = 0;
				}
				if (othTotal != '') {
					var othTotal1 = parseFloat(othTotal);
				} else {
					var othTotal1 = 0;
				}
				if (mntTotal != '') {
					var mntTotal1 = parseFloat(mntTotal);
				} else {
					var mntTotal1 = 0;
				}
				if (rentTotal != '') {
					var rentTotal1 = parseFloat(rentTotal);
				} else {
					var rentTotal1 = 0;
				}
				var grndTotal = wtrTotal1 + pwrTotal1 + gasTotal1 + dslTotal1
						+ acTotal1 + othTotal1 + rentTotal1 + mntTotal1;

				var invoice = {
					invoiceid:invoiceid,
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
					updateddate:updateddate
				}
				$
						.ajax({
							type : "Post",
							url : "updateInvoice?flatno=" + flatno +  "&Ed_prtyname=" + prptyname + "",
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

			else {
				if (unitNo == "") {
					alert("Please select Unit no");
				} /*else {
					alert("Please select atleast one check box");
				}*/
			}
		}
		
		function editInvoice(invoiceid) {

			var wtrMtrRead = 0, pwrMtrRead = 0, dslMtrRead = 0, gasMtrRead = 0, acMtrRead = 0, othMtrRead = 0;
			var wtrMtrcost = 0, pwrMtrcost = 0, dslMtrcost = 0, gasMtrcost = 0, acMtrcost = 0, othMtrcost = 0;
			var wtrMtrGst = 0, pwrMtrGst = 0, dslMtrGst = 0, gasMtrGst = 0, acMtrGst = 0, othMtrGst = 0;
			
			var rent = 0, maintance = 0, rentGst = 0, maintanceGst = 0;
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
								acMtrRead = response.acUnits,
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
								
								rentGst = response.rentGST;
								

maintanceGst = response.maintenanceGST;
								rent = response.rent; 
								maintance = response.maintenance;
							
						$('#Ed_invoiceid').val(invoiceid);
						$('#ed_month').val(response.month);
						$('#Ed_year').val(response.year);
						$('#Ed_inv_comments').val(comment);
						$('#ed_unitno').val(response.flano);
						$('#Ed_ownerid_inv').val(response.ownerid);
						$('#Ed_tenenatid_inv').val(response.tenentid);
						if (response.wtrUnits!=null && response.wtrUnits != 0) {
							

$('#Ed_wtr_mr').text(response.wtrUnits);
							

$('#Ed_wtr_cost').text(response.wtrCost);
							

$('#Ed_wtr_mr_txt').val(response.wtrUnits);
							

$('#Ed_wtr_cost_txt').val(response.wtrCost);
							

$('#Ed_wtr_gst').val(response.wtrGST);
							

$("#Ed_invoiceEditWater").prop('checked', true);
							

$("#Ed_waterEditdisply").toggle();

						} /* else if 

(response.wtrUnits == 0) {
							

$("#Ed_waterEditdisply").hide();
						} */
						if (response.pwrUnits!=null && response.pwrUnits != 0) {
							

$('#Ed_pwr_mr').text(response.pwrUnits);
							

$('#Ed_pwr_cost').text(response.pwrCost);
							

$('#Ed_pwr_mr_txt').val(response.pwrUnits);
							

$('#Ed_pwr_cost_txt').val(response.pwrCost);
							

$('#Ed_pwr_gst').val(response.pwrGST);

							

$("#Ed_invoiceEditCurrent").prop('checked', true);
							

$("#Ed_currentEditDisplay").toggle();

						}
						if (response.gasUnits!=null && response.gasUnits != 0) {
							

$('#Ed_gas_mr').text(response.gasUnits);
							

$('#Ed_gas_cost').text(response.gasCost);
							

$('#Ed_gas_mr_txt').val(response.gasUnits);
							

$('#Ed_gas_cost_txt').val(response.gasCost);
							

$('#Ed_gas_gst').val(response.gasGST);
							

$("#Ed_invoiceEditGas").prop('checked', true);
							

$("#Ed_gasEditDisply").toggle();

						}
						if (response.dslUnits!=null && response.dslUnits != 0) {
							

$('#Ed_dsl_mr').text(response.dslUnits);
							

$('#Ed_dsl_cost').text(response.dslCost);
							

$('#Ed_dsl_mr_txt').val(response.dslUnits);
							

$('#Ed_dsl_cost_txt').val(response.dslCost);
							

$('#Ed_dsl_gst').val(response.dslGST);

							

$("#Ed_invoiceEditDissel").prop('checked', true);
							

$("#Ed_disselEditDisply").toggle();

						}
						
						if (response.acUnits!=null && response.acUnits != 0) {
							

$('#Ed_ac_mr').text(response.acUnits);
							

$('#Ed_ac_cost').text(response.acCost);
							

$('#Ed_ac_mr_txt').val(response.acUnits);
							

$('#Ed_ac_cost_txt').val(response.acCost);
							

$('#Ed_ac_gst').val(response.acGST);
							

$("#Ed_invoiceEditAc").prop('checked', true);
							

$("#Ed_acEditDisply").toggle();

						}
						if (response.othrUnits!=null && response.othrUnits != 0 ) {
							

$('#Ed_oth_cost').text(response.othrCost);
							

$('#Ed_oth_mr').text(response.othrUnits);
							

$('#Ed_oth_mr_txt').val(response.othrUnits);
							

$('#Ed_oth_cost_txt').val(response.othrCost);
							

$('#Ed_oth_gst').val(response.othrGST);
							

$("#Ed_invoiceEditOtheRead").prop('checked', true);
							

$("#Ed_otherReadEditDisply").toggle();

						}

						
						if (response.rent != null 

&& response.rent != 0) {
							

$('#Ed_rentTxt').val(response.rent);
							

$('#Ed_rentGst').val(response.rentGST);
							

$("#Ed_inlineEditCheckRent").prop('checked', true);
							

$("#Ed_rentEditDisply").toggle();
						}
						if (response.maintenance != 

null && response.maintenance != 0) {
							

$('#Ed_mntTxt').val(response.maintenance);
							

$('#Ed_mntGst').val(response.maintenanceGST);
							

$("#Ed_inlineEditCheckMain").prop('checked', true);
							

$("#Ed_invoiceEditMaintaince").toggle();
						}
						
						
						var flatVal = response.flano;
						$('#ed_unitno').val(flatVal);
					}
					var wtrTotal = getTotalByReading(wtrMtrRead, wtrMtrcost,wtrMtrGst);
					var pwrTotal = getTotalByReading(pwrMtrRead, pwrMtrcost,pwrMtrGst);
					var gasTotal = getTotalByReading

(gasMtrRead, gasMtrcost,
							gasMtrGst);
					var dslTotal = getTotalByReading

(dslMtrRead, dslMtrcost,
							dslMtrGst);
					var acTotal = getTotalByReading

(acMtrRead, acMtrcost,
							acMtrGst);
					var othTotal = getTotalByReading

(othMtrRead, othMtrcost,
							othMtrGst);
					var rentTotal = getRMTotal(rent, 

rentGst);
					var mntTotal = getRMTotal

(maintance, maintanceGst);

					var grandTotal = wtrTotal + 

pwrTotal + gasTotal + dslTotal
							+ acTotal + 

othTotal + rentTotal + mntTotal;
					$('#Ed_wtrTotaltxt').val(wtrTotal);
					$('#Ed_pwrTotaltxt').val(pwrTotal);
					$('#Ed_gasTotaltxt').val(gasTotal);
					$('#Ed_dslTotaltxt').val(dslTotal);
					$('#Ed_acTotaltxt').val(acTotal);
					$('#Ed_othTotalTxt').val(othTotal);

					$('#Ed_renttotalTxt').val

(rentTotal);
					$('#Ed_mnttotalTxt').val(mntTotal);
					

				},
				error : function() {
				}
			});

		}