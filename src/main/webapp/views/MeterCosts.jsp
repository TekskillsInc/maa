
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

#tenantDetailsTable button i {
	font-size: 17px;
	color: #000;
}

#tenantDetailsTable button i:hover {
	color: #fff;
}

#tenantDetailsTable button.custnBtn {
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
				<div class="col-md-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">

							<div class="row">
								<div class="col-8">
									<strong class="card-title">Meter Cost List</strong>
								</div>
								<c:if test='${roleid==2||roleid==1}'>
									<div class="col-4">
										<div class="addButton" id="tenantPlusAdd" style="float: right">
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="modal" data-target="#mCostAddModal">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</c:if>
							</div>



						</div>
						<div class="card-body">
							<table id="tenantDetailsTable"
								class="text-center table-borderless" data-toggle="table"
								data-pagination="true" data-search="true"
								data-show-columns="true" data-show-pagination-switch="true"
								data-show-refresh="true" data-key-events="true"
								data-show-toggle="true" data-resizable="true" data-cookie="true"
								data-cookie-id-table="saveId" data-show-export="true"
								data-click-to-select="true" data-toolbar="#toolbar">
								<thead>
									<tr>

										<th>prty Name</th>
										<th>Water Cost</th>
										<th>Power Cost</th>
										<th>Gas Cost</th>
										<th>Ac Cost</th>
										<th>Diesel Cost</th>
										<th>Other Costs</th>
										<!-- <th>Status</th> -->
										<th class="custmheight">Action</th>
									</tr>
								</thead>
								<tbody>


									<%-- <c:forEach var="cost" items="${mCostList}"> --%>

									<tr>

										<td>${prptyName}</td>
										<td>${cost.wtrCost}</td>
										<td>${cost.pwrCost}</td>
										<td>${cost.gasCost}</td>
										<td>${cost.acCost}</td>
										<td>${cost.dslCost}</td>
										<td>${cost.otherCost}</td>


										<td><button type="button"
												class="btn btn-outline-info btn-sm custnBtn"
												data-toggle="modal" data-target="#viewCostModal"
												onclick="viewCost('${cost.prtyid}','${prptyName}','${cost.wtrCost}','${cost.pwrCost}',
											'${cost.gasCost}','${cost.acCost}','${cost.dslCost}'
											,'${cost.otherCost}','${cost.status}')">
												<i class="fa fa-eye"></i>
											</button> <c:if test='${roleid==2||roleid==1}'>
												<button type="button"
													class="btn btn-outline-info btn-sm custnBtn"
													data-toggle="modal" data-target="#costEditModal"
													onclick="EditCost('${cost.tblpk}','${cost.prtyid}','${prptyName}','${cost.wtrCost}','${cost.pwrCost}',
											'${cost.gasCost}','${cost.acCost}','${cost.dslCost}'
											,'${cost.otherCost}','${cost.status}')">
													<i class="fa fa-edit"></i>
												</button>
											</c:if></td>

										<%-- <button type="button" class="btn btn-outline-info btn-sm custnBtn"
											 onclick="deleteTenant('${tntlist.tbl_id}')"><i class="fa fa-trash-o"></i></button> --%>
									</tr>
									<%-- </c:forEach> --%>






								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<!--Tenant ID Modal popup Start here-->

				<div class="modal fade" id="viewCostModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									MeterCost Info - <span id="v_tenant_name"></span>
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<div class="card">
											<div class="card-body card-block">
												<div class="row">
													<div class="col col-md-5">
														<label class=" form-control-label">PropertyName:</label>
													</div>
													<div class="col col-md-7">
														<p class="form-control-static">
															<span id="prtyname_v"></span>
														</p>
													</div>
												</div>

												<div class="row">
													<div class="col col-md-5">
														<label class=" form-control-label">water Cost:</label>
													</div>
													<div class="col col-md-7">
														<p class="form-control-static">
															<span id="wtrCost_v"></span>
														</p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-5">
														<label class=" form-control-label">Power Cost :</label>
													</div>
													<div class="col col-md-7">
														<p class="form-control-static">
															<span id="pwrCost_v"></span>
														</p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-5">
														<label class=" form-control-label">Gas Cost:</label>
													</div>
													<div class="col col-md-7">
														<p class="form-control-static">
															<span id="gasCost_v"></span>
														</p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-5">
														<label class=" form-control-label">Ac Cost</label>
													</div>
													<div class="col col-md-7">
														<p class="form-control-static">
															<span id="acCost_v"></span>
														</p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-5">
														<label class=" form-control-label">Diessel Cost</label>
													</div>
													<div class="col col-md-7">
														<p class="form-control-static">
															<span id="dslCost_v"></span>
														</p>
													</div>
												</div>
												<div class="row">
													<div class="col col-md-5">
														<label class=" form-control-label">Cost Cost</label>
													</div>
													<div class="col col-md-7">
														<p class="form-control-static">
															<span id="otrCost_v"></span>
														</p>
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




				<!--Tenant Add Details start Here-->
				<div class="modal fade" id="mCostAddModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content ">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Meter
									Costs</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" id="addModalbody">
								<div class="row">
									<div class="col">
										<form action="saveMeterCost" method='POST'>
											<input type="hidden" id="prptyid" name="prptyid"
												value="${prptyid}"> <input type="hidden"
												name="prptyName" value="${prptyName}">
											<div class="form-group">
												<label>Water cost*</label> <input type="text" id="wCost"
													name="wCost"  class="form-control" 
													>
											</div>
											<div class="form-group">
												<label>Current cost*</label> <input type="text" id="Ccost"
													name="Ccost" class="form-control" 
													 >
											</div>
											<div class="form-group">
												<label>Gas cost*</label> <input type="text" id="gcost"
													name="gcost" 
													 class="form-control">
											</div>
											<div class="form-group">
												<label>AC cost*</label> <input type="text" id="aCcost"
													name="aCcost" class="form-control"
													 >
											</div>
											<div class="form-group">
												<label>Dissel cost*</label> <input type="text" id="dcost"
													name="dcost" 
													  class="form-control">
											</div>
											<div class="form-group">
												<label>Other cost*</label> <input type="text" id="ocost"
													name="ocost" class="form-control" 
													 >
											</div>


											<button type="submit" class="btn btn-info btn-sm">Save</button>



										</form>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--Tenant Add Details Ends Here-->




				<!--Tenant Edit Details start here-->

				<div class="modal fade" id="costEditModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content ">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit
									MeterCost</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="col">
										<form action="updateMeterCost" method='POST'>
											<input type="hidden" id="prptyid" name="prptyid"
												value="${prptyid}"> <input type="hidden"
												name="prptyName" value="${prptyName}"> <input
												type="hidden" id="tblPk_e" name="tblPk_e">
											<div class="form-group">
												<label>Water cost*</label> <input type="text" id="wCost_e"
													name="wCost_e"   class="form-control" >
											</div>
											<div class="form-group">
												<label>Current cost*</label> <input type="text" id="Ccost_e"
													name="Ccost_e"  class="form-control" >
											</div>
											<div class="form-group">
												<label>Gas cost*</label> <input type="text" id="gCost_e"
													name="gcost_e"  class="form-control" >
											</div>
											<div class="form-group">
												<label>AC cost*</label> <input type="text" id="aCcost_e"
													name="aCcost_e"  class="form-control" oninvalid="this.setCustomValidity('Please Enter value as 0.00')">
											</div>
											<div class="form-group">
												<label>Dissel cost*</label> <input type="text" id="dCost_e"
													name="dcost_e"   class="form-control" oninvalid="this.setCustomValidity('Please Enter value as 0.00')">
											</div>
											<div class="form-group">
												<label>Other cost*</label> <input type="text" id="oCost_e"
													name="ocost_e"  class="form-control" >
											</div>

											<button type="submit" class="btn btn-info btn-sm">Save</button>
											<button type="button" class="btn btn-secondary btn-sm"
												data-dismiss="modal">Close</button>

										</form>
									</div>
								</div>
							</div>
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
					 Copyright &copy; 2019 @Maa Properties</div> 
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
		  $("#mCostAddModal").on("hidden.bs.modal", function() {
		    $("#addModalbody").html("");
		  });
		});
	
		$(document).ready(function() {
			$('#tenantSelectDetails').DataTable({
				columnDefs : [ {
					orderable : false,
					className : 'select-checkbox',
					targets : 0
				} ],
				select : {
					style : 'os',
					selector : 'td:first-child'
				},
				order : [ [ 1, 'asc' ] ]
			});
		});
	</script>
	<script>
		function viewCost(prtyid, prtyname, wtrCost, pwrCost, gasCost, acCost,
				dslCost, otrCost, status) {

			$('#prtyname_v').text(prtyname);
			$('#wtrCost_v').text(wtrCost);
			$('#pwrCost_v').text(pwrCost);
			$('#gasCost_v').text(gasCost);
			$('#acCost_v').text(acCost);
			$('#dslCost_v').text(dslCost);
			$('#otrCost_v').text(otrCost);
			$('#status_v').text(status);

			$('#viewCostModal').modal('show');
		}

		function EditCost(tblpk, prtyid, prtyname, wtrCost, pwrCost, gasCost,
				acCost, dslCost, otrCost, status) {

			$('#tblPk_e').val(tblpk);
			//$('#prtyname_e').val(prtyname);
			$('#wCost_e').val(wtrCost);
			$('#Ccost_e').val(pwrCost);
			$('#gCost_e').val(gasCost);
			$('#aCcost_e').val(acCost);
			$('#dCost_e').val(dslCost);
			$('#oCost_e').val(otrCost);
			//$('#status_e').text(status);

			/* if(status==0){
				$("#IstatusTogle").prop('checked', false);}
			else{
				$("#IstatusTogle").prop('checked', true);
			} */

			// $('#costEditModal').modal('show');
		}
	</script>

</body>

</html>