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

			box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
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
		
		#custmHeight{
			width: 1px!important
		}
		.fixed-table-body thead th.custmheight .th-inner {
			width: 120px;
		}
	</style>
</head>

<body>
	

	
	
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
										<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#PaymentAddModal" onclick="loadTenantAndOwner('${prptyid}')"><i class="fa fa-plus"></i></button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body" id="paymetAdmin">
							<table id="paymentDetails" class="text-center table-borderless" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
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
										<td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#paymentIdModal" 
										onclick="viewPayment('${pay.paymentid}','${pay.receiptNo}','${pay.payeeName}','${pay.unitNo}','${pay.paymentPurpose}','${pay.paymentDate}','${pay.month}','${pay.year}',
										'${pay.totalAmount}','${pay.amountPaid}','${pay.dueAmount}','${pay.ownerid}','${pay.tenantid}','${prptyName}')"><i class="fa fa-eye"></i></button>
											<!-- <button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-edit"></i></button> -->
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


		<div class="modal fade" id="paymentIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Payment Info</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-6">
										<div class="row pt-3">
											<div class="col col-md-3">
												<label class=" form-control-label" style="text-align: right">Receipt No:</label></div>
											<div class="col col-md-6">
											<input type="hidden" id="v_paymentid"  name="v_paymentid"  placeholder="Ex:TNT0001" class="form-control">
											
												<p class="form-control-static" style="color: #f96332;font-weight: 600;font-size: 15px;" id='v_receiptNo'></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-md-3">
												<label class=" form-control-label" style="text-align: right">Bulding Name:</label></div>
											<div class="col col-md-6">
												<p class="form-control-static" style="color: #f96332;font-weight: 600;font-size: 15px;" id='v_prtyname'></p>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										                                   <div class="paid-date" style="float: right">
										<div class="row pt-3">
											<div class="col col-md-3">
												<label class=" form-control-label" style="text-align: right">Paid Date:</label></div>
											<div class="col col-md-6">
												<p class="form-control-static" style="color: #f96332;font-weight: 600;font-size: 16px;" id='v_paymentDate'></p>
											</div>
											                                   </div>
										</div>

									</div>

								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="card">
											<div class="card-header"><strong>Payment Details</strong></div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Amount Paid:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_amountPaid'></p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Due Amount:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static"id='v_dueAmount'></p>
													</div>
												</div>

												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Payment Period:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static"id='v_Payperiod'></p>
													</div>
												</div>


												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Payment Purpose:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_paymentPurpose'></p>
													</div>
												</div>

											</div>
										</div>


									</div>
									<div class="col-md-4">
										<div class="card">
											<div class="card-header"><strong>Payee Details</strong></div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Paid By:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_payeeName'></p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Payee Id:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_PayeeId'></p>
													</div>
												</div>

												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Unit No:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_unitNo'></p>
													</div>
												</div>

												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Payee Mobile:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static" id='v_payeeMobile'></p>
													</div>
												</div>


												

												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label" style="text-align: right">Payee EMail:</label></div>
													<div class="col col-md-6">
														<p class="form-control-static" id='payeeEmail'></p>
													</div>
												</div>
												<div class="row">
													
														<i class="fa fa-envelope"></i>&nbsp;maaproperties123@gmail.com</p>
													</div>
												</div>

											</div>
										</div>

									</div>
									<!-- <div class="col-md-4">
										<div class="card">
											<div class="card-header"><strong>Payment Address</strong></div>
											<div class="card-body card-block">
												<div class="row">

													<div class="col-12 col-md-12">
														<p class="form-control-static" id='payeeAddress'><i class="fa fa-home"></i></p>
														<p class="form-control-static">
															<i class="fa fa-phone"></i>&nbsp;8099244422<br>
															<i class="fa fa-envelope"></i>&nbsp;maaproperties123@gmail.com</p>
													</div>



												</div>


											</div>
										</div>

									</div> -->

								</div>
							</div>
							<div class="modal-footer">
 
					
								<button type="button" class="btn btn-info btn-sm" id="expenseIdEdit" onclick="downloadReceipt()">
									
								</button>
								<button type="reset" class="btn btn-info btn-sm">
									<i class="fa fa-envelope"></i>
								</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div> 



				<!--Add Payment Modal popup start here-->


				<div class="modal fade" id="PaymentAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Payment Info</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<div class="payment-pillTab">
											<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
												<li class="nav-item">
													<a class="nav-link active" id="pills-payTenant-tab" data-toggle="pill" href="#pills-payTenant" role="tab" aria-controls="pills-home" aria-selected="true">For Tenant</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" id="pills-Owner-tab" data-toggle="pill" href="#pills-Owner" role="tab" aria-controls="pills-profile" aria-selected="false">For Owner</a>
												</li>

											</ul>
											
											<div class="tab-content" id="pills-tabContent">
											<form action='savePaymentTenant' method='POST' id='submitTenantform'>
												<div class="tab-pane fade show active" id="pills-payTenant" role="tabpanel" aria-labelledby="pills-payTenant-tab">
													<div class="row" id="custm-row">
														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">


															<div class="card">
																<div class="card-header"><strong>Tenant Details</strong></div>
																<div class="card-body card-block">
																	<div class="form-group">
																		<label for="company" class="form-control-label">Tenant ID</label>
																		<div class="row">
																			<div class="col-9">
																			<select id='tenantidSelect' class="form-control" onchange="setTentantVal()">
																			<option value="">Select Tenant</option>
																			</select>
																				<!-- <input type="text" id="company" placeholder="Ex:TNT0001" class="form-control"> -->
																			</div>
																			<%-- <div class="col-2">
																				<button type="button" class="btn btn-info mb-1" data-toggle="modal" data-target="#payModalPopup" onclick="getTenantList('${prptyid}')">
																					<i class="fa fa-search"></i>
																				</button>
																			</div> --%>
																			<div class="col"></div>
																		</div>
																		<%-- <div class="modal fade" id="payModalPopup" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
																			<div class="modal-dialog modal-md" role="document">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h5 class="modal-title" id="largeModalLabel">Tenant List</h5>
																						
                         
																					</div>
																					<div class="modal-body">

																						<table id="tntPayDetails" class="text-center" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
																							<thead>
																								<tr>
																									<th></th>
																									<!-- <th>Tenant ID</th> -->
																									<th>Tenant Name</th>
																									<th>Unit No</th>
																									<!-- <th>Tenant Owner</th> -->

																								</tr>
																							</thead>
																							<tbody id="tenantBody">
																								<!--<tr>
																									 <td></td>
																									<td>TNT0001</a></td>
																									<td>Vikram</td>
																									<td>101</td>
																									<td>Ramesh</td>

																								</tr> -->


																							</tbody>
																						</table>
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-info btn-sm" onclick="appendFlatno_TNT('${prptyid}')">OK</button>
																						<!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>-->
																					</div>
																				</div>
																			</div>
																		</div>
													 --%>				</div>


																	<div class="form-group">
																		<label for="company" class=" form-control-label">Tenant Name</label>
																		<input type="text" id="tnt_name" name="tnt_name" placeholder="Tenant Name" class="form-control">
																	<input type="hidden" id="tnt_id" name="tnt_id" placeholder="Ex:TNT0001" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<input type="text" id="month_tnt" name="month_tnt" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Year</label>
																		<input type="text" id="year_tnt" name="year_tnt" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Unit No</label>
																		<input type="text" id="unitNo_tnt" name="unitNo_tnt" placeholder="Unit No" class="form-control">
																	</div>
																	<!-- <div class="form-group">
																		<label for="company" class=" form-control-label">Owner Name</label>
																		<input type="text" id="company" placeholder="Owner Name" class="form-control">
																	</div> -->


																</div>
															</div>



														</div>

														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
															<div class="card">
																<div class="card-header"><strong>Payment Details</strong></div>
																<div class="card-body card-block">
																	<div class="form-group">
																	<input type="hidden" class="form-control" id="prptyid_t" name="prptyid" value='${prptyid}'>
																		<input type="hidden" class="form-control" id="prptyName_t" name="prptyName" value='${prptyName}'>
																	
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Cause of Payment</label>
																		<input type="text" id="paypurpose_T" name="paypurpose_T"  placeholder="Cause of payment" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Toal Amount</label>
																		<input type="text" id="totamt_T" name ="totamt_T" placeholder="Amount paid" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Amount paid</label>
																		<input type="text" id="amtpaid_T"  name="amtpaid_T" placeholder="Amount Payable" class="form-control" onchange="getDueAmountTenant()">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Due Payment</label>
																		<input type="text" id="dueamt_T"name="dueamt_T" placeholder="Due payment" class="form-control">
																	</div>
																
																</div>
															</div>

														</div>

													</div>


												</div>
												</form>
												<form action='savePaymentOwner' method='POST' id='submitOwnerform'>
												<div class="tab-pane fade" id="pills-Owner" role="tabpanel" aria-labelledby="pills-Owner-tab">
													<div class="row" id="custm-row">
														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
															<div class="card">
																<div class="card-header"><strong>Owner Details</strong></div>
																<div class="card-body card-block">
																	<div class="form-group">
																		<label for="company" class="form-control-label">Asset ID</label>
																		<div class="row">
																			<div class="col-9">
																				<select id='ownridSelect' name='ownridSelect' onchange="setOwnerVal()" class="form-control">
																				<option value="">Select Owner</option>
																			</select>
																			</div>
																			<%-- <div class="col-2">
																				<button type="button" class="btn btn-info mb-1" data-toggle="modal" data-target="#payOwnerModalPopup" onclick="getOwnerList('${prptyid}')">
																					<i class="fa fa-search"></i>
																				</button>
																			</div> --%>
																			<div class="col"></div>
																		</div>
																		<!-- <div class="modal fade" id="payOwnerModalPopup" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
																			<div class="modal-dialog modal-md" role="document">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h5 class="modal-title" id="largeModalLabel">Asset List</h5>
																						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
																					</div>
																					<div class="modal-body">
																						<div class="table-responsive">

																							<table id="ownerPayDetails" class="text-center" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
																								<thead>
																									<tr>
																										<th ></th>
																										<th>Asset ID</th>
																										<th>Owner Name</th>
																										<th>Unit No</th>


																									</tr>
																								</thead>
																								<tbody id="ownerBody">
																									

																								</tbody>
																							</table>
																						</div>
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-info btn-sm">OK</button>
																						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
																					</div>
																				</div>
																			</div>
																		</div>
											 -->						</div>


																	<div class="form-group">
																		<label for="company" class=" form-control-label">Owner Name</label>
																		<input type="text" id="ownr_name" name="ownr_name"placeholder="Owner Name" class="form-control">
																		<input type="hidden" id="owner_id" name="owner_id" placeholder="Owner Name" class="form-control">
																	
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Unit No</label>
																		<input type="text" id="unitNo_ownr" name="unitNo_ownr" placeholder="Unit No" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<input type="text" id="month_ownr" name="month_ownr" placeholder="From Date" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Year</label>
																		<input type="text" id="year_ownr" name="year_ownr"class="form-control">
																	</div>

																</div>
															</div>



														</div>
														
														<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
															<div class="card">
																<div class="card-header"><strong>Payment Details</strong></div>
																<div class="card-body card-block">
																	<div class="form-group">
																	<input type="hidden" class="form-control" id="prptyid_o" name="prptyid" value='${prptyid}'>
																		<input type="hidden" class="form-control" id="prptyName_o" name="prptyName" value='${prptyName}'>
																		<!-- <label for="company" class=" form-control-label">Receipt No</label>
																		<input type="text" id="company" value="19021900081" class="form-control"> -->
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Cause of Payment</label>
																		<input type="text" id="paypurpose_o" name="paypurpose_o" placeholder="Cause of payment" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">TotalAmount</label>
																		<input type="text" id="totAmnt_o" name ="totAmnt_o" placeholder="Amount paid" class="form-control">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Amount Paid</label>
																		<input type="text" id="amtpaid_o" name="amtpaid_o" placeholder="Amount Payable" class="form-control" onchange="getDueAmountOwner()">
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Due Payment</label>
																		<input type="text" id="dueamt_o" name="dueamt_o" placeholder="Due payment" class="form-control">
																	</div>
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
							<div class="modal-footer">
								
								<button type="button" class="btn btn-info btn-sm" onclick='submitPayment()'>Save </button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				
				

				
			


			</div>



		


	
	<!--              Payment Id details ends here-->





	<div class="clearfix"></div>



	<!-- .animated -->

	<!-- /.content -->
	<div class="clearfix"></div>
	<!-- Footer -->
	<!-- <footer class="site-footer">
		<div class="footer-inner bg-white">
			<div class="row">
				<div class="col-sm-6">
					Copyright &copy; 2019 @Maa Properties 
				</div>
			</div>
		</div>
	</footer> -->
	<!-- /.site-footer -->


	<!-- /#right-panel -->
	<!-- Scripts -->


	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	



<script>
function viewPayment(paymentid,receiptNo,payeeName,unitNo,paymentPurpose,paymentDate,month,year,totalAmount,amountPaid,dueAmount,ownerid,tenantid,prtyname){
$('#v_paymentid').val(paymentid);
$('#v_receiptNo').text(receiptNo);
$('#v_payeeName').text(payeeName);
$('#v_unitNo').text(unitNo);
$('#v_paymentPurpose').text(paymentPurpose);
$('#v_paymentDate').text(paymentDate);
$('#v_Payperiod').text(month+"-"+year);
$('#v_prtyname').text(prtyname);

$('#v_amountPaid').text(amountPaid);
$('#v_dueAmount').text(dueAmount);
if(ownerid!=0){
$('#v_PayeeId').text('Ownr'+ownerid);
}
if(tenantid!=0)
	{$('#v_PayeeId').text('Tnt'+tenantid);}



$('#v_payeeMobile').text('NA');
$('#payeeEmail').text('NA');

}

function downloadReceipt(){
	var paymentid=$('#v_paymentid').val();
	//window.location.href="/download/paymentid.html";

										
/* <a href="${pageContext.request.contextPath}/download/${candidate.candidateInfo.candidateid}.html"><i class="fa fa-download"></i></a> */

}

//function getTenantList(prtyid){
	function loadTenantAndOwner(prtyid){
$.ajax({
     type: "post",
     url: "getTenantsbByProprtyId?prtyid="+prtyid+"",
     cache: false,
     async: false,               
     success: function(response){
   
      for(var i=0;i<response.length;i++){
          
    	var tntVal=response[i].flat+"_"+response[i].tenantname+"_"+response[i].tenantid;
    	var flattext='AST'+response[i].flat;
	     /*  var tr="<tr><td><input type='radio' id='IchkBox"+response[i].flat+"' name='IchkBox' required></td>"+
	      " <td id='ITenantId"+response[i].flat+"'><input type='hidden' id='ITenantIdTxt"+response[i].flat+"' name='ITenantId' value='"+response[i].tenantid+"'>TNT"+response[i].tenantid+"</td>"+ 
	      "<td id='ITenantName"+response[i].flat+"'><input type='hidden' id='ITenantNameTxt"+response[i].flat+"' name='ITenantName' value='"+response[i].tenantname+"'>"+response[i].tenantname+"</td>"+
	      "<td id='IFlatNo"+response[i].flat+"'><input type='hidden' id='IFlatNoTxt"+response[i].flat+"' name='IFlatNo' value='"+response[i].flat+"'>"+response[i].flat+"</td></tr>";
 */

	     /*  var o = new Option(response[i].tenantname, tntVal);
	   
	    $(o).html(response[i].tenantname); */
	    
		$('#tenantidSelect').append('<option value=' + tntVal + '>' + flattext + '</option>');	
		    
	     // $('#').append(o);
				
	      
		
    	 
			//$('#tenantBody').append(tr);
	      }
  
       
     },
     error: function(){                                                                                 
     }                                                       
 });    

//}		
//function getOwnerList(prtyid){
$('#ownridSelect').empty(); 
	$.ajax({
	     type: "post",
	     url: "getOnwerbByProprtyId?prtyid="+prtyid+"",
	     cache: false,
	     async: false,               
	     success: function(response){
	      //alert(response.length);
	      for(var i=0;i<response.length;i++){
	    		var ownrVal=response[i].flat+"_"+response[i].ownername+"_"+response[i].ownerid;
	    		var flattext='AST'+response[i].flat;
		      /* var tr="<tr><td><input type='radio' id='IchkBoxownr"+response[i].ownerid+"' name='IchkBox' required></td>"+
		      "<td id='IownrId"+response[i].flat+"'><input type='hidden' id='IownrIdTxt"+response[i].flat+"' name='IownrIdTxt' value='"+response[i].ownerid+"'>OWNR"+response[i].ownerid+"</td>"+ 
		      "<td id='IownrName"+response[i].flat+"'><input type='hidden' id='IownrNameTxt"+response[i].flat+"' name='IownrNameTxt' value='"+response[i].ownername+"'>"+response[i].ownername+"</td>"+
		      "<td id='IFlatNoownr"+response[i].flat+"'><input type='hidden' id='IFlatNoownrTxt"+response[i].flat+"' name='IFlatNoownrTxt' value='"+response[i].flat+"'>"+response[i].flat+"</td> </tr>"; */
		    
		    
		  	$('#ownridSelect').append('<option value=' + ownrVal + '>' + flattext + '</option>');	
		     /*  var o = new Option(response[i].ownername, ownrVal);
			   
			    $(o).html(response[i].ownername); */
			    //$("#ownridSelect").append(o);
			
		
	    	 
				//$('#ownerBody').append(tr);
		      }
	  
	       
	     },
	     error: function(){                                                                                 
	     }                                                       
	 });    

	}				

function setOwnerVal() {
	var ownerval=$('#ownridSelect').val();
	
		var arr=ownerval.split("_");
		
		$('#unitNo_ownr').val(arr[0]);
		$('#ownr_name').val(arr[1]);
		$('#owner_id').val(arr[2]);
		//$('#ast_occ_by').val(arr[2]);
		/* $('#ownerid_inv').val(ownerid);
		$('#tenenatid_inv').val(tenantid); */
		
	
		
	}
function setTentantVal() {
	var tntval=$('#tenantidSelect').val();
	//alert(tntval);
		var arr=tntval.split("_");
	//	alert(arr);
		$('#unitNo_tnt').val(arr[0]);
		$('#tnt_name').val(arr[1]);
		$('#tnt_id').val(arr[2]);
		//$('#ast_occ_by').val(arr[2]);
		/* $('#ownerid_inv').val(ownerid);
		$('#tenenatid_inv').val(tenantid); */
		
	
		
	}

function submitPayment(){
var tntname=$('#tnt_name').val();

if(tntname==''){
	
	$('#submitOwnerform').submit();
}
else{


	$('#submitTenantform').submit();
}
	
	}


	
function getDueAmountTenant(){
	var totalAmt=$('#totamt_T').val();
	var amtPaid=$('#amtpaid_T').val();
	var tVal=parseFloat(totalAmt);
	var aVal=parseFloat(amtPaid);
	var dueAmount=tVal-aVal;
	$('#dueamt_T').val(dueAmount);
}
function getDueAmountOwner(){
	var totalAmt=$('#totAmnt_o').val();
	var amtPaid=$('#amtpaid_o').val();
	var tVal=parseFloat(totalAmt);
	var aVal=parseFloat(amtPaid);
	var dueAmount=tVal-aVal;
	$('#dueamt_o').val(dueAmount);
}

</script>
</body>

</html>