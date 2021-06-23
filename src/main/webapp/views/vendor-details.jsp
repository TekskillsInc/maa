<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="no-js" lang="">
<!--<![endif]-->
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
			box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
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
		.vendorIdImg img {
			border-radius: 5px;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
		}
		.vendorTitle h5 {
			font-weight: 600;
			font-size: 16px;
		}
		.modal-body h4 {
			font-weight: 600;
			font-size: 16px;
			text-decoration: underline;
		}
		.profilePic .nav-pills .nav-item {
			width: 50%;
		}
		.shareImg {
			font-size: 20px;
		}
		
		#vendorTable button {
			font-size: 11px;
		}
		#invoice-details span {
			font-size: 15px;
			font-size: 17px;
			padding-left: 4px;
			padding-right: 4px;
		}
		#vendorTable button i {
			font-size: 17px;
			color: #000;
		}
		#vendorTable button i:hover {
			color: #fff;
		}
		#vendorTable button.custnBtn {
			border-color: transparent;
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

	

		.sliderBtn.round {
			border-radius: 34px;
		}

		.sliderBtn.round:before {
			border-radius: 50%;
		}
		
		.profilePic .nav-pills .nav-item{
			width: 50%;
		}
		.owner-image img{
			width: 130px;
			height: 130px;
		}
		
		#ownerViewModal .modal-body{
			padding: 0px!important;
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
	<div id="right-panel" class="right-panel" style="margin-top: 0px;">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12" id="vendorMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Vendor List</strong>
								</div>
								<c:if test='${roleid==2||roleid==1}'>
								<div class="col-4">
									<div class="addButton" id="VendorPlusAdd" style="float: right">
										<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#vendorAddModal" id="modalClose"><i class="fa fa-plus"></i></button>
									</div>
								</div>
								</c:if>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="vendorTable" class="text-center table-borderless" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
									<thead>
										<tr>
											<th>Vendor ID</th>
											<th>Name</th>
											<th>Profile</th>
											<th>Mobile</th>
											<th>Email Id</th>
											<th>Location</th>
											<th>Address</th>
											<th>Status</th>
											<c:if test='${roleid==1}'>
											<th>Show/No Show</th>
										</c:if>
											<th class="custmheight">Action</th>
										</tr>
									</thead>
									<tbody>
									
									<c:forEach var="vendor" items="${vendorList}">
										<tr>
										
										  <c:choose>
                                                  <c:when test='${empty vendor.vendorimg}'>
                                                    <td>
													<img class="photo_round"
													src="resources/maa-images/us2.jpg"
													style="width: 40px; height: 40px; border-radius: 50%;"></td>
													
                                                  </c:when>
                                                   <c:otherwise>
                                                     <td>
											         <img class="photo_round" src="resources/maa-images/${vendor.vendorimg}" style="width: 40px;height: 40px;border-radius: 50%;">
											          </td>
                                                  </c:otherwise>
                                           </c:choose>
											
											<td>${vendor.vendorname}</td>
											<td>${vendor.profession}</td>
											<td>${vendor.mobile}</td>
											<td>${vendor.email}</td>
											<td>${vendor.city}</td>
											<td>${vendor.address}</td>
											<c:choose>
											<c:when test="${vendor.status==0}">
											<td>In-Active</td>
											</c:when>
											<c:when test="${vendor.status==1}">
											<td>Active</td>
											</c:when>
											</c:choose>
											<c:if test='${roleid==1}'>
											<td>${vendor.vstatus}</td> 
											</c:if>
											<td>
											<c:if test='${roleid==1}'>
											<c:choose>
											<c:when test="${vendor.flag=='YES'}">
											<input type="checkbox" checked id="checkId" onclick="getCheckVal('${vendor.vendorid}','${vendor.prtyid}','${vendor.flag}')">
											</c:when>
											<c:otherwise>
											<input type="checkbox"  id="checkId" onclick="getCheckVal('${vendor.vendorid}','${vendor.prtyid}','${vendor.flag}')">
											</c:otherwise>
											</c:choose>
											</c:if>
											
											<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#vendorIDModal" onclick="viewVendor(
								'${vendor.vendorname}','${vendor.profession}','${vendor.mobile}','${vendor.email}','${vendor.city}','${vendor.address}','${vendor.status}',
								'${vendor.vendorimg}','${vendor.altmobile}','${vendor.idno}','${vendor.idimg}')"><i class="fa fa-eye"></i></button>


											<c:if test='${roleid==2||roleid==1}'>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#vendorEditModal" onclick="Editvendor('${vendor.vendorid}','${vendor.vendorname}','${vendor.profession}','${vendor.mobile}','${vendor.email}','${vendor.city}','${vendor.address}','${vendor.status}',
								'${vendor.vendorimg}','${vendor.altmobile}','${vendor.idno}','${vendor.idtype}','${vendor.country}','${vendor.state}','${vendor.pincode}','${vendor.idimg}')"><i class="fa fa-edit" "></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn" onclick="deletevendor('${vendor.vendorid}','${vendor.vendorname}')"><i class="fa fa-trash-o"></i></button>
										
										</c:if>
										</td>
										</tr>
								</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--Vendor Id Modal Popup Start here-->
				<div class="modal fade" id="vendorIDModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Vendor Info</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-4">
										<div class="profilePic">
											<div class="tab-content" id="pills-tabContent">
												<div class="tab-pane fade show active" id="pills-image" role="tabpanel" aria-labelledby="pills-image-tab">
													<div class="vendor-image my-4 text-center">
														<img id="v_image" class="img-fluid">
													</div>
												</div>
												<div class="tab-pane fade" id="pills-idImg" role="tabpanel" aria-labelledby="pills-idImg-tab">
													<div class="vendor-image my-4 text-center">
														<img id="v_imageId" class="img-fluid">
													</div>
												</div>
											</div>
											<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
												<li class="nav-item">
													<a class="nav-link active" id="pills-image-tab" data-toggle="pill" href="#pills-image" role="tab" aria-controls="pills-image" aria-selected="true">Image</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" id="pills-idImg-tab" data-toggle="pill" href="#pills-idImg" role="tab" aria-controls="pills-profile" aria-selected="false">Id No</a>
												</li>
											</ul>
											<div class="row">
												<div class="col ml-3">
													<div class="shareImg">
														<i class="fa fa-facebook-square"></i>
													</div>
												</div>
												<div class="col">
													<div class="shareImg">
														<i class="fa fa-envelope"></i>
													</div>
												</div>
												<div class="col">
													<div class="shareImg ml-4">
														<a href="tel:+123456789"><i class="fa fa-phone"></i></a>
													</div>
												</div>
											</div>
											
										</div>
									</div>
									<div class="col-md-8">
										<h4 class="py-3">Information</h4>
										<div class="row">
											<div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<label class=" form-control-label"> <i class="fa fa-user"></i>&nbsp; Name:</label></div>
											<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="form-control-static" id="v_name"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<label class=" form-control-label"><i class="fa fa-user"></i>&nbsp;Profession:</label></div>
											<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="form-control-static" id="v_profession"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<label class=" form-control-label"> <i class="fa fa-phone"></i>&nbsp;Mobile No:</label></div>
											<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="form-control-static" id="v_mobile"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<label class=" form-control-label"><i class="fa fa-phone"></i>&nbsp;Alternate Mobile No:</label></div>
											<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="form-control-static" id="v_altmobile"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<label class=" form-control-label"><i class="fa fa-credit-card"></i>&nbsp;ID No:</label></div>
											<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="form-control-static" id="v_idno"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<label class=" form-control-label"><i class="fa fa-envelope"></i>&nbsp; Email:</label></div>
											<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="form-control-static" id="v_email"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<label class=" form-control-label"><i class="fa fa-home"></i>&nbsp;Address:</label></div>
											<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7 ">
												<p class="form-control-static" id="v_address"></p>
											</div>
										</div>
									
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!--Vendor add modal start here-->
				<div class="modal fade" id="vendorAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
						<form action ="saveVendor" method="Post"  enctype="multipart/form-data" id="addForm">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add a Vendor</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						
							<div class="modal-body" id="addModalbody">
								<div class="row my-3 ml-1">
									<!-- <div class="col">
										<div class="form-check-inline form-check">
											<label for="inline-radio1" class="form-check-label ">
												<input type="radio" id="inline-radio1" name="inline-radios" value="Self" class="form-check-input">Self
											</label> &nbsp;&nbsp;
											<label for="inline-radio2" class="form-check-label ">
												<input type="radio" id="inline-radio2" name="inline-radios" value="Company" class="form-check-input" >Company
											</label>
										</div>
									</div> -->
									<div class="col"></div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
										<div class="card">
											<div class="card-header"><strong>Vendor Details</strong></div>
											<div class="card-body card-block">
												<div class="form-group ">
													<label for="company" class=" form-control-label">Picture<span style="color:red;"></span></label>
													<div class="custom-file">
														<input type="file"  id="vendorimg"  name="vendorimg">
													</div>
												</div>
												<div class="form-group">
												<input type="hidden" class="form-control" id="prtyid" name="prtyid" value='${prptyid}'>
												<input type="hidden" class="form-control" id="prptyName" name="prptyName" value='${prptyName}'>
													<label for="company" class=" form-control-label">Vendor Name<span style="color:red;">*</span></label>
													<input type="text" id="vendorname"  name="vendorname" placeholder="Vendor Name" 
													title="This field accepts alphanumeric, specical characters like &,.- and empty spaces are not allowed"
													pattern="^(?!\d\s,.+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &,.-]*)?$" class="form-control" required>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Profession<span style="color:red;">*</span></label>
													<select class="custom-select" id="profession"  name="profession" required>
														<option value="">Select Profession</option>
														<option value="Electrician">Electrician</option>
														<option value="Carpenter">Carpenter</option>
														<option value="Painter">Painter</option>
														<option value="PLumber">Plumber</option>
														<option value="Repairs">Repairs</option>
														<option value="CarpetCleaner">CarpetCleaner</option>
														<option value="CurrentLineMan">Current Line Man</option>
														<option value="Driver Services">Driver Services</option>
														<option value="KeyMakers">Key Makers</option>
														<option value="Maid">Maid</option>
														<option value="Masons">Masons</option>
														<option value="PestControl">Pest Service</option>
														<option value="Repair">Repair</option>
														<option value="Watchman">Watchman</option>
														<option value="Garbage Collecting man">Garbage Collecting man</option>
														<option value="Water boy">Water boy</option>
														<option value="Management Fee">Management Services</option>
														<option value="Property tax">Property tax</option>
														<option value="Water bill">Water Supply</option>
														<option value="Electricity bill">Electricity Line Man</option>
														<option value="Broadband Bill">Internet Services</option>
														<option value="WaterTankerServices">Water Tanker Service</option>
														<option value="Surveillance">Surveillance</option>
														<option value="Lift Service">Lift Service</option>
														<option value="Water purifier">Water purifier</option>
														<option value="Milk Service">Milk Service</option>
														<option value="Others" id="othersControl">Others</option>
													</select>
												</div>
												<div class="form-group" id="otherTypeVendor">
													<label for="company" class=" form-control-label">Others</label>
													<input type="text" id="othProfession"  name="othProfession" placeholder="Enter OtherType" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Mobile<span style="color:red;">*</span></label>
													<input type="text" id="mobile"  name="mobile" minlength="10" maxlength="12"  pattern="^[0-9]*$"
													 placeholder="Vendor Mobile" class="form-control" required title="This field accepts numbers only">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Alternate Mobile Number</label>
													<input type="text" id="altmobile"  name="altmobile" minlength="10" maxlength="12"
													  pattern="^[0-9]*$" placeholder="Vendor Mobile" class="form-control" title="This field accepts numbers only">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Email</label>
													<input type="text" id="email"  name="email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$"
													 placeholder="Vendor Email" class="form-control" title="Please enter valid e-mail ID">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Valid ID Proof<span style="color:red;"></span></label>
													<select class="custom-select" id="idtype"  name="idtype">
														<option value="">Valid ID Proof</option>
														<option value="Passport">Passport</option>
														<option value="AadharCard">Aadhar Card</option>
														<option value="PanCard">Pan Card</option>
														<option value="DrivingLicence">Driving License</option>
														<option value="VoterId">Voter ID</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="card">
											<div class="card-header"><strong>Personal Details</strong></div>
											<div class="card-body card-block">
												<div class="form-group ">
													<label for="company" class=" form-control-label">Upload ID Proof<span style="color:red;"></span></label>
													<div class="custom-file">
														<input type="file" id="idproof"  name="idproof" >
														
													</div>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">ID Proof Number<span style="color:red;"></span></label>
													<input type="text" id="idno"  name="idno" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
													 placeholder="ID No" class="form-control"title="This field accepts alphanumeric only">
												</div>
												<div class="form-group">
												<label for="company" class=" form-control-label">Country<span style="color:red;">*</span></label>
												<select name="country" class="countries form-control" id="countryId" required>
												    <option value="">Select Country</option>
												</select>											
													
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">State<span style="color:red;">*</span></label>
													<select name="state" class="states form-control" id="stateId" required>
												    <option value="">Select State</option>
												</select>
													
													
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">City<span style="color:red;">*</span></label>
													<select name="city" class="cities form-control" id="cityId" required>
														    <option value="">Select City</option>
														</select>
													
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Locality<span style="color:red;">*</span></label>
													<input type="text" id="address"  name="address"	pattern="^(?!\d\s+$)(?:([#a-zA-Z0-9])[a-zA-Z0-9 #&,.-]*)?$" 
													title="This field accepts alphanumeric, specical characters like &,.- and empty spaces are not allowed"
													placeholder="Ex:Kukatpally" class="form-control" required>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Pincode<span style="color:red;">*</span></label>
													<input type="text" id="pincode"  name="pincode" minlength="6" maxlength="8"  pattern="^[0-9]*$"
													title="This field accepts numbers only"  placeholder=" Pincode" class="form-control" required>
												</div>
												
												<div class="form-check-inline form-check">
													<label for="inline-radio1" class="form-check-label ">
														<input type="checkbox" id="status" name="status"  class="form-check-input" checked="checked">Show in Home page
													</label> &nbsp;&nbsp;
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-info btn-sm">Save</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
						</div>
						</form>
					</div>
				</div>
				<!--Vendor Edit modal start here-->
				<div class="modal fade" id="vendorEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Vendor</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action ="updateVendor" method="Post" enctype="multipart/form-data">
							<div class="modal-body">
								<div class="row my-3 ml-1">
									<div class="col">
									
									</div>
									<div class="col"></div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
										<div class="card">
											<div class="card-header"><strong>Vendor Details</strong></div>
											<div class="card-body card-block">
												<div class="form-group ">
													<label for="company" class=" form-control-label">Picture</label>
													<div class="custom-file">
														<input type="file"  id="E_vendorimg"  name="E_vendorimg" >
														<span style="color:#a832a2;font-size:14px;" id="vImagefile"></span>
													</div>
												</div>
												<div class="form-group">
												<input type="hidden" class="form-control" id="prtyid" name="prtyid" value='${prptyid}'>
												<input type="hidden" class="form-control" id="prptyName" name="prptyName" value='${prptyName}'>
												<input type="hidden" class="form-control" id="vendorid" name="vendorid" >
													<label for="company" class=" form-control-label">Vendor Name<span style="color:red;">*</span></label>
													<input type="text" id="E_vendorname"  name="E_vendorname" placeholder="Vendor Name" class="form-control" required>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Profession<span style="color:red;">*</span></label>
													<select class="custom-select" id="E_profession"  name="E_profession" required>
														<option value="">Select Profession</option>
														<option value="Electrician">Electrician</option>
														<option value="Carpenter">Carpenter</option>
														<option value="Painter">Painter</option>
														<option value="plumber">Plumber</option>
														<option value="Repairs">Repairs</option>
														<option value="CarpetCleaner">CarpetCleaner</option>
														<option value="CurrentLineMan">Current Line Man</option>
														<option value="DriverServices">Driver Services</option>
														<option value="KeyMakers">Key Makers</option>
														<option value="Maid">Maid</option>
														<option value="Masons">Masons</option>
														<option value="PestControl">Pest Service</option>
														<option value="Repair">Repair</option>
														<option value="Watchman">Watchman</option>
													    <option value="Water bill">Water Supply</option>
														<option value="Electricity bill">Electricity Line Man</option>
														<option value="Broadband Bill">Internet Services</option>
														<option value="WaterTankerServices">Water Tanker Service</option>
														<option value="Surveillance">Surveillance</option>
														<option value="Lift Service">Lift Service</option>
														<option value="Water purifier">Water purifier</option>
														<option value="Milk Service">Milk Service</option>
														<option value="Others" id="othersControl">Others</option>
													</select>
												</div>
												<div class="form-group" id="E_otherTypeVendor">
													<label for="company" class=" form-control-label">Others</label>
													<input type="text" id="E_othProfession"  name="E_othProfession" placeholder="Enter OtherType" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Mobile<span style="color:red;">*</span></label>
													<input type="text" id="E_mobile"  name="E_mobile" placeholder="Vendor Mobile" class="form-control" required>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Alternate Mobile Number</label>
													<input type="text" id="E_altmobile"  name="E_altmobile" placeholder="Vendor Mobile" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Email</label>
													<input type="text" id="E_email"  name="E_email" placeholder="Vendor Email" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Valid ID Proof<span style="color:red;"></span></label>
													<select class="custom-select" id="E_idtype"  name="E_idtype">
														<option value="">Valid ID Proof</option>
														<option value="Passport">Passport</option>
														<option value="AadharCard">AadharCard</option>
														<option value="PanCard">PanCard</option>
														<option value="DrivingLicence">DrivingLicence</option>
														<option value="VoterId">VoterId</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="card">
											<div class="card-header"><strong>Vendor Details</strong></div>
											<div class="card-body card-block">
												<div class="form-group ">
													<label for="company" class=" form-control-label">Upload ID Proof<span style="color:red;"></span></label>
													<div class="custom-file">
														<input type="file"  id="E_idproof"  name="E_idproof" >
														 <span id="idprooffile" style="color:#a832a2;font-size: 14px;"></span>
														<!-- style="color:#a832a2" -->
													</div>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">ID Proof Number<span style="color:red;"></span></label>
													<input type="text" id="E_idno"  name="E_idno" placeholder="ID Proof Number" class="form-control">
												</div>
									
												
												
										 <div class="form-group">
													<label for="company" class=" form-control-label">Country<span style="color:red;">*</span></label>
													<input type="text" class="form-control" id="E_country"  name="E_country" required>
													
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">State<span style="color:red;">*</span></label>
													<input type="text" class="form-control"  id="E_State"  name="E_State" required>
													
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">City<span style="color:red;">*</span></label>
													<input type="text" class="form-control" id="E_city"  name="E_city" required>
												</div> 
												<div class="form-group">
													<label for="company" class=" form-control-label">Locality<span style="color:red;">*</span></label>
													<input type="text" id="E_address"  name="E_address" placeholder=" Ex:Kukatpally" class="form-control" required>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Pincode<span style="color:red;">*</span></label>
													<input type="text" id="E_pincode"  name="E_pincode" placeholder=" Pincode" class="form-control"  required>
												</div>
												
												<div class="form-check-inline form-check">
													<label for="inline-radio1" class="form-check-label ">
														<input type="checkbox" id="E_status" name="E_status"  class="form-check-input" checked="checked">Show in Home page
													</label> &nbsp;&nbsp;
													
												</div>
												<input type="hidden" name="E_status1" id="E_status1">
												
												
												<div class="row">
                                                  <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                         <label class=" form-control-label"><i class="fa fa-home"></i>&nbsp;Status:</label></div>
                                                  <div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7 ">
                                                  
                                                  <p> &nbsp;&nbsp;<label class="switch">
                                                  
                                                  <input type="checkbox" id="statusTogle"  name="statusTogle">
                                                  <span class="sliderBtn round "></span>
                                                  </div>
                                           		 </div>
												
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-info btn-sm">Save</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
							</form>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- .animated -->
		</div>
<!-- /.content -->
		
		<div class="clearfix"></div>
		
	</div>
	

	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	 

<script src="https://geodata.solutions/includes/countrystatecity.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 

	<script>
$('#modalClose').on('click',function(){
$('#addForm').trigger("reset");
});
</script>
	<script>
	
		$("#VendorAdd").hide();
		$("#VendorPlusAdd").click(function() {
			$("#VendorIdDetails").hide();
			$("#VendorEditDetails").hide();
			$("#VendorAdd").show();
		});
		$("#VendorIdDetails").hide();
		$("#VendorIdshow").click(function() {
			$("#VendorAdd").hide();
			$("#VendorEditDetails").hide();
			$("#VendorIdDetails").show();
		});
		$("#VendorEditDetails").hide();
		$("#VendorIdEdit").click(function() {
			$("#VendorAdd").hide();
			$("#VendorIdDetails").hide();
			$("#VendorEditDetails").show();
		});
		
	</script>
	
	<script>
		$(document).ready(function() {
			$('#vendorTable').DataTable({
				lengthMenu: [
					[4, 10, 50, -1],
					[4, 10, 20, "All"]
				],
				"bLengthChange": true,
				responsive: true,
				columnDefs: [{
					className: 'control',
					orderable: false,
				}],
				order: [1, 'asc']
			});
		});



		function viewVendor(vendorname,profession,mobile,email,city,address,status,vendorimg,altmobile,idno,idimg){
				$('#v_name').text(vendorname);
				$('#v_profession').text(profession);
				$('#v_mobile').text(mobile);
				$('#v_email').text(email);
				
				$('#v_address').text(address);
				
		var path="resources/maa-images";
		
		if(vendorimg==''){
			vendorimg='us2.jpg';
		}
		if(idimg==''){
			idimg='adhar_default.jpg';
		}
	    var vimage=path+"/"+vendorimg;
	    var vimageIdp=path+"/"+idimg;

				 $("#v_image").attr("src",vimage);
				 $("#v_imageId").attr("src",vimageIdp);
				if(status==0){
					$("#statusTogle").attr('checked',false);
					}
			
				else{
					$("#statusTogle").attr('checked', true);
				}

				
				$('#v_altmobile').text(altmobile);
				$('#v_idno').text(idno);
				


			}
		function Editvendor(vendorid,vendorname,profession,mobile,email,city,address,status,vendorimg,altmobile,idno,idtype,country,state,pincode,idimg){
			$('#vendorid').val(vendorid);
			$('#vImagefile').text(vendorimg);
			$('#E_vendorname').val(vendorname);
			var professionVal = $("select[name='E_profession']");
		 	professionVal.find('option[value="' + profession + '"]').attr('selected', true);
			$('#E_mobile').val(mobile);
			$('#E_email').val(email);
			
			$('#E_country').val(country);
			$('#E_State').val(state);
			$('#E_city').val(city);
			$('#E_pincode').val(pincode);
			$('#E_address').val(address);
			 var idTypeVal = $("select[name='E_idtype']");
			
			 idTypeVal.find('option[value="' + idtype + '"]').attr('selected', true);
			
			 $('#idprooffile').text(idimg); 
			 
			if(status==0){
				$("#statusTogle").attr('checked',false);
				}
		
			else{
				$("#statusTogle").attr('checked', true);
			}

			$('#E_status1').val(status);
			$('#E_altmobile').val(altmobile);
			$('#E_idno').val(idno);
			


		}
		function deletevendor(vendorid,vendorname){

			
		    	   
		           var r = confirm("Are you sure you want to delete Vendor?");
		         
		           if (r == true) {
		        	   $.ajax({
		      	         type: "post",
		      	         url: "deleteVendor?vendorid="+vendorid+"",
		      	         cache: false,
		      	         async: false,               
		      	         success: function(response){
		      		      alert(vendorname+" was In-Activated Successfully");
		      	           window.location.reload();
		      	         },
		      	         error: function(){                                                                                 
		      	         }                                                       
		      	     });     
		            
		           } 
		            

			}
				
	</script>
	<script>
		$("#otherTypeVendor").hide();
		$('#typeOthers').on('change', function() {
			if ($(this).val() === "Others") {
				$("#otherTypeVendor").show()
			} else {
				$("#otherTypeVendor").hide()
			}
		});
		$("#otherTypeVendorEdit").hide();
		$('#typeOthersEdit').on('change', function() {
			if ($(this).val() === "OthersEdit") {
				$("#otherTypeVendorEdit").show()
			} else {
				$("#otherTypeVendorEdit").hide()
			}
		});
	</script>
	<script>
	function getCheckVal(vendorId,propertyId,flag){
		   var flagVal=null;
		   if(flag=='YES'){flagVal='NO';}
		   else{flagVal='YES';}
		  $.ajax({
		         type: "post",
		         url: "showUserInWebSite?propertyId="+propertyId+"&vendorId="+vendorId+"&flag="+flagVal+"",
		         cache: false,
		         async: false, 
		         success: function(response){
			         if(response=="updated"){
			        	 alert("Vendor showing interest to show in home page");
						window.location.reload();
				         }
		         },
		         error: function(){                                                                                 
		         }                                                       
		     }); 
		  }


	</script>
	
</body>
</html>