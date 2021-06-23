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

<link rel="stylesheet" href="resources/css/style.css">
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
table#invoiceInnerAsset tr th:nth-child(3)  { display: none; }
table#invoiceInnerAsset tr th:nth-child(4)  { display: none; }
table#invoiceInnerAsset tr th:nth-child(5)  { display: none; }

table#invoiceInnerAsset tr td:nth-child(3)  { display: none; }
table#invoiceInnerAsset tr td:nth-child(4)  { display: none; }
table#invoiceInnerAsset tr td:nth-child(5)  { display: none; }

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

#pills-address {
	/*            border: 1px solid rgb(168, 168, 168);*/
	margin-top: 1%;
	margin-left: 3%;
	margin-right: 3%;
	margin-bottom: 2%;
}

#pills-tab {
	margin-left: 3%;
	margin-right: 3%;
	box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0
		rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
}

.nav-pills .nav-link.active {
	background-color: #3AAFE8 !important;
	color: #fff !important;
}

.nav-pills li a {
	color: #274552;
	font-size: 13px;
	text-align: center;
	text-transform: uppercase;
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

#meterCard .card-title {
	font-size: 13px;
}

#meterCard {
	margin-bottom: 0.875em !important;
}

#readingCard {
	margin-bottom: 0px !important;
}

#readingCard .custmNavRead {
	padding: 0px;
}

#readingCard #pills-tab {
	margin-left: 0%;
	margin-right: 0%;
}

#readingCard .nav-pills .nav-item {
	width: 50%;
}

.totalData {
	font-weight: 600
}

#invoiceDetails button {
	font-size: 11px;
}

#invoiceDetails span {
	font-size: 15px;
	font-size: 17px;
	padding-left: 4px;
	padding-right: 4px;
}

#invoiceDetails button i {
	font-size: 17px;
	color: #000;
}

#invoiceDetails button i:hover {
	color: #fff;
}

#invoiceDetails button.custnBtn {
	border-color: transparent;
}

.paybtn {
	width: 68%;
}

#invoiceEditDetails button {
	font-size: 13px;
}

#invoiceAddDetails button {
	font-size: 13px;
}

#editInvoiceModal .form-control {
	font-size: 13px !important;
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
				<div class="col-md-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Invoice</strong>
								</div>
								<c:if test='${roleid==2||roleid==1}'>
									<div class="col-4">
										<div class="addButton" id="invoicePlusAdd"
											style="float: right">
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="modal" data-target="#invoiceAddModal">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</c:if>
							</div>

						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="invoiceDetails" class="text-center table-borderless"
									data-toggle="table" data-pagination="true" data-search="true"
									data-show-columns="true" data-show-pagination-switch="true"
									data-show-refresh="true" data-key-events="true"
									data-show-toggle="true" data-resizable="true"
									data-cookie="true" data-cookie-id-table="saveId"
									data-show-export="true" data-click-to-select="true"
									data-toolbar="#toolbar">
									<thead>
										<tr>
											<th>Invoice ID</th>
											<th>Name</th>
											<th>Unit No</th>
											<th>Invoice Amount</th>
											<th>Amount Paid</th>
											<th>Open Balance</th>
											<th>Payment</th>
											<th class="custmheightInv">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="inv" items="${invoiceList}">
											<tr>
												<td>INVC${inv.invid}</td>
												<td>${inv.paidby}</td>
												<td>${inv.unitno}</td>
												<td>${inv.invoiceAmount}</td>

												<c:choose>
													<c:when
														test="${empty inv.amountpaid  && empty inv.dueAmount }">
														<td>0</td>
														<td>${inv.invoiceAmount}</td>
														<td><button type="button" class="btn btn-info btn-sm"
																data-toggle="modal" data-target="#invoicePaymentModal"
																onclick="payInvoice('${inv.invid}','${inv.unitno}','${inv.month}','${inv.year}','${inv.invoiceAmount}','${inv.amountpaid}','${inv.dueAmount}','${inv.paidby}','${inv.ownerid}','${inv.tenantid}')">Pay</button></td>
													</c:when>

													<c:when test="${inv.invoiceAmount==inv.amountpaid}">

														<td>${inv.amountpaid}</td>
														<td>${inv.dueAmount}</td>
														<td><button type="button" class="btn btn-info btn-sm">Paid</button></td>
													</c:when>
													<c:otherwise>
														<td>${inv.amountpaid}</td>
														<td>${inv.dueAmount}</td>
														<td><button type="button" class="btn btn-info btn-sm"
																data-toggle="modal" data-target="#invoicePaymentModal"
																onclick="payInvoice('${inv.invid}','${inv.unitno}','${inv.month}','${inv.year}','${inv.dueAmount}','${inv.amountpaid}','${inv.dueAmount}','${inv.paidby}','${inv.ownerid}','${inv.tenantid}')">Partial
																Paid</button></td>
													</c:otherwise>
												</c:choose>

												<td><button type="button"
														class="btn btn-outline-info btn-sm custnBtn"
														data-toggle="modal" data-target="#viewInvoiceModal"
														onclick="viewInvoice('${inv.invid}')">
														<i class="fa fa-eye"></i>
													</button>
													<button type="button"
														class="btn btn-outline-info btn-sm custnBtn"
														data-toggle="modal" data-target="#editInvoiceModal"
														onclick="editInvoice('${inv.invid}')">
														<i class="fa fa-edit"></i>
													</button>
													<button type="button"
														class="btn btn-outline-info btn-sm custnBtn">
														<i class="fa fa-envelope-o"></i>
													</button> <%-- <button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o" onclick="deleteInvoice('${inv.invid}')"></i></button> --%>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>

			</div>

		</div>

		<!--Invoice add Details start here-->

		<div class="modal fade" id="invoiceAddModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Add Invoice</h5>
						<button type="button" class="close" onclick="closeModal()"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form>
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
									<div class="card" id="meterCard">
										<div class="card-header">
											<strong class="card-title">Asset Details</strong>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="company" class=" form-control-label">Month</label>
												<div class="input-group">
													<!-- <input  class="form-control" id="month_indv" > -->
													<select class="form-control" id="month_indv"
														name="month_indv" onchange="closeInvoiceDiv()">
													</select>

												</div>
											</div>
											<div class="form-group">
												<label for="company" class=" form-control-label">Year</label>
												<div class="input-group">
													<input type="text" class="form-control" id="year_indv"
														name="year_indv"> <input type="hidden"
														class="form-control" id="prptyid" name="prptyid"
														value="${prptyid}">
														<input type="hidden"
														class="form-control" id="prptyName_inv" name="prptyName_inv"
														value="${prptyName}">
												</div>
											</div>
											<div class="form-group">
												<label for="company" class="form-control-label">Unit
													No</label>
												<div class="row">
													<div class="col-9">
														<input type="text" id="unitNo" name="unitNo"
															placeholder="Ex:Unit" class="form-control"> <input
															type="hidden" id="meterredingsByasset"
															name="meterredingsByasset" class="form-control">
														<input type="hidden" id="rentResponse" name="rentResponse"
															class="form-control"> <input type="hidden"
															id="gstResponse" name="gstResponse" class="form-control">

														<input type="hidden" id="ownerid_inv" name="ownerid_inv"
															class="form-control"> <input type="hidden"
															id="tenenatid_inv" name="tenenatid_inv"
															class="form-control"> <input type="hidden"
															id="ast_occ_by" name="ast_occ_by" placeholder="Ex:Unit"
															class="form-control">
													</div>
													<div class="col-2">
														<button type="button" class="btn btn-info mb-1"
															data-toggle="modal" data-target="#meterAddIndModal">
															<i class="fa fa-search"></i>
														</button>
													</div>
													<div class="col"></div>
												</div>
												<div class="modal fade" id="meterAddIndModal" tabindex="-1"
													role="dialog" aria-labelledby="largeModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="largeModalLabel">Asset
																	List</h5>

															</div>
															<div class="modal-body">
																<table id="invoiceInnerAsset" class="text-center"
																	data-toggle="table" data-pagination="true"
																	data-search="true" data-show-columns="true"
																	data-show-pagination-switch="true"
																	data-show-refresh="true" data-key-events="true"
																	data-show-toggle="true" data-resizable="true"
																	data-cookie="true" data-cookie-id-table="saveId"
																	data-show-export="true" data-click-to-select="true"
																	data-toolbar="#toolbar">
																	<thead>
																		<tr>
																			<th></th>
																			<th>Property Name</th>
																			<th>OccBy</th>
																			<th>ownerB</th>
																			<th>tentB</th>
																			<th>Unit No</th>

																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach var="asset" items="${assetListInvoice}">
																			<tr>
																				<td><input type="radio" id="chkBox"
																					name="chkBox"></td>

																				<td>${prptyName}</td>
																				<td ><span >${asset.occ_by}</span></td>
																			 <td ><p>${asset.ownerid}</p></td>
																				<td ><h5>${asset.tenantId}</h5></td> 
																				<td><input type="hidden" id="flatnoNew"
																					name="flatno" value="${asset.flatno}">${asset.flatno}</td>


																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-info btn-sm"
																	onclick="appendFlatno('${prptyid}')">OK</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group row">
												<label for="company" class="form-control-label col-12">Choose
													Unit Bills</label>
												<div class="col-12">
													<div class="row pt-3">
														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled"
																id="inlineCheckboxAll" value="option1"> <label
																for="inlineCheckboxAll"> All &nbsp;</label>
														</div>
														<div class="checkbox checkbox checkbox-inline">
															<input type="checkbox" class="styled"
																id="inlineCheckMain" value="option1"> <label
																for="inlineCheckMain"> Maintaince </label>
														</div>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled"
																id="inlineCheckRent" value="option1"> <label
																for="inlineCheckRent"> Rent </label>
														</div>

													</div>
												</div>
											</div>
											<div class="form-group row">
												<label for="company" class="form-control-label col-12">Choose
													Meter Readings</label>
												<div class="col-12">
													<div class="row pt-3">
														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled" id="invoiceAllRead"
																value="option1"> <label for="invoiceAllRead">
																All &nbsp;</label>
														</div>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled" id="invoiceWater"
																value="option1"> <label for="invoiceWater">
																Water </label>
														</div>
														<div class="checkbox checkbox checkbox-inline">
															<input type="checkbox" class="styled" id="invoiceCurrent"
																value="option1"> <label for="invoiceCurrent">
																Current </label>
														</div>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled" id="invoiceDissel"
																value="option1"> <label for="invoiceDissel">
																Dissel </label>
														</div>

														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled" id="invoiceGas"
																value="option1"> <label for="invoiceGas">
																Gas </label>
														</div>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled" id="invoiceAc"
																value="option1"> <label for="invoiceAc">
																Ac </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</div>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" class="styled"
																id="invoiceOtheRead" value="option1"> <label
																for="invoiceOtheRead"> Other Readings </label>
														</div>
													</div>
												</div>
											</div>


											<div class="form-group">
												<label for="exampleFormControlTextarea1"
													class="form-control-label">Comments</label>
												<textarea class="form-control" id="inv_comments"
													name="inv_comments" rows="3"></textarea>
											</div>
											<p>
												<span style="color: red; font-weight: 600">Note:</span>&nbsp;Please
												set your GST and Terms & Conditions in Settings Icon
											</p>
										</div>
									</div>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
									<div class="row">
										<div class="col">
											<div class="card">
												<div class="card-header">
													<strong class="card-title">Invoice Details</strong>
												</div>
												<div class="card-body" style="background-color: #ffc10726">
													<div class="invoiceTableDetails" >
														<table class="table text-center">
															<thead class="thead-light">
																<tr>
																	<th>Particulars</th>
																	<th>Units</th>
																	<th>Cost/Unit</th>
																	<th width="15%">GST%</th>
																	<th>Total</th>
																</tr>
															</thead>
															<tbody class="text-center">
																<tr id="waterdisply">
																	<th scope="row">Water</th>
																	<td id='wtr_mr'><input type="hidden"
																		id='wtr_mr_txt' name='wtr_mr_txt' class="form-control"></td>
																	<td id='wtr_cost'><input type="hidden"
																		id='wtr_cost_txt' name='wtr_cost_txt'
																		class="form-control"></td>
																	<td><input type="text" id='wtr_gst' name='wtr_gst'
																		class="form-control" placeholder="Enter Gst" readonly></td>
																	<td id="wtrTotal"><input type="text"
																		id='wtrTotaltxt' name='wtrTotaltxt'
																		class="form-control" placeholder="Enter Gst" readonly></td>
																</tr>
																<tr id="currentDisplay">
																	<th scope="row">Electricity</th>
																	<td id='pwr_mr'><input type="hidden"
																		id='pwr_mr_txt' name='pwr_mr_txt' class="form-control"></td>
																	<td id='pwr_cost'><input type="hidden"
																		id='pwr_cost_txt' name='pwr_cost_txt'
																		class="form-control"></td>
																	<td><input type="text" id='pwr_gst' name='pwr_gst'
																		class="form-control" readonly></td>
																	<td id="pwrTotal"><input type="text"
																		id='pwrTotaltxt' name='pwrTotaltxt'
																		class="form-control" placeholder="Enter Gst" readonly></td>
																</tr>
																<tr id="gasDisply">
																	<th scope="row">Gas</th>
																	<td id='gas_mr'><input type="hidden"
																		id='gas_mr_txt' name='gas_mr_txt' class="form-control"></td>
																	<td id='gas_cost'><input type="hidden"
																		id='gas_cost_txt' name='gas_cost_txt'
																		class="form-control"></td>
																	<td><input type="text" id='gas_gst' name='gas_gst'
																		class="form-control" readonly></td>
																	<td id="gasTotal"><input type="text"
																		id='gasTotaltxt' name='gasTotaltxt'
																		class="form-control" readonly></td>
																</tr>
																<tr id="acDisply">
																	<th scope="row">AC</th>
																	<td id='ac_mr'><input type="hidden" id='ac_mr_txt'
																		name='ac_mr_txt' class="form-control"></td>
																	<td id='ac_cost'><input type="hidden"
																		id='ac_cost_txt' name='ac_cost_txt'
																		class="form-control"></td>
																	<td><input type="text" id='ac_gst' name='ac_gst'
																		class="form-control" readonly></td>
																	<td id="acTotal"><input type="text"
																		id='acTotaltxt' name='acTotaltxt' class="form-control"
																		readonly></td>
																</tr>
																<tr id="disselDisply">
																	<th scope="row">Dissel</th>
																	<td id='dsl_mr'><input type="hidden"
																		id='dsl_mr_txt' name='dsl_mr_txt' class="form-control"></td>
																	<td id='dsl_cost'><input type="hidden"
																		id='dsl_cost_txt' name='dsl_cost_txt'
																		class="form-control"></td>
																	<td><input type="text" id='dsl_gst' name='dsl_gst'
																		class="form-control" readonly></td>
																	<td id="dslTotal"><input type="text"
																		id='dslTotaltxt' name='dslTotaltxt'
																		class="form-control" readonly></td>
																</tr>
																<tr id="otherReadDisply">
																	<th scope="row">Other Reading<span
																		style="color: red">*</span></th>
																	<td id='oth_mr'><input type="hidden"
																		id='oth_mr_txt' name='oth_mr_txt' class="form-control"></td>
																	<td id='oth_cost'><input type="hidden"
																		id='oth_cost_txt' name='oth_cost_txt'
																		class="form-control"></td>
																	<td><input type="text" id='oth_gst' name='oth_gst'
																		class="form-control" readonly></td>
																	<td id="othTotal"><input type="text"
																		id='othTotalTxt' name='othTotalTxt'
																		class="form-control" readonly></td>
																</tr>
																<tr id="rentDisply">
																	<th scope="row">Rent</th>
																	<td></td>
																	<td><input type="text" id="rentTxt" name="rentTxt"
																		class="form-control" readonly></td>
																	<td><input type="text" id="rentGst" name="rentGst"
																		class="form-control" readonly></td>
																	<td id="rent_total"><input type="text"
																		id='renttotalTxt' name='renttotalTxt'
																		class="form-control" readonly></td>
																</tr>
																<tr id="invoiceMaintaince">
																	<th scope="row">Maintaince</th>
																	<td></td>
																	<td><input type="text" id="mntTxt" name="mntTxt"
																		class="form-control" readonly></td>
																	<td><input type="text" id="mntGst" name="mntGst"
																		class="form-control" readonly></td>
																	<td id="mnt_total"><input type="text"
																		id='mnttotalTxt' name='mnttotalTxt'
																		class="form-control" readonly></td>
																</tr>
																<!-- 	<tr id="otherBillsDisply">
																		<th scope="row">Other Bills<span style="color: red">*</span></th>
																		<td>100</td>
																		<td>1000</td>
																		<td><input type="text" class="form-control" placeholder="Enter Gst" value="0%"></td>
																		<td>10000</td>
																	</tr> -->
																<tr>
																	<th scope="row"></th>
																	<td></td>
																	<td></td>
																	<td><span class="totalData">Total</span></td>
																	<td><span class="totalData" id="grandTotalspan"></span><input
																		type="hidden" id='grdtotalTxt' name='grdtotalTxt'
																		class="form-control"></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-info btn-sm"
								onclick="saveInvoiceFun()">
								<i class="fa fa-save"></i> Save
							</button>
							<button type="button" class="btn btn-info btn-sm">
								<i class="fa fa-envelope-o"></i> Save & Send
							</button>
							<button type="button" class="btn btn-secondary btn-sm"
								onclick="closeModal()">Close</button>

						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="viewInvoiceModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">View Invoice</h5>
						<button type="button" class="close" 
							aria-label="Close" onclick="closeModal()">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-12">
								<div id="readingCard">

									<div class="row">
										<div class="col-lg-5 col-md-4 col-sm-12 col-xs-12">
											<div class="card" id="meterCard">
												<div class="card-header">
													<strong class="card-title">Asset Details</strong>
												</div>
												<div class="card-body">
													<div class="form-group">
														<label for="company" class=" form-control-label">Month</label>
														<div class="input-group">
															<input type="text" id="vi_month" name="vi_month"
																class="form-control" readonly>


														</div>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Year</label>
														<div class="input-group">
															<input type="text" id="vi_year" name="vi_year"
																class="form-control" readonly>
														</div>
													</div>
													<div class="form-group">
														<label for="company" class="form-control-label">Unit
															No</label>
														<div class="row">
															<div class="col-9">
																<input type="text" id="vi_unitno" id="vi_unitno"
																	placeholder="Ex:Unit" class="form-control" readonly>
															</div>

															<div class="col"></div>
														</div>

													</div>

													<div class="form-group">
														<label for="exampleFormControlTextarea1"
															class="form-control-label">Comments</label>
														<textarea class="form-control"
															id="exampleFormControlTextarea1" rows="3"></textarea>
													</div>
													<p>Note:Please set your GST and Terms & Conditions in
														Settings Icon</p>
												</div>
											</div>
										</div>
										<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
											<div class="row">
												<div class="col">
													<div class="card">
														<div class="card-header">
															<strong class="card-title">Invoice Details</strong>
														</div>
														<div class="card-body" style="background-color: #ffc10726">
															<div class="invoiceTableDetails">
																<table class="table text-center">
																	<thead class="thead-light">
																		<tr>
																			<th>Particulars</th>
																			<th>Units</th>
																			<th>Cost/Unit</th>
																			<th width="15%">GST%</th>
																			<th>Total</th>
																		</tr>
																	</thead>
																	<tbody class="text-center">
																		<tr id="vi_waterdisply">
																			<th scope="row">Water</th>
																			<td id='vi_wtr_mr'><input type="hidden"
																				id='vi_wtr_mr_txt' name='vi_wtr_mr_txt'
																				class="form-control"></td>
																			<td id='vi_wtr_cost'><input type="hidden"
																				id='vi_wtr_cost_txt' name='vi_wtr_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='vi_wtr_gst'
																				name='vi_wtr_gst' class="form-control"
																				placeholder="Enter Gst" readonly></td>
																			<td id="Ed_wtrTotal"><input type="text"
																				id='vi_wtrTotaltxt' name='wtrTotaltxt'
																				class="form-control" placeholder="Enter Gst"></td>
																		</tr>
																		<tr id="vi_currentDisplay">
																			<th scope="row">Electricity</th>
																			<td id='vi_pwr_mr'><input type="hidden"
																				id='vi_pwr_mr_txt' name='vi_pwr_mr_txt'
																				class="form-control"></td>
																			<td id='vi_pwr_cost'><input type="hidden"
																				id='vi_pwr_cost_txt' name='vi_pwr_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='vi_pwr_gst'
																				name='vi_pwr_gst' class="form-control" readonly></td>
																			<td id="vi_pwrTotal"><input type="text"
																				id='vi_pwrTotaltxt' name='vi_pwrTotaltxt'
																				class="form-control" placeholder="Enter Gst"></td>
																		</tr>
																		<tr id="vi_gasDisply">
																			<th scope="row">Gas</th>
																			<td id='vi_gas_mr'><input type="hidden"
																				id='vi_gas_mr_txt' name='vi_gas_mr_txt'
																				class="form-control"></td>
																			<td id='vi_gas_cost'><input type="hidden"
																				id='vi_gas_cost_txt' name='vi_gas_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='vi_gas_gst'
																				name='vi_gas_gst' class="form-control" readonly></td>
																			<td id="Ed_gasTotal"><input type="text"
																				id='vi_gasTotaltxt' name='vi_gasTotaltxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="vi_acDisply">
																			<th scope="row">AC</th>
																			<td id='vi_ac_mr'><input type="hidden"
																				id='vi_ac_mr_txt' name='vi_ac_mr_txt'
																				class="form-control"></td>
																			<td id='vi_ac_cost'><input type="hidden"
																				id='vi_ac_cost_txt' name='vi_ac_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='vi_ac_gst'
																				name='vi_ac_gst' class="form-control" readonly></td>
																			<td id="acTotal"><input type="text"
																				id='vi_acTotaltxt' name='vi_acTotaltxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="vi_disselDisply">
																			<th scope="row">Dissel</th>
																			<td id='vi_dsl_mr'><input type="hidden"
																				id='vi_dsl_mr_txt' name='vi_dsl_mr_txt'
																				class="form-control"></td>
																			<td id='vi_dsl_cost'><input type="hidden"
																				id='vi_dsl_cost_txt' name='vi_dsl_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='vi_dsl_gst'
																				name='vi_dsl_gst' class="form-control" readonly></td>
																			<td id="vi_dslTotal"><input type="text"
																				id='vi_dslTotaltxt' name='vi_dslTotaltxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="vi_otherReadDisply">
																			<th scope="row">Other Reading<span
																				style="color: red">*</span></th>
																			<td id='vi_oth_mr'><input type="hidden"
																				id='vi_oth_mr_txt' name='vi_oth_mr_txt'
																				class="form-control"></td>
																			<td id='vi_oth_cost'><input type="hidden"
																				id='vi_oth_cost_txt' name='vi_oth_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='vi_oth_gst'
																				name='vi_oth_gst' class="form-control" readonly></td>
																			<td id="vi_othTotal"><input type="text"
																				id='vi_othTotalTxt' name='vi_othTotalTxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="vi_rentDisply">
																			<th scope="row">Rent</th>
																			<td></td>
																			<td><input type="text" id="vi_rentTxt"
																				name="vi_rentTxt" class="form-control" readonly></td>
																			<td><input type="text" id="vi_rentGst"
																				name="vi_rentGst" class="form-control" readonly></td>
																			<td id="rent_total"><input type="text"
																				id='vi_renttotalTxt' name='vi_renttotalTxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="vi_invoiceMaintaince">
																			<th scope="row">Maintaince</th>
																			<td></td>
																			<td><input type="text" id="vi_mntTxt"
																				name="vi_mntTxt" class="form-control" readonly></td>
																			<td><input type="text" id="vi_mntGst"
																				name="vi_mntGst" class="form-control" readonly></td>
																			<td id="vi_mnt_total"><input type="text"
																				id='vi_mnttotalTxt' name='vi_mnttotalTxt'
																				class="form-control" readonly></td>
																		</tr>
																		<!-- 	<tr id="otherBillsDisply">
																		<th scope="row">Other Bills<span style="color: red">*</span></th>
																		<td>100</td>
																		<td>1000</td>
																		<td><input type="text" class="form-control" placeholder="Enter Gst" value="0%"></td>
																		<td>10000</td>
																	</tr> -->
																		<tr>
																			<th scope="row"></th>
																			<td></td>
																			<td></td>
																			<td><span class="vi_totalData">Total</span></td>
																			<td><span class="vi_totalData"
																				id="vi_grandTotalspan"></span><input type="hidden"
																				id='vi_grdtotalTxt' name='vi_grdtotalTxt'
																				class="form-control"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-secondary btn-sm"
							onclick="closeModal()">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!--Invoice Edit Moadl popup start here-->

		<div class="modal fade" id="editInvoiceModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Edit Invoice</h5>
						<button type="button" class="close" onclick="closeModal()"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-12">
								<div id="readingCard">

									<div class="row">
										<div class="col-lg-5 col-md-4 col-sm-12 col-xs-12">
											<div class="card" id="meterCard">
												<div class="card-header">
													<strong class="card-title">Asset Details</strong>
												</div>
												<div class="card-body">
													<div class="form-group">
														<label for="company" class=" form-control-label">Month</label>
														<div class="input-group">
															<!-- <input type="month"  id="ed_month" name="Ed_month" class="form-control" id="invoiceDatePick"> -->
															<select class="form-control" id="ed_month"
																name="ed_month">
															</select>

														</div>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Year</label>
														<div class="input-group">
															<input type="text" id="Ed_year" name="Ed_year"
																class="form-control" id="invoiceDatePick">
														</div>
													</div>
													<div class="form-group">
														<label for="company" class="form-control-label">Flat
															No</label>
														<div class="row">
															<div class="col-9">
																<input type="text" id="ed_unitno" id="ed_unitno"
																	placeholder="Ex:Unit" class="form-control">
															</div>
															<input type="hidden" id="Ed_ownerid_inv" name="Ed_ownerid_inv"
															class="form-control"> <input type="hidden"
															id="Ed_tenenatid_inv" name="Ed_tenenatid_inv"
															class="form-control">
															<input type="hidden"
															id="Ed_prptyid" name="Ed_prptyid"
															class="form-control" value='${prptyid}'>
															<input type="hidden"
															id="Ed_prtyname" name="Ed_prtyname"
															class="form-control" value='${prptyName}'>
															<input type="hidden"
															id="Ed_invoiceid" name="Ed_invoiceid"
															class="form-control" >
															

														</div>
														<div class="form-group row">
															<label for="company" class="form-control-label col-12">Choose
																Meter Readings</label>
															<div class="col-12">
																<div class="row pt-3">
															
																	<div class="checkbox checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_invoiceEditCurrent" value="option1"> <label
																			for="Ed_invoiceEditCurrent"> Current </label>
																	</div>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_invoiceEditDissel" value="option1"> <label
																			for="Ed_invoiceEditDissel"> Dissel </label>
																	</div>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_invoiceEditWater" value="option1"> <label
																			for="Ed_invoiceEditWater"> Water </label>
																	</div>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_invoiceEditGas" value="option1"> <label
																			for="Ed_invoiceEditGas"> Gas </label>
																	</div>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_invoiceEditAc" value="option1"> <label
																			for="Ed_invoiceEditAc"> Ac </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	</div>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_invoiceEditOtheRead" value="option1">
																		<label for="Ed_invoiceEditOtheRead"> Other
																			Readings </label>
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group row">
															<label for="company" class="form-control-label col-12">Choose
																Unit Bills</label>
															<div class="col-12">
																<div class="row pt-3">
																<!-- 	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_inlineEditCheckboxAll" value="option1">
																		<label for="Ed_inlineEditCheckboxAll"> All
																			&nbsp;</label>
																	</div> -->
																	<div class="checkbox checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_inlineEditCheckMain" value="option1">
																		<label for="Ed_inlineEditCheckMain">
																			Maintaince </label>
																	</div>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_inlineEditCheckRent" value="option1">
																		<label for="Ed_inlineEditCheckRent"> Rent </label>
																	</div>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" class="styled"
																			id="Ed_inlineEditCheckOther" value="option1">
																		<label for="Ed_inlineEditCheckOther"> Other
																			Bills </label>
																	</div>
																</div>
															</div>
														</div>

														<div class="form-group">
															<label for="exampleFormControlTextarea1"
																class="form-control-label">Comments</label>
															<textarea class="form-control"
																id="Ed_inv_comments" name="Ed_inv_comments" rows="3"></textarea>
														</div>
														<p>Note:Please set your GST and Terms & Conditions in
															Settings Icon</p>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
											<div class="row">
												<div class="col">
													<div class="card">
														<div class="card-header">
															<strong class="card-title">Invoice Details</strong>
														</div>
														<div class="card-body" style="background-color: #ffc10726">
															<div class="invoiceTableDetails">
																<table class="table text-center">
																	<thead class="thead-light">
																		<tr>
																			<th>Particulars</th>
																			<th>Units</th>
																			<th>Cost/Unit</th>
																			<th width="15%">GST%</th>
																			<th>Total</th>
																		</tr>
																	</thead>
																	<tbody class="text-center">
																		<tr id="Ed_waterEditdisply">
																			<th scope="row">Water</th>
																			<td id='Ed_wtr_mr'><input type="hidden"
																				id='Ed_wtr_mr_txt' name='Ed_wtr_mr_txt'
																				class="form-control"></td>
																			<td id='Ed_wtr_cost'><input type="hidden"
																				id='Ed_wtr_cost_txt' name='Ed_wtr_cost_txt'
																				class="form-control" ></td>
																			<td><input type="text" id='Ed_wtr_gst'
																				name='Ed_wtr_gst' class="form-control"
																				placeholder="Enter Gst" readonly></td>
																			<td id="Ed_wtrTotal"><input type="text"
																				id='Ed_wtrTotaltxt' name='wtrTotaltxt'
																				class="form-control" placeholder="Enter Gst" readonly></td>
																		</tr>
																		<tr id="Ed_currentEditDisplay">
																			<th scope="row">Electricity</th>
																			<td id='Ed_pwr_mr'><input type="hidden"
																				id='Ed_pwr_mr_txt' name='Ed_pwr_mr_txt'
																				class="form-control"></td>
																			<td id='Ed_pwr_cost'><input type="hidden"
																				id='Ed_pwr_cost_txt' name='Ed_pwr_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='Ed_pwr_gst'
																				name='Ed_pwr_gst' class="form-control" readonly></td>
																			<td id="Ed_pwrTotal"><input type="text"
																				id='Ed_pwrTotaltxt' name='Ed_pwrTotaltxt'
																				class="form-control" placeholder="Enter Gst" readonly></td>
																		</tr>
																		<tr id="Ed_gasEditDisply">
																			<th scope="row">Gas</th>
																			<td id='Ed_gas_mr'><input type="hidden"
																				id='Ed_gas_mr_txt' name='Ed_gas_mr_txt'
																				class="form-control"></td>
																			<td id='Ed_gas_cost'><input type="hidden"
																				id='Ed_gas_cost_txt' name='Ed_gas_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='Ed_gas_gst'
																				name='Ed_gas_gst' class="form-control" readonly></td>
																			<td id="Ed_gasTotal"><input type="text"
																				id='Ed_gasTotaltxt' name='Ed_gasTotaltxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="Ed_acEditDisply">
																			<th scope="row">AC</th>
																			<td id='Ed_ac_mr'><input type="hidden"
																				id='Ed_ac_mr_txt' name='Ed_ac_mr_txt'
																				class="form-control"></td>
																			<td id='Ed_ac_cost'><input type="hidden"
																				id='Ed_ac_cost_txt' name='Ed_ac_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='Ed_ac_gst'
																				name='Ed_ac_gst' class="form-control" readonly></td>
																			<td id="acTotal"><input type="text"
																				id='Ed_acTotaltxt' name='Ed_acTotaltxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="Ed_disselEditDisply">
																			<th scope="row">Dissel</th>
																			<td id='Ed_dsl_mr'><input type="hidden"
																				id='Ed_dsl_mr_txt' name='Ed_dsl_mr_txt'
																				class="form-control"></td>
																			<td id='Ed_dsl_cost'><input type="hidden"
																				id='Ed_dsl_cost_txt' name='Ed_dsl_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='Ed_dsl_gst'
																				name='Ed_dsl_gst' class="form-control" readonly></td>
																			<td id="Ed_dslTotal"><input type="text"
																				id='Ed_dslTotaltxt' name='Ed_dslTotaltxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="Ed_otherReadEditDisply">
																			<th scope="row">Other Reading<span
																				style="color: red">*</span></th>
																			<td id='Ed_oth_mr'><input type="hidden"
																				id='Ed_oth_mr_txt' name='Ed_oth_mr_txt'
																				class="form-control"></td>
																			<td id='Ed_oth_cost'><input type="hidden"
																				id='Ed_oth_cost_txt' name='Ed_oth_cost_txt'
																				class="form-control"></td>
																			<td><input type="text" id='Ed_oth_gst'
																				name='Ed_oth_gst' class="form-control" readonly></td>
																			<td id="othTotal"><input type="text"
																				id='Ed_othTotalTxt' name='Ed_othTotalTxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="Ed_rentEditDisply">
																			<th scope="row">Rent</th>
																			<td></td>
																			<td><input type="text" id="Ed_rentTxt"
																				name="Ed_rentTxt" class="form-control" readonly></td>
																			<td><input type="text" id="Ed_rentGst"
																				name="Ed_rentGst" class="form-control" readonly></td>
																			<td id="rent_total"><input type="text"
																				id='Ed_renttotalTxt' name='Ed_renttotalTxt'
																				class="form-control" readonly></td>
																		</tr>
																		<tr id="Ed_invoiceEditMaintaince">
																			<th scope="row">Maintaince</th>
																			<td></td>
																			<td><input type="text" id="Ed_mntTxt"
																				name="Ed_mntTxt" class="form-control" readonly></td>
																			<td><input type="text" id="Ed_mntGst"
																				name="Ed_mntGst" class="form-control" readonly></td>
																			<td id="Ed_mnt_total"><input type="text"
																				id='Ed_mnttotalTxt' name='Ed_mnttotalTxt'
																				class="form-control" readonly></td>
																		</tr>
																		<!-- 	<tr id="otherBillsDisply">
																		<th scope="row">Other Bills<span style="color: red">*</span></th>
																		<td>100</td>
																		<td>1000</td>
																		<td><input type="text" class="form-control" placeholder="Enter Gst" value="0%"></td>
																		<td>10000</td>
																	</tr> -->
																		<tr>
																			<th scope="row"></th>
																			<td></td>
																			<td></td>
																			<td><span class="Ed_totalData"></span></td>
																			<td><span class="Ed_totalData"
																				id="Ed_grandTotalspan"></span><input type="hidden"
																				id='Ed_grdtotalTxt' name='Ed_grdtotalTxt'
																				class="form-control"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info btn-sm" onclick="updateInvoiceFun()">
							<i class="fa fa-save"></i> Save
						</button>
						<button type="button" class="btn btn-info btn-sm">
							<i class="fa fa-envelope-o"></i> Save & Send
						</button>
						<button type="button" class="btn btn-secondary btn-sm"
							onclick="closeModal()">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="modal fade" id="invoicePaymentModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Invoice Payment
						Info</h5>
					<button type="button" class="close" 
						aria-label="Close" onclick="closeModal()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="savePayment" method='POST'>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="card">
									<div class="card-header">
										<strong>Payment Details</strong>
									</div>
									<div class="card-body card-block">
										<div class="form-group">
											<label for="company" class=" form-control-label">Payment
												Date</label>
											<div class="input-group">
												<input type="hidden" class="form-control" id="prptyid"
													name="prptyid" value='${prptyid}'> <input
													type="hidden" class="form-control" id="prptyName"
													name="prptyName" value='${prptyName}'> <input
													class="form-control" id="payDate" name="payDate">
											</div>
										</div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Payment
												period</label>
											<div class="input-group">
												<input class="form-control" id="payPeriod" name="payPeriod">
											</div>
										</div>

										<div class="form-group">
											<label for="company" class=" form-control-label">Invoice
												ID</label>
											<div class="input-group">
												<input class="form-control" id="InvId" name="InvId">
												<input type="hidden" class="form-control" id="InvIdHidden"
													name="InvIdHidden">

											</div>
										</div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Paid
												By</label>
											<div class="input-group">
												<input type="hidden" class="form-control" id="ownerid_pay"
													name="ownerid_pay"> <input type="hidden"
													class="form-control" id="tenantid_pay" name="tenantid_pay">
												<input class="form-control" id="paidBy" name="paidBy">
											</div>
										</div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Unit
												No</label>
											<div class="input-group">
												<input class="form-control" id="unitNo_pay"
													name="unitNo_pay">
											</div>
										</div>

									</div>
								</div>
							</div>
							<input type="hidden" id="invAmount" name="invAmount">
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="card">
									<div class="card-header">
										<strong>Total</strong>
									</div>
									<div class="card-body card-block">
										<div class="form-group">
											<label for="company" class=" form-control-label">Total
												Amount</label>
											<div class="input-group">

												<input class="form-control" id="totalAmount"
													name="totalAmount">
											</div>
										</div>

										<div class="form-group">
											<label for="company" class=" form-control-label">Amount
												Paid</label>
											<div class="input-group">
												<input class="form-control" id="amountPaid"
													name="amountPaid" onchange="getDueAmount()">
											</div>
										</div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Due
												Amount</label>
											<div class="input-group">
												<input class="form-control" id="dueAmount" name="dueAmount">
											</div>
										</div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Payment
												Type</label>
											<div class="input-group">
												<select class="form-control" id="payType" name="payType"
													required>
													<option value="Cash">Cash</option>
													<option value="Cheque">Cheque</option>

												</select>

											</div>
										</div>

									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-info btn-sm">Save</button>
						<button type="button" class="btn btn-secondary btn-sm"
							onclick="closeModal()">Close</button>

					</div>
				</form>
			</div>
		</div>
	</div>

	</div>
	<!-- /.content -->
	<div class="clearfix"></div>
	<!-- Footer -->
	<!-- <footer class="site-footer">
		<div class="footer-inner bg-white">
			<div class="row">
				<div class="col-sm-6">
				Copyright &copy; 2019 @Maa Properties</div>
			</div>
		</div>
	</footer> -->
	<!-- /.site-footer -->

	<!-- /#right-panel -->
	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

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
				$('#month_indv').append(
						$('<option/>').attr("value", mlist[i]).text(mlist[i]));
				$('#ed_month').append(
						$('<option/>').attr("value", mlist[i]).text(mlist[i]));
			}
			//$('#month_indv').val(mlist);
			$('#year_indv').val(cur_year);

		}
		window.onload = loadMonthYear;
	</script>

	<script>


	function monthNameToNum(month) {
		 	var month1 = months.indexOf(month);
		var premonth=months[month1 - 1] || '';
		//alert(premonth);
		 	return premonth;
		 	}
	var months = [
		 	'January', 'February', 'March', 'April', 'May',
		 	'June', 'July', 'August', 'September',
		 	'October', 'November', 'December'
		 	];



	
		$("#vi_waterdisply").hide();
		$("#vi_currentDisplay").hide();
		$("#vi_disselDisply").hide();
		$("#vi_gasDisply").hide();
		$("#vi_acDisply").hide();
		$("#vi_otherReadDisply").hide();
		$("#vi_rentDisply").hide();
		$("#vi_invoiceMaintaince").hide();

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
								}
							});
			
			$("#meterAddIndModal").hide();
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
												if (response != '') {
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
								var wtrMtrRead = 0;
								var wtrMtrcost = 0;
								var wtrMtrGst = 0;
								$('#wtr_mr').text(wtrMtrRead);
								$('#wtr_cost').text(wtrMtrcost);
								$('#wtr_cost_txt').val(wtrMtrcost);
								$('#wtr_mr_txt').val(wtrMtrRead);
								var wtrTotal = getTotalByReading(wtrMtrRead,
										wtrMtrcost, wtrMtrGst);
								$('#wtrTotaltxt').val(wtrTotal);
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

												if (response != '') {
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
								var pwrMtrcost = 0;
								var pwrMtrRead = 0;
								var pwrMtrGst = 0;
								$('#pwr_mr').text(0);
								$('#pwr_mr_txt').val(0);
								$('#pwr_cost').text(0);
								$('#pwr_mr_txt').val(0);
								var pwrTotal = getTotalByReading(pwrMtrRead,
										pwrMtrcost, pwrMtrGst);
								$('#wtrTotaltxt').val(pwrTotal);
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

												if (response != '') {
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
								var pwrMtrcost = 0;
								var pwrMtrRead = 0;
								var pwrMtrGst = 0;
								$('#dsl_mr').text(0);
								$('#dsl_cost').text(0);
								$('#dsl_mr_txt').val(0);
								$('#dsl_cost_txt').val(0);
								var pwrTotal = getTotalByReading(pwrMtrRead,
										pwrMtrcost, pwrMtrGst);
								$('#dslTotaltxt').val(pwrTotal);
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

												if (response != '') {
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
								var pwrMtrcost = 0;
								var pwrMtrRead = 0;
								var pwrMtrGst = 0;
								$('#gas_mr').text(0);
								$('#gas_mr_txt').val(0);
								$('#gas_cost').text(0);
								$('#gas_cost_txt').val(0);
								var pwrTotal = getTotalByReading(pwrMtrRead,
										pwrMtrcost, pwrMtrGst);
								$('#gasTotaltxt').val(pwrTotal);
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
												

												if (response != '') {

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
								success : function(response) {

									if (response != '') {

										$('#mntGst').val(response.maintenanceGST);

									} else {
										$('#rentGst').val(0);
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

													$('#mntTxt')
															.val(
																	response.maintenance);
													$("#inlineCheckboxAll").attr('disabled',true);
															
															
													var maintenance = parseFloat(response.maintenance);
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
				success : function(response) {

					if (response != '') {

						
						$('#rentGst').val(response.rentGST);
						$('#mntGst').val(
								response.maintenanceGST);

					} else {
						$('#rentGst').val(0);
						$('#mntGst').val(
								0);

						
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

				
				var pwrMtrcost = 0;
				var pwrMtrRead = 0;
				var pwrMtrGst = 0;
				$('#Ed_pwr_mr').text(0);
				$('#Ed_pwr_mr_txt').val(0);
				$('#Ed_pwr_cost').text(0);
				$('#Ed_pwr_cost_txt').val(0);
				var pwrTotal = getTotalByReading(pwrMtrRead,
						pwrMtrcost, pwrMtrGst);
				$('#Ed_pwrTotaltxt').val(pwrTotal);
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
									$('#Ed_dsl_mr').text(
											response.disel_MR);
									$('#Ed_dsl_cost').text(
											dCpu);
									$('#Ed_dsl_mr_txt').val(
											response.disel_MR);
									$('#Ed_dsl_cost_txt').val(
											dCpu);

									
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

				
				var pwrMtrcost = 0;
				var pwrMtrRead = 0;
				var pwrMtrGst = 0;
				$('#Ed_dsl_mr').text(0);
				$('#Ed_dsl_cost').text(0);
				$('#Ed_dsl_mr_txt').val(0);
				$('#Ed_dsl_cost_txt').val(0);
				var pwrTotal = getTotalByReading(pwrMtrRead,
						pwrMtrcost, pwrMtrGst);
				$('#Ed_dslTotaltxt').val(pwrTotal);
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

				/* $("#invoiceAllRead").attr('disabled', false); */
				var pwrMtrcost = 0;
				var pwrMtrRead = 0;
				var pwrMtrGst = 0;
				$('#Ed_gas_mr').text(0);
				$('#Ed_gas_mr_txt').val(0);
				$('#Ed_gas_cost').text(0);
				$('#Ed_gas_cost_txt').val(0);
				var pwrTotal = getTotalByReading(pwrMtrRead,
						pwrMtrcost, pwrMtrGst);
				$('#Ed_gasTotaltxt').val(pwrTotal);
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

							},
							error : function() {
							}
						});
				$("#Ed_acEditDisply").toggle();
			} else {
			/* 	$("#invoiceAllRead").attr('disabled', false); */
				var pwrMtrcost = 0;
				var pwrMtrRead = 0;
				var pwrMtrGst = 0;
				$('#Ed_ac_mr').text(0);
				$('#Ed_ac_mr_txt').val(0);
				$('#Ed_ac_cost').text(0);
				$('#Ed_ac_cost_txt').val(0);

				var pwrTotal = getTotalByReading(pwrMtrRead,
						pwrMtrcost, pwrMtrGst);
				$('#Ed_acTotaltxt').val(pwrTotal);
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
				
				var pwrMtrcost = 0;
				var pwrMtrRead = 0;
				var pwrMtrGst = 0;
				$('#Ed_oth_cost').text(0);
				$('#Ed_oth_mr').text(0);
				$('#Ed_oth_mr_txt').val(0);
				$('#Ed_oth_cost_txt').val(0);

				var pwrTotal = getTotalByReading(pwrMtrRead,
						pwrMtrcost, pwrMtrGst);
				$('#Ed_othTotalTxt').val(pwrTotal);
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
							
						
							$('#Ed_mntTxt')
									.val(response.maintenance);
											
						
											
							
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
			/* 	$("#Ed_inlineEditCheckboxAll").attr('disabled', false); */
				
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
						
							$('#Ed_rentTxt').val(
									response.rent);
							/* $('#mntTxt')
									.val(
											response.maintenance); */
							
							/* $("#Ed_inlineEditCheckboxAll").attr('disabled', true); */
							$("#Ed_inlineEditCheckRent").attr('disabled', true);
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
				$("#Ed_inlineEditCheckboxAll").attr('disabled', false);
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
			/* var All_rm = document.getElementById("Ed_inlineEditCheckboxAll").checked; */
			var rent = $('#Ed_rentEditDisply').prop("checked");
			var maintenance = $('#Ed_invoiceEditMaintaince').prop("checked");

			/* arra1.push(All); */
			arra1.push(Current);
			arra1.push(Diesel);
			arra1.push(Water);
			arra1.push(Gas);
			arra1.push(AC);
			arra1.push(Others);
		/* 	arra1.push(All_rm); */
			arra1.push(rent);
			arra1.push(maintenance);

			if (arra1.includes(true) && unitNo != "") {

				var month = $('#ed_month').val();
				var prvmonth=monthNameToNum(month);
				var year = $('#Ed_year').val();
				var prptyid = $('#Ed_prptyid').val();
				var prptyname = $('#Ed_prtyname').val();
				
				var flatno = $('#ed_unitno').val();
			/* 	var occBy = $('#ast_occ_by').val(); */

				var wtrMtrRead = $('#Ed_wtr_mr').text();
				
				var pwrMtrRead = $('#Ed_pwr_mr').text();
				
				var gasMtrRead = $('#Ed_gas_mr').text();
				var dslMtrRead = $('#Ed_ac_mr').text();
				var acMtrRead = $('#Ed_dsl_mr').text();
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
				} else {
					alert("Please select atleast one check box");
				}
			}
		}
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

				var wtrMtrRead = $('#wtr_mr').text();
				
				var pwrMtrRead = $('#pwr_mr').text();
				var gasMtrRead = $('#gas_mr').text();
				var acMtrRead = $('#ac_mr').text();
				var dslMtrRead = $('#dsl_mr').text();
				var othMtrRead = $('#oth_mr').text();

				var wtrMtrcost = $('#wtr_cost').text();
				var pwrMtrcost = $('#pwr_cost').text();
				var gasMtrcost = $('#gas_cost').text();
				var acMtrcost = $('#ac_cost').text();
				var dslMtrcost = $('#dsl_cost').text();
				var othMtrcost = $('#oth_cost').text();

				var wtrMtrGst = $('#wtr_gst').val();
				var pwrMtrGst = $('#pwr_gst').val();
				var gasMtrGst = $('#gas_gst').val();
				var dslMtrGst = $('#dsl_gst').val();
				var acMtrGst = $('#ac_gst').val();
				var othMtrGst = $('#oth_gst').val();

				var rentGst = $('#rentGst').val();
				var mntGST = $('#mntGst').val();
				var rent = $('#rentTxt').val();
				
				var maintenece = $('#mntTxt').val();
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
					
					//alert(rentTotal1);
				if(wtrTotal1!=''||pwrTotal1!=''||wtrTotal1!=''||gasTotal1!=''||dslTotal1!=''||acTotal1!=''||othTotal1!=''||rentTotal1!=''||mntTotal1!=''){
				var grndTotal = wtrTotal1 + pwrTotal1 + gasTotal1 + dslTotal1
						+ acTotal1 + othTotal1 + rentTotal1 + mntTotal1;
				//alert(grndTotal);
				//grndTotal= grndTotal.toFixed(2);
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

			else {
				if (unitNo == "") {
					alert("Please select Unit no");
				} else {
					alert("Please select atleast one check box");
				}
			}
		}
	</script>
	<script>
		function payInvoice(invId, flatNo, month, year, invamount, amtPaid,
				due, paidby, ownerid, tntid) {

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

		function viewInvoice(invoiceid) {
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
						wtrMtrRead = response.wtrUnits,
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
						$('#vi_year').val(response.year);
						
						if (response.wtrUnits != null) {
							
							$('#vi_wtr_mr').text(response.wtrUnits);
							$('#vi_wtr_cost').text(response.wtrCost);
							$('#vi_wtr_mr_txt').val(response.wtrUnits);

							$('#vi_wtr_gst').val(response.wtrGST);
							$('#vi_wtr_cost_txt').val(response.wtrCost);

							$('#vi_wtrTotaltxt').val(wtrTotal);
							$("#vi_waterdisply").toggle();

						}
						if (response.pwrUnits != null) {
							$('#vi_pwr_mr').text(response.pwrUnits);
							$('#vi_pwr_mr_txt').val(response.pwrUnits);
							$('#vi_pwr_cost').text(response.pwrCost);
							$('#vi_pwr_cost_txt').val(response.pwrCost);
							$('#vi_pwr_gst').val(response.pwrGST);

							$('#vi_pwrTotaltxt').val(pwrTotal);

							$("#vi_currentDisplay").toggle();

						}



						
						if (response.gasUnits != null) {
							$('#vi_gas_mr').text(response.gasUnits);
							$('#vi_gas_cost').text(response.gasCost);
							$('#vi_gas_mr_txt').val(response.gasUnits);
							$('#vi_gas_cost_txt').val(response.gasCost);
							$('#vi_gas_gst').val(response.gasGST);

							$('#vi_gasTotaltxt').val(gasTotal);
							$("#vi_gasDisply").toggle();

						}

						if (response.acUnits != null) {
							$('#vi_ac_mr').text(response.acUnits);
							$('#vi_ac_cost_txt').val(response.acCost);
							$('#vi_ac_mr_txt').val(response.acUnits);
							$('#vi_ac_cost').text(response.acCost);
							$('#vi_ac_gst').val(response.acGST);

							$('#vi_acTotaltxt').val(acTotal);
							$("#vi_acDisply").show();

						}

						if (response.dslUnits != null) {
							$('#vi_dsl_cost').text(response.dslCost);
							$('#vi_dsl_mr').text(response.dslUnits);
							$('#vi_dsl_gst').val(response.dslGST);
							$('#vi_dsl_mr_txt').val(response.dslUnits);
							$('#vi_dsl_cost_txt').val(response.dslCost);

							$('#vi_dslTotaltxt').val(dslTotal);

							$("#vi_disselDisply").toggle();
						}

						if (response.othrUnits != null) {
							$('#vi_oth_cost_txt').val(response.othrCost);
							$('#vi_oth_mr_txt').val(response.othrUnits);
							$('#vi_oth_mr').text(response.othrUnits);
							$('#vi_oth_cost').text(response.othrCost);
							$('#vi_oth_gst').val(response.othrGST);
							$('#vi_othTotalTxt').val(othTotal);
							$("#vi_otherReadDisply").toggle();

						}

						if (response.rent != null) {
							$('#vi_rentTxt').val(response.rent);
							$('#vi_rentGst').val(response.rentGST);
							$('#vi_renttotalTxt').val(rentTotal);
							$("#vi_rentDisply").toggle();

						}

						if (response.maintenance != null) {
							$('#vi_mntGst').val(response.maintenanceGST);
							$('#vi_mntTxt').val(response.maintenance);
							$('#vi_mnttotalTxt').val(mntTotal);
							$("#vi_invoiceMaintaince").toggle();
						}
						var flatVal = response.flano;
						$('#vi_unitno').val(flatVal);

					}

					$('#vi_grandTotalspan').text(grandTotal);
					$('#vi_grdtotalTxt').val(grandTotal);

				},
				error : function() {
				}
			});
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
						$('#ed_unitno').val(response.flano);
						$('#Ed_ownerid_inv').val(response.ownerid);
						$('#Ed_tenenatid_inv').val(response.tenentid);
						if (response.wtrUnits != null) {
							$('#Ed_wtr_mr').text(response.wtrUnits);
							$('#Ed_wtr_cost').text(response.wtrCost);
							$('#Ed_wtr_mr_txt').val(response.wtrUnits);
							$('#Ed_wtr_cost_txt').val(response.wtrCost);
							$('#Ed_wtr_gst').val(response.wtrGST);
							$("#Ed_invoiceEditWater").prop('checked', true);
							$("#Ed_waterEditdisply").toggle();

						} /* else if (response.wtrUnits == 0) {
							$("#Ed_waterEditdisply").hide();
						} */
						if (response.pwrUnits != null) {
							$('#Ed_pwr_mr').text(response.pwrUnits);
							$('#Ed_pwr_cost').text(response.pwrCost);
							$('#Ed_pwr_mr_txt').val(response.pwrUnits);
							$('#Ed_pwr_cost_txt').val(response.pwrCost);
							$('#Ed_pwr_gst').val(response.pwrGST);

							$("#Ed_invoiceEditCurrent").prop('checked', true);
							$("#Ed_currentEditDisplay").toggle();

						}
						if (response.gasUnits != null) {
							$('#Ed_gas_mr').text(response.gasUnits);
							$('#Ed_gas_cost').text(response.gasCost);
							$('#Ed_gas_mr_txt').val(response.gasUnits);
							$('#Ed_gas_cost_txt').val(response.gasCost);
							$('#Ed_gas_gst').val(response.gasGST);
							$("#Ed_invoiceEditGas").prop('checked', true);
							$("#Ed_gasEditDisply").toggle();

						}
						if (response.dslUnits != null) {
							$('#Ed_dsl_mr').text(response.dslUnits);
							$('#Ed_dsl_cost').text(response.dslCost);
							$('#Ed_dsl_mr_txt').val(response.dslUnits);
							$('#Ed_dsl_cost_txt').val(response.dslCost);
							$('#Ed_dsl_gst').val(response.dslGST);

							$("#Ed_invoiceEditDissel").prop('checked', true);
							$("#Ed_disselEditDisply").toggle();

						}
						if (response.acUnits != null) {
							$('#Ed_ac_mr').text(response.acUnits);
							$('#Ed_ac_cost').text(response.acCost);
							$('#Ed_ac_mr_txt').val(response.acUnits);
							$('#Ed_ac_cost_txt').val(response.acCost);
							$('#Ed_ac_gst').val(response.acGST);
							$("#Ed_invoiceEditAc").prop('checked', true);
							$("#Ed_acEditDisply").toggle();

						}
						if (response.othrUnits != null) {
							$('#Ed_oth_cost').text(response.othrCost);
							$('#Ed_oth_mr').text(response.othrUnits);
							$('#Ed_oth_mr_txt').val(response.othrUnits);
							$('#Ed_oth_cost_txt').val(response.othrCost);
							$('#Ed_oth_gst').val(response.othrGST);
							$("#Ed_invoiceEditOtheRead").prop('checked', true);
							$("#Ed_otherReadEditDisply").toggle();

						}

						
						if (response.rent != null) {
							$('#Ed_rentTxt').val(response.rent);
							$('#Ed_rentGst').val(response.rentGST);
							$("#Ed_inlineEditCheckRent").prop('checked', true);
							$("#Ed_rentEditDisply").toggle();
						}
						if (response.maintenance != null) {
							$('#Ed_mntTxt').val(response.maintenance);
							$('#Ed_mntGst').val(response.maintenanceGST);
							$("#Ed_inlineEditCheckMain").prop('checked', true);
							$("#Ed_invoiceEditMaintaince").toggle();
						}
						
						
						var flatVal = response.flano;
						$('#ed_unitno').val(flatVal);

					

					}
					var wtrTotal = getTotalByReading(wtrMtrRead, wtrMtrcost,
							wtrMtrGst);
					var pwrTotal = getTotalByReading(pwrMtrRead, pwrMtrcost,
							pwrMtrGst);
					var gasTotal = getTotalByReading(gasMtrRead, gasMtrcost,
							gasMtrGst);
					var dslTotal = getTotalByReading(dslMtrRead, dslMtrcost,
							dslMtrGst);
					var acTotal = getTotalByReading(acMtrRead, acMtrcost,
							acMtrGst);
					var othTotal = getTotalByReading(othMtrRead, othMtrcost,
							othMtrGst);
					var rentTotal = getRMTotal(rent, rentGst);
					var mntTotal = getRMTotal(maintance, maintanceGst);

					var grandTotal = wtrTotal + pwrTotal + gasTotal + dslTotal
							+ acTotal + othTotal + rentTotal + mntTotal;
					$('#Ed_wtrTotaltxt').val(wtrTotal);
					$('#Ed_pwrTotaltxt').val(pwrTotal);
					$('#Ed_gasTotaltxt').val(gasTotal);
					$('#Ed_dslTotaltxt').val(dslTotal);
					$('#Ed_acTotaltxt').val(acTotal);
					$('#Ed_othTotalTxt').val(othTotal);

					$('#Ed_renttotalTxt').val(rentTotal);
					$('#Ed_mnttotalTxt').val(mntTotal);
					

				},
				error : function() {
				}
			});

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

			 document.getElementById("invoiceAllRead").checked= false;
			 $('#invoiceCurrent').prop("checked", false);
			 $('#invoiceDissel').prop("checked", false);
			 $('#invoiceWater').prop("checked", false);
			 $('#invoiceGas').prop("checked", false);
			 $('#invoiceAc').prop("checked", false);
			 $('#invoiceOtheRead').prop("checked", false);

			document.getElementById("inlineCheckboxAll").checked= false;
			 $('#inlineCheckRent').prop("checked", false);
			 $('#inlineCheckMain').prop("checked", false);
			}
	</script>





</body>

</html>