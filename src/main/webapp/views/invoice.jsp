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
<style type="text/css">
												.bhimupi a{
													display: block;
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
											<th>Period</th>
											<th>Unit No</th>
											<th>Invoice Amount</th>
											<th>Amount Paid</th>
											
											<th>Open Balance</th>
											<th>Status</th>
											<th class="custmheightInv">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="inv" items="${invoiceList}">
											<tr>
												<td>INVC${inv.invid}</td>
												<td>${inv.paidby}</td>
												<td>${inv.month}/${inv.year}</td>
												<td>${inv.unitno}</td>
												<td>${inv.invoiceAmount}</td>

												<c:choose>
													<c:when
														test="${empty inv.amountpaid  && empty inv.dueAmount }">
														
														
														<td>0</td>
														<td>${inv.invoiceAmount}</td>
														<c:choose>
														<c:when test='${roleid==2||roleid==1}'>
														 <td><button type="button" class="btn btn-info btn-sm"
																data-toggle="modal" data-target="#invoicePaymentModal"
																onclick="payInvoice('${inv.invid}','${inv.unitno}','${inv.month}','${inv.year}','${inv.invoiceAmount}','${inv.amountpaid}','${inv.dueAmount}','${inv.paidby}','${inv.ownerid}','${inv.tenantid}')">Pay</button></td>
													
													
													 </c:when>
													 <c:otherwise>
													 <td>Pay</td>
													 
													 </c:otherwise>
													</c:choose>
													 	<!-- <td>Pay</td> -->
													 </c:when>
													
													<c:when test="${inv.invoiceAmount==inv.amountpaid}">

														<td>${inv.amountpaid}</td>
														<td>${inv.dueAmount}</td>
														<!--<td>Paid</td>-->
														<c:choose>
														<c:when test='${roleid==2||roleid==1}'>
														
														 <td><button type="button" class="btn btn-info btn-sm">Paid</button></td> 
													
													</c:when>
													<c:otherwise> <td>Paid</td></c:otherwise>
													</c:choose>
													</c:when>
													<c:otherwise>
														<td>${inv.amountpaid}</td>
														<td>${inv.dueAmount}</td>
														<c:choose>
														<c:when test='${roleid==2||roleid==1}'>
														 <td><button type="button" class="btn btn-info btn-sm"
																data-toggle="modal" data-target="#invoicePaymentModal"
																onclick="payInvoice('${inv.invid}','${inv.unitno}','${inv.month}','${inv.year}','${inv.invoiceAmount}','${inv.amountpaid}','${inv.dueAmount}','${inv.paidby}','${inv.ownerid}','${inv.tenantid}')">Partial
																Paid</button></td> 
																</c:when>
																<c:otherwise>
																<td>Partial Paid</td>
																</c:otherwise>
																</c:choose>
													</c:otherwise>
													
													</c:choose>
												

												<td><button type="button"
														class="btn btn-outline-info btn-sm custnBtn"
														data-toggle="modal" data-target="#viewInvoiceModal"
														onclick="viewInvoice('${inv.invid}','${inv.upiid}','${inv.bankAcntNo}','${inv.ifscCode}','${inv.accountname}','${inv.dueAmount}','${inv.invoiceAmount}','${inv.amountpaid}')">
														<i class="fa fa-eye"></i>
													</button>
																		<c:choose>
													
													<c:when
														test="${empty inv.amountpaid  && empty inv.dueAmount }">
														<c:if test="${roleid eq  1 || roleid eq  2}">
														<button type="button"
														class="btn btn-outline-info btn-sm custnBtn"
														data-toggle="modal" data-target="#editInvoiceModal"
														onclick="editInvoice('${inv.invid}')">
														<i class="fa fa-edit"></i>
													</button></c:if>
													</c:when>

													 <%-- data-target="#editInvoiceModal"
														onclick="editInvoice('${inv.invid}')" --%>
													<c:otherwise>
														<!-- <button type="button"
														class="btn btn-outline-info btn-sm custnBtn"
														data-toggle="modal">
														<i class="fa fa-edit"></i>
													</button> -->
													</c:otherwise>
												</c:choose>
													
													
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
						<div class="modal-body" id="addModalBody">
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
																				<td><input type="radio" id="chkBox${asset.assetid}"
																					name="chkBox"></td>

																				<td>${prptyName}</td>
																				<td ><span >${asset.occ_by}</span></td>
																			 <td ><p>${asset.ownerid}</p></td>
																				<td ><h5>${asset.tenantId}</h5></td> 
																				<td><input type="hidden" id="flatnoNew${asset.assetid}"
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
																Diesel </label>
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
																	<th scope="row">Diesel</th>
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
							<button type="button" class="btn btn-info btn-sm" id="savebutton"
								onclick="saveInvoiceFun()">
								<i class="fa fa-save"></i> Save
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
																<input type="hidden" id="vi_ownerid" name="vi_ownerid"
																class="form-control" readonly>
																<input type="hidden" id="vi_tntid" name="vi_tntid"
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
																	placeholder="Ex:Unit" class="form-control" >
																	<input type="hidden" id="vi_invDate" id="vi_invDate"
																	 class="form-control" >
																	<input type="hidden" id="vi_prptyName" id="vi_prptyName"
																	 class="form-control" value="${prptyName}" >
																	<input type="hidden" id="vi_prptyid" id="vi_prptyid"
																	 class="form-control" value="${prptyid}" >
																	<input type="hidden" id="vi_invid" id="vi_invid"
																	 class="form-control"  >
																	 
													<input type="hidden" class="form-control" id="p_upval">
													
													<input type="hidden" class="form-control" id="p_bacnumber">
													
													<input type="hidden" class="form-control" id="p_icode">
													
													<input type="hidden" class="form-control" id="p_acname">
													<input type="hidden" class="form-control" id="p_invoiceAmount">
													
													<input type="hidden" class="form-control" id="p_dueAmount">
																
															</div>

															<div class="col"></div>
														</div>

													</div>

													<div class="form-group">
														<label for="exampleFormControlTextarea1"
															class="form-control-label">Comments</label>
														<textarea class="form-control"
															 rows="3" id="vi_comment"></textarea>
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
																		<tr>
																		
																		
																			<th scope="row"></th>
																			<td></td>
																			<td></td>
																			<td><b><span class="vi_totalData">Amount Paid</span></b></td>
																			<td><span class="vi_totalData"
																				id="vi_amountPaidspan"></span></td>
																			
																				
																		</tr>
																		<tr>
																			<th scope="row"></th>
																			<td></td>
																			<td></td>
																			
																			<td><b><span class="vi_totalData">Due Amount</span></b></td>
																			<td><span class="vi_totalData"
																				id="vi_amountDuespan"></span></td>
																				
																		</tr>
																		
																		
																		
																	</tbody>
																</table>
															</div>
														</div>

														
														<br>
												<div class="row" id="QRscanDiv">
														<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
															<div class="row">
																<div class="col">
																	<div class="card">
																		<div class="card-header">
																			<strong class="card-title">Pay Using BHIM
																				UPI </strong>
																		</div>
																		<div class="card-body" id="payid"
																			style="background-color: #ffc10726">
																			<div class="form-check form-check-inline"
																				id='bhimDiv' style='display:inline;color:blue;'>
																				
																			</div>
																				
																			<div class="bhimupi">

																				<div id="qrCode"></div>

																			</div><br>
																		</div>
<div class="form-check form-check-inline">
																			
																	 <div><a type="href" onclick="getUpi('${prptyid}')" style='background: #ff912f;border: 2px solid #8a4100;padding: 10px;text-decoration: none;color: white;font-size: larger;border-radius: 10px;'>Pay using UPI</a></div>
																	</div>
																	<!--  <div><a href='apinew?uri=upi://pay?pa=kiran.ravi0908@ybl&pn=ravikiran&am=58&cu=INR' id='__UPI_BUTTON1__' style='background: #ff912f;border: 2px solid #8a4100;padding: 10px;text-decoration: none;color: white;font-size: larger;border-radius: 10px;'>Pay </a></div> -->
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
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info btn-sm"
								id="downloadInvPdf" onclick="getInvoicePDF()"><i class="fa fa-download"></i></button> 
							<button type="button" class="btn btn-info btn-sm" onclick="sendInvoiceMail()">
								<i class="fa fa-envelope-o" ></i> Mail
							</button>
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
																			for="Ed_invoiceEditDissel"> Diesel </label>
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
																			<th scope="row">Diesel</th>
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
				<form action="savePayment" method='POST' onsubmit="return checkForm(this);">
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
												<input type="hidden" class="form-control" id="prptyid_pay"
													name="prptyid_pay" value='${prptyid}'> <input
													type="hidden" class="form-control" id="prptyName"
													name="prptyName" value='${prptyName}'>
													 <input
													class="form-control" id="payDate" name="payDate" >
													
											</div>
										</div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Payment
												period</label>
											<div class="input-group">
												<input class="form-control" id="payPeriod" name="payPeriod" readonly>
											</div>
										</div>

										<div class="form-group">
											<label for="company" class=" form-control-label">Invoice
												ID</label>
											<div class="input-group">
												<input class="form-control" id="InvId" name="InvId" readonly>
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
												<input class="form-control" id="paidBy" name="paidBy" readonly >
											</div>
										</div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Unit
												No</label>
											<div class="input-group">
												<input class="form-control" id="unitNo_pay"
													name="unitNo_pay" readonly>
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
													name="totalAmount" readonly>
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
												<label for="company" class=" form-control-label">Payment Type</label>
												
												<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" >
  <label class="form-check-label" for="inlineRadio1">Cash</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
  <label class="form-check-label" for="inlineRadio2">Online</label>
</div>
<div class="form-check form-check-inline" id='bhimDiv'>
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
  <label class="form-check-label" for="inlineRadio3">BHIM UPI</label>
</div>

									</div>
									
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-info btn-sm" id="savebuttonpay">Save</button>
						<button type="button" class="btn btn-secondary btn-sm"
							onclick="closeModal()">Close</button>

					</div>
				</form>
			</div>
		</div>
	</div>

	
	
	<div class="clearfix"></div>
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="resources/js/EditInvoice.js"></script>
	<script type="text/javascript" src="resources/js/AddInvoice.js"></script>
	<script type="text/javascript" src="resources/js/ViewInvoice.js"></script>
	<script type="text/javascript" src="resources/js/Qrcode.js"></script>
	<script type="text/javascript" src="resources/js/Qrcode.min.js"></script>
	
	<script>
$('#QRscanDiv').hide();
	$(document).ready(function() {
		  $("#invoiceAddModal").on("hidden.bs.modal", function() {
		    $("#addModalBody").html("");
		  });
		});

	
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
	
		 	return premonth;
		 	}
	var months = [
		 	'January', 'February', 'March', 'April', 'May',
		 	'June', 'July', 'August', 'September',
		 	'October', 'November', 'December'
		 	];



	
	
	</script>


<script type="text/javascript">
	$(".bhimupi").hide();
	$("#payid").show();
	
	$("#savebutton").on('click', function (event) {  
        event.preventDefault();
        var el = $(this);
        el.prop('disabled', true);
        setTimeout(function(){el.prop('disabled', false); }, 3000);
  });
	/* $("#savebuttonpay").on('click', function (event) {  
        event.preventDefault();
        var el = $(this);
        el.prop('disabled', true);
        setTimeout(function(){el.prop('disabled', false); }, 3000);
  }); */
  function checkForm(form)
  {
    
    form.savebuttonpay.disabled = true;
    form.savebuttonpay.value = "Please wait...";
    return true;
  }
function getUpi(prtyid){	
	var invid =  $("#vi_invid").val();
	/*var invAmount =  $("#p_invoiceAmount").val();
	var dueAmount =  $("#p_dueAmount").val();
	var invAmount1;
	if(dueAmount!=''){
		invAmount1=dueAmount;
	}else{
		invAmount1=invAmount;
	}
	*/ 
	/* window.location.href="http://localhost:8081/Maa/apinew?prtyid="+prtyid+"&invoiceid="+invid+"&invoiceamt="+invAmount1+""; */
	//window.location.href="http://maaproperties.com/apinew?prtyid="+prtyid+"&invoiceid="+invid+"&invoiceamt="+invAmount1+"";//production URL	
	  var accNumber = $("#p_bacnumber").val();
	  var invAmount = $("#invAmount").val();
	  var accIFSC = $("#p_icode").val();
	  var accName = $("#p_acname").val();
	  var upi=$('#p_upval').val();
	  var dueAmount=$('#p_dueAmount').val();
	  var invoiceAmount=$('#p_invoiceAmount').val();	
      var invAmount;

if(dueAmount==0){
invAmount=invoiceAmount;
}else{
invAmount=dueAmount;
}
if(accNumber!=''&&accIFSC!=''){
	var url="upi://pay?pa=" + accNumber + "@" + accIFSC +".ifsc.npci&pn=" + accName + "&tn=INV" + invid + "&mam=0.01&am="+invAmount+"&cu=INR";
	window.open(url);	
}else if(upi!=''){
	var url="upi://pay?pa=" + upi + "&pn=" + accName + "&tn=INV" + invid + "&mam=0.01&am="+invAmount+"&cu=INR";
	window.open(url);
	  } 		
}

	/* $(function () {
        $("#chkBoxpay").click(function () {
            if ($(this).is(":checked")) {
            	
        		$( "#qrCode").empty();
        		genQrCode();
        		$(".bhimupi").show();
            } else {
            	alert("no");
        		$(".bhimupi").hide();
            }
        });
    }); */


	
/* 		function genQrCode() {
			
			   var accNumber = $("#p_bacnumber").val();
			   var invAmount = $("#invAmount").val();
			  var accIFSC = $("#p_icode").val();
			  var accName = $("#p_acname").val();
			var upi=$('#p_upval').val();
			var dueAmount=$('#p_dueAmount').val();
			var invoiceAmount=$('#p_invoiceAmount').val();	


var invAmount;
			
	 var str;
		 // var  str="upi://pay?pa=kiran.ravi0908@ybl&pn=" + accName + "&mam=0.01&am="+invAmount+"&cu=INR";;
		   
if(dueAmount==0){
	invAmount=invoiceAmount;
}
else{
	invAmount=dueAmount;
}
		  
		  if(accNumber!=''&&accIFSC!=''){
			
		   str="upi://pay?pa=" + accNumber + "@" + accIFSC +".ifsc.npci&pn=" + accName + " &mam=0.01&am="+invAmount+"&cu=INR";
		  }else if(upi!=''){
			 
			   str="upi://pay?pa=" + upi + "&pn=" + accName + "&mam=0.01&am="+invAmount+"&cu=INR";
			  }
		var qrcode = new QRCode(document.getElementById("qrCode"), {
			text: str,
			width: 128,
			height: 128,
			colorDark : "#000000",
			colorLight : "#ffffff",
			correctLevel : QRCode.CorrectLevel.H
		});
		
		}	 */

		

</script>


</body>

</html>