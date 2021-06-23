<!doctype html>

<html class="no-js" lang="">

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
			
			box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
		}


		.nav-pills li a {
			color: #274552;
			font-size: 13px;
			text-align: center;
			text-transform: uppercase;
		}

		.nav-pills .nav-item {
			width: 33.33%;
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

		.fixed-table-toolbar {
			float: left;
		}

		#tenantDetailsTable button i {
			font-size: 17px;
			color: #000;
		}

		#tenantDetailsTable button i:hover {
			color: #fff;
		}

		#tenantDetailsTable button.custnBtn {
			border-color: transparent;
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

		.owner-image img {
			width: 120px;
			height: 120px;
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

		.profilePic .nav-pills .nav-item {
			width: 50%;
		}

		.owner-image img {
			width: 130px;
			height: 130px;
		}

		#ownerViewModal .modal-body {
			padding: 0px !important;
		}
	</style>
</head>

<body>
	<!-- Left Panel -->
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
									<strong class="card-title">Tenant List</strong>
								</div>
								 <c:if test='${roleid==2||roleid==1}'>
								<div class="col-4">
									<div class="addButton" id="tenantPlusAdd" style="float: right">
										<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#tenantAddModal"><i class="fa fa-plus"></i></button>
									</div>
								</div>
								</c:if>
							</div>



						</div>
						<div class="card-body">
							<table id="tenantDetailsTable" class="text-center table-borderless" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
								<thead>
									<tr>
										<th>Tenant ID</th>
										<th>Tenant Name</th>
										<th>Owner</th>
										<th>Unit No</th>
										<th>Mobile</th>
										<th>Email</th>
										<th>End Date</th>
										<th>Status</th>
										<th class="custmheight">Action</th> 
									</tr>
								</thead>
								<tbody>
								
								
								<c:forEach var="tntlist" items="${tenantList}">
                                    
                                        <tr>
											<td>TNT00${tntlist.tbl_id}</td>
											<td>${tntlist.tenant_name}</td>
											<td>${tntlist.ownerName}</td>
											<td>${tntlist.flat}</td>
											<td>${tntlist.tenant_contact}</td>
											<td>${tntlist.tenant_email}</td>
											<td>${tntlist.end_date}</td>
											<c:if  test="${tntlist.status==0}">
											<td>In-Active</td></c:if>
											<c:if  test="${tntlist.status==1}">
											<td>Active</td></c:if>
											
											 <td><button type="button" class="btn btn-outline-info btn-sm custnBtn" 
											data-toggle="modal" data-target="#viewTenantModal" 
											onclick="viewTenant('${tntlist.tbl_id}','${tntlist.flat}','${tntlist.tenant_name}','${tntlist.tenant_contact}',
											'${tntlist.tenant_email}','${tntlist.address}','${tntlist.ownerName}'
											,'${tntlist.advamount}','${tntlist.join_date}','${tntlist.end_date}','${tntlist.comments}','${tntlist.imgName}','${tntlist.imgIdName}')"><i class="fa fa-eye"></i></button>
											 <c:if test='${roleid==2||roleid==1}'>
											<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal"
											 data-target="#tenantEditModal" onclick="EditTenant('${tntlist.tbl_id}','${tntlist.flat}',
											 '${tntlist.tenant_name}','${tntlist.tenant_contact}','${tntlist.tenant_email}',
											 '${tntlist.address}','${tntlist.ownerName}','${tntlist.advamount}','${tntlist.join_date}',
											 '${tntlist.end_date}','${tntlist.comments}','${tntlist.status}',
											'${tntlist.id_number}','${tntlist.imgName}','${tntlist.imgIdName}','${prptyid}')">
											<i class="fa fa-edit"></i></button>
											
											<button type="button" class="btn btn-outline-info btn-sm custnBtn"
											 onclick="deleteTenant('${tntlist.tbl_id}','${prptyid}')"><i class="fa fa-trash-o"></i></button></c:if></td>
										</tr>
										</c:forEach>
								
								
						
									


								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<!--Tenant ID Modal popup Start here-->

				<div class="modal fade" id="viewTenantModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Tenant Info - <span id="v_tenant_name"></span></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div> 
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<div class="tenantIDtablist">
											<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
												<li class="nav-item">
													<a class="nav-link active" id="pills-Details-tab" data-toggle="pill" href="#pills-Details" role="tab" aria-controls="pills-flats" aria-selected="false">Details</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" id="pills-Payments-tab" data-toggle="pill" href="#pills-Payments" role="tab" aria-controls="pills-address" aria-selected="true">Invoice</a>
												</li>

												<li class="nav-item">
													<a class="nav-link" id="pills-Tenants-tab" data-toggle="pill" href="#pills-Tenants" role="tab" aria-controls="pills-payments" aria-selected="false">Expense</a>
												</li>

											</ul>
										</div>

										<div class="tab-content" id="pills-tabContent">
											<div class="tab-pane fade show active" id="pills-Details" role="tabpanel" aria-labelledby="pills-Details-tab">
												<div class="row">
													<div class="col-md-4">
														<div class="card">
															<div class="card-header">
																<strong>Tenant Info</strong>
															</div>
															<div class="card-body card-block">

																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Unit No:</label></div>
																	<div class="col col-md-7">
																		<p class="form-control-static"><span id="v_flat"></span></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Name:</label></div>
																	<div class="col col-md-7">
																		<p class="form-control-static"><span id="tenant_name"></span></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Mobile No:</label></div>
																	<div class="col col-md-7">
																		<p class="form-control-static"><span id="v_tenant_contact"></span></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Email:</label></div>
																	<div class="col col-md-7">
																		<p class="form-control-static"><span id="v_tenant_email"></span></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-5">
																		<label class=" form-control-label">Address</label></div>
																	<div class="col col-md-7">
																		<p class="form-control-static"><span id="v_address"></span></p>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="card">
															<div class="card-header">
																<strong>Building & Address</strong>
															</div>
															<div class="card-body card-block">
																
																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label">Owner Name:</label></div>
																	<div class="col col-md-6">
																		<p class="form-control-static"><span id="v_ownerName"></span></p>
																	</div>
																</div>


															</div>

														</div>
													</div>

													<div class="col-md-4">
														<div class="card">
															<div class="card-header">
																<strong>ID Details</strong>
															</div>
															<div class="card-body card-block">

																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label">Advance Amount Paid:</label></div>
																	<div class="col col-md-6">
																		<p class="form-control-static"><span id="v_advamount"></span></p>
																	</div>
																</div>

																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label">Joining Date :</label></div>
																	<div class="col col-md-6">
																		<p class="form-control-static"><span id="v_join_date"></span></p>
																	</div>
																</div>
																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label">Vacating Date:</label></div>
																	<div class="col col-md-6">
																		<p class="form-control-static"><span id="v_end_date"></span></p>
																	</div>
																</div>

																<div class="row">
																	<div class="col col-md-6">
																		<label class=" form-control-label">Comments:</label></div>
																	<div class="col col-md-6">
																		<p class="form-control-static"><span id="v_comments"></span></p>
																	</div>
																</div>

															</div>

														</div>
													</div>

													<div class="col-lg-7">
														<div class="profilePic mt-4">
															<div class="tab-content" id="pills-tabContent">
																<div class="tab-pane fade show active" id="pills-image" role="tabpanel" aria-labelledby="pills-image-tab">
																	<div class="owner-image text-center">
																		<img id="tntimage" class="img-fluid">
																	</div>
																</div>
																<div class="tab-pane fade" id="pills-houseImg" role="tabpanel" aria-labelledby="pills-idImg-tab">
																	<div class="tenant-img text-center">
																		<img id="tntimageId" class="img-fluid">
																	</div>
																</div>
															</div>
															<ul class="nav nav-pills my-3" id="pills-tab" role="tablist">
																<li class="nav-item">
																	<a class="nav-link active" id="pills-image-tab" data-toggle="pill" href="#pills-image" role="tab" aria-controls="pills-image" aria-selected="true">Image</a>
																</li>
																<li class="nav-item">
																	<a class="nav-link" id="pills-idImg-tab" data-toggle="pill" href="#pills-houseImg" role="tab" aria-controls="pills-profile" aria-selected="false">ID</a>
																</li>
															</ul>
														</div>
													</div>
											


												</div>
											</div>
											<div class="tab-pane fade" id="pills-Payments" role="tabpanel" aria-labelledby="pills-Payments-tab">
												<div class="card">
													<div class="card-header">
														<strong class="card-title">Invoice</strong>
													</div>
													<div class="card-body">
													<div class="table-responsive">
														<table class="table table-striped table-bordered text-center">
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
											<div class="tab-pane fade" id="pills-Tenants" role="tabpanel" aria-labelledby="pills-Tenants-tab">
												<div class="col">
													<div class="card">
														<div class="card-header">
															<strong class="card-title">Expense</strong>
														</div>
														<div class="card-body">
														<div class="table-responsive">
															<table class="table table-striped table-bordered text-center">
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
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!--Tenant ID modal popup Ends here-->


				<!--Tenant Add Details start Here-->
				<div class="modal fade" id="tenantAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content ">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add a New Tenant</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="AddTenant" method="POST" enctype="multipart/form-data" >
							<div class="modal-body">
								<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 mx-auto">
									<div class="card">
										<div class="card-header"><strong>Personal Details</strong></div>
										<div class="card-body card-block">
											<div class="row">
												<div class="form-group col">
													<label for="company" class=" form-control-label">Picture</label>
													<div class="custom-file">
														<!-- <input type="file" class="custom-file-input" id="customFileLangHTML"> -->
														<input type="file"  id="tenantImg" name="tenantImg">
														<!-- <label class="custom-file-label" for="customFileLangHTML" data-browse="Picture">Upload image(optional)</label> -->
													</div>
												</div>
											</div>
										 <input type="hidden" name="prtyId" id="prtyId" value="${prptyid}">
										<input type="hidden" name="prptyName" id="prptyName" value="${prptyName}">
										
											<div class="form-group">
												<label for="company" class=" form-control-label">Name<span style="color:red;">*</span></label>
												<input type="text" id="name" name="name" placeholder="Name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required>
											<span style="color:Red">Accepts Alphabets only</span>
											</div>
											<div class="form-group">
												<label for="company" class=" form-control-label">Email<span style="color:red;">*</span></label>
												<input type="text" id="email" name="email" placeholder="Email" class="form-control" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$"
												 required>
											</div>

											<div class="form-group">
												<label for="company" class=" form-control-label">Mobile No<span style="color:red;">*</span></label>
												<input type="text" id="phone" name="phone" placeholder="Mobile No" class="form-control"  minlength="10" maxlength="12" required pattern="^[0-9]*$" required>
												<span style="color:Red">Accepts number only</span>
											</div>

										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="card">
										<div class="card-header">
											<strong class="card-title">Address & Contacts</strong>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="company" class="form-control-label">Asset No<span style="color:red;">*</span></label>
												<div class="row">
													<div class="col-9">
														<input type="text" id="assetNo" name="assetNo" placeholder="Ex:AST1" class="form-control" required >
														
													</div>
													<div class="col-2">
														<button type="button" class="btn btn-info mb-1" onclick="getAssetList()" 
														data-toggle="modal" data-target="#tenantInnerAddmodal">
															<i class="fa fa-search"></i>
														</button>
													</div>
													<div class="col"></div>
												</div>
												<div class="modal fade" id="tenantInnerAddmodal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="largeModalLabel">Asset List</h5>
																
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col">																	
																			<table id="tenantAddInnerTable" class="text-center" data-toggle="table"
																			 data-pagination="true" data-search="true" data-show-columns="true"
																			  data-show-pagination-switch="true" data-show-refresh="true" 
																			  data-key-events="true" data-show-toggle="true" data-resizable="true" 
																			  data-cookie="true" data-cookie-id-table="saveId" data-show-export="true"
																			   data-click-to-select="true" data-toolbar="#toolbar">
																				<thead>
																					<tr>
																						<th></th>
																						<th>Unit No</th>
																						<th>Occupied By</th>

																					</tr>
																				</thead>
																				<tbody><!-- id="assetListbody" -->
																				<c:forEach var="asset" items="${assetList}">
                                    					    						 <tr>
                                    					    							<td ><input type="checkbox" id="chkBox" name="chkBox"></td>
																						<td id="flatnoTD"><input type="text" id="flatnoval" name="flatnoval" value="${asset.flatno}">${asset.flatno}</td>
																						<td><input type="hidden" id="occ_by" name="occ_by" value="T">Tenant</td>
																						</tr>
																				</c:forEach>
																				</tbody>
																			</table>
																		
																	</div>
																</div>


															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-info btn-sm" onclick="appendFlatno()">OK</button>
																<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
															</div>
														</div>
													</div>
												</div>
											</div>

											
											<div class="form-group">
												<label for="company" class=" form-control-label">Tenant's Permanent Address<span style="color:red;">*</span></label>
												<input type="text" id="paddress" name="paddress"  placeholder="Tenant's Permanent Address" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z0-9]+$|^[A-Za-z]+$" required>
											</div>
											<div class="form-group">
												<label for="company" class=" form-control-label">Advance Amount Paid</label>
												<input type="number"  id="advamntpaid" name="advamntpaid"  placeholder="Advance Amount" class="form-control"  maxlength="6"  pattern="^[0-9]*$">
											</div>



										</div>

									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="card">
										<div class="card-header">
											<strong class="card-title">Personal Details</strong>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="company" class=" form-control-label">ID<span style="color:red;">*</span></label>
												<div class="custom-file">
													<input type="file"  id="tenantIdImg" name="tenantIdImg" required>
													<!-- <label class="custom-file-label" for="customFileLangHTML" data-browse="ID">Upload image(Required)</label> -->
												</div>
											</div>

											<div class="form-group">
												<label for="company" class=" form-control-label">ID No<span style="color:red;">*</span></label>
												<input type="number" id="Idno" name="Idno" placeholder="Enter id number" class="form-control"  pattern="^[0-9]*$" required>
											</div>

											<div class="form-group">
												<label for="company" class=" form-control-label">Joining Date<span style="color:red;">*</span></label>
												<input type="date" id="joiningdate" name="joiningdate" placeholder="Joining Date" class="form-control" required>
											</div>
											<div class="form-group">
												<label for="company" class=" form-control-label">Ending Date</label>
												<input type="date" id="endingdate" name="endingdate" placeholder="Ending Date" class="form-control" >
											</div>

											<div class="form-group">
												<label for="exampleFormControlTextarea1" class="form-control-label">Comments</label>
												<textarea class="form-control" id="exampleFormControlTextarea1" name="comments" rows="1" maxlength="500"></textarea>
											</div>



										</div>

									</div>
								</div>
							</div>

							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-info btn-sm">Save</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
								
							</div></form>
						</div>
					</div>
				</div>

				<!--Tenant Add Details Ends Here-->
				
				
				
				
				<!--Tenant Edit Details start here-->
				
				<div class="modal fade" id="tenantEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content ">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Tenant</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="UpdateTenant" method="POST" enctype="multipart/form-data" id="editFormid">
							<input type="hidden" name="eprtyId" value="${prptyid}">
							<input type="hidden" name="eprptyName" value="${prptyName}">
							<input type="hidden" name="tenantId" id="tenantId">
							<div class="modal-body">
								<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
									<div class="card">
										<div class="card-header"><strong>Personal Details</strong></div>
										<div class="card-body card-block">
											<div class="row">
												<div class="form-group col">
													<label for="company" class=" form-control-label">Picture</label>
													<div class="custom-file">
														<input type="file"  id="ImagName" name="ImagName">
														<!-- <label class="custom-file-label" for="customFileLangHTML" data-browse="Picture">Upload image(optional)</label> -->
													</div>
												</div>
											</div>

											<div class="form-group">
												<label for="company" class=" form-control-label">Name<span style="color:red;">*</span></label>
												<input type="text" id="etenant_name" name="etenant_name" placeholder="Name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required>
											</div>
											<div class="form-group">
												<label for="company" class=" form-control-label">Email<span style="color:red;">*</span></label>
												<input type="text" id="etenant_email" name="etenant_email" placeholder="Email" class="form-control" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" required>
											</div>

											<div class="form-group">
												<label for="company" class=" form-control-label">Mobile No<span style="color:red;">*</span></label>
												<input type="text" id="etenant_contact" name="etenant_contact" placeholder="Mobile No" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$" required>
											</div>

										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="card">
										<div class="card-header">
											<strong class="card-title">Address & Contacts</strong>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="company" class="form-control-label">Asset No<span style="color:red;">*</span></label>
												<div class="row">
													<div class="col-9">
														<input type="text" id="eassetNo" name="eassetNo" placeholder="Ex:AST1" class="form-control" required>
													<input type="hidden" id="flatArr" name="flatArr" placeholder="Ex:Unit" class="form-control">
													 <input type="hidden" id="flatObjArr" name="flatObjArr" placeholder="Ex:Unit" class="form-control"> 
													</div>
													<div class="col-2">
														<button type="button" class="btn btn-info mb-1" data-toggle="modal" data-target="#tenantInnerEditmodal">
															<i class="fa fa-search"></i>
														</button>
													</div>
													<div class="col"></div>
												</div>
												<div class="modal fade" id="tenantInnerEditmodal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="largeModalLabel">Asset List</h5>
																
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col">																
																			<table id="tenantEditInnerTable" class="text-center" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
																				<thead>
																					<tr>
																						<th></th>
																						<th>Unit No</th>
																						<th>Occupied By</th>

																					</tr>
																				</thead>
																				<tbody id='editAssetlist'>
																					
																				
																		
																				</tbody>
																			</table>
																		
																	</div>
																</div>


															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-info btn-sm" onclick='editappendFlatno()'>OK</button>
															</div>
														</div>
													</div>
												</div>
											</div>




											
											<div class="form-group">
												<label for="company" class=" form-control-label">Tenant's Permanent Address<span style="color:red;">*</span></label>
												<input type="text" id="eaddress" name="eaddress" placeholder="Tenant's Permanent Address" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z0-9]+$|^[A-Za-z]+$">
											</div>
											<div class="form-group">
												<label for="company" class=" form-control-label">Advance Amount Paid</label>
												<input type="text" id="eadvamount" name="eadvamount" placeholder="Advance Amount" class="form-control" pattern="^[0-9]*$">
											</div>



										</div>

									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="card">
										<div class="card-header"> 
											<strong class="card-title">Personal Details</strong>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="company" class=" form-control-label">ID<span style="color:red;">*</span></label>
												<div class="custom-file">
													<input type="file"  id="ImagIdName" name="ImagIdName">
													<!-- <label class="custom-file-label" for="customFileLangHTML" data-browse="ID">Upload image(Required)</label> -->
												</div>
											</div>

											<div class="form-group">
												<label for="company" class=" form-control-label">ID No:<span style="color:red;">*</span></label>
												<input type="text" id="Idno" name="Idno" placeholder="Enter id number" class="form-control"  required pattern="^[0-9]*$">
											</div>

											<div class="form-group">
												<label for="company" class=" form-control-label">Joining Date <span style="color:red;">*</span></label>
												<input type="date" id="ejoin_date" name="ejoin_date" placeholder="Joining Date" class="form-control" required>
											</div>
											<div class="form-group">
												<label for="company" class=" form-control-label">Ending Date</label>
												<input type="date" id="eend_date" name="eend_date"  placeholder="Ending Date" class="form-control">
											</div>

											<div class="form-group">
												<label for="exampleFormControlTextarea1" class="form-control-label">Comments</label>
												<textarea class="form-control" id="ecomments" name="ecomments"  rows="1" maxlength="500" ></textarea>
											</div>
											<div class="row mt-4">
												<div class="col">
													<p><span>De-Activate</span> &nbsp;&nbsp;<label class="switch">
															<input type="checkbox" id="IstatusTogle" name="IstatusTogle" onclick="toggleStatus()">
															<span class="sliderBtn round "></span>
														</label>&nbsp;&nbsp;Active</p>
												</div>
											</div>



										</div>

									</div>
								</div>
							</div>

							</div>
							<div class="modal-footer">
								<button class="btn btn-info btn-sm" id="updateownerEdit" onclick="submitEditForm()">Save</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
								
							</div>
							</form>
						</div>
					</div>
				</div>
				


			</div>
			<!-- .animated -->
		</div>
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
	</div>
	<!-- /#right-panel -->
	<!-- Scripts -->



	 <script src="https://code.jquery.com/jquery-1.10.2.js"></script> 

	<script>
	
		$(document).ready(function() {
					$('#tenantSelectDetails').DataTable({
						columnDefs: [{
							orderable: false,
							className: 'select-checkbox',
							targets: 0
						}],
						select: {
							style: 'os',
							selector: 'td:first-child'
						},
						order: [
							[1, 'asc']
						]
					});
		});
		
	</script>
<script>
function getAssetList(){
var prtyId=$('#prtyId').val();
	$.ajax({
		type : "get",
	    url  : "getTenantAssetListbyPrptyId?prtyId="+prtyId+"",
	    cache : false,
	    async : false,
	    success  : function(response){
	    	if(response.length!=0){
			 $('#assetListbody').empty();
        	for(var i=0;i<response.length;i++){
        		var tr=
            	"<tr><td><input type='checkbox' id='checkboxid'></td>"
            	+"<td>"+response[i].flatno+"</td>"
			    +"<td>Tenant</td></tr>";
			    $('#assetListbody').append(tr);
			  //  $('#tenantInnerAddmodal').modal('show');
			   
            }
	    	}
	    },
	    error: function(){  
	     alert('Asset List not available');
	    }
	});
}
function toggleStatus(){
	   var earry1=[];
	   var flatString=$('#eassetNo').val();
    var chk=$('#IstatusTogle').is(':checked');
   
    if(chk!=true){
        if( flatString=='' ){
 	   
		 $('#updateownerEdit').attr('disabled',false);
        }else{
     	 alert("Please un-select  assets before in-activating owner");
     	 $('#updateownerEdit').attr('disabled',true);
     	 $('#IstatusTogle').prop('checked',true);
            }
    }
    else {
 	   if( flatString=='' ){
     	   
			 $('#updateownerEdit').attr('disabled',true);
 		alert("Please select assets before activating Tenant");
 		 $('#IstatusTogle').prop('checked',false);
 		
 	   }else{
         	
         	 $('#updateownerEdit').attr('disabled',false);
         	
                }
    }
 		 
    }
function appendFlatno(){
	var flatString='';
	var flatVal='';
	var flatArr=[];
	var flatNoArr=[];
		$("#tenantAddInnerTable tr").each(function(){
			var tr = $(this);
	
			 var chkbox = $(this).find('input[type="checkbox"]').is(':checked');

			

			 
			
		 	if(chkbox==true){
				
				 var flat = $(this).find('input[type="text"]').val();
					//var select = $(this).find("hidden");
					var occBy=$('#occ_by').val();
				 flatVal=flat+'_'+occBy;
				 flatString=flatVal+','+flatString;
			}
			else{
				
				} 
	    
      });
		
	
	
		$('#assetNo').val(flatString);
		 $("#tenantInnerAddmodal").hide();
}
function editappendFlatno(){


	var flatString='';
	var flatVal='';
	var flatArr=[];
	var flatNoArr=[];
		$("#tenantInnerEditmodal tr").each(function(){
			var tr = $(this);
	
			 var chkbox = $(this).find('input[type="checkbox"]').is(':checked');
			
			 if(chkbox==true){
					
				 var flat = $(this).find('input[type="hidden"]').val();
					var select = $(this).find("select");
					if(select.length)
					var occBy=select.val();
					//var occBy=$('#occ_by').val();
					
				 flatVal=flat+'_'+occBy;

				 
			             
			           
				/*  flatObj={
    					 "flatNo":flat,
    					 "OccBy":occBy
				 } */
				 flatNoArr.push(flatVal);
				 flatArr.push(flat);
				 flatString=flatVal+','+flatString;
			}
			else{
				
				}




	    
      });
		$('#flatArr').val(flatArr);
		
		$('#flatObjArr').val(flatNoArr);
		$('#eassetNo').val(flatString);
		 $("#tenantInnerEditmodal").hide();
}
	

function deleteTenant(tntId,prtyid){
	
var r = confirm("Are you sure you want to delete?");
    if (r == true) {
 	   $.ajax({
	         type: "post",
	         url: "deleteTenant?tntId="+tntId+"&prptyid="+prtyid+"",
	         cache: false,
	         async: false,               
	         success: function(response){
		   
	           window.location.reload();
	         },
	         error: function(){                                                                                 
	         }                                                       
	     });     
     
    } 
     }


function viewTenant(tbl_id,flat,tenant_name,tenant_contact,tenant_email,address,
		ownerName,advamount,join_date,end_date,comments,pic,idpic){

	$('#v_flat').text(flat);
	$('#v_tenant_name').text(tenant_name);
	$('#tenant_name').text(tenant_name);
	$('#v_tenant_contact').text(tenant_contact);
	$('#v_tenant_email').text(tenant_email);
	$('#v_address').text(address);
	$('#v_ownerName').text(ownerName);
	$('#v_advamount').text(advamount);
	$('#v_join_date').text(join_date);
	$('#v_end_date').text(end_date);
	$('#v_comments').text(comments);
	var path="resources/maa-images";
	var timage=path+"/"+pic;
	var timageIdp=path+"/"+idpic;
	
				 $("#tntimage").attr("src",timage);
				 $("#tntimageId").attr("src",timageIdp);
	

	$('#viewTenantModal').modal('show');
    }

function EditTenant(tbl_id,flat,tenant_name,tenant_contact,tenant_email,address,
		ownerName,advamount,join_date,end_date,comments,status,Idno,imgname,imgIdname,prtyid)
{
	$('#tenantId').val(tbl_id);
	$('#eflat').val(flat);
	$('#etenant_name').val(tenant_name);
	$('#etenant_contact').val(tenant_contact);
	$('#etenant_email').val(tenant_email);
	$('#eaddress').val(address);
	$('#eownerName').val(ownerName);
	$('#eadvamount').val(advamount);
	$('#ejoin_date').val(join_date);
	$('#eend_date').val(end_date);
	$('#ecomments').val(comments);
	$('#Idno').val(Idno);
	$('#eassetNo').val(flat);  
	$('#eimgName').text(imgname);
	$('#eimgIdName').text(imgIdname);
	
	if(status==0){
		$("#IstatusTogle").prop('checked', false);}
	else{
		$("#IstatusTogle").prop('checked', true);
	}
	$('#editAssetlist').empty();
	$.ajax({
         type: "get",
         url: "getTenantAssetListbyPrptyId?prtyId="+prtyid+"",
         cache: false,
         async: false,               
         success: function(response){
         
	      for(var i=0;i<response.length;i++){
	    	
		      var tr="<tr><td><input type='checkbox' id='IchkBox"+response[i].assetid+"' name='IchkBox'></td>"+
		      "<td id='IflatnovalTd"+response[i].assetid+"'><input type='hidden' id='Iflatnoval"+response[i].assetid+"' name='Iflatnoval' value='"+response[i].flatno+"'>"+response[i].flatno+"</td>"+
		     /*  "  <td><input type='hidden' id='Iocc_by"+response[i].assetid+"' name='Iocc_by' value='T'>Tenant</td></tr>"; */
		   " <td><select class='form-control' id='Iocc_by"+response[i].assetid+"' name='Iocc_by'><option value='T' >Tenant</option></select></td></tr>";
					
					
		
	    	 
				$('#editAssetlist').append(tr);
		      }
	  
           
         },
         error: function(){                                                                                 
         }                                                       
     });    
	

	 var str=flat.split(",");
	 for(var m=0;m<str.length;m++){
		 var unit=str[m];
		 var  unitArr = unit.split("_");
		 var flatVal = unitArr[0];
		// var flatValInt=parseInt(flatVal);
			var occby_new = unitArr[1];
			var assetid = unitArr[2];
			var Iflatnoval=$('#Iflatnoval'+assetid).val();
			//var IflatnovalInt=parseInt(Iflatnoval);
			if(flatVal.trim()===Iflatnoval.trim()){
				$("#IchkBox"+assetid).prop('checked', true);
					
				}
			else{
				}
		 }
	// $('#tenantEditModal').modal('show');
	 
}
function submitEditForm(){
    var fLATNO=$('#eassetNo').val();
   
   var chkStatus= $('#IstatusTogle').is(':checked');
  
    if(fLATNO==''&&chkStatus==true){
        alert("Please uncheck Status to inactivate user or selct asset to update asset");
        }else{
	   $('#editFormid').submit();
        }
	  // window.location.reload();
    }
		
</script>

</body>

</html>