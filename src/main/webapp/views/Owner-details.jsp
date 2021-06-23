<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
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
	/*margin-left: 3%;
            margin-right: 3%;*/
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

/* .fixed-table-toolbar {
	float: left;
} */

#ownerDetails button i {
	font-size: 17px;
	color: #000;
}

#ownerDetails button i:hover {
	color: #fff;
}

#ownerDetails button.custnBtn {
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
.table td{
border-top:0px!important;
}

.hideTd{
display:none;
}
</style>


</head>




<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="resources/img/logo/rounded_logo.png" alt="">
	</div>
	<!-- Left Panel -->

	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel" style="margin-top: 0px;">
		<!-- Header-->


		<!--        Modal popup for switch property ends here-->
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12 col-sm-12 col-xs-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Owner List</strong>
								</div>
								<c:if test='${roleid==2||roleid==1}'>
									<div class="col-4">
										<div class="addButton" id="ownerPlusAdd" style="float: right">
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="modal" data-target="#ownerAddModal" id="modalClose">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</c:if>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="ownerDetails" class="text-center" data-toggle="table"
									data-pagination="true" data-search="true"
									data-show-columns="true" data-show-pagination-switch="true"
									data-show-refresh="true" data-key-events="true"
									data-show-toggle="true" data-resizable="true"
									data-cookie="true" data-cookie-id-table="saveId"
									data-show-export="true" data-click-to-select="true"
									data-toolbar="#toolbar">
									<thead>
										<tr>
											<th>Owner </th>
											<th>Name</th>
											<th>Mobile</th>
											<th>Address</th>
											<th>Unit No</th>
											<th>Email</th>
											<th >Status</th>
											<th scope="col"  class="hideTd"></th>
											<th class="custmheight">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="ownr" items="${onwerList}">

											<tr>
											
											        <c:choose>
                                                      <c:when test='${empty ownr.pic}'>
                                                    <td><img class="photo_round"
													src="resources/maa-images/maa_logo2.jpg"
													style="width: 40px; height: 40px; border-radius: 50%;"></td>
                                                  
                                                    </c:when>
                                                      <c:otherwise>
                                                     <td><img class="photo_round"
													src="resources/maa-images/${ownr.pic}"
													style="width: 40px; height: 40px; border-radius: 50%;"></td>
                                                     </c:otherwise>
                                                      </c:choose>
											
												<td>${ownr.name}</td>
												<td>${ownr.contact}</td>
												<td>${ownr.address}</td>
												<td>${ownr.unitno}</td>
												<td>${ownr.email}</td>

												<c:if test="${ownr.status==0}">
													<td>In-Active</td>
												</c:if>
												<c:if test="${ownr.status==1}">
													<td>Active</td>
												</c:if>
												<td scope="col" class="hideTd" id="ownrNote${ownr.ownrid}">${ownr.note}</td>
												<td><button type="button"
														class="btn btn-outline-info btn-sm custnBtn"
														data-toggle="modal" data-target="#ownerViewModal"
														onclick="viewOwner('${ownr.ownrid}','${ownr.name}','${prptyid}','${ownr.upiid}','${ownr.contact}',
											'${ownr.address}','${ownr.email}','${ownr.contact}','${ownr.altcontact}','${ownr.status}','${ownr.flat}','${ownr.pic}','${ownr.id_pic}')">
														<i class="fa fa-eye"></i>
													</button> <c:if test='${roleid==2||roleid==1}'>
														<button type="button"
															class="btn btn-outline-info btn-sm custnBtn"
															data-toggle="modal" data-target="#ownerEditModal"
															onclick="EditOwner('${ownr.ownrid}','${ownr.name}','${ownr.upiid}','${ownr.contact}',
											'${ownr.address}','${ownr.email}','${ownr.contact}','${ownr.altcontact}','${ownr.status}','${ownr.prtyid}','${ownr.pic}','${ownr.id_pic}','${ownr.flat}')">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button"
															class="btn btn-outline-info btn-sm custnBtn"
															onclick="deleteOwner('${ownr.ownrid}','${prptyid}')">
															<i class="fa fa-trash-o"></i>
														</button>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<!--                owner id details start here-->
				<div class="modal fade" id="ownerViewModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									Owner Details - <strong id="ownername"><span></span></strong>
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
											<li class="nav-item"><a class="nav-link active"
												id="pills-expence-tab" data-toggle="pill"
												href="#pills-expence" role="tab"
												aria-controls="pills-expence" aria-selected="false">Owner
													Info</a></li>



											<li class="nav-item"><a class="nav-link"
												id="pills-flats-tab" data-toggle="pill" href="#pills-flats"
												role="tab" aria-controls="pills-flats" aria-selected="false">Tenants</a>
											</li>
											<li class="nav-item"><a class="nav-link"
												id="pills-payments-tab" data-toggle="pill"
												href="#pills-payments" role="tab"
												aria-controls="pills-payments" aria-selected="false">Invoice</a>
											</li>
											<!--
                               
-->
										</ul>
										<div class="tab-content" id="pills-tabContent">
											<div class="tab-pane fade show active" id="pills-expence"
												role="tabpanel" aria-labelledby="pills-expence-tab">
												<div class="row mx-auto">

													<div class="col-lg-6 col-md-8 col-sm-6 col-xs-6">
														<p>
															<b><i class="fa fa-user"></i>&nbsp;<span id="sname"></span></b><br>
															<i class="fa fa-envelope"></i>&nbsp;<span id="smail"></span><br>
															<i class="fa fa-phone"></i>&nbsp;<span id="sphn"></span><br>
															<i class="fa fa-phone" id="altPNo"></i>&nbsp;<span id="saltphn"></span>
														</p>
														<p>
														<b>Units : </b> <span id="sunit"></span><br>
															<b>Property Tax Number : </b><span id="supiid"></span><br> <b>Notes : </b><span
																id="snotes"></span><br> <b>Address : </b><span id="saddress"></span><br>
															
														</p>
														<!-- <p>
															&nbsp;&nbsp;<label class="switch"> <input
																type="checkbox" id="statusTogle" name="statusTogle">
																<span class="sliderBtn round "></span>
															</label>&nbsp;&nbsp;Active
														</p> Surya -->
													</div>



													<div class="col-lg-6 col-md-4 col-sm-6 col-xs-6">
														<div class="profilePic mt-4">
															<div class="tab-content" id="pills-tabContent">
																<div class="tab-pane fade show active" id="pills-image"
																	role="tabpanel" aria-labelledby="pills-image-tab">
																	<div class="owner-image text-center">
																		<img id='ownerImage' class="img-fluid">
																	</div>
																</div>
																<div class="tab-pane fade" id="pills-houseImg"
																	role="tabpanel" aria-labelledby="pills-idImg-tab">
																	<div class="owner-image text-center">
																		<img id='ownerImageIdp' class="img-fluid" style="border-radius:0%;width:220px;">
																	</div>
																</div>
															</div>
															<ul class="nav nav-pills my-3" id="pills-tab"
																role="tablist">
																<li class="nav-item"><a class="nav-link active"
																	id="pills-image-tab" data-toggle="pill"
																	href="#pills-image" role="tab"
																	aria-controls="pills-image" aria-selected="true">Image</a>
																</li>
																<li class="nav-item"><a class="nav-link"
																	id="pills-idImg-tab" data-toggle="pill"
																	href="#pills-houseImg" role="tab"
																	aria-controls="pills-profile" aria-selected="false">ID</a>
																</li>
															</ul>
														</div>
													</div>
												</div>




											</div>


											<div class="tab-pane fade" id="pills-flats" role="tabpanel"
												aria-labelledby="pills-flats-tab">
												<div class="card">

													<div class="card-body">
														<div class="table-responsive">
															<table
																class="table table-striped table-bordered text-center">
																<thead>
																	<tr>
																		<th>Tenant ID</th>
																		<th>Name</th>
																		<th>Mobile</th>
																		<th>Unit No</th>
																		<th>Email</th>
																	</tr>
																</thead>
																<tbody id="ownrTeananrts">

																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>

											<div class="tab-pane fade" id="pills-payments"
												role="tabpanel" aria-labelledby="pills-payments-tab">

												
											</div>


										</div>
									</div>

								</div>
							</div>
							<div class="modal-footer">

								<button type="button" class="btn btn-secondary btn-sm"
									data-dismiss="modal">Close</button>

							</div>
						</div>
					</div>
				</div>


				<div class="modal fade" id="ownerAddModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog  modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add a New
									Owner</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close" >
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="AddOwner" method="POST"
								enctype="multipart/form-data" id="addForm">
								<div class="modal-body" id="addModalbody">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
											<div class="card">
												<div class="card-header">
													<strong>Personal Details</strong>
												</div>
												<div class="card-body card-block">
													<div class="form-group">
														<label for="company" class=" form-control-label">Name<span style="color:red;">*</span></label>
														<input type="text" id="Name" name="Name" placeholder="Name" class="form-control" 
														pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" title="This field accepts alphabets only" required>
													</div>
													<div class="row">
														<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
															<input type="hidden" id="prtyId" name="prtyId"
																placeholder="Ex:PTY1" value="${prptyid}"
																class="form-control">
															<div class="form-group ">
																<label for="company" class=" form-control-label">Picture</label>
																<div class="custom-file">
																	<input type="file" 
																		id="ownrImage" name="ownrImage"> <!-- <label
																		class="custom-file-label" for="customFileLangHTML"
																		data-browse="Picture">Upload image(optional)</label> -->
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="company" class=" form-control-label">ID Proof<span style="color:red;"></span></label>
																<div class="custom-file">
																	<input type="file" 
																		id="ownrIdImg" name="ownrIdImg"> 
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Property
															Name</label> <input type="text" id="prptyName" name="prptyName"
															placeholder="Building Name" value="${prptyName}"
															class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class="form-control-label">Unit
															No<span style="color:red;">*</span></label>
														<div class="row">
															<div class="col-10">
																<input type="text" id="flatno_input" name="flatno_input"
																	placeholder="Ex:101(0),102(T),103(A)"
																	class="form-control"  required>
															</div>
															<div class="col-2">
																<button type="button" class="btn btn-info mb-1"
																	data-toggle="modal" data-target="#modal_asset">
																	<i class="fa fa-search"></i>
																</button>
															</div>
														</div>
														<div class="modal fade custmModal" id="modal_asset"
															tabindex="-1" role="dialog"
															aria-labelledby="largeModalLabel" aria-hidden="true">
															<div class="modal-dialog modal-dialog-scrollable"
																role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="largeModalLabel">Asset
																			List</h5>

																	</div>
																	<div class="modal-body">
																		<div class="row">
																			<div class="col">
																				<table id="ownerInnerAddTable" class="text-center"
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
																							<th>Unit No</th>
																							<th>Type</th>
																						</tr>
																					</thead>
																					<tbody>
																						<c:forEach var="asset" items="${assetList}">
																							<tr>
																								<td><input type="checkbox" id="chkBox"
																									name="chkBox"></td>
																								<td id="flatnoTD"><input type="hidden"
																									id="flatnoval" name="flatnoval"
																									value="${asset.flatno}">${asset.flatno}</td>
																								<td><select class="form-control"
																									id="occ_by" name="occ_by">
																										<option value=''>occupant By</option>
																										<option value="O">Owner</option>
																										<option value="V">Vacant</option>
																								</select></td>

																							</tr>
																						</c:forEach>

																					</tbody>
																				</table>

																			</div>

																		</div>


																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-info btn-sm"
																			onclick="appendFlatno()">OK</button>
																		
																		
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Property Tax Number
															</label> <input type="text" id="UPID" name="UPID"
															placeholder="Property Tax Number" class="form-control">
													</div>

												</div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title">Personal Details</strong>
												</div>
												<div class="card-body">
													<div class="form-group">
														<label for="company" class=" form-control-label">Mobile
															Number<span style="color:red;">*</span></label> <input type="text" id="mobile" name="mobile"
															placeholder="Mobile number" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$" title="This field accepts numbers only" required>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Alternate
															Mobile Number</label> <input type="text" id="altMobile"
															name="altMobile" placeholder="Mobile number" minlength="10" maxlength="12"  pattern="^[0-9]*$"
															class="form-control" title="This field accepts numbers only">
													</div>

													<div class="form-group">
														<label for="company" class=" form-control-label">Email
															Id<span style="color:red;">*</span></label> <input type="text" id="EmailId" name="EmailId"
															placeholder="Email Id" class="form-control" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$"
															 required onchange="validateMail('${prptyid}')" title="Please enter valid e-mail ID">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Address<span style="color:red;">*</span></label>
														<input type="text" id="Address" name="Address"
															placeholder="Address" class="form-control" pattern="^[ A-Za-z0-9_@./#&,-]*$"
															title="This field accepts alphanumeric, specical characters like _@./#&,-" required>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Notes</label>
														<textarea rows="2" id="Notes" name="Notes" cols="50"
															class="form-control" maxlength="500"></textarea>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info btn-sm" id="submitowner">Save</button>
									<button type="button" class="btn btn-secondary btn-sm"
										data-dismiss="modal" onclick="closeModal()">Close</button>

								</div>
							</form>
						</div>
					</div>


					<!--Owner Edit details ends here-->
				</div>



				<div class="modal fade" id="ownerEditModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Owner</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close" id="removeModal">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="UpdateOwner" method="POST"
								enctype="multipart/form-data" id="editFormid">
								<div class="modal-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
											<div class="card">
												<div class="card-header">
													<strong>Personal Details</strong>
												</div>
												<div class="card-body card-block">
													<div class="form-group">
														<label for="company" class=" form-control-label">Name<span style="color:red;">*</span></label>
														<input type="text" id="IName" name="IName"
															placeholder="Name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$">
													</div>
													<div class="row">
														<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
															<input type="hidden" id="IprtyId" name="IprtyId"
																placeholder="Ex:PTY1" value="${prptyid}"
																class="form-control"> <input type="hidden"
																id="IOwnrId" name="IOwnrId" placeholder="Ex:PTY1"
																class="form-control"> <input type="hidden"
																id="flatArr" name="flatArr" placeholder="Ex:Unit"
																class="form-control"> <input type="hidden"
																id="flatObjArr" name="flatObjArr" placeholder="Ex:Unit"
																class="form-control">


															<div class="form-group ">
																<label for="company" class=" form-control-label">Picture</label>
																<div class="custom-file">
																	<input type="file" 
																		id="IownrImage" name="IownrImage"> <span
																		id="IspownrImage"></span> <!-- <label
																		class="custom-file-label" for="customFileLangHTML"
																		data-browse="Picture">Upload image(optional)</label> -->
																</div>
															</div>
														</div>
														<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
															<div class="form-group">
																<label for="company" class=" form-control-label">ID Proof<span style="color:red;"></span></label>
																<div class="custom-file">
																	<input type="file" 
																		id="IownrIdImg" name="IownrIdImg"> <b><span style="color:#a832a2"id="IspownrIdImg"></span></b>
																		 
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Property
															No</label> <input type="text" id="IprptyName" name="IprptyName"
															placeholder="Building Name" value="${prptyName}"
															class="form-control">
													</div>
													<div class="form-group">
														<label for="company" class="form-control-label">Unit
															No<span style="color:red;">*</span></label>
														<div class="row">
															<div class="col-10">


																<input type="text" id="Iflatno_input"
																	name="Iflatno_input" placeholder="Ex:Unit"
																	class="form-control" required>
															</div>
															<div class="col-2">
																<button type="button" class="btn btn-info mb-1"
																	data-toggle="modal" data-target="#scrollEditmodal">
																	<i class="fa fa-search"></i>
																</button>
															</div>
														</div>
														<div class="modal fade custmModal" id="scrollEditmodal"
															tabindex="-1" role="dialog"
															aria-labelledby="largeModalLabel" aria-hidden="true">
															<div class="modal-dialog modal-dialog-scrollable"
																role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="largeModalLabel">Asset
																			List</h5>

																	</div>
																	<div class="modal-body">

																		<div class="row">
																			<div class="col">

																				<table id="ownerEditInner" class="text-center"
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
																							<th>Unit No</th>
																							<th>Type</th>
																						</tr>
																					</thead>
																					<tbody id='editAssetlist'>

																					</tbody>
																				</table>

																			</div>

																		</div>


																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-info"
																			onclick="EditappendFlatno()">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Property Tax
															Number</label> <input type="text" id="IUPID" name="IUPID"
															placeholder="Property Tax Number" class="form-control">
													</div>

												</div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title">Personal Details</strong>
												</div>
												<div class="card-body">
													<div class="form-group">
														<label for="company" class=" form-control-label">Mobile
															Number<span style="color:red;">*</span></label> <input type="text" id="Imobile" name="Imobile"
															placeholder="Mobile number" class="form-control" minlength="10" maxlength="12" required pattern="^[0-9]*$">
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Alternate
															Mobile Number</label> <input type="text" id="IaltMobile"
															name="IaltMobile" placeholder="Mobile number"
															class="form-control">
													</div>

													<div class="form-group">
														<label for="company" class=" form-control-label">Email
															Id<span style="color:red;">*</span></label> <input type="text" id="IEmailId" name="IEmailId"
															placeholder="Email Id" class="form-control" required>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Address<span style="color:red;">*</span></label>
														<input type="text" id="IAddress" name="IAddress"
															placeholder="Address" class="form-control"  required>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Notes</label>
														<textarea rows="2" cols="50" class="form-control"
															id="INotes" name="INotes"maxlength="500">
</textarea>
													</div>
													<p>
														&nbsp;&nbsp;<label class="switch"> <input
															type="checkbox" id="IstatusTogle" name="IstatusTogle"
															onclick="toggleStatus()"> <span
															class="sliderBtn round "></span>
														</label>&nbsp;&nbsp;
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button id="updateownerEdit" type="button" 
										class="btn btn-info btn-sm" onclick="submitEditForm()">Save</button>
									<button type="button" class="btn btn-secondary btn-sm"
										data-dismiss="modal" id="removeModal2">Close</button>

								</div>
							</form>
						</div>
					</div>
				</div>




			</div>
		</div>
		<div class="clearfix"></div>
	

	</div>

	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>


<script>
$('#modalClose').on('click',function(){
$('#addForm').trigger("reset");
});
</script>
	<script>
	$('#submitowner').attr('disabled',true);
	function appendFlatno() {
		var flatString = '';
		var flatVal = '';
		$("#ownerInnerAddTable tr")
				.each(
						function() {
							var tr = $(this);

							var chkbox = $(this).find(
									'input[type="checkbox"]')
									.is(':checked');

							if (chkbox == true) {

								var flat = $(this).find(
										'input[type="hidden"]').val();
								var select = $(this).find("select");
								if (select.length)
									var occBy = select.val();
								if (occBy == '') {
								} else {
									flatVal = flat + '_' + occBy;

									flatString = flatVal + ',' + flatString;
								}
							} else {

							}

						});
		if (flatString != '') {
			$('#flatno_input').val(flatString);
			
			$("#modal_asset").hide();
			
		} else {
			alert("Select occcupant type ");
		}

	}

	function viewOwner(ownerid, ownrname, prtyid, ownrupiid, ownrcontact,
			ownraddress, ownremail, ownrcontact, ownraltcontact, 
			status, unitno1, pic, idpic) {
		var ownrNote=$('#ownrNote'+ownerid).html();
		$('#ownername').text(ownrname);
		$('#supiid').text(ownrupiid);
		$('#smail').text(ownremail);
		$('#sphn').text(ownrcontact);
		if(ownraltcontact!=''){$('#saltphn').text(ownraltcontact);
		$('#altPNo').show();
		}else{

			$('#altPNo').hide();
			}
		
		
		$('#ownrTeananrts').empty();
		$.ajax({
			type : "post",
			url : "getTenantsByOwner?onwerid=" + ownerid + "&prtyid="
					+ prtyid + "",
			cache : false,
			async : false,
			success : function(response) {

				for (var i = 0; i < response.length; i++) {

					var tr = "<tr><td>" + response[i].tbl_id + "</td>"
							+ "<td >" + response[i].tenant_name + "</td>"
							+ "<td >" + response[i].tenant_contact
							+ "</td>" + "<td >" + response[i].flat
							+ "</td>" + "<td>" + response[i].tenant_email
							+ "</td></tr>";
					$('#ownrTeananrts').append(tr);
				}

			},
			error : function() {
			}
		});
		if(pic==''){
			pic='us2.jpg';
		}
		if(idpic==''){
			idpic='adhar_default.jpg';
		}
		var path = "resources/maa-images";
		var oimage = path + "/" + pic;
		var oimageIdp = path + "/" + idpic;

		$("#ownerImage").attr("src", oimage);
		$("#ownerImageIdp").attr("src", oimageIdp);
		$('#sname').text(ownrname);
		$('#snotes').text(ownrNote);
		if (status = 0)
			$("#statusTogle").prop('checked', false)

		else
			$("#statusTogle").prop('checked', true)

		$('#saddress').text(ownraddress);
		$('#sunit').text(unitno1);

	}
	function EditOwner(ownerid, ownrname, ownrupiid, ownrcontact,
			ownraddress, ownremail, ownrcontact, ownraltcontact, 
			status, prtyid, IspownrImage, IspownrIdImage, unitno) {
		var ownrNote=$('#ownrNote'+ownerid).html();
		$('#IName').val(ownrname);
		$('#IOwnrId').val(ownerid);

		$('#IspownrImage').text(IspownrImage);
		$('#IspownrIdImg').text(IspownrIdImage);
		$('#IUPID').val(ownrupiid);
		$('#Imobile').val(ownrcontact);

		$('#IaltMobile').val(ownraltcontact);
		$('#IEmailId').val(ownremail);
		$('#IAddress').val(ownraddress);
		$('#Iflatno_input').val(unitno);

var flatString='';
var flatNoArr=[];
var flatArr=[];

var flatVal='';
var str = unitno.split(",");
for (var m = 0; m < str.length; m++) {
	var unit = str[m];
	var unitArr = unit.split("_");

	var flat = unitArr[0];
	var occby_new = unitArr[1];
	flatVal = flat + '_' + occby_new;
	flatArr.push(flat);
	flatNoArr.push(flatVal);
	flatString = flatVal + ',' + flatString;
	var assetid = unitArr[2];
}

		$('#flatArr').val(flatArr);
		$('#flatObjArr').val(flatNoArr);
		$('#INotes').val(ownrNote);
		
		if (status == 0) {
			$("#IstatusTogle").prop('checked', false);
		}

		else {
			$("#IstatusTogle").prop('checked', true);
		}
		$('#saddress').val(ownraddress);
		$('#editAssetlist').empty();
		//var str=unitno.split(",");
		$
				.ajax({
					type : "post",
					url : "getAssetDetailsPeoprtyIdEdit?onwerid=" + ownerid
							+ "&prtyid=" + prtyid + "",
					cache : false,
					async : false,
					success : function(response) {

						for (var i = 0; i < response.length; i++) {

							var td='<td></td>';
							if(response[i].occ_by=='T'){
								td= " <td><select class='form-control' id='Iocc_by"+response[i].assetid+"' name='Iocc_by' selected readonly> <option value='T'>Tenant</option></select></td>";
							}else{
								td= " <td><select class='form-control' id='Iocc_by"+response[i].assetid+"' name='Iocc_by'><option value=''>occupant By</option> <option value='O'>Owner</option><option value='V'>Vacant</option></select></td>";
								
								}
															var tr = "<tr><td><input type='checkbox' id='IchkBox"+response[i].assetid+"' name='IchkBox'></td>"
																	+ "<td id='IflatnovalTd"+response[i].assetid+"'><input type='hidden' id='Iflatnoval"+response[i].assetid+"' name='Iflatnoval' value='"+response[i].flatno+"'>"
																	+ response[i].flatno
																	
																	+ "</td>"+td+
																	"</tr>";
																	
															$('#editAssetlist').append(tr);
														}

					},
					error : function() {
					}
				});
		var str = unitno.split(",");
		for (var m = 0; m < str.length; m++) {
			var unit = str[m];
			var unitArr = unit.split("_");

			var flatVal = unitArr[0];
			var occby_new = unitArr[1];
			var assetid = unitArr[2];
			
			

			var Iflatnoval = $('#Iflatnoval' + assetid).val();
			

			if (flatVal.trim() === Iflatnoval.trim()) {
				
				$("#IchkBox" + assetid).prop('checked', true);
				$(
						"#Iocc_by" + assetid + " option:contains("
								+ occby_new + ")").attr('selected',
						'selected');

			} else {
				
			}

		}

	}

	function EditappendFlatno() {
		var flatString='';
		var flatVal='';
		var flatArr = [];
		var flatNoArr = [];
		
		$("#ownerEditInner tr")
				.each(
						function() {
							var tr = $(this);

							var chkbox = $(this).find(
									'input[type="checkbox"]')
									.is(':checked');

							if (chkbox == true) {
								$(this).find("select").attr("required",
										"required");
								var flat = $(this).find(
										'input[type="hidden"]').val();
								var select = $(this).find("select");
								if (select.length)
									var occBy = select.val();
								if (occBy == '') {

									alert("Select Occupant type..");

								} else {
									flatVal = flat + '_' + occBy;
									flatNoArr.push(flatVal);
									flatArr.push(flat);
									flatString = flatVal + ',' + flatString;
								}
							} else {

							}

						});
		
		if (flatString != '') {

			$('#Iflatno_input').val(flatString);
			$('#flatArr').val(flatArr);

			$('#flatObjArr').val(flatNoArr);
			$("#scrollEditmodal").hide();
		} else {
			$('#Iflatno_input').val('');
			$('#flatArr').val(''); 
			$('#flatObjArr').val('');
			$("#scrollEditmodal").hide();
		} 

	}
	function deleteOwner(ownerid, prptyid) {

		var r = confirm("Are you sure you want to delete owner?");

		if (r == true) {
			$.ajax({
				type : "post",
				url : "deleteOwner?onwerid=" + ownerid + "&prptyid="
						+ prptyid + "",
				cache : false,
				async : false,
				success : function(response) {

					window.location.reload();
				},
				error : function() {
				}
			});

		}
	}
	function toggleStatus() {
		var earry1 = [];
		var flatString = $('#Iflatno_input').val();
		var chk = $('#IstatusTogle').is(':checked');
		// alert(chk);
		if (chk != true) {
			if (flatString == '') {

				$('#updateownerEdit').attr('disabled', false);
			} else {
				alert("Please un-select  assets before in-activating owner");
				$('#updateownerEdit').attr('disabled', true);
				$('#IstatusTogle').prop('checked', true);
			}
		} else {
			if (flatString == '') {

				$('#updateownerEdit').attr('disabled', true);
				alert("Please select assets before activating owner");
				$('#IstatusTogle').prop('checked', false);

			} else {

				$('#updateownerEdit').attr('disabled', false);

			}
		}

	}
	function submitEditForm() {
		var fLATNO = $('#Iflatno_input').val();

		var chkStatus = $('#IstatusTogle').is(':checked');

		
			var flatArr=	$('#flatArr').val();
				var flatObjArr=$('#flatObjArr').val();
		
		if (fLATNO == '') {
			if(chkStatus == true) {
			
			alert("Please uncheck Status to inactivate user or selct asset to update asset");
		} else if(chkStatus == false) {
			
			$('#editFormid').submit();
		}
		}
		else{
			if(chkStatus == true) {
				
				$('#editFormid').submit();
			} else if(chkStatus == false) {
				
				alert("Please uncheck Status to inactivate user or selct asset to update asset");
			}
			}
	}
	$("#removeModal").click(function() {
        $('.modal-backdrop').remove();
        
    });
	$("#removeModal2").click(function() {
        $('.modal-backdrop').remove();
        
    });
        function validateMail(prptyid){
            var ownerMail=$('#EmailId').val();
            var data={"ownerMail":ownerMail,"prptyid":prptyid,"type":'O'}
            $.ajax({
        		type : "get",
        		url : "validatEmail",
        		cache : false,
        		async : false,
        		data:data,
				success : function(response) {
					if(response==''){
						$('#submitowner').attr('disabled',false);
						
						}else{
							alert("Mail id already resistered, please go to edit ");
							$('#submitowner').attr('disabled',true);
							}
				},
				error : function() {
				}
			});
            
            }
		
	</script>
</body>

</html>