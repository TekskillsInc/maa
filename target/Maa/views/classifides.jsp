<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">
	<link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="resources/css/wizard/smart_wizard.css">
	<style>
		.navbar-brand {
			font-size: 18px !important;
		}

		.mail span {
			font-size: 32px;
			color: #878787
		}

		/*
        .mail{
            border: 1px solid #878787;
        }
*/

.addButton a{
	color:#fff;
}
	</style>
	<style>
		.form_wizard .stepContainer {
			display: block;
			position: relative;
			margin: 0;
			padding: 0;
			border: 0 solid #CCC;
			/*overflow-x: hidden*/
		}

		.wizard_horizontal ul.wizard_steps {
			display: table;
			list-style: none;
			position: relative;
			width: 100%;
			margin: 0 0 20px
		}

		.wizard_horizontal ul.wizard_steps li {
			display: table-cell;
			text-align: center
		}

		.wizard_horizontal ul.wizard_steps li a,
		.wizard_horizontal ul.wizard_steps li:hover {
			display: block;
			position: relative;
			-moz-opacity: 1;
			filter: alpha(opacity=100);
			opacity: 1;
			color: #666
		}

		.wizard_horizontal ul.wizard_steps li a:before {
			content: "";
			position: absolute;
			height: 4px;
			background: #ccc;
			top: 20px;
			width: 100%;
			z-index: 4;
			left: 0
		}

		.wizard_horizontal ul.wizard_steps li a.disabled .step_no {
			background: #ccc
		}

		.wizard_horizontal ul.wizard_steps li a .step_no {
			width: 40px;
			height: 40px;
			line-height: 40px;
			border-radius: 100px;
			display: block;
			margin: 0 auto 5px;
			font-size: 16px;
			text-align: center;
			position: relative;
			z-index: 5
		}

		.step_no,
		.wizard_horizontal ul.wizard_steps li a.selected:before {
			background: #34495E;
			color: #fff
		}

		.wizard_horizontal ul.wizard_steps li a.done .step_no,
		.wizard_horizontal ul.wizard_steps li a.done:before {
			background: #1ABB9C;
			color: #fff
		}

		.wizard_horizontal ul.wizard_steps li:first-child a:before {
			left: 50%
		}

		.wizard_horizontal ul.wizard_steps li:last-child a:before {
			right: 50%;
			width: 50%;
			left: auto
		}

		.actionBar {
			width: 100%;
			border-top: 1px solid #ddd;
			padding: 10px 5px;
			text-align: right;

		}

		.actionBar .buttonDisabled {
			cursor: not-allowed;
			pointer-events: none;
			opacity: .65;
			filter: alpha(opacity=65);
			box-shadow: none
		}

		.actionBar a {
			margin: 0 3px
		}

		.msgBox {
			display: none;
		}

		.loader {
			display: none;
		}

		.btn {

			font-size: 13px !important;
		}

		.input-group-text {
			font-size: 13px;
		}
		
		.file-upload {
    position: relative;
    height: 10rem;
    margin-bottom: 2rem;
    margin-top: 2rem;
}
.file-upload .file-upload-input {
    border-radius: .4rem;
    width: 100%;
    border: .2rem dashed rgba(0,0,0,.2);
    height: 10rem;
    text-align: center;
    cursor: pointer;
    position: relative;
    display: inline-block;
    padding: 10rem 0 0 0;
    overflow: hidden;
    z-index: 1;
    transition: .3s ease;
}
.file-upload .file-upload-input:hover {
    border-color: rgba(0,0,0,.4);
    background-color: rgba(0,0,0, .05);
}
.file-upload span {
    position: absolute;
    top: 0;
    bottom: 0;
    line-height: 10.5rem;
    width: 100%;
    text-align: center;
    margin: auto;
    z-index: 0;
    left: 0;
    font-size: 0.8rem;
    color: rgba(0,0,0,.5);
}
.file-upload span i {
    color: #2d4b64;
    margin-right: 0rem;
}
.file-upload-previews > .MultiFile-label {
    border-radius: .4rem;
    background-color: rgba(0,0,0, .03);
    display: inline-block;
    border: .2rem solid rgba(0,0,0, .1);
    padding: 1rem;
    position: relative;
    margin-right: 1rem;
    width: 100%;
}
.file-upload-previews span.MultiFile-label {
    box-shadow: 0 0.2rem .7rem 0 rgba(0,0,0, .08);
    position: relative;
    text-align: center;
    display: inline-block;
    margin: 1rem;
}
.file-upload-previews span.MultiFile-label .MultiFile-title {
    position: absolute;
    background-color: rgba(0,0,0, .4);
    color: #fff;
    padding: 1rem;
    bottom: 0;
    font-size: 1.2rem;
    text-align: center;
    width: 100%;
}
.file-upload-previews span.MultiFile-label .MultiFile-preview {
    max-width: 20rem !important;
    max-height: 15rem !important;
}
.file-upload-previews .MultiFile-remove {
    box-shadow: 0 0.2rem .7rem 0 rgba(0,0,0, .08);
    border-radius: 50%;
    color: transparent;
    position: absolute;
    background-color: red;
    width: 2rem;
    height: 2rem;
    top: -1rem;
    right: -1rem;
    z-index: 1;
}
.file-upload-previews .MultiFile-remove:after {
    font-family: 'fontawesome';
    content: "\f00d";
    color: #fff;
    top: -.2rem;
    position: relative;
    font-size: 1rem;
}
.file-uploaded-images .image {
    height: 4rem;
    display: inline-block;
    margin-bottom: 1.8rem;
    margin-right: 1.5rem;
    position: relative;
}
.file-uploaded-images .image figure {
 box-shadow: 0 0.2rem 0.7rem 0 rgba(0,0,0, .08);
    border-radius: 50%;
    cursor: pointer;
    background-color: #17a2b8;
    width: 1.5rem;
    height: 1.5rem;
    position: absolute;
    right: -1rem;
    top: -1rem;
    content: "";
    text-align: center;
    line-height: 1.5rem;
}
.file-uploaded-images .image figure i {
    color: #fff;
    font-size: 1rem;
}
.file-uploaded-images .image img {
    height: 100%;
}

.file-upload-previews > .MultiFile-label {
    border-radius: .4rem;
    background-color: rgba(0,0,0, .03);
    display: inline-block;
    border: .2rem solid rgba(0,0,0, .1);
    padding: 1rem;
    position: relative;
    margin-right: 1rem;
    width: 100%;
}
.file-upload-previews span.MultiFile-label {
    box-shadow: 0 0.2rem .7rem 0 rgba(0,0,0, .08);
    position: relative;
    text-align: center;
    display: inline-block;
    margin: 1rem;
}
.file-upload-previews span.MultiFile-label .MultiFile-title {
    position: absolute;
    background-color: rgba(0,0,0, .4);
    color: #fff;
    padding: 1rem;
    bottom: 0;
    font-size: 1.2rem;
    text-align: center;
    width: 100%;
}
.file-upload-previews span.MultiFile-label .MultiFile-preview {
    max-width: 20rem !important;
    max-height: 15rem !important;
}
.file-upload-previews .MultiFile-remove {
    box-shadow: 0 0.2rem .7rem 0 rgba(0,0,0, .08);
    border-radius: 50%;
    color: transparent;
    position: absolute;
    background-color: red;
    width: 2rem;
    height: 2rem;
    top: -1rem;
    right: -1rem;
    z-index: 1;
}
.file-upload-previews .MultiFile-remove:after {
    font-family: 'fontawesome';
    content: "\f00d";
    color: #fff;
    top: -.2rem;
    position: relative;
    font-size: 1rem;
}

		input.custom-checkbox{
			width: 20px;
			height: 20px;
			border-radius: 50%!important;
		}
				
.round {
  position: relative;
}

.round label {
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 50%;
  cursor: pointer;
  height: 28px;
  left: 0;
  position: absolute;
  top: 0;
  width: 28px;
}

.round label:after {
  border: 2px solid #fff;
  border-top: none;
  border-right: none;
  content: "";
  height: 6px;
  left: 7px;
  opacity: 0;
  position: absolute;
  top: 8px;
  transform: rotate(-45deg);
  width: 12px;
}

.round input[type="checkbox"] {
  visibility: hidden;
}

.round input[type="checkbox"]:checked + label {
  background-color: #66bb6a;
  border-color: #66bb6a;
}

.round input[type="checkbox"]:checked + label:after {
  opacity: 1;
}
		.checkbox-round {
    width: 1.3em;
    height: 1.3em;
    background-color: white;
    border-radius: 50%;
    vertical-align: middle;
    border: 2px solid rgba(0,0,0,.125);
    -webkit-appearance: none;
    outline: none;
    cursor: pointer;
}

.checkbox-round:checked {
    background-color: #17a2b8;
	border:1px solid #fff;
}		
		#border-box{
			border:1px solid #ced4da;
			padding: 15px;
		}
		
		button{
			width: 100%;
		}
		.custm-card1{
			 padding-top: 10px;
    padding-bottom: 10px;
    background-color: #edeef3;
		}
		.facebook{
			font-size: 30px;
			color: #3b5998;
		}
		.whatsapp{
			font-size: 30px;
			color: #46e676;
		}
		.twitter{
			font-size: 30px;
			color: #33aae0;
		}
		h4 a{
			font-size: 15px;
			font-weight: 600;
		}
		h5 a{
			font-size: 14px;
			font-weight: 600;
		}
		.instagram{
			font-size: 30px;
			color: #d7207c;
		}
	</style>
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="resources/img/logo/rounded_logo.png" alt="">
	</div>
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!--    Modal popup for switch property start here-->
		<div class="modal fade" id="switchModalPopUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Switch Property</h5>
						<button type="button" class="close custmClose" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="switchprpty-list">
							<div class="row">
								<div class="col-md-12">
									<aside class="profile-nav alt">
										<section class="card" id="custm-card">
											<div class="card-header user-header alt bg-dark">
												<div class="media">
													<a href="#">
														<img class="align-self-center rounded-circle mr-3" style="width:100px; height:100px;" alt="" src="images/home-images/home.png">
													</a>
													<div class="media-body mt-3">
														<h4 class="text-light display-6">Manjeera Trinity Corporate</h4>
														<p>Kphb colony,<br>Jntu,Hyderabad</p>
													</div>
												</div>
											</div>
										</section>
									</aside>
								</div>
								<div class="col-md-12">
									<a href="#">
										<aside class="profile-nav alt">
											<section class="card" id="custm-card">
												<div class="card-header user-header alt bg-dark">
													<div class="media">
														<a href="#">
															<img class="align-self-center rounded-circle mr-3" style="width:100px; height:100px;" alt="" src="images/home-images/home.png">
														</a>
														<div class="media-body mt-3">
															<h4 class="text-light display-6">Manjeera Trinity Corporate</h4>
															<p>Kphb colony,<br>Jntu,Hyderabad</p>
														</div>
													</div>
												</div>
											</section>
										</aside>
									</a>
								</div>
								<div class="col-md-12">
									<a href="#">
										<aside class="profile-nav alt">
											<section class="card" id="custm-card">
												<div class="card-header user-header alt bg-dark">
													<div class="media">
														<a href="#">
															<img class="align-self-center rounded-circle mr-3" style="width:100px; height:100px;" alt="" src="images/home-images/home.png">
														</a>
														<div class="media-body mt-3">
															<h4 class="text-light display-6">Manjeera Trinity Corporate</h4>
															<p>Kphb colony,<br>Jntu,Hyderabad-500075</p>
														</div>
													</div>
												</div>
											</section>
										</aside>
									</a>
								</div>
							</div>
						</div>
						<hr>
						<p class="text-center"><a href="#">View All</a></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info">Ok</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
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
									<strong class="card-title">Classifides</strong>
								</div>
								<div class="col-4">
									<div class="addButton" id="ownerPlusAdd" style="float:right">
										<a type="button" href="classifidesAdd" class="btn btn-info btn-sm"><i class="fa fa-plus"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body" id="classifiedImg">
							<div class="row">
								<div class="col-sm-12 col-lg-4 col-md-6">
									<!-- product card -->
									<div class="product-item bg-light">
										<div class="card">
											<div class="thumb-content">
												<!-- <div class="price">$200</div> -->
												<a href="classifides-single.html">
													<img class="card-img-top img-fluid" src="resources/images/home-images/img_3.jpg" alt="Card image cap">
												</a>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-8">
														<h4 class="card-title"><a data-toggle="modal" data-target="#viewClassifidModal">Manjeera Trinity Corpoarate</a></h4>
													</div>
													<div class="col">
														<a type="button" href="classifides-edit.html" class="btn btn-info btn-sm"><i class="fa fa-edit"></i></a>
														<a type="button" href="classifides-single.html" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
														
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">Flat For Rent</a></h5>
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#">Rs.34,000/-</a></h5>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">East,Hyderabad</a></h5>
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#"><i class="fa fa-calendar"></i>26th December</a></h5>
													</div>
												</div>

												
												
												<div class="row">
													<div class="col">
														<span class="facebook"><i class="fa fa-facebook-square"></i></span>	
													</div>
													<div class="col">
													<span class="whatsapp"><i class="fa fa-whatsapp"></i></span>
													</div>
													<div class="col">
													<span class="twitter"><i class="fa fa-twitter"></i></span>
													</div>
													<div class="col">
														<span class="instagram"><i class="fa fa-instagram"></i></span>
													</div>
												</div>
												<div class="row">
													<div class="col"><button type="button" class="btn btn-info">Mark as Rented</button></div>
													<div class="col"><button type="button" class="btn btn-info">Asst for Tenant</button></div>
												</div>
												<div class="row mt-2">
													<div class="col">
														<button type="button" class="btn btn-info">Asst for TenancyManagement</button>
													</div>
												</div>
												
												
												<!--<div class="product-ratings">
													<ul class="list-inline">
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item"><i class="fa fa-star"></i></li>
													</ul>
												</div>-->
											</div>
										</div>
									</div>



								</div>
								<div class="col-sm-12 col-lg-4 col-md-6">
									<!-- product card -->
									<div class="product-item bg-light">
										<div class="card">
											<div class="thumb-content">
												<!-- <div class="price">$200</div> -->
												<a href="classifides-single.html">
													<img class="card-img-top img-fluid" src="resources/images/home-images/img_3.jpg" alt="Card image cap">
												</a>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-8">
														<h4 class="card-title"><a data-toggle="modal" data-target="#viewClassifidModal">Manjeera Trinity Corpoarate</a></h4>
													</div>
													<div class="col">
														<a type="button" href="classifides-edit.html" class="btn btn-info btn-sm"><i class="fa fa-edit"></i></a>
														<a type="button" href="classifides-single.html" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
														
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">Flat For Rent</a></h5>
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#">Rs.34,000/-</a></h5>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">East,Hyderabad</a></h5>
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#"><i class="fa fa-calendar"></i>26th December</a></h5>
													</div>
												</div>

												
												
												<div class="row">
													<div class="col">
														<span class="facebook"><i class="fa fa-facebook-square"></i></span>	
													</div>
													<div class="col">
													<span class="whatsapp"><i class="fa fa-whatsapp"></i></span>
													</div>
													<div class="col">
													<span class="twitter"><i class="fa fa-twitter"></i></span>
													</div>
													<div class="col">
														<span class="instagram"><i class="fa fa-instagram"></i></span>
													</div>
												</div>
												<div class="row">
													<div class="col"><button type="button" class="btn btn-info">Mark as Rented</button></div>
													<div class="col"><button type="button" class="btn btn-info">Asst for Tenant</button></div>
												</div>
												<div class="row mt-2">
													<div class="col">
														<button type="button" class="btn btn-info">Asst for TenancyManagement</button>
													</div>
												</div>
												
												
												<!--<div class="product-ratings">
													<ul class="list-inline">
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item"><i class="fa fa-star"></i></li>
													</ul>
												</div>-->
											</div>
										</div>
									</div>



								</div>
								<div class="col-sm-12 col-lg-4 col-md-6">
									<!-- product card -->
									<div class="product-item bg-light">
										<div class="card">
											<div class="thumb-content">
												<!-- <div class="price">$200</div> -->
												<a href="classifides-single.html">
													<img class="card-img-top img-fluid" src="resources/images/home-images/img_3.jpg" alt="Card image cap">
												</a>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-8">
														<h4 class="card-title"><a data-toggle="modal" data-target="#viewClassifidModal">Manjeera Trinity Corpoarate</a></h4>
													</div>
													<div class="col">
														<a type="button" href="classifides-edit.html" class="btn btn-info btn-sm"><i class="fa fa-edit"></i></a>
														<a type="button" href="classifides-single.html" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
														
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">Flat For Rent</a></h5>
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#">Rs.34,000/-</a></h5>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">East,Hyderabad</a></h5>
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#"><i class="fa fa-calendar"></i>26th December</a></h5>
													</div>
												</div>

												
												
												<div class="row">
													<div class="col">
														<span class="facebook"><i class="fa fa-facebook-square"></i></span>	
													</div>
													<div class="col">
													<span class="whatsapp"><i class="fa fa-whatsapp"></i></span>
													</div>
													<div class="col">
													<span class="twitter"><i class="fa fa-twitter"></i></span>
													</div>
													<div class="col">
														<span class="instagram"><i class="fa fa-instagram"></i></span>
													</div>
												</div>
												<div class="row">
													<div class="col"><button type="button" class="btn btn-info">Mark as Rented</button></div>
													<div class="col"><button type="button" class="btn btn-info">Asst for Tenant</button></div>
												</div>
												<div class="row mt-2">
													<div class="col">
														<button type="button" class="btn btn-info">Asst for TenancyManagement</button>
													</div>
												</div>
												
												
												<!--<div class="product-ratings">
													<ul class="list-inline">
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
														<li class="list-inline-item"><i class="fa fa-star"></i></li>
													</ul>
												</div>-->
											</div>
										</div>
									</div>



								</div>
							</div>


							<!--<div class="table-responsive">
								<table id="classifedDetails" class="text-center table-borderless" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
									<thead>
										<tr>
											<th>Property Name</th>
											<th>Category</th>
											<th>Area</th>
											<th>BedRooms</th>
											<th>Facing</th>
											<th>Posted On</th>
											<th>Avilability On</th>
											<th class="custmheight">Action</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Manjeera</td>
											<td>Flat For Rent</td>
											<td>750Sft</td>
											<td>3BHK</td>
											<td>East</td>
											<td>05-05-2019</td>
											<td>15-05-2019</td>
											<td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#viewClassifidModal"><i class="fa fa-eye"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#editClasfideModal"><i class="fa fa-edit"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o"></i></button></td>

										</tr>
										<tr>
											<td>Manjeera</td>
											<td>Flat For Sell</td>
											<td>750Sft</td>
											<td>3</td>
											<td>East</td>
											<td>05-05-2019</td>
											<td>15-05-2019</td>
											<td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#viewClassifidModal"><i class="fa fa-eye"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#editClasfideModal"><i class="fa fa-edit"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o"></i></button></td>

										</tr>
										<tr>
											<td>Manjeera</td>
											<td>Item For Sale</td>
											<td>750Sft</td>
											<td>3</td>
											<td>East</td>
											<td>05-05-2019</td>
											<td>15-05-2019</td>
											<td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#viewClassifidModal"><i class="fa fa-eye"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#editClasfideModal"><i class="fa fa-edit"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o"></i></button></td>

										</tr>
										<tr>
											<td>Manjeera</td>
											<td>Commericaial</td>
											<td>750Sft</td>
											<td>3</td>
											<td>East</td>
											<td>05-05-2019</td>
											<td>15-05-2019</td>
											<td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#viewClassifidModal"><i class="fa fa-eye"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#editClasfideModal"><i class="fa fa-edit"></i></button>
												<button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o"></i></button></td>

										</tr>

									</tbody>
								</table>

							</div>-->

						</div>






					</div>
				</div>
				<div class="clearfix"></div>

				<!--
				Classifiede Add Modal Popup Start here-->

				

				<!--Classifides View Modal Start Here-->

				<div class="modal fade" id="viewClassifidModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Manjeera Trinity </h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">


									<div class="col-md-12">
										<div class="card" data-toggle="modal" data-target="#exampleModal">
											<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
												<ol class="carousel-indicators">
													<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
													<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
													<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
													<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
													<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
													<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
													<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>

												</ol>
												<div class="carousel-inner">
													<div class="carousel-item active">
														<img src="resources/images/home-images/img_1.jpg" class="d-block w-100" alt="...">
													</div>
													<div class="carousel-item">
														<img src="resources/images/home-images/img_3.jpg" class="d-block w-100" alt="...">
													</div>
													<div class="carousel-item">
														<img src="resources/images/home-images/img_5.jpg" class="d-block w-100" alt="...">
													</div>
													<div class="carousel-item">
														<img src="resources/images/home-images/img_3.jpg" class="d-block w-100" alt="...">
													</div>
													<div class="carousel-item">
														<img src="resources/images/home-images/img_3.jpg" class="d-block w-100" alt="...">
													</div>
													<div class="carousel-item">
														<img src="resources/images/home-images/img_3.jpg" class="d-block w-100" alt="...">
													</div>
												</div>


											</div>
											<div class="card-body">
												<h4 class="pt-4" style="font-weight: 600">Detailed Information</h4>

												<div class="row mt-4">
													<div class="col">
														<div class="row">
															<div class="col col-md-6">
																<label class=" form-control-label">Category:</label></div>
															<div class="col col-md-6">
																<p class="form-control-static">Flat For Rent</p>
															</div>
														</div>
														<div class="row">
															<div class="col col-md-6">
																<label class=" form-control-label">Facing:</label></div>
															<div class="col-12 col-md-6">
																<p class="form-control-static">West</p>
															</div>
														</div>
														<div class="row">
															<div class="col col-md-6">
																<label class=" form-control-label">Area:</label></div>
															<div class="col col-md-6">
																<p class="form-control-static">11000S.F.T</p>
															</div>
														</div>


														<div class="row">
															<div class="col col-md-6">
																<label class=" form-control-label">Property Type:</label></div>
															<div class="col col-md-6">
																<p class="form-control-static">3BHK</p>
															</div>
														</div>

														<div class="row">
															<div class="col col-md-6">
																<label class=" form-control-label">Price (in Rs):</label></div>
															<div class="col col-md-6">
																<p class="form-control-static">20000Rs/-</p>
															</div>
														</div>





													</div>
													<div class="col">
														<div class="row">
															<div class="col col-md-5">
																<label class=" form-control-label">Name:</label></div>
															<div class="col col-md-7">
																<p class="form-control-static">Veerababu</p>
															</div>
														</div>
														<div class="row">
															<div class="col col-md-5">
																<label class=" form-control-label">Email:</label></div>
															<div class="col col-md-7">
																<p class="form-control-static"> Ch.veerababu1@gmail.com</p>
															</div>
														</div>
														<div class="row">
															<div class="col col-md-5">
																<label class=" form-control-label">Mobile No:</label></div>
															<div class="col col-md-7">
																<p class="form-control-static"> 9876543210</p>
															</div>
														</div>
														<div class="row">
															<div class="col col-md-5">
																<label class=" form-control-label">Posted On:</label></div>
															<div class="col col-md-7">
																<p class="form-control-static"> 23-02-2019</p>
															</div>
														</div>
														<div class="row">
															<div class="col col-md-5">
																<label class=" form-control-label">Avilability On:</label></div>
															<div class="col col-md-7">
																<p class="form-control-static"> 01-03-2019</p>
															</div>
														</div>






													</div>

												</div>

												<div class="row">
													<div class="col">
														<label class=" form-control-label">Description:</label>
														<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
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

				<!--
				Classifides Edit Modal Popup start here-->

				<div class="modal fade" id="editClasfideModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Classifides</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<div id="wizard2" class="form_wizard wizard_horizontal mt-4">
											<ul class="wizard_steps">
												<li>
													<a href="#step-1">
														<span class="step_no">1</span>
														<span class="step_descr">

															<small>Property Details</small>
														</span>
													</a>
												</li>
												<li>
													<a href="#step-2">
														<span class="step_no">2</span>
														<span class="step_descr">

															<small>Upload Photos</small>
														</span>
													</a>
												</li>
												<li>
													<a href="#step-3">
														<span class="step_no">3</span>
														<span class="step_descr">

															<small>Contact Details</small>
														</span>
													</a>
												</li>
											</ul>

											<div id="step-1">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="card-header">
																<strong class="card-title">Property Details</strong>
															</div>
															<div class="card-body card-block">
																<input type="radio" name="age" value="30" id="inlineRadioFtbtn2" class="checkbox-round"  checked="checked"> Flat For Rent &nbsp;&nbsp;
																<input type="radio" name="age" value="60" id="inlineRadioSnbtn2" class="checkbox-round"> Flat For Sale &nbsp;&nbsp;
																<input type="radio" name="age" value="100" id="inlineRadioTdbtn2" class="checkbox-round"> House Hunting&nbsp;&nbsp;

																<div class="row mt-4" id="inlineFtContent2">
																	<div class="col-lg-6 col-md-6 col-sm-12">

																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type</label>
																			<select class="form-control" id="exampleFormControlSelect1">
																				<option>Apartment</option>
																				<option>House</option>
																				<option>Townhouse</option>
																				<option>Unit</option>

																			</select>
																		</div>


																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Beds</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Bathrooms</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of parking</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 0
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>


																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Area(s.ft)</label>
																					<input type="text" id="company" placeholder="Area(s.ft)" class="form-control">
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Facing</label>
																					<select class="form-control" id="exampleFormControlSelect1">
																						<option>East</option>
																						<option>West</option>
																						<option>North</option>
																						<option>South</option>
																					</select>
																				</div>

																			</div>

																		</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Address</label>
																			<textarea rows="2" cols="50" class=" form-control"></textarea>
																		</div>


																	</div>
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">City</label>
																					<input type="text" id="company" placeholder="City" class="form-control">
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">State</label>
																					<input type="text" id="company" placeholder="State" class="form-control">
																				</div>
																			</div>
																		</div>


																		<h5><b>Features</b></h5>
																		<div class="row mt-3">
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" id="checkbox" class="checkbox-round"> Power Backup
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Children Playground
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Gym
																				</label>
																			</div>
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Walking Track
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Lift Access 
																				</label><br>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Club House
																				</label>

																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<input type="text" id="company" placeholder="" class="form-control">
																				</div>
																			</div>
																		</div>
																		<button type="button" class="btn btn-info">Add more features</button>
																		<div class="form-group mt-3">
																			<label for="company" class=" form-control-label">GoogleMap Link</label>
																			<textarea rows="2" cols="50" class=" form-control"></textarea>
																			<small id="passwordHelpBlock" class="form-text">
  <a href="https://www.google.com/maps" target="_blank">click here for Googlemap</a>
</small>
																		</div>

																	</div>

																</div>
																<div class="row mt-4" id="inlineSdContent2">
																	<div class="col-6">

																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type</label>
																			<select class="form-control" id="exampleFormControlSelect1">
																				<option>Apartment</option>
																				<option>House</option>
																				<option>Townhouse</option>
																				<option>Unit</option>

																			</select>
																		</div>


																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Beds</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Bathrooms</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of parking</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 0
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option1" autocomplete="off" checked> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="options" id="option3" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>


																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Area(s.ft)</label>
																					<input type="text" id="company" placeholder="Area(s.ft)" class="form-control">
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Facing</label>
																					<select class="form-control" id="exampleFormControlSelect1">
																						<option>East</option>
																						<option>West</option>
																						<option>North</option>
																						<option>South</option>
																					</select>
																				</div>

																			</div>

																		</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Address</label>
																			<textarea rows="2" cols="50" class=" form-control"></textarea>
																		</div>


																	</div>
																	<div class="col-6">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">City</label>
																					<input type="text" id="company" placeholder="City" class="form-control">
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">State</label>
																					<input type="text" id="company" placeholder="State" class="form-control">
																				</div>
																			</div>
																		</div>


																		<h5><b>Features</b></h5>
																		<div class="row mt-3">
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Power Backup
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Children Playground
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Gym
																				</label>
																			</div>
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Walking Track
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Lift Access
																				</label><br>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> Club House
																				</label>

																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<input type="text" id="company" placeholder="" class="form-control">
																				</div>
																			</div>
																		</div>
																		<button type="button" class="btn btn-info">Add more features</button>
																		<div class="form-group mt-3">
																			<label for="company" class=" form-control-label">GoogleMap Link</label>
																			<textarea rows="2" cols="50" class=" form-control"></textarea>
																			<small id="passwordHelpBlock" class="form-text">
  <a href="https://www.google.com/maps" target="_blank">click here for Googlemap</a>
</small>
																		</div>

																	</div>

																</div>
																<div class="row mt-4" id="inlineTdContent2">
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Name</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> For Rent
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="" class="checkbox-round"> For Buy
																				</label>
																				
																			</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">My interests (No Of beds, Locality, Budget) </label>
																			<textarea rows="2" cols="50" class=" form-control"></textarea>
																		</div>
																		
																	</div>
																</div>

															</div>
														</div>

													</div>
												</div>
											</div>
											<div id="step-2">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="card-header">
																<strong class="card-title">Upload Photos</strong>
															</div>
															<div class="card-body card-block">
																<div class="row">
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="form-group" id="rentClick">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Rent</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">
																				<div class="input-group-append">
																					<div class="input-group-text">Monthly</div>
																				</div>
																			</div>
																		</div>
																		<div class="form-group" id="saleClick">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">sale</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Advance</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Available on</div>
																				</div>
																				<input type="date" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">Title</label>
																			<input type="text" id="company" placeholder="Title" class="form-control">
																		</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Description</label>
																			<textarea rows="2" cols="50" class="form-control"></textarea>
																		</div>

																	</div>
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<h4 class="my-3">Gallery</h4>
                            <div class="file-uploaded-images">
                                <div class="image">
                                    <figure class="remove-image"><i class="fa fa-close"></i></figure>
                                    <img src="images/buldinginner/1.jpg" alt="">
                                </div>
                                <div class="image">
                                    <figure class="remove-image"><i class="fa fa-close"></i></figure>
                                     <img src="images/buldinginner/2.jpg" alt="">
                                </div>
                                <div class="image">
                                    <figure class="remove-image"><i class="fa fa-close"></i></figure>
                                     <img src="images/buldinginner/3.jpg" alt="">
                                </div>
                            </div>
                            <div class="file-upload-previews"></div>
                            <div class="file-upload">
                                <input type="file" name="files[]" class="file-upload-input with-preview" multiple title="Click to add files" maxlength="10" accept="gif|jpg|png">
                                <span><i class="fa fa-plus-circle"></i>Click or drag images here</span>
                            </div>
																		
																		
																		
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div id="step-3">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="card-header">
																<strong class="card-title">Contact Details</strong>
															</div>
															<div class="card-body card-block">
																<div class="row">
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Name</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone</div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
																			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
																			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
																			<input type="checkbox" name="age" value="100"> Do u want any assistence
																			
																			
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		
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
	<!--
    <script src="js/data-table/datatables.min.js"></script>
    <script src="js/data-table/dataTables.bootstrap.min.js"></script>
    <script src="js/data-table/dataTables.buttons.min.js"></script>
    <script src="js/data-table/buttons.bootstrap.min.js"></script>
    <script src="js/data-table/jszip.min.js"></script>
    <script src="js/data-table/vfs_fonts.js"></script>
    <script src="js/data-table/buttons.html5.min.js"></script>
    <script src="js/data-table/buttons.print.min.js"></script>
    <script src="js/data-table/buttons.colVis.min.js"></script>
-->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<!--    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>-->
	<!--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>-->
	<!-- data table JS
		============================================ -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<!--<script src="js/datatable-new-backup/responsivebootstrap4.js"></script>
	<script src="js/data-table/bootstrap-table.js"></script>
	<script src="js/data-table/tableExport.js"></script>
	<script src="js/data-table/data-table-active.js"></script>
	<script src="js/data-table/bootstrap-table-editable.js"></script>
	<script src="js/data-table/bootstrap-editable.js"></script>
	<script src="js/data-table/bootstrap-table-resizable.js"></script>
	<script src="js/data-table/colResizable-1.5.source.js"></script>
	<script src="js/data-table/bootstrap-table-export.js"></script>-->
	<script src="resources/js/state.js"></script>
	<script src="resources/js/countries.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="resources/js/wizard/jquery.smartWizard.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// Initialize Smart Wizard
			$('#wizard').smartWizard();
			$('#wizard2').smartWizard();
			$('.buttonNext').addClass('btn btn-secondary');
			$('.buttonPrevious').addClass('btn btn-primary');
			$('.buttonFinish').addClass('btn btn-success');

		});
	</script>
	<script>
		$("#saleClick").hide();
		/*$("#inlineFtContent").hide();*/
		$("#inlineRadioFtbtn").click(function() {
			$("#inlineSdContent").hide();
			$("#inlineTdContent").hide();
			$("#saleClick").hide();
			$("#rentClick").show();
			$("#inlineFtContent").show();
		});
	</script>
	<script>
		$("#inlineSdContent").hide();
		$("#inlineRadioSnbtn").click(function() {
			$("#inlineFtContent").hide();
			$("#saleClick").show();
			$("#rentClick").hide();
			$("#inlineTdContent").hide();
			$("#inlineSdContent").show();
		});
		
		$(document).ready(function() {
			// Initialize Smart Wizard
			$('#wizard').smartWizard();
			$('#wizard2').smartWizard();
			$('.buttonNext').addClass('btn btn-secondary');
			$('.buttonPrevious').addClass('btn btn-primary');
			$('.buttonFinish').addClass('btn btn-success');

		});
	</script>
	<script>
		$("#saleClick2").hide();
		/*$("#inlineFtContent").hide();*/
		$("#inlineRadioFtbtn2").click(function() {
			$("#inlineSdContent2").hide();
			$("#inlineTdContent2").hide();
			$("#saleClick2").hide();
			$("#rentClick2").show();
			$("#inlineFtContent2").show();
		});
	</script>
	<script>
		$("#inlineSdContent2").hide();
		$("#inlineRadioSnbtn2").click(function() {
			$("#inlineFtContent2").hide();
			$("#saleClic2k").show();
			$("#rentClick2").hide();
			$("#inlineTdContent2").hide();
			$("#inlineSdContent2").show();
		});
		
	</script>
	<script>
		$("#inlineTdContent2").hide();
		$("#inlineRadioTdbtn2").click(function() {
			$("#inlineFtContent2").hide();
			$("#inlineSdContent2").hide();
			$("#inlineTdContent2").show();
		});
	</script>
	<script>
		$("#inlineTdContent").hide();
		$("#inlineRadioTdbtn").click(function() {
			$("#inlineFtContent").hide();
			$("#inlineSdContent").hide();
			$("#inlineTdContent").show();
		});
	</script>



</body>

</html>