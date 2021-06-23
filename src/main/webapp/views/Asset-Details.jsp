<!doctype html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MPRTS|Asset-Dashboard</title>
<meta name="description" content="Maa Properties">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="#">

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
	/*
            margin-left: 3%;
            margin-right: 3%;
*/
	box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0
		rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
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

.form-group select {
	font-size: 13px;
}

/* .fixed-table-toolbar {
	float: left;
} */
#assetTable button i {
	font-size: 17px;
	color: #000;
}

#assetTable button i:hover {
	color: #fff;
}

#assetTable button.custnBtn {
	border-color: transparent;
}
</style>
<style>
.assetTablist .nav-pills .nav-item {
	width: 33.33% !important;
}

.modal-header {
	background-color: #17a2b8;
}

.modal-header h5 {
	color: #fff;
	font-size: 15px;
	font-weight: 600
}

.fixed-table-toolbar .dropdown-menu.show {
	top: 100% !important;
}

.fixed-table-toolbar .dropdown-menu.show {
	width: 160px !important;
}

.fixed-table-toolbar .dropdown-menu>li>a {
	display: block;
	padding: 3px 20px !important;
	clear: both;
	font-weight: 400;
	line-height: 1.42857143;
	color: #333;
	white-space: nowrap;
	font-size: 13px;
}

.fixed-table-toolbar .dropdown-menu>li>label {
	display: block;
	padding: 3px 20px !important;
	clear: both;
	font-weight: 400;
	line-height: 1.42857143;
	color: #333;
	white-space: nowrap;
	font-size: 13px;
}

.pull-right.pagination {
	display: table !important;
}

.close {
	color: #fff !important
}
</style>
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 51px;
	height: 20px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.sliderBtn {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.sliderBtn:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 0px;
	bottom: -2px;
	background-color: #fff;
	box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.4);
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.sliderBtn {
	background-color: #17a2b8;
}

input:focus+.sliderBtn {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.sliderBtn:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.sliderBtn.round {
	border-radius: 34px;
}

.sliderBtn.round:before {
	border-radius: 50%;
}
.table td{
border-top:0px!important;
}
</style>
</head>
<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="resources/img/logo/rounded_logo.png" alt="">
	</div>


	<!-- Content -->
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Assets List</strong>
								</div>
								<c:if test='${(roleid==2||roleid==1)}'>
								<c:if test='${assetCount lt unitCount}'>
								
									<div class="col-4">
										<div class="addButton" id="assetPlusAdd" style="float: right">
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="modal" id="modalClose" data-target="#addAssetModal">
												<i class="fa fa-plus"></i>
											</button>
										</div>
										
									</div>
									</c:if>
								</c:if>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="assetTable" class="text-center" data-toggle="table"
									data-pagination="true" data-search="true"
									data-show-columns="true" data-show-pagination-switch="true"
									data-show-refresh="true" data-key-events="true"
									data-show-toggle="true" data-resizable="true"
									data-cookie="true" data-cookie-id-table="saveId"
									data-show-export="true" data-click-to-select="true"
									data-toolbar="#toolbar">
									<thead class="text-center">
										<tr>
											<th scope="col">Asset ID</th>
											<!-- <th id="prptyName">Property Name</th> -->
											<th scope="col">Unit No</th>
											<th scope="col">Type</th>
											<th scope="col">Rent</th>
											<th scope="col">Maintenance</th>
											<th scope="col">Water Meter</th>
											<th scope="col">Current Meter</th>
											<th scope="col">Desiel Meter</th>
											<th scope="col">Ac Meter</th>
											<th scope="col">Gas Meter</th>
											<th scope="col">Other Meter</th>
											<th scope="col" class="custmheight">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="asset" items="${assetList}">

											<tr>
												<td>AST00${asset.assetid}</td>
												<%-- <td>${prptyName}</td> --%>
												<td>${asset.flatno}</td>
												<td>${asset.asttype}BHK</td>
												<td>${asset.rent}</td>
												<td>${asset.maintenance}</td>
												<td>${asset.watermeter}</td>
												<td>${asset.curmeterno}</td>
												<td>${asset.desselmeter}</td>
												<td>${asset.acmeter}</td>
												<td>${asset.gasmeter}</td>
												<td>${asset.othMeter}</td>
												<td><button type="button"
														class="btn btn-outline-info custnBtn btn-sm"
														data-toggle="modal" data-target="#viewAssetModal"
														onclick="viewAsset('${asset.assetid}','${asset.flatno}','${asset.prtyid}','${asset.userd}','${prptyName}'
                                            ,'${asset.asttype}','${asset.rent}' ,'${asset.maintenance}','${asset.watermeter}','${asset.curmeterno}',
                                                '${asset.desselmeter}','${asset.acmeter}','${asset.gasmeter}','${asset.othMeter}','${asset.areasqft}','${asset.prtytax}','${asset.secBill}','${asset.occ_by}','${asset.status}')">
														<i class="fa fa-eye"></i>
													</button> <c:if test='${roleid==2||roleid==1}'>
														<button type="button"
															class="btn btn-outline-info custnBtn btn-sm"
															data-toggle="modal" data-target="#EditAssetModal"
															onclick="editAsset('${asset.assetid}','${asset.flatno}','${asset.prtyid}','${asset.userd}','${prptyName}','${asset.asttype}','${asset.rent}' ,
                                                '${asset.maintenance}','${asset.watermeter}','${asset.curmeterno}','${asset.desselmeter}','${asset.acmeter}','${asset.gasmeter}','${asset.othMeter}','${asset.areasqft}','${asset.prtytax}','${asset.secBill}')">
															<i class="fa fa-edit"></i>
														</button>
													</c:if> <!--  <button type="button" class="btn btn-outline-info custnBtn btn-sm"><i class="fa fa-trash-o"></i></button> -->
												</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- Add Asset Modal -->
				<div class="modal fade" id="addAssetModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Asset</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="SaveAssetDetils" method="POST" id="addForm">
								<div class="modal-body" id="addModalbody">

									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class="card">
												<div class="card-header">
													<strong>Asset Details</strong>
												</div>

												<div class="card-body card-block">
													<div class="form-group">
														<input type="hidden" id="prtyId" name="prtyId"
															placeholder="Ex:PTY1" value="${prptyid}"
															class="form-control"> <input type="hidden"
															id="prtyName" name="prtyName" placeholder="Ex:PTY1"
															value="${prptyName}" class="form-control"> <label
															for="company" class=" form-control-label">Unit No<span style="color:red;">*</span></label>
														<input type="text" id="unitNo" name="unitNo"
															placeholder="Unit No" class="form-control" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" 
															onchange="checkAsset('${prptyid}')" required>
															
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Type/Beds<span style="color:red;">*</span></label>
														<input type="number" id="roomType" name="roomType" 
															placeholder="Ex:2(BHK)" class="form-control" required>
													</div>



													<div class="form-group">
														<label for="company" class=" form-control-label">Property
															Tax Number</label> <input type="text" id="prtytax" name="prtytax"
															placeholder="Property Tax ID" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Area(Sqft)<span style="color:red;">*</span></label>
														<input type="text" id="areSqft" name="areSqft"
															placeholder="Area" class="form-control" pattern="^[0-9]*$" required   >
													</div>

												</div>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class="card">
												<div class="card-header">
													<strong>Bill Details</strong>
												</div>
												<div class="card-body card-block">


													<div class="form-group">
														<div class="row">
															<div class="col-12">
																<label for="company" class="form-control-label">Rent</label>
																<input type="text" id="rent" name="rent"
																	placeholder="Rent" class="form-control" pattern="^[0-9]*$">

															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-12">
																<label for="company" class="form-control-label">Maintenance<span style="color:red;">*</span></label>
																<input type="text" id="maintanance" name="maintanance"
																	placeholder="Ex:2000" class="form-control" pattern="^[0-9]*$" required>
																<small>(SQFT * Price = Total)</small>
															</div>
														</div>
													</div>
													
												</div>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class="card">
												<div class="card-header">
													<strong>Meter Details</strong>
												</div>
												<div class="card-body card-block">
													<div class="form-group">
														<label for="company" class=" form-control-label">Water
															Meter</label> <input type="text" id="wtrMeter" name="wtrMeter"
															placeholder="Water Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Current
															Meter</label> <input type="text" id="curMeter" name="curMeter"
															placeholder="Current Number" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Dessel
															Meter</label> <input type="text" id="dslMeter" name="dslMeter"
															placeholder="Dessel Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">AC
															Meter</label> <input type="text" id="acMeter" name="acMeter"
															placeholder="Ac Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Gas
															Meter</label> <input type="text" id="gasMeter" name="gasMeter"
															placeholder="Gas Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Other
															Meters</label> <input type="text" id="othMeter" name="othMeter"
															placeholder="Other Meter" class="form-control">
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info btn-sm"
										id="submitasset">
										<i class="fa fa-save"></i>&nbsp;Save
									</button>
									<button type="button" class="btn btn-secondary btn-sm"
										data-dismiss="modal">
										<i class="fa fa-times"></i>&nbsp;Close
									</button>

								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- View Asset Modal -->
				<div class="modal fade" id="viewAssetModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Flat
									Details-508</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">

								<div class="row">
									<div class="col">
										<div class="assetTablist">
											<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
												<li class="nav-item"><a class="nav-link active"
													id="pills-address-tab" data-toggle="pill"
													href="#pills-address" role="tab"
													aria-controls="pills-address" aria-selected="true">Asset
														Info</a></li>
												<li class="nav-item"><a class="nav-link"
													id="pills-payments-tab" data-toggle="pill"
													href="#pills-payments" role="tab"
													aria-controls="pills-payments" aria-selected="false">Payments</a>
												</li>
												<li class="nav-item"><a class="nav-link"
													id="pills-expence-tab" data-toggle="pill"
													href="#pills-expence" role="tab"
													aria-controls="pills-expence" aria-selected="false">Expense</a>
												</li>
											</ul>
										</div>
										<div class="tab-content" id="pills-tabContent">
											<div class="tab-pane fade show active" id="pills-address"
												role="tabpanel" aria-labelledby="pills-address-tab">
												<div class="row">
													<div class="col-md-4">
														<div class="card">
															<div class="card-header">
																<strong>Asset Info</strong>
															</div>
															<div class="card-body card-block">
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Property
																			Name:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="iprtyname"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Unit No:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="iflatNo"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Type:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="iroomType"></p>
																	</div>
																</div>

																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">SQFT:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="iareaSqft"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Property
																			Tax No:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="iprtyTax"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Occupied By
																			:</label>
																	</div>
																	<div class="col col-md-7">
																		<h4>
																			<span style="font-size: 14px;"
																				class="badge badge-info" id="iunitStatus"></span>
																		</h4>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="card">
															<div class="card-header">
																<strong>Meter Details</strong>
															</div>
															<div class="card-body card-block">
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Maintenance:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="imaintenance"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Rent:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="irent"></p>
																	</div>
																</div>

																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Water Meter
																			:</label>
																	</div>
																	<div class="col col-md-7">
																		<p class="form-control-static" id="iwtrMtr"></p>
																	</div>
																</div>


															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="card">
															<div class="card-header">
																<strong>Meter Details</strong>
															</div>
															<div class="card-body card-block">
																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label"> Current
																			Meter :</label>
																	</div>
																	<div class="col col-md-6">
																		<p class="form-control-static" id="icurMtr"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label"> Gas Meter:</label>
																	</div>
																	<div class="col col-md-6">
																		<p class="form-control-static" id="igasMtr"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label"> AC Meter :</label>
																	</div>
																	<div class="col col-md-6">
																		<p class="form-control-static" id="iacMtr"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label"> Dissel
																			Meter :</label>
																	</div>
																	<div class="col col-md-6">
																		<p class="form-control-static" id="idslMtr"></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label">Other Meter
																			:</label>
																	</div>
																	<div class="col col-md-6">
																		<p class="form-control-static" id="iothMtr"></p>
																	</div>
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" id="pills-payments"
												role="tabpanel" aria-labelledby="pills-payments-tab">

												<div class="card">

													<div class="card-body">
														<div class="table-responsive">
															<table class="table table-striped  text-center">
																<tr>
																	<th>Invoice ID</th>
																	<th>Unit No</th>
																	<th>Actual Amount</th>
																	<th>Amount Paid</th>
																	<th>Due Amount</th>
																	<th>Payment Status</th>
																</tr>
																
															</table>
														</div>
													</div>
												</div>

											</div>
											<div class="tab-pane fade" id="pills-expence" role="tabpanel"
												aria-labelledby="pills-expence-tab">

												<div class="card">

													<div class="card-body">
														<div class="table-responsive">
															<table class="table table-striped  text-center">
																<tr>
																	<th>Expense ID</th>
																	<th>Expense Amount</th>
																	<th>Expense Date</th>
																	<th>Expense Cause</th>
																	<th>Description</th>
																</tr>
																
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
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!--  Edit AssetModel-->
				<div class="modal fade" id="EditAssetModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Asset</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<form action="updateAssetDetils" method="POST">
								<div class="modal-body">

									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class="card">
												<div class="card-header">
													<strong>Asset Details</strong>
												</div>

												<div class="card-body card-block">
													<div class="form-group">
														<input type="hidden" id="EprtyId" name="EprtyId"
															placeholder="Ex:PTY1" value="${prptyid}"
															class="form-control"> <input type="hidden"
															id="Eassetid" name="Eassetid" class="form-control">
														<input type="hidden" id="EprtyName" name="EprtyName"
															class="form-control"> <label for="company"
															class=" form-control-label">Unit No<span style="color:red;">*</span></label> <input
															type="text" id="EunitNo" name="EunitNo" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
															placeholder="Unit No" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Type/Beds<span style="color:red;">*</span></label>
														<input type="number" id="EroomType" name="EroomType" required
															placeholder="Ex:2(BHK)" class="form-control">
													</div>



													<div class="form-group">
														<label for="company" class=" form-control-label">Property
															Tax Number</label> <input type="text" id="EprtyTax"
															name="Eprtytax" placeholder="Property Tax ID"
															class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Area(Sqft)<span style="color:red;">*</span></label>
														<input type="text" id="EareSqft" name="EareSqft" required
															placeholder="Area" class="form-control">
													</div>

												</div>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class="card">
												<div class="card-header">
													<strong>Bill Details</strong>
												</div>
												<div class="card-body card-block">


													<div class="form-group">
														<div class="row">
															<div class="col-12">
																<label for="company" class="form-control-label">Rent</label>
																<input type="text" id="Erent" name="Erent"
																	placeholder="Rent" class="form-control" pattern="^[0-9]*$">

															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-12">
																<label for="company" class="form-control-label">Maintenance<span style="color:red;">*</span></label>
																<input type="text" id="Emaintanance" name="Emaintanance"
																	placeholder="Ex:2000" class="form-control" pattern="^[0-9]*$" required> <small>(SQFT
																	* Price = Total)</small>
															</div>
														</div>
													</div>
													
												</div>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class="card">
												<div class="card-header">
													<strong>Meter Details</strong>
												</div>
												<div class="card-body card-block">
													<div class="form-group">
														<label for="company" class=" form-control-label">Water
															Meter</label> <input type="text" id="EwtrMeter" name="EwtrMeter"
															placeholder="Water Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Current
															Meter</label> <input type="text" id="EcurMeter" name="EcurMeter"
															placeholder="Current Number" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Dessel
															Meter</label> <input type="text" id="EdslMeter" name="EdslMeter"
															placeholder="Dessel Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">AC
															Meter</label> <input type="text" id="EacMeter" name="EacMeter"
															placeholder="Ac Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Gas
															Meter</label> <input type="text" id="EgasMeter" name="EgasMeter"
															placeholder="Gas Meter" class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Other
															Meters</label> <input type="text" id="EothMeter" name="EothMeter"
															placeholder="Other Meter" class="form-control">
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info btn-sm">
										<i class="fa fa-save"></i>&nbsp;Save
									</button>
									<button type="button" class="btn btn-secondary btn-sm"
										data-dismiss="modal">
										<i class="fa fa-times"></i>&nbsp;Close
									</button>

								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- .animated -->
			</div>
			<!-- /.content -->
			<div class="clearfix"></div>
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$('#modalClose').on('click',function(){
$('#addForm').trigger("reset");
});
</script>
	


	<script>
 function viewAsset(assetid,flatno,prtyid,userid,prtyname,asttype,rent ,
          maintenance,watermeter,curmeterno,desselmeter,acmeter,gasmeter,othMeter,areasqft,prtytax,secBill,occ_by,status){

				var occupiedBy='';
	            $("#irent").text(rent);
	            $("#imaintenance").text(maintenance);
	            if(occ_by=='O'){
	            	occupiedBy=' Owner';
		            }
	            else if(occ_by=='T'){
	            	occupiedBy=' Tenant';
		            }
	            else if(occ_by=='V'){
	            	occupiedBy='Vacant';
		            }
	            if(status==1){
	            $("#iunitStatus").text(occupiedBy);
	            }
	            else{$("#iunitStatus").text('Available');}
	            $("#iprtyTax").text(prtytax);
	            $("#iareaSqft").text(areasqft);
	            $("#iroomType").text(asttype+'BHK');

	            $("#iflatNo").text(flatno);
	           
	           $("#iprtyname").text(prtyname);
	           
	            $("#igasMtr").text(gasmeter);
	            $("#idslMtr").text(desselmeter);
	            $("#iacMtr").text(acmeter);
	            $("#iothMtr").text(othMeter);
	            $("#icurMtr").text(curmeterno);
	            $("#iwtrMtr").text(watermeter);
	       
	   
   }
   function editAsset(assetid,flatno,prtyid,userd,prptyName,asttype,rent ,maintenance,watermeter,curmeterno,
		   desselmeter,acmeter,gasmeter,othMeter,areasqft,prtytax,secBill){

	   $("#Erent").val(rent);
       $("#Emaintanance").val(maintenance);
     
       $("#EprtyTax").val(prtytax);
       $("#EareSqft").val(areasqft);
       $("#EroomType").val(asttype);

       $("#EunitNo").val(flatno);
      
    
       //Other Meters
       $("#EgasMeter").val(gasmeter);
       $("#EdslMeter").val(desselmeter);
       $("#EacMeter").val(acmeter);
       $("#EothMeter").val(othMeter);
       $("#EcurMeter").val(curmeterno);
       $("#EwtrMeter").val(watermeter);
      /*  $("#EsecBill").val(secBill); */
       $("#Eassetid").val(assetid);
       $("#EprtyName").val(prptyName);
       


	       }
   function checkAsset(prtyid){
var asset= $("#unitNo").val();
$.ajax({
    type: "get",
    url: "getAssetByFlat?flatno="+asset+"&prtyid="+prtyid,
    cache: false,
    async: false,               
    success: function(response){  
              if(response!=''){
        	 alert(asset+" already added pls change "); 
        	 $('#submitasset').attr("disabled",true);
            }
        else{
        	$('#submitasset').attr("disabled",false);
            }
         },
    error: function(){                                                                                 
    }                                                       
});      

	   
	   }
   </script>

</body>
</html>