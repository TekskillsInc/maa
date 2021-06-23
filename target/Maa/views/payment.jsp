<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MPRTS|Dashboard</title>
<meta name="description" content="Maa Properties">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.right-panel .navbar-brand img {
	max-width: 47px;
}

.card-header a {
	color: #27ae60;
}

.card-header {
	position: relative;
}
</style>
<style>
body {
	font-size: 13px;
}

.right-panel .navbar-brand img {
	max-width: 47px;
}

.card-header a {
	color: #27ae60;
}

.card-header {
	position: relative;
}

::placeholder {
	font-size: 13px;
}

.card-title {
	font-size: 16px;
}

.nav-pills .nav-item {
	width: 25%;
}

#pills-tab {
	box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0
		rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
}

.nav-pills .nav-item {
	width: 25%;
}

.nav-pills .nav-link {
	padding-top: 17px;
	padding-bottom: 17px;
}

.nav-pills li a:hover {
	color: #3AAFE8 !important;
}

.dropdown-menu {
	width: 350px !important;
}

#custmHeight {
	width: 1px !important
}

.fixed-table-body thead th.custmheight .th-inner {
	width: 120px;
}
</style>



</head>

<body>
<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="resources/img/logo/rounded_logo.png" alt="">
	</div>


	<div id="right-panel" class="right-panel" style="margin-top: 0px;">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12" id="paymentMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Payment List</strong>
								</div>
								<div class="col-4">
									<div class="addButton" style="float: right">
										<button type="button" class="btn btn-info btn-sm"
											data-toggle="modal" data-target="#PaymentAddModal"
											onclick="loadTenantAndOwner('${prptyid}')">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body" id="paymetAdmin">
							<table id="paymentDetails" class="text-center table-borderless"
								data-toggle="table" data-pagination="true" data-search="true"
								data-show-columns="true" data-show-pagination-switch="true"
								data-show-refresh="true" data-key-events="true"
								data-show-toggle="true" data-resizable="true" data-cookie="true"
								data-cookie-id-table="saveId" data-show-export="true"
								data-click-to-select="true" data-toolbar="#toolbar">
								<thead>
									<tr>
										<th>Receipt No</th>
										<th>Payee Name</th>
										<th>Unit No</th>
										<th>Payment Purpose</th>
										<th>Payment Date</th>
										<th>Month</th>
										<th>Total Amount</th>
										<th>Amount Paid</th>
										<th>Due Amount</th>
										<th class="custmheight">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pay" items="${paymentList}">
										<tr>
											<td>${pay.receiptNo}</td>
											<td>${pay.payeeName}</td>
											<td>${pay.unitNo}</td>
											<td>${pay.paymentPurpose}</td>
											<td>${pay.paymentDate}</td>
											<td>${pay.month}</td>
											<td>${pay.totalAmount}</td>
											<td>${pay.amountPaid}</td>
											<td>${pay.dueAmount}</td>
											<td><button type="button"
													class="btn btn-outline-info btn-sm custnBtn"
													data-toggle="modal" data-target="#paymentIdModal"
													onclick="viewPayment('${pay.paymentid}','${pay.receiptNo}','${pay.payeeName}','${pay.unitNo}','${pay.paymentPurpose}','${pay.paymentDate}','${pay.month}','${pay.year}',
										'${pay.totalAmount}','${pay.amountPaid}','${pay.dueAmount}','${pay.ownerid}','${pay.tenantid}','${prptyName}','${pay.payeeinfo}')">
													<i class="fa fa-eye"></i>
												</button> <!-- <button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-edit"></i></button> -->
												<!-- <button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o"></i></button></td> -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<!--Payment ID Modal popup start here-->


				<div class="modal fade" id="paymentIdModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Payment Info</h5>
								<button type="button" class="close" onclick="closeModal()"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body canvas_div_pdf" style="background-color: #fff!important">
								<div class="row">
									<div class="col-md-6">
										<div class="row pt-3">
											<div class="col col-md-6">
												<label class=" form-control-label" style="text-align: right">Receipt
													No:</label>
											</div>
											<div class="col col-md-6">
												<input type="hidden" id="v_paymentid" name="v_paymentid"
													placeholder="Ex:TNT0001" class="form-control">

												<p class="form-control-static"
													style="color: #f96332; font-weight: 600; font-size: 15px;"
													id='v_receiptNo'></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-md-6">
												<label class=" form-control-label" style="text-align: right">Bulding
													Name:</label>
											</div>
											<div class="col col-md-6">
												<p class="form-control-static"
													style="color: #f96332; font-weight: 600; font-size: 15px;"
													id='v_prtyname' ></p>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="paid-date">
											<div class="row pt-3">
												<div class="col col-md-3">
													<label class=" form-control-label"
														style="text-align: right">Paid Date:</label>
												</div>
												<div class="col col-md-6">
													<p class="form-control-static"
														style="color: #f96332; font-weight: 600; font-size: 16px;"
														id='v_paymentDate'></p>
												</div>
											</div>
										</div>

									</div>

								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="card">
											<div class="card-header" style="background-color: #fff!important">
												<strong>Payment Details</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Amount Paid:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_amountPaid'></p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Due Amount:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_dueAmount'></p>
													</div>
												</div>

												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Payment Period:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_Payperiod'></p>
													</div>
												</div>


												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Payment Purpose:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_paymentPurpose'></p>
													</div>
												</div>

											</div>
										</div>


									</div>
									<div class="col-md-6" >
										<div class="card">
											<div class="card-header" style="background-color: #fff!important">
												<strong>Payee Details</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Paid By:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_payeeName'></p>
													</div>
												</div>
											

												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Unit No:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_unitNo'></p>
													</div>
												</div>

												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Payee Mobile:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_payeeMobile'></p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label"
															style="text-align: right">Payee EMail:</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static" id='payeeEmail'></p>
													</div>
												</div>
												
											</div>

										</div>
									</div>

								</div>
							

							</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-info btn-sm"
								id="expenseIdEdit" onclick="getPDF()"><i class="fa fa-download"></i></button>
							<button type="reset" class="btn btn-info btn-sm">
								<i class="fa fa-envelope"></i>
							</button>
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>



			<!--Add Payment Modal popup start here-->


			<div class="modal fade" id="PaymentAddModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Payment
								Info</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col">
									<div class="payment-pillTab">
										<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
											<li class="nav-item"><a class="nav-link active"
												id="pills-payTenant-tab" data-toggle="pill"
												href="#pills-payTenant" role="tab"
												aria-controls="pills-home" aria-selected="true">For
													Tenant</a></li>
											<li class="nav-item"><a class="nav-link"
												id="pills-Owner-tab" data-toggle="pill" href="#pills-Owner"
												role="tab" aria-controls="pills-profile"
												aria-selected="false">For Owner</a></li>

										</ul>

										<div class="tab-content" id="pills-tabContent">

											<div class="tab-pane fade show active" id="pills-payTenant"
												role="tabpanel" aria-labelledby="pills-payTenant-tab">
												<form action='savePaymentTenant' method='POST'
													id='submitTenantform'>
													<div class="row" id="custm-row">
														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
															<div class="card">
																<div class="card-header">
																	<strong>Tenant Details</strong>
																</div>
																<div class="card-body card-block">
																	<div class="form-group">
																		<label for="company" class="form-control-label">Tenant
																			ID</label>
																		<div class="row">
																			<div class="col-md-12 col-sm-12">
																				<select id='tenantidSelect' class="form-control"
																					onchange="setTentantVal()">
																					<option value="">Select Tenant</option>
																				</select>
																				<!-- <input type="text" id="company" placeholder="Ex:TNT0001" class="form-control"> -->
																			</div>
																		
																			
																		</div>
												
																	</div>


																	<div class="form-group">
																		<label for="company" class=" form-control-label">Tenant
																			Name</label> <input type="text" id="tnt_name" name="tnt_name"
																			placeholder="Tenant Name" class="form-control">
																		<input type="hidden" id="tnt_id" name="tnt_id"
																			placeholder="Ex:TNT0001" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<select class="form-control" id="month_tnt"
																			name="month_tnt">
																		</select>
																		<!-- <input type="text" id="month_tnt" name="month_tnt" class="form-control"> -->
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Year</label>
																		<input type="text" id="year_tnt" name="year_tnt"
																			class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Unit
																			No</label> <input type="text" id="unitNo_tnt"
																			name="unitNo_tnt" placeholder="Unit No"
																			class="form-control" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$">
																	</div>
																


																</div>
															</div>



														</div>

														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
															<div class="card">
																<div class="card-header">
																	<strong>Payment Details</strong>
																</div>
																<div class="card-body card-block">
																	<div class="form-group">
																		<input type="hidden" class="form-control"
																			id="prptyid_t" name="prptyid" value='${prptyid}'>
																		<input type="hidden" class="form-control"
																			id="prptyName_t" name="prptyName"
																			value='${prptyName}'>

																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Cause
																			of Payment</label> <input type="text" id="paypurpose_T"
																			name="paypurpose_T" placeholder="Cause of payment" pattern="[a-zA-Z]"
																			class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Total
																			Amount</label> <input type="number" id="totamt_T"
																			name="totamt_T" placeholder="Amount paid"
																			class="form-control" maxlength="9" pattern="^[0-9]*$">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Amount
																			paid</label> <input type="number" id="amtpaid_T"
																			name="amtpaid_T" placeholder="Amount Payable"
																			class="form-control" maxlength="9" onchange="getDueAmountTenant()">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Due
																			Payment</label> <input type="number" id="dueamt_T"
																			name="dueamt_T" maxlength="9" placeholder="Due payment"
																			class="form-control">
																	</div>

																</div>
															</div>

														</div>

													</div>
												</form>


											</div>


											<div class="tab-pane fade" id="pills-Owner" role="tabpanel"
												aria-labelledby="pills-Owner-tab">
												<form action='savePaymentOwner' method='POST'
													id='submitOwnerform'>
													<div class="row" id="custm-row">
														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
															<div class="card">
																<div class="card-header">
																	<strong>Owner Details</strong>
																</div>
																<div class="card-body card-block">
																	<div class="form-group">
																		<label for="company" class="form-control-label">Asset
																			ID</label>
																		<div class="form-group row">
																			<div class="col-md-12 col-sm-12">
																				<select id='ownridSelect' name='ownridSelect'
																					onchange="setOwnerVal()" class="form-control">
																					<option value="">Select Owner</option>
																				</select>
																			</div>
														
																	</div>


																	<div class="form-group">
																		<label for="company" class=" form-control-label">Owner
																			Name</label> <input type="text" id="ownr_name"
																			name="ownr_name" placeholder="Owner Name"
																			class="form-control"> <input type="hidden"
																			id="owner_id" name="owner_id"
																			placeholder="Owner Name" class="form-control" pattern="[a-zA-Z]" >

																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Unit
																			No</label> <input type="text" id="unitNo_ownr"
																			name="unitNo_ownr" placeholder="Unit No"
																			class="form-control" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<select class="form-control" id="month_ownr"
																			name="month_ownr"></select>
																		<
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Year</label>
																		<input type="text" id="year_ownr" name="year_ownr"
																			class="form-control">
																	</div>

																</div>
															</div>



														</div>
</div>

														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
															<div class="card">
																<div class="card-header">
																	<strong>Payment Details</strong>
																</div>
																<div class="card-body card-block">
																	<div class="form-group">
																		<input type="hidden" class="form-control"
																			id="prptyid_o" name="prptyid" value='${prptyid}'>
																		<input type="hidden" class="form-control"
																			id="prptyName_o" name="prptyName"
																			value='${prptyName}'>
																		
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Cause
																			of Payment</label> <input type="text" id="paypurpose_o"
																			name="paypurpose_o" placeholder="Cause of payment"
																			class="form-control" pattern="/^[ A-Za-z0-9_@./#&+-]*$/">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">TotalAmount</label>
																		<input type="text" id="totAmnt_o" name="totAmnt_o"
																			placeholder="Amount paid" class="form-control" maxlength="9" required pattern="^[0-9]*$">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Amount
																			Paid</label> <input type="text" id="amtpaid_o"
																			name="amtpaid_o" placeholder="Amount Payable"
																			class="form-control" maxlength="9" required pattern="^[0-9]*$" onchange="getDueAmountOwner()">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Due
																			Payment</label> <input type="text" id="dueamt_o"
																			name="dueamt_o" placeholder="Due payment"
																			class="form-control" maxlength="9" required pattern="^[0-9]*$">
																	</div>
																</div>
															</div>

														</div>

													</div>

												</form>
											</div>


										</div>


									</div>


								</div>

							</div>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-info btn-sm"
								onclick='submitPayment()'>Save</button>
							<button type="button" class="btn btn-secondary btn-sm"
								onclick="closeModal()">Close</button>
						</div>
					</div>
				</div>
			</div>
</div>
</div>
<div class="clearfix"></div>



	<!-- .animated -->

	<!-- /.content -->
	<div class="clearfix"></div>
	

	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>



	<script>
		function loadMonthYear() {
			var dt = new Date();
			var cur_month = dt.getMonth();
			var prev_month = 0;
			if (cur_month != 0) {
				prev_month = cur_month - 1;
			}
			var cur_year = dt.getFullYear();

			var mlist = [ "Select Month", "January", "February", "March",
					"April", "May", "June", "July", "August", "September",
					"October", "November", "December" ];
			for (var i = 0; i < mlist.length; i++) {
				$('#month_tnt').append(
						$('<option/>').attr("value", mlist[i]).text(mlist[i]));
				$('#month_ownr').append(
						$('<option/>').attr("value", mlist[i]).text(mlist[i]));
				/* $('#ed_month').append(
						$('<option/>').attr("value", mlist[i]).text(mlist[i])); */
			}
			//$('#month_indv').val(mlist);
			$('#year_tnt').val(cur_year);
			$('#year_ownr').val(cur_year);

		}
		window.onload = loadMonthYear;
		function viewPayment(paymentid, receiptNo, payeeName, unitNo,
				paymentPurpose, paymentDate, month, year, totalAmount,
				amountPaid, dueAmount, ownerid, tenantid, prtyname,payeinfo) {
			$('#v_paymentid').val(paymentid);
			$('#v_receiptNo').text(receiptNo);
			$('#v_payeeName').text(payeeName);
			$('#v_unitNo').text(unitNo);
			$('#v_paymentPurpose').text(paymentPurpose);
			$('#v_paymentDate').text(paymentDate);
			$('#v_Payperiod').text(month + "-" + year);
			$('#v_prtyname').text(prtyname);

			$('#v_amountPaid').text(amountPaid);
			$('#v_dueAmount').text(dueAmount);
			
			if (ownerid != 0) {
				$('#v_PayeeId').text('Ownr' + ownerid);
			}
			if (tenantid != 0) {
				$('#v_PayeeId').text('Tnt' + tenantid);
			}
			var payeearr=payeinfo.split('_');

			$('#v_payeeMobile').text(payeearr[0]);
			$('#payeeEmail').text(payeearr[1]);

		}

		function downloadReceipt() {
			var paymentid = $('#v_paymentid').val();
			//window.location.href="/download/paymentid.html";

			/* <a href="${pageContext.request.contextPath}/download/${candidate.candidateInfo.candidateid}.html"><i class="fa fa-download"></i></a> */

		}

		//function getTenantList(prtyid){
		function loadTenantAndOwner(prtyid) {
			$.ajax({
				type : "post",
				url : "getTenantsbByProprtyId?prtyid=" + prtyid + "",
				cache : false,
				async : false,
				success : function(response) {
				
					for (var i = 0; i < response.length; i++) {
					var tntName= response[i].tenantname;
					tntName=tntName.replace(/ /g,'-');
					
					
						var tntVal = response[i].flat + "_"+ response[i].tenantid
						+ "_"	+ tntName;
								
					
						var flattext =  response[i].flat;
						

						$('#tenantidSelect').append(
								'<option value=' + tntVal + '>' + flattext
										+ '</option>');

						
					}

				},
				error : function() {
				}
			});

			
			$.ajax({
				type : "post",
				url : "getOnwerbByProprtyId?prtyid=" + prtyid + "",
				cache : false,
				async : false,
				success : function(response) {
					
					for (var i = 0; i < response.length; i++) {
						var ownerName= response[i].ownername;
						
						ownerName=ownerName.replace(/ /g,'-');
						
						var ownrVal = response[i].flat + "_"
						+ response[i].ownerid+ "_"+ownerName;
						
						
						var flattext =  response[i].flat;
						
						$('#ownridSelect').append(
								'<option value=' + ownrVal + '>' + flattext
										+ '</option>');

					}

				},
				error : function() {
				}
			});

		}

		function setOwnerVal() {
			var ownerval = $('#ownridSelect').val();
						var arr = ownerval.split("_");
			
			$('#unitNo_ownr').val(arr[0]);
			var ownerName=arr[2];
			ownerName=ownerName.replace(/-/g, " ");
			$('#ownr_name').val(ownerName);
			$('#owner_id').val(arr[1]);
			

		}
		function setTentantVal() {
			var tntval = $('#tenantidSelect').val();
			
			var arr = tntval.split("_");
			var tntname=arr[2];
			tntname=tntname.replace(/-/g, " ");
			$('#unitNo_tnt').val(arr[0]);
			$('#tnt_name').val(tntname);
			$('#tnt_id').val(arr[1]);
			

		}

		function submitPayment() {
			var tntname = $('#tnt_name').val();
			
			if (tntname == '') {
			
				$('#submitOwnerform').submit();
			} else {

				
				$('#submitTenantform').submit();
			}

		}

		function getDueAmountTenant() {
			var totalAmt = $('#totamt_T').val();
			var amtPaid = $('#amtpaid_T').val();
			var tVal = parseFloat(totalAmt);
			tVal=tVal.toFixed(2);
			var aVal = parseFloat(amtPaid);
			aVal=aVal.toFixed(2);
			var dueAmount = tVal - aVal;
			$('#dueamt_T').val(dueAmount);
		}
		function getDueAmountOwner() {
			var totalAmt = $('#totAmnt_o').val();
			var amtPaid = $('#amtpaid_o').val();
			var tVal = parseFloat(totalAmt);
			var aVal = parseFloat(amtPaid);
			aVal=aVal.toFixed(2);
			var dueAmount = tVal - aVal;
			$('#dueamt_o').val(dueAmount);
		}
function closeModal(){
			
			location.reload();
			}
function getPDF(){
	 var pdfname=$('#v_receiptNo').text();
	
	var HTML_Width = $(".canvas_div_pdf").width();
	var HTML_Height = $(".canvas_div_pdf").height();
	var top_left_margin = 15;
	var PDF_Width = HTML_Width+(top_left_margin*4);
	var PDF_Height = (PDF_Width*1.5)+(top_left_margin*2);
	var canvas_image_width = HTML_Width;
	var canvas_image_height = HTML_Height;
	
	var totalPDFPages = Math.ceil(HTML_Height/PDF_Height)-1;
	

	html2canvas($(".canvas_div_pdf")[0],{allowTaint:true}).then(function(canvas) {
		canvas.getContext('2d');
		
		console.log(canvas.height+"  "+canvas.width);
		
		
		var imgData = canvas.toDataURL("image/jpeg", 1.0);
		var pdf = new jsPDF('p', 'pt',  [PDF_Width, PDF_Height]);
	    pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin,canvas_image_width,canvas_image_height);
		
		
		for (var i = 1; i <= totalPDFPages; i++) { 
			pdf.addPage(PDF_Width, PDF_Height);
			pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
		}
		
	    pdf.save(pdfname+".pdf");
    });
};
	</script>
</body>

</html>