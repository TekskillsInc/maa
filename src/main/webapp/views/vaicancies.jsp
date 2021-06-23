<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="resources/css/icons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
	<link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
	<link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/css/datepicker.css">
	<link rel="stylesheet" href="resources/css/build.css">
	<link rel="stylesheet" href="resources/css/toggle.css">
	<link rel="stylesheet" href="resources/css/data-table/bootstrap-table.css">
	<link rel="stylesheet" href="resources/css/data-table/bootstrap-editable.css">
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
		/*
        .th.sorting{
            display: none!important;
        }
*/
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
</head>
<body>
	<!-- Left Panel -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="MasterDashboard"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
					</li>
					<li>
						<a href="admin-properties?userid=${userid}"><i class="menu-icon fa fa-building-o"></i>Properties </a>
					</li>
					<li>
						<a href="classifides-admin"><i class="menu-icon fa fa-cubes"></i>Classifieds </a>
					</li>
					<li>
						<a href="vendor-admin"><i class="menu-icon fa fa-user"></i>Vendors </a>
					</li>
					<li>
						<a href="vacancies-admin"><i class="menu-icon fa fa-search"></i>Vacancies</a>
					</li>
					<!-- <li>
						<a href="reports.html"><i class="menu-icon fa fa-file" aria-hidden="true"></i>Reports</a>
					</li> -->
					<li>
						<a href="blogs"><i class="fa fa-rss menu-icon" aria-hidden="true"></i>Blogs</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
					<a class="navbar-brand" href="MasterDashboard">MaaServices </a>
					<a class="navbar-brand hidden" href="./"><img src="resources/img/logo/rounded_logo.png" alt="Logo"></a>
				</div>
				
			</div>
			<div class="top-right">
				<div class="header-menu">
					<div class="header-left">
						<!-- <a href="#">
							
						</a> -->
			
					<div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="resources/images/admin.jpg" alt="User Avatar">
                        <span style="color:white"><b>Super Admin</b></span>
                       
                       </a>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>
                            <a class="nav-link" href="changePassword"><i class="fa fa-power -off"></i>Change Password</a>
                            <a class="nav-link" href="logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>
				</div>
			</div>
			</div>
		</header>
			<!-- Animated -->
			<div class="content">		<!-- Header-->
			<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12" id="vendorMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title"> Vacancies</strong>
								</div>
								<div class="col-4">
									
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="vendorTable" class="text-center table-borderless" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
									<thead>
										<tr>
											<!-- <th>View</th> -->
											<th>Property Name</th>
											<th>Unit No</th>
											<th>Owner Name</th>
											<th>Mobile No</th>
											<th>E-Mail Id</th>
											
											<th>Location</th>								
											
										</tr>
									</thead>
									<tbody>
									<c:forEach var="vacancy" items="${vacanciesList}">
										<tr>
										<tr>
											<!-- <td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#vendorIDModal"><i class="fa fa-eye"></i></button>
												</td> -->
											
											
											<td><u><a href="PropertyFetch?prptyid=${vacancy.prtyid}&prptyname=${vacancy.ropertyName}">${vacancy.ropertyName} </u> </a></td>
											
											<%-- <td>${vacancy.ropertyName}</td> --%>
											<td>${vacancy.unitNo}</td>
											<td>${vacancy.ownerName}</td>
											<td>${vacancy.mobileNo}</td>
											<td>${vacancy.eMailId}</td>
											<td>${vacancy.location}</td>
											
											
										</tr>
										</c:forEach>	
									</tbody>
								</table>
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
		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">
						Copyright &copy; 2019 @Maa Properties
					</div>
				</div>
			</div>
		</footer>
		<!-- /.site-footer -->
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	
	 <script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="resources/js/datatable-new-backup/responsivebootstrap4.js"></script>
	<script src="resources/js/data-table/bootstrap-table.js"></script>
	<script src="resources/js/data-table/tableExport.js"></script>
	<script src="resources/js/data-table/data-table-active.js"></script>
	<script src="resources/js/data-table/bootstrap-table-editable.js"></script>
	<script src="resources/js/data-table/bootstrap-editable.js"></script>
	<script src="resources/js/data-table/bootstrap-table-resizable.js"></script>
	<script src="resources/js/data-table/colResizable-1.5.source.js"></script>
	<script src="resources/js/data-table/bootstrap-table-export.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/preloader.js"></script>
	<script src="resources/js/state.js"></script>
	<script src="resources/js/countries.js"></script>
	<script src="resources/js/main.js"></script>
	
	
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
	</script>
	<!-- <script>
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
		populateCountries("country2");
		        $("#otherTypeVendor").hide();
		        $("#typeOthers").on("change", function() {            
		            if ($('#otherTypeVendor').val() === 'Others') {
		               $("#otherTypeVendor").show();
		            }
		        });
	</script>
	 -->
	<!-- <script>
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
	</script> -->
</body>
</html>