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
.file-upload {
	display: block;
	text-align: center;
	font-family: Helvetica, Arial, sans-serif;
	font-size: 12px;
}

.file-upload .file-select {
	display: block;
	border: 2px solid #dce4ec;
	color: #34495e;
	cursor: pointer;
	height: 40px;
	line-height: 40px;
	text-align: left;
	background: #FFFFFF;
	overflow: hidden;
	position: relative;
	width: 205px;
}

.file-upload .file-select .file-select-button {
	background: #dce4ec;
	padding: 0 10px;
	display: inline-block;
	height: 40px;
	line-height: 40px;
}

.file-upload .file-select .file-select-name {
	line-height: 40px;
	display: inline-block;
	padding: 0 10px;
}

.file-upload .file-select:hover {
	border-color: #34495e;
	transition: all .2s ease-in-out;
	-moz-transition: all .2s ease-in-out;
	-webkit-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
}

.file-upload .file-select:hover .file-select-button {
	background: #34495e;
	color: #FFFFFF;
	transition: all .2s ease-in-out;
	-moz-transition: all .2s ease-in-out;
	-webkit-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
}

.file-upload.active .file-select {
	border-color: #3fa46a;
	transition: all .2s ease-in-out;
	-moz-transition: all .2s ease-in-out;
	-webkit-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
}

.file-upload.active .file-select .file-select-button {
	background: #3fa46a;
	color: #FFFFFF;
	transition: all .2s ease-in-out;
	-moz-transition: all .2s ease-in-out;
	-webkit-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
}

.file-upload .file-select input[type=file] {
	z-index: 100;
	cursor: pointer;
	position: absolute;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.file-upload .file-select.file-select-disabled {
	opacity: 0.65;
}

.file-upload .file-select.file-select-disabled:hover {
	cursor: default;
	display: block;
	border: 2px solid #dce4ec;
	color: #34495e;
	cursor: pointer;
	height: 40px;
	line-height: 40px;
	margin-top: 5px;
	text-align: left;
	background: #FFFFFF;
	overflow: hidden;
	position: relative;
}

.file-upload .file-select.file-select-disabled:hover .file-select-button
	{
	background: #dce4ec;
	color: #666666;
	padding: 0 10px;
	display: inline-block;
	height: 40px;
	line-height: 40px;
}

.file-upload .file-select.file-select-disabled:hover .file-select-name {
	line-height: 40px;
	display: inline-block;
	padding: 0 10px;
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
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Meter Readings</strong>
								</div>
								   <c:if test='${roleid==2||roleid==1}'>
								<div class="col-4">
									<div class="addButton" style="float: right">
										<button type="button" class="btn btn-info btn-sm"
											data-toggle="modal" data-target="#meterAddModal" id="meterPlusAdd">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
								</c:if>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="meterDetails" class="text-center table-borderless"
									data-toggle="table" data-pagination="true" data-search="true"
									data-show-columns="true" data-show-pagination-switch="true"
									data-show-refresh="true" data-key-events="true"
									data-show-toggle="true" data-resizable="true"
									data-cookie="true" data-cookie-id-table="saveId"
									data-show-export="true" data-click-to-select="true"
									data-toolbar="#toolbar">
									<thead>
										<tr>
											<th>Unit No</th>
											<th>Period</th>
											<th>Water</th>
											<th>Current</th>
											<th>Gas</th>
											<th>Diesel</th>
											<th>AC</th>
											<th>Other</th>
											<th class="custmheight text-center">Action</th>
										</tr>
									</thead>
									<tbody>
									
									<c:forEach var="rlist" items="${readingList}">
									<tr>
								
									
									<td>${rlist.flatno}</td>
									<td>${rlist.month}/${rlist.year}</td>
									<td>${rlist.water_MR}</td>
									<td>${rlist.power_MR}</td>
									<td>${rlist.gas_MR}</td>
									<td>${rlist.disel_MR}</td>
									<td>${rlist.ac_MR}</td>
									<td>${rlist.other_MR}</td>
									 
									<td>
									<button type="button" class="btn btn-outline-info btn-sm custnBtn"	data-toggle="modal"
											data-target="#meterIDModal" onclick="getReadingsView('${rlist.flatno}','${rlist.month}','${rlist.water_CPU}',
											'${rlist.water_MR}','${rlist.power_CPU}','${rlist.power_MR}','${rlist.gas_CPU}','${rlist.gas_MR}',
											'${rlist.disel_CPU}','${rlist.disel_MR}','${rlist.ac_CPU}','${rlist.ac_MR}',
											'${rlist.other_CPU}','${rlist.other_MR}','${rlist.year}')"><i class="fa fa-eye"></i></button>
											 <c:if test='${roleid==2||roleid==1}'>
									<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal"
											data-target="#editMeterReadingsModal"  onclick="editReadings('${rlist.flatno}','${rlist.month}',
											'${rlist.water_MR}','${rlist.power_MR}','${rlist.gas_MR}',
											'${rlist.disel_MR}','${rlist.ac_MR}',
											'${rlist.other_MR}','${rlist.year}','${rlist.tbl_pk}')"><i class="fa fa-edit"></i></button>
									<button type="button" class="btn btn-outline-info btn-sm custnBtn">
										<i class="fa fa-trash-o" onclick="deleteReadings('${rlist.flatno}','${prptyid}','${rlist.month}'
										,'${rlist.year}','${rlist.tbl_pk}')"></i></button>
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
				<div class="clearfix"></div>



				<!--Meter Details Start Here-->

				<div class="modal fade" id="meterIDModal" tabindex="-1"
					role="dialog" aria-labelledby="myExtraLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Unit
									No-<span id="v_flatno1"></span></h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							
							
		
		
							<div class="modal-body">
								<div class="row">
									<div class="col-md-3">
										<div class="card">
											<div class="card-header">
												<strong>Unit Information</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Unit No</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_flatno"></span></p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Month</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_month"></span></p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card">
											<div class="card-header">
												<strong>Water Meter Reading</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Present</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_wmr"></span></p>
													</div>
												</div>
										
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Cost/Unit</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_water_CPU"></span></p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card">
											<div class="card-header">
												<strong>Current Meter Reading</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Present </label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_power_CPU"></span></p>
													</div>
												</div>
										
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Cost/Unit</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_pmr"></span></p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card">
											<div class="card-header">
												<strong>Gas Meter Reading</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Present</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_gas_CPU"></span></p>
													</div>
												</div>
									
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Cost/Unit</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_gmr"></span></p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card">
											<div class="card-header">
												<strong>Diesel Meter Reading</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Present</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_disel_CPU"></span></p>
													</div>
												</div>
										
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Cost/Unit</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_dmr"></span></p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card">
											<div class="card-header">
												<strong>Ac Meter Reading</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Present</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_ac_CPU"></span></p>
													</div>
												</div>
										
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Cost/Unit</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_amr"></span></p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card">
											<div class="card-header">
												<strong>Other Meter Reading</strong>
											</div>
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Present</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_other_CPU"></span></p>
													</div>
												</div>
									
												<div class="row">
													<div class="col col-md-6">
														<label class=" form-control-label">Cost/Unit</label>
													</div>
													<div class="col col-md-6">
														<p class="form-control-static"><span id="v_omr"></span></p>
													</div>
												</div>
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


				<!--Meter Add Modal popup Start here-->

				<div class="modal fade" id="meterAddModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-xl" role="document">					
						<div class="modal-content">
						<form action='saveMeterReadings' method='POST' id='formid'>
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Meter
									Readings</h5>
								<button type="button" class="close"
									aria-label="Close" onclick="closeModal()">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" id="addModalbody">
							
								<div class="row">
									<div class="col">
										<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
											<li class="nav-item"><a class="nav-link active"
												id="pills-individual-tab" data-toggle="pill"
												href="#pills-individual" role="tab"
												aria-controls="pills-individual" aria-selected="true">Individual
													Readings</a></li>
											<li class="nav-item"><a class="nav-link"
												id="pills-bulk-tab" data-toggle="pill" href="#pills-bulk"
												role="tab" aria-controls="pills-bulk" aria-selected="false">Bulk
													Readings</a></li>
										</ul>
										<div class="tab-content" id="pills-tabContent">
											
											<div class="tab-pane fade show active" id="pills-individual"
												role="tabpanel" aria-labelledby="pills-individual-tab">
												<div class="row">
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
														<div class="card" id="meterCard">
															<div class="card-header">
																<strong class="card-title">Asset Details</strong>
															</div>
														
																<input type="hidden" id="prptyid" name="prptyid" value="${prptyid}">
																<input type="hidden"  name="prptyName" value="${prptyName}">
																<div class="card-body">
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<div class="input-group">
																			<!-- <input type="text" class="form-control"
																				id="month_indv" name="month_indv"> -->
																				<select class="form-control" id="month_indv"
														name="month_indv" >
													</select>
																		</div>
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Year</label>
																		<div class="input-group">
																			<input type="text" class="form-control"
																				id="year_indv" name="year_indv">
																		</div>
																	</div>

																	<div class="form-group">
																		<label for="company" class="form-control-label">Unit
																			No</label>
																		<div class="row">
																			<div class="col-9">
																				<input type="text" id="unitNo" name="unitNo"
																					placeholder="Ex:Unit" class="form-control">
																					<input type="hidden" id="assetid" name="assetid"
																					placeholder="Ex:Unit" class="form-control">
																			</div>
																			<div class="col-2">
																				<button type="button" class="btn btn-info mb-1"
																					data-toggle="modal" data-target="#meterAddIndModal">
																					<i class="fa fa-search"></i>
																				</button>
																			</div>
																			<div class="col"></div>
																		</div>
																		<div class="modal fade" id="meterAddIndModal"
																			tabindex="-1" role="dialog"
																			aria-labelledby="largeModalLabel" aria-hidden="true">
																			<div class="modal-dialog " role="document">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h5 class="modal-title" id="largeModalLabel">Asset
																							List</h5>																						
																					</div>
																					<div class="modal-body">
																						<div class="row">
																							<div class="col">
																								<div class="form-group ml-4 mt-4">
																									<div class="form-check-inline form-check">																									
																									</div>
																								</div>
																								<div class="table-responsive">
																								<table id="innerMeterAddTable"
																									class="text-center" data-toggle="table"
																									data-pagination="true" data-search="true"
																									data-show-columns="true"
																									data-show-pagination-switch="true"
																									data-show-refresh="true" data-key-events="true"
																									data-show-toggle="true" data-resizable="true"
																									data-cookie="true"
																									data-cookie-id-table="saveId"
																									data-show-export="true"
																									data-click-to-select="true"
																									data-toolbar="#toolbar">
																									<thead>
																										<tr>
																											<th></th>
																											<th>Asset ID</th>
																											<th>Property Name</th>
																											<th>Unit No</th>
																										</tr>
																									</thead>
																									
																									<tbody>
																										<!-- id="assetListbody" -->
																										<c:forEach var="asset" items="${assetList}">
																											<tr>
																												<td><input type="radio" id="chkBox"
																													name="chkBox" ></td>
																												<td>AST000<span id='assetid_span'>${asset.assetid}</span></td>
																												<td>${prptyName}</td>
																												<td><input type="hidden" id="flatno"
																													name="flatno" value="${asset.flatno}">${asset.flatno}</td>
																											</tr>
																										</c:forEach>
																									</tbody>
																								</table>
																							</div>
																							</div>
																						</div>

																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-info btn-sm" onclick = "appendFlatno(${prptyid})">OK</button>
																					

																					</div>
																				</div>
																			</div>
																		</div>
																</div>
																	<div class="form-group row">
																	<span style="color:red;"><b> Please add meeter cost befor adding readings.</b></span>
																		<label for="company" class="form-control-label col-12">Choose
																			Meter Readings</label>
																		<div class="col-12">
																			<div class="row pt-3">
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" class="styled"
																						id="inlineEditIndCheckbox1"  onclick='showAll()'
																						> <label
																						for="inlineEditIndCheckbox1"> All &nbsp;</label>
																				</div>
																				<div class="checkbox checkbox checkbox-inline">
																					<input type="checkbox" class="styled"
																						id="inlineEditIndCheckbox2" onclick="showcurrent()">
																					<label for="inlineEditIndCheckbox2">
																						Current </label>
																				</div>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" class="styled"
																						id="inlineEditIndCheckbox3" onclick="showDiesel()">
																					<label for="inlineEditIndCheckbox3"> Diesel
																					</label>
																				</div>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" class="styled"
																						id="inlineEditIndCheckbox4" onclick="showWater()">
																					<label for="inlineEditIndCheckbox4"> Water
																					</label>
																				</div>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" class="styled"
																						id="inlineEditIndCheckbox5" onclick="showgas()"> <label
																						for="inlineEditIndCheckbox5"> Gas </label>
																				</div>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" class="styled"
																						id="inlineEditIndCheckbox6" onclick="showAC()"> <label
																						for="inlineEditIndCheckbox6"> AC </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																				</div>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" class="styled"
																						id="inlineEditIndCheckbox7" onclick="showOthers()">
																					<label for="inlineEditIndCheckbox7"> Others
																					</label>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
														</div>
													</div>
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
														<!-- <div class="currentMeter"> -->
															<div class="waterMeter">
																<div class="card" id="meterCard">
																	<div class="card-header">
																		<strong class="card-title">Water Reading</strong>
																	</div>
																	<div class="card-body">
																		<table class="table text-center">
																			<thead class="thead-light">
																				<tr>
																					<!-- <th>Previous</th> -->
																					<th>Present</th>
																					<th>Cost</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr>
																				
																					<td><input type="text" id="wpresent"
																						name="wpresent" pattern="^[0-9]*\.[0-9]{2}"  class="form-control">
																					</td>
																					<td><input type="text" id="wCost"
																						name="wCost"  class="form-control" value="${cost.wtrCost}" readonly></td>
																				</tr>
																			</tbody>
																		</table>
																

																	</div>
																</div>
															</div>
															<div class="currentMeter">
																<div class="card" id="meterCard">
																	<div class="card-header">
																		<strong class="card-title">Current Reading</strong>
																	</div>
																	<div class="card-body">
																		<table class="table text-center">
																			<thead class="thead-light">
																				<tr>
																					<th>Present</th>
																					
																					<th>Cost/Unit</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr>
																					<td><input type="text" id="Cpresent"
																						name="Cpresent" pattern="^[0-9]*\.[0-9]{2}"  class="form-control"></td>
																					
																					<td><input type="text" id="Ccost" name="Ccost"
																						class="form-control" value="${cost.pwrCost}" readonly></td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>

															<div class="gasMeter">
																<div class="card" id="meterCard">
																	<div class="card-header">
																		<strong class="card-title">Gas Reading</strong>
																	</div>
																	<div class="card-body">
																		<table class="table text-center">
																			<thead class="thead-light">
																				<tr>
																					<th>Present</th>
																					<!-- <th>Date</th> -->
																					<th>Cost/Unit</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr>

																					<td><input type="text" id="Gpresent"
																						name="Gpresent" pattern="^[0-9]*\.[0-9]{2}"  class="form-control"></td>
																					
																					<td><input type="text" id="Gcost" name="Gcost"
																						required class="form-control" value="${cost.gasCost}" readonly ></td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														<!-- </div> -->
													</div>
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
														<div class="disselMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">Diesel Reading</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				<!-- 	<th>Date</th> -->
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>

																				<td><input type="text" id="Dpresent"
																					name="Dpresent" pattern="^[0-9]*\.[0-9]{2}"  class="form-control"></td>
																				
																				<td><input type="text" id="Dcost" name="Dcost"
																					required class="form-control" value="${cost.dslCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="acMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">AC Reading</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>

																				<td><input type="text" id="ACpresent"
																					name="ACpresent"  pattern="^[0-9]*\.[0-9]{2}"  class="form-control"></td>
																				
																				<td><input type="text" id="ACcost"
																					name="ACcost"  class="form-control" value="${cost.acCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="OtherMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">Other Readings</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																			
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>

																				<td><input type="text" id="Otpresent"
																					name="Otpresent" pattern="^[0-9]*\.[0-9]{2}"  class="form-control" ></td>
																				
																				<td><input type="text" id="Otcost"
																					name="Otcost"  class="form-control" value="${cost.otherCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" id="pills-bulk" role="tabpanel"
												aria-labelledby="pills-bulk-tab">
												<div class="row">
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
														<div class="card" id="meterCard">
															<div class="card-header">
																<strong class="card-title">Asset Details</strong>
															</div>
															<div class="card-body">
																<div class="form-group">
																	<label for="company" class=" form-control-label">Date</label>
																	<div class="input-group">
																		<input class="form-control" id="dateBulkpicker">
																	</div>
																</div>
																<div class="form-group">
																	<label for="company" class="form-control-label">Unit
																		No</label>
																	<div class="row">
																		<div class="col-9">
																			<input type="text" id="company" placeholder="Ex:Unit"
																				class="form-control">
																		</div>
																		<div class="col-2">
																			<button type="button" class="btn btn-info mb-1"
																				data-toggle="modal" data-target="#meterAddBulkModal">
																				<i class="fa fa-search"></i>
																			</button>
																		</div>
																		<div class="col"></div>
																	</div>
																	<div class="modal fade" id="meterAddBulkModal"
																		tabindex="-1" role="dialog"
																		aria-labelledby="largeModalLabel" aria-hidden="true">
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="largeModalLabel">Asset
																						List</h5>
																					</div>
																				<div class="modal-body">
																					<div class="row">
																						<div class="col">
																							<div class="form-group ml-4 mt-4">
																								<div class="form-check-inline form-check">
																									<label for="inline-radio1"
																										class="form-check-label "> <input
																										type="radio" id="inline-radio1"
																										name="inline-radios" value="option1"
																										class="form-check-input">Full Property
																									</label> &nbsp;&nbsp;

																								</div>
																							</div>
																							<table id="meterBulktable" class="text-center"
																								data-toggle="table" data-pagination="true"
																								data-search="true" data-show-columns="true"
																								data-show-pagination-switch="true"
																								data-show-refresh="true" data-key-events="true"
																								data-show-toggle="true" data-resizable="true"
																								data-cookie="true" data-cookie-id-table="saveId"
																								data-show-export="true"
																								data-click-to-select="true"
																								data-toolbar="#toolbar">
																								<thead>
																									<tr>
																										<th data-checkbox="true"></th>
																										<th>Asset ID</th>
																										<th>Property Name</th>
																										<th>Unit No</th>

																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td></td>
																										<td><a href="#">AST0001</a></td>
																										<td>Manjeera Trinity</td>
																										<td>101</td>
																									</tr>
																									<tr>
																										<td></td>
																										<td><a href="#">AST0001</a></td>
																										<td>Manjeera Trinity</td>
																										<td>101</td>
																									</tr>
																								</tbody>
																							</table>

																						</div>

																					</div>

																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-info">OK</button>
																					<!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>-->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>

													<div class="col-lg-8">
														<div class="bulkUpload">
															<h4 class="py-3">Please read the below guidelines
																before uploading a file</h4>
															<ol class="pl-3 text-justify">
																<li>Click on below link to download the template</li>
																<li>After downloading the template switch back to
																	app</li>
																<li>Edit the downloaded template in microsoft Excel</li>
																<li>There are certain things which have been locked
																	in the tamplate sheet to avoid manual errors while you
																	enter the data.</li>
																<li>Columns marked in the red are Mandatory.</li>
																<li>There is a sample Property(in blue,line number
																	2),being added in each child sheet the child sheets are
																	advertise for rent,advertise for sale,already on rent
																	and hold,Please follow the pattern to add your
																	properties.</li>
																<li>Delete the sample data,line2,before uploading a
																	file.</li>
																<li>After entering the properties in the
																	template,save the file in your device.</li>
																<li>upload the .xlsx file by selecting "select file
																	" button.</li>
																<li>If you have any issues, Please give us a
																	feedback (our online feedback feature),we are happy to
																	assit you.</li>

															</ol>
															<button type="button" class="btn btn-outline-info">Download
																the template</button>

															<div class="file-upload mt-3">
																<div class="file-select">
																	<div class="file-select-button" id="fileName">
																		<i class="fa fa-upload" aria-hidden="true"></i>
																	</div>
																	<div class="file-select-name" id="noFile">No file
																		chosen...</div>
																	<input type="file" name="chooseFile" id="chooseFile">
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
								<button type="button" id="saveRedings" class="btn btn-info btn-sm"
									onclick="submitReadins()">Save</button>
								<button type="button" class="btn btn-secondary btn-sm"
									onclick="closeModal()">Close</button>

							</div>
							</form>
						</div>
					</div>
				</div>

				<!--Meter Edit Modal popup Start Here-->
				<div class="modal fade" id="editMeterReadingsModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog  modal-xl" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Meter
									Readings</h5>
								<button type="button" class="close" data-dismiss="modal" onclick="closeModal()"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="updateMeterReading" method="post">
							<input type="hidden"  name="prptyid" value="${prptyid}">
							<input type="hidden"  name="prptyName" value="${prptyName}">
							
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
											<li class="nav-item"><a class="nav-link active"
												id="pills-Editindividual-tab" data-toggle="pill"
												href="#pills-Editindividual" role="tab"
												aria-controls="pills-individual" aria-selected="true">Individual
													Readings</a></li>
										<!-- 	<li class="nav-item"><a class="nav-link"
												id="pills-Editbulk-tab" data-toggle="pill"
												href="#pills-Editbulk" role="tab" aria-controls="pills-bulk"
												aria-selected="false">Bulk Readings</a></li> -->
										</ul>
										<div class="tab-content" id="pills-tabContent">
											<div class="tab-pane fade show active"
												id="pills-Editindividual" role="tabpanel"
												aria-labelledby="pills-individual-tab">
												<div class="row">
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
														<div class="card" id="meterCard">
															<div class="card-header">
																<strong class="card-title">Asset Details</strong>
															</div>
															<input type="hidden" class="form-control" id="tbl_pk" name="tbl_pk">
															<div class="card-body">
																<div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<div class="input-group">
																			<input type="text" class="form-control"
																				id="e_month" name="e_month" readonly>
																		</div>
																	</div>
																	<div class="form-group">
																		<label for="company" class=" form-control-label">Year</label>
																		<div class="input-group">
																			<input type="text" class="form-control"
																				id="e_year" name="e_year" readonly>
																		</div>
																	</div>
																<div class="form-group">
																	<label for="company" class="form-control-label">Unit
																		No</label>
																	<div class="row">
																		<div class="col-9">
																			<input type="text" id="e_flatno" name="e_flatno" placeholder="Ex:Unit"
																				class="form-control" readonly>
																				<input type="hidden" id="e_assetid" name="e_assetid"
																					placeholder="Ex:Unit" class="form-control" >
																		</div>
																		
																		<div class="col"></div>
																	</div>
																	
																</div>
																<div class="form-group row">
																	<label for="company" class="form-control-label col-12">Choose
																		Meter Readings</label>

																	<div class="col-12">
																		<div class="row pt-3">
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" class="styled"
																					id="inlineCheckbox1" value="option1" onclick="showAllEdit()"> <label
																					for="inlineCheckbox1"> All &nbsp;</label>
																			</div>
																			<div class="checkbox checkbox checkbox-inline">
																				<input type="checkbox" class="styled"
																					id="inlineCheckbox2" value="option1"> <label
																					for="inlineCheckbox2"> Water  </label>
																			</div>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" class="styled"
																					id="inlineCheckbox3" value="option1"> <label
																					for="inlineCheckbox3"> Dissel </label>
																			</div>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" class="styled"
																					id="inlineCheckbox4" value="option1"> <label
																					for="inlineCheckbox4"> Current </label>
																			</div>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" class="styled"
																					id="inlineCheckbox5" value="option1"> <label
																					for="inlineCheckbox5"> Gas </label>
																			</div>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" class="styled"
																					id="inlineCheckbox6" value="option1"> <label
																					for="inlineCheckbox6"> AC </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			</div>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" class="styled"
																					id="inlineCheckbox7" value="option1"> <label
																					for="inlineCheckbox7"> Others </label>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
													
														<div class="waterEditMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">Water Reading</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				
																				
																				<td><input type="text" id="e_wmr" name="e_wmr" class="form-control" pattern="^[0-9]*$"></td>
																				<td><input type="text" id="e_water_CPU" name="e_water_CPU" class="form-control" value="${cost.wtrCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="currentEditMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">Current Reading</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
													
																			<tr>
																				<td><input type="text" id="e_pmr" name="e_pmr" class="form-control" pattern="^[0-9]*$"></td>
																				<td><input type="text" id="e_power_CPU" name="e_power_CPU" class="form-control" value="${cost.pwrCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="gasEditMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">Gas Reading</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
													
																			<tr>
																				<td><input type="text" id="e_gmr" name="e_gmr" class="form-control" pattern="^[0-9]*$"></td>
																				<td><input type="text" id="e_gas_CPU" name="e_gas_CPU" class="form-control" value="${cost.gasCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>

													</div>
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
														<div class="disselEditMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">Dissel Reading</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				<th>Cost/Unit</th>
																			</tr>
												
																		</thead>
																		<tbody>
																			<tr>
																				<td><input type="text" id="e_dmr" name="e_dmr" class="form-control" pattern="^[0-9]*$"></td>
																				<td><input type="text" id="e_disel_CPU" name="e_disel_CPU" class="form-control" value="${cost.dslCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="acEditMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">AC Reading</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td><input type="text" id="e_amr" name="e_amr" class="form-control" pattern="^[0-9]*$"></td>
																				<td><input type="text" id="e_ac_CPU" name="e_ac_CPU" class="form-control" value="${cost.acCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="OtherEditMeter">
															<div class="card" id="meterCard">
																<div class="card-header">
																	<strong class="card-title">Other Readings</strong>
																</div>
																<div class="card-body">
																	<table class="table text-center">
																		<thead class="thead-light">
																			<tr>
																				<th>Present</th>
																				<th>Cost/Unit</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td><input type="text" id="e_omr" name="e_omr" class="form-control" pattern="^[0-9]*$"></td>
																				<td><input type="text" id="e_other_CPU" name="e_other_CPU" class="form-control" value="${cost.otherCost}" readonly></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" id="pills-Editbulk"
												role="tabpanel" aria-labelledby="pills-Editbulk-tab">
												<div class="row">
													<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
														<div class="card" id="meterCard">
															<div class="card-header">
																<strong class="card-title">Asset Details</strong>
															</div>
															<div class="card-body">
																<div class="form-group">
																	<label for="company" class=" form-control-label">Date</label>
																	<div class="input-group">
																		<input class="form-control" id="datepicker">
																	</div>
																</div>
																<div class="form-group">
																	<label for="company" class="form-control-label">Unit
																		No</label>
																	<div class="row">
																		<div class="col-9">
																			<input type="text" id="company" placeholder="Ex:Unit"
																				class="form-control">
																		</div>
																		<div class="col-2">
																			<button type="button" class="btn btn-info mb-1"
																				data-toggle="modal"
																				data-target="#meterEditBulkModal">
																				<i class="fa fa-search"></i>
																			</button>
																		</div>
																		<div class="col"></div>
																	</div>
																	<div class="modal fade" id="meterEditBulkModal"
																		tabindex="-1" role="dialog"
																		aria-labelledby="largeModalLabel" aria-hidden="true">
																		<div class="modal-dialog modal-lg" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="largeModalLabel">Asset
																						List</h5>
																					<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>-->
																				</div>
																				<div class="modal-body">
																					<div class="form-group">
																						<div class="form-check-inline form-check">
																							<label for="inline-radio1"
																								class="form-check-label "> <input
																								type="radio" id="inline-radio1"
																								name="inline-radios" value="option1"
																								class="form-check-input">Full Property
																							</label> &nbsp;&nbsp;

																						</div>
																					</div>
																					<table id="editmeterBulkInner" class="text-center"
																						data-toggle="table" data-pagination="true"
																						data-search="true" data-show-columns="true"
																						data-show-pagination-switch="true"
																						data-show-refresh="true" data-key-events="true"
																						data-show-toggle="true" data-resizable="true"
																						data-cookie="true" data-cookie-id-table="saveId"
																						data-show-export="true"
																						data-click-to-select="true"
																						data-toolbar="#toolbar">
																						<thead>
																							<tr>
																								<th data-checkbox="true"></th>
																								<th>Asset ID</th>
																								<th>Property Name</th>
																								<th>Unit No</th>

																							</tr>
																						</thead>
																						<tbody>
																							<tr>
																								<td></td>
																								<td><a href="#">AST0001</a></td>
																								<td>Manjeera Trinity</td>
																								<td>101</td>
																							</tr>
																							<tr>
																								<td></td>
																								<td><a href="#">AST0001</a></td>
																								<td>Manjeera Trinity</td>
																								<td>101</td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-info btn-sm">OK</button>

																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																
															</div>
														</div>
													</div>
													<div class="col-lg-8">
														<div class="bulkUpload">
															<h4 class="py-3">Please read the below guidelines
																before uploading a file</h4>
															<ol class="pl-3 text-justify">
																<li>Click on below link to download the template</li>
																<li>After downloading the template switch back to
																	app</li>
																<li>Edit the downloaded template in microsoft Excel</li>
																<li>There are certain things which have been locked
																	in the tamplate sheet to avoid manual errors while you
																	enter the data.</li>
																<li>Columns marked in the red are Mandatory.</li>
																<li>There is a sample Property(in blue,line number
																	2),being added in each child sheet the child sheets are
																	advertise for rent,advertise for sale,already on rent
																	and hold,Please follow the pattern to add your
																	properties.</li>
																<li>Delete the sample data,line2,before uploading a
																	file.</li>
																<li>After entering the properties in the
																	template,save the file in your device.</li>
																<li>upload the .xlsx file by selecting "select file
																	" button.</li>
																<li>If you have any issues, Please give us a
																	feedback (our online feedback feature),we are happy to
																	assit you.</li>

															</ol>
															<button type="button" class="btn btn-outline-info">Download
																the template</button>

															<div class="file-upload mt-3">
																<div class="file-select">
																	<div class="file-select-button" id="fileName">
																		<i class="fa fa-upload" aria-hidden="true"></i>
																	</div>
																	<div class="file-select-name" id="noFile">No file
																		chosen...</div>
																	<input type="file" name="chooseFile" id="chooseFile">
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
								<button type="submit" class="btn btn-info btn-sm">Save</button>
								<button type="button" class="btn btn-secondary btn-sm"
									onclick="closeModal()">Close</button>

							</div></form>
						</div>
					</div>
				</div>



			</div>
			<!-- .animated -->
		</div>

	
		<!-- /.content -->
		<div class="clearfix"></div>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	
	<script>

		 $('#inlineEditIndCheckbox1').attr('disabled', false);
		$('#inlineEditIndCheckbox2').attr('disabled', false);
	    $('#inlineEditIndCheckbox3').attr('disabled', false);
	    $('#inlineEditIndCheckbox4').attr('disabled', false);
	    $('#inlineEditIndCheckbox5').attr('disabled', false);
	    $('#inlineEditIndCheckbox6').attr('disabled', false);
	    $('#inlineEditIndCheckbox7').attr('disabled', false);
	$(".currentMeter").hide();
	$(".disselMeter").hide();
	$(".waterMeter").hide();
	$(".gasMeter").hide();
	$(".acMeter").hide();
	$(".OtherMeter").hide();
	
	
	   function loadMonthYear() {
	        var dt = new Date();
	        var cur_month = dt.getMonth();
	        var prev_month = 0;
	        if (cur_month != 0) {
	            prev_month = cur_month - 1;
	        }
	        var cur_year = dt.getFullYear();
	        var mlist = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	       
	        for (var i = 0; i < mlist.length; i++) {
				$('#month_indv').append(
						$('<option/>').attr("value", mlist[i]).text(mlist[i]));
				
			}
	        
	        //$('#month_indv').val(month_name);
	        $('#year_indv').val(cur_year);
	       
	    }
	    window.onload = loadMonthYear;
	    
function submitReadins(){
	var arra1=[];
	var datepicInd=$('#datepicInd').val();
	var unitNo=$('#unitNo').val();
	 var All = document.getElementById("inlineEditIndCheckbox1").checked; 
	var Current=$('#inlineEditIndCheckbox2').prop("checked");
	var Diesel=$('#inlineEditIndCheckbox3').prop("checked");
	var Water=$('#inlineEditIndCheckbox4').prop("checked");
	var Gas=$('#inlineEditIndCheckbox5').prop("checked");
	var AC=$('#inlineEditIndCheckbox6').prop("checked");
	var Others=$('#inlineEditIndCheckbox7').prop("checked");
	arra1.push(All);
	arra1.push(Current);
	arra1.push(Diesel);
	arra1.push(Water);
	arra1.push(Gas);
	arra1.push(AC);
	arra1.push(Others);
	 if(arra1.includes(true)&&unitNo!=""){
	
							$('#formid').submit();
					
						
					}
	 else{
		 if(unitNo==""){
			 alert("Please select Unit no");
			 }else{
		 alert("Please select atleast one check box");
			 }
		 }
		}

		function appendFlatno(prtyid) {
		var month=$('#month_indv').val();
		var year=$('#year_indv').val();
			var flatno = 0;
			var Cassetid = 0;
			//Cassetid   chkBox
			$("#innerMeterAddTable tr").each(
					function() {
						var tr = $(this);
						var chkbox = $(this).find('input[type="radio"]').prop("checked");
						
								
						if (chkbox == true) {
							flatno = $(this).find('input[type="hidden"]').val();
							Cassetid=$(this).find('span').text();
						
							 $.ajax({
				      	         type: "post",
				      	         url: "getReadingsByFlat?flat="+flatno+"&prtyid="+prtyid+"&month="+month+"&year="+year+"",
				      	         cache: false,
				      	         async: false,               
				      	         success: function(response){
				      		      
				      		      if(response!=''){

									alert("Readings already added to this asset for this moth and year..please go to edit");
									$("#saveRedings").attr("disabled", true);
					      		      
					      		      }
				      		      else{
				      		    	$("#saveRedings").attr("disabled", false);
					      		      }
				      	           
				      	         },
				      	         error: function(){                                                                                 
				      	         }                                                       
				      	     });   
							
						} else {

						}
					});

			$('#unitNo').val(flatno);
			$('#assetid').val(Cassetid);
		
			$("#meterAddIndModal").hide();
		}

		
						function showAll() {
							var chkVal=$("#inlineEditIndCheckbox1").prop("checked");
							var pwrCost=$('#Ccost').val();
							if(pwrCost==''){
								alert(" Cost not added..Please add cost to save mreadings..!");
								
								$("#saveRedings").attr("disabled", true);
							}
						else{
							$("#saveRedings").attr("disabled", false);
							}
							if(chkVal==true){
							$(".waterMeter").toggle();
							$(".currentMeter").toggle();
							$(".disselMeter").toggle();
							$(".gasMeter").toggle();
							$(".acMeter").toggle();
							$(".OtherMeter").toggle();
							//.datepicker("disable").attr("disabled",false).
							$(
									"#wpresent,#wCost,#Cpresent,#Ccost")
									.prop("required", true);
							$(
									"#Gpresent,#Gcost,#Dpresent,Dcost")
									.prop("required", true);
							$(
									"#ACpresent,#wCost,#ACcost,#Otpresent,#Otcost")
									.prop("required", true);
							 	$('#inlineEditIndCheckbox2').attr('disabled', true);
					            $('#inlineEditIndCheckbox3').attr('disabled', true);
					            $('#inlineEditIndCheckbox4').attr('disabled', true);
					            $('#inlineEditIndCheckbox5').attr('disabled', true);
					            $('#inlineEditIndCheckbox6').attr('disabled', true);
					            $('#inlineEditIndCheckbox7').attr('disabled', true);
						    
						}else{
							$("#Cpresent").val('');
							$("#wpresent").val('');
							$("#Dpresent").val('');
							$("#Gpresent").val('');
							$("#ACpresent").val('');
							$("#Otpresent").val('');
							$(".waterMeter").toggle();
							$(".currentMeter").toggle();
							$(".disselMeter").toggle();
							$(".gasMeter").toggle();
							$(".acMeter").toggle();
							$(".OtherMeter").toggle();
							$("#wprvious,#wpresetnt,#wCost,#Cpresent,#Ccost")
							.prop("required", false);
					
							$("#Gpresent,#Gcost,#Dpresent,Dcost")
							.prop("required", false);
					
							$("#ACpresent,#wCost,#ACcost,#Otpresent,#Otcost")
							.prop("required", false);
							$('#inlineEditIndCheckbox2').attr('disabled', false);
				            $('#inlineEditIndCheckbox3').attr('disabled', false);
				            $('#inlineEditIndCheckbox4').attr('disabled', false);
				            $('#inlineEditIndCheckbox5').attr('disabled', false);
				            $('#inlineEditIndCheckbox6').attr('disabled', false);
				            $('#inlineEditIndCheckbox7').attr('disabled', false);

							}
						}

						
		
		function showcurrent() {
			var chkVal=$("#inlineEditIndCheckbox2").prop("checked");
			var pwrCost=$('#Ccost').val();
			if(pwrCost==''){
				alert("Power cost not added..Please add cost to save mreadings..!");
				
				$("#saveRedings").attr("disabled", true);
			}
		else{
			$("#saveRedings").attr("disabled", false);
			}
			if(chkVal==true){
				$(".currentMeter").toggle();
				$("#Cpresent").prop("required", true);
				$('#inlineEditIndCheckbox1').attr('disabled', true);
	           
			}
			else{
				$(".currentMeter").hide();
				$("#Cpresent").val('');
				$("#Cpresent").prop("required", false);
				$('#inlineEditIndCheckbox1').attr('disabled', false);
				}
			}

		function showWater() {
			var chkVal=$("#inlineEditIndCheckbox4").prop("checked");
			var wCost=$('#Ccost').val();
			if(wCost==''){
				alert("Water cost not added..Please add cost to save mreadings..!");
				
				$("#saveRedings").attr("disabled", true);
			}
		else{
			$("#saveRedings").attr("disabled", false);
			}
			if(chkVal==true){
				$(".waterMeter").toggle();
				$("#wpresent").prop("required", true);
				$('#inlineEditIndCheckbox1').attr('disabled', true);
	           
			}
			else{
				$(".waterMeter").hide();
				$("#wpresent").prop("required", false);
				$("#wpresent").val('');
				$('#inlineEditIndCheckbox1').attr('disabled', false);
				
				}
			}
		$("#saveRedings").attr("disabled", true);
		function showDiesel(){
			var chkVal=$("#inlineEditIndCheckbox3").prop("checked");
			var Dcost=$('#Dcost').val();
			if(Dcost==''){
				alert("Desiel cost not added..Please add cost to save mreadings..!");
				
				$("#saveRedings").attr("disabled", true);
			}
		else{
			$("#saveRedings").attr("disabled", false);
			}
			if(chkVal==true){
				$(".disselMeter").toggle();
				$("#Dpresent").prop("required", true);
				
	           
			}
			else{
				$(".disselMeter").hide();
				$("#Dpresent").prop("required", false);
				$("#Dpresent").val('');
				$('#inlineEditIndCheckbox1').attr('disabled', false);
				
				}
			
			}
		function showgas(){
			var chkVal=$("#inlineEditIndCheckbox5").prop("checked");
			var Gcost=$('#Gcost').val();
			if(Gcost==''){
				alert("Gas cost not added..Please add cost to save mreadings..!");
				$("#saveRedings").attr("disabled", true);
				}
			else{
				$("#saveRedings").attr("disabled", false);
				}
			if(chkVal==true){
				$(".gasMeter").toggle();
				$("#Gpresent").prop("required", true);
							}
			else{
				$(".gasMeter").hide();
				$("#Gpresent").prop("required", false);
				
				$("#Gpresent").val('');
				$('#inlineEditIndCheckbox1').attr('disabled', false);
				$("#saveRedings").attr("disabled", false);
				}
			
			}
		function showAC(){
			var chkVal=$("#inlineEditIndCheckbox6").prop("checked");
			var ACcost=$('#ACcost').val();
			if(ACcost==''){
				alert("Gas cost not added..Please add cost to save mreadings..!");
				
				$("#saveRedings").attr("disabled", true);
			}
		else{
			$("#saveRedings").attr("disabled", false);
			}
			if(chkVal==true){
				$(".acMeter").toggle();
				$("#ACpresent").prop("required", true);
				
				$('#inlineEditIndCheckbox1').attr('disabled', true);
	           
			}
			else{
				$(".acMeter").hide();
				$("#ACpresent").prop("required", false);
				
				$("#ACpresent").val('');
				$('#inlineEditIndCheckbox1').attr('disabled', false);
				}
			
			}
		function showOthers(){
			var chkVal=$("#inlineEditIndCheckbox7").prop("checked");
			/* var ACcost=$('#ACcost').val();
			if(ACcost==''){
				alert("Other cost not added..Please add cost to save mreadings..!");
				
				$("#saveRedings").attr("disabled", true);
			}
		else{
			$("#saveRedings").attr("disabled", false);
			} */
			if(chkVal==true){
				$(".OtherMeter").toggle();
				$("#Otpresent").prop("required", true);
				
				$('#inlineEditIndCheckbox1').attr('disabled', true);
	           
			}
			else{
				$(".OtherMeter").hide();
				$("#Otpresent").val('');
				$("#Otpresent").prop("required", false);
				
				$('#inlineEditIndCheckbox1').attr('disabled', false);
				}
			
			}

		
		
	
	</script>

	
	<script>
		$('#chooseFile').bind('change', function() {
			var filename = $("#chooseFile").val();
			if (/^\s*$/.test(filename)) {
				$(".file-upload").removeClass('active');
				$("#noFile").text("No file chosen...");
			} else {
				$(".file-upload").addClass('active');
				$("#noFile").text(filename.replace("C:\\fakepath\\", ""));
			}
		});
	</script>
	
	<script>

	function getReadingsView(flatno,month,water_CPU,wmr,power_CPU,pmr,gas_CPU,gmr,disel_CPU,dmr,ac_CPU,amr,other_CPU,omr){
		$("#v_flatno").text(flatno);		$("#v_month").text(month);
		$("#v_water_CPU").text(water_CPU);	$("#v_wmr").text(wmr);
		$("#v_power_CPU").text(power_CPU);	$("#v_pmr").text(pmr);
		$("#v_gas_CPU").text(gas_CPU);	    $("#v_gmr").text(gmr);
		$("#v_disel_CPU").text(disel_CPU);	$("#v_dmr").text(dmr);
		$("#v_ac_CPU").text(ac_CPU);		$("#v_amr").text(amr);
		$("#v_other_CPU").text(other_CPU);	$("#v_omr").text(omr);
		$("#v_flatno1").text(flatno);
		}

	//$("#inlineCheckbox1").change(function() {
	function showAllEdit(){

		var chekVal=$("#inlineCheckbox1").prop('checked');
		if(chekVal==false){
			$('#e_wmr').val('');
			$('#e_pmr').val('');
			$('#e_dmr').val('');
			$('#e_gmr').val('');
			$('#e_amr').val('');
			$('#e_omr').val('');
			$("#inlineCheckbox2").prop('checked',false);
			$("#inlineCheckbox3").prop('checked',false);
			$("#inlineCheckbox4").prop('checked',false);
			$("#inlineCheckbox5").prop('checked',false);
			$("#inlineCheckbox6").prop('checked',false);
			$("#inlineCheckbox7").prop('checked',false);
			$(".waterEditMeter").hide();
			$(".currentEditMeter").hide();
			$(".disselEditMeter").hide();
			$(".gasEditMeter").hide();
			$(".acEditMeter").hide();
			$(".OtherEditMeter").hide();
		
		}else{
			$("#inlineCheckbox2").prop('checked',true);
			$("#inlineCheckbox3").prop('checked',true);
			$("#inlineCheckbox4").prop('checked',true);
			$("#inlineCheckbox5").prop('checked',true);
			$("#inlineCheckbox6").prop('checked',true);
			$("#inlineCheckbox7").prop('checked',true);
			$(".waterEditMeter").show();
			$(".currentEditMeter").show();
			$(".disselEditMeter").show();
			$(".gasEditMeter").show();
			$(".acEditMeter").show();
			$(".OtherEditMeter").show();
			}

	}
	//});
	$("#inlineCheckbox2").change(function() {
		var chekVal=$("#inlineCheckbox2").prop('checked');
		if(chekVal==false){
			$('#e_wmr').val('');
			
		$(".waterEditMeter").hide();
		
		}else{
			$(".waterEditMeter").toggle();
			}
		
	});
	$("#inlineCheckbox4").change(function() {

		var chekVal=$("#inlineCheckbox4").prop('checked');
		if(chekVal==false){
			$('#e_pmr').val('');
			
		$(".currentEditMeter").hide();
		
		}else{
			$(".currentEditMeter").toggle();
			}
		//$(".currentEditMeter").toggle();
		
	});
	$("#inlineCheckbox3").change(function() {
		var chekVal=$("#inlineCheckbox3").prop('checked');
		if(chekVal==false){
			$('#e_dmr').val('');
		
		$(".disselEditMeter").hide();
		
		}else{
			$(".disselEditMeter").toggle();
			}
		//$(".disselEditMeter").toggle();
		
	});
	$("#inlineCheckbox5").change(function() {
		var chekVal=$("#inlineCheckbox5").prop('checked');
		if(chekVal==false){
			$('#e_gmr').val('');
		
		$(".gasEditMeter").hide();
		
		}else{
			$(".gasEditMeter").toggle();
			}
		//$(".gasEditMeter").toggle();
		
	});
	$("#inlineCheckbox6").change(function() {
		var chekVal=$("#inlineCheckbox6").prop('checked');
		if(chekVal==false){
			$('#e_amr').val('');
			
		$(".acEditMeter").hide();
		
		}else{
			$(".acEditMeter").toggle();
			}
		//$(".acEditMeter").toggle();
		
	});
	$("#inlineCheckbox7").change(function() {
		var chekVal=$("#inlineCheckbox7").prop('checked');
		if(chekVal==false){
			$('#e_omr').val('');
			
		$(".OtherEditMeter").hide();
		
		}else{
			$(".OtherEditMeter").toggle();
			}
		//$(".OtherEditMeter").toggle();
		
	});
	
function editReadings(flatno,month,wmr,pmr,gmr,dmr,amr,omr,year,tbl_pk){
		
if( wmr!=0 && pmr!=0 && dmr!=0 && gmr!=0 && amr!=0 && omr!=0 ){
	
	$("#inlineCheckbox1").prop('checked',true);
}

 if(wmr!=0){
	$("#inlineCheckbox2").prop('checked',true);
}
 else{
	 $("#inlineCheckbox2").prop('checked',false);
	 $(".waterEditMeter").hide();
	 }
 if(dmr!=0){
	$("#inlineCheckbox3").prop('checked',true);
	
}
 else{
	 $("#inlineCheckbox3").prop('checked',false);
	 $(".disselEditMeter").hide();
	 }
 if(pmr!=0){
	$("#inlineCheckbox4").prop('checked',true);
}
 else{
	 $("#inlineCheckbox4").prop('checked',false);
	 $(".currentEditMeter").hide();
	 }
 
 if(gmr!=0){
	$("#inlineCheckbox5").prop('checked',true);
}
 else{
	 $("#inlineCheckbox5").prop('checked',false);
	 $(".gasEditMeter").hide();
	 }
 if(amr!=0){
	$("#inlineCheckbox6").prop('checked',true);
}
 else{
	 $("#inlineCheckbox6").prop('checked',false);
	 $(".acEditMeter").hide();
	 }
 if(omr!=0){
	$("#inlineCheckbox7").prop('checked',true);
	
}
 else{
	 $("#inlineCheckbox7").prop('checked',false);
	 $(".OtherEditMeter").hide();
	 }
		$("#e_flatno").val(flatno);		    
		$("#e_month").val(month);
	
		$("#e_flatno1").val(flatno);		
		$("#tbl_pk").val(tbl_pk);
		$("#e_wmr").val(wmr);
		$("#e_pmr").val(pmr);
		 $("#e_gmr").val(gmr);
		 $("#e_dmr").val(dmr);
		 $("#e_omr").val(omr);
		 $("#e_amr").val(amr);
		 $("#e_year").val(year);
		
	}

	function deleteReadings(flat,prtyid,month,year,tblpk){
		 var r = confirm("Are you sure you want to delete Readings for this asset?");
      
         if (r == true) {
             
		 $.ajax({
  	         type: "post",
  	         url: "DeleteReadingsByFlat?flat="+flat+"&prtyid="+prtyid+"&month="+month+"&year="+year+"&readingid="+tblpk+"",
  	         cache: false,
  	         async: false,               
  	         success: function(response){
				alert("Readings Deleted successfully for period "+month+"/"+year+" for Asset- "+flat);
				window.location.reload();
				
  	         },
  	         error: function(){                                                                                 
  	         }                                                       
  	     }); 
         }

		}
	function closeModal(){
		
		window.location.reload();
		}
	
	</script>
</body>

</html>