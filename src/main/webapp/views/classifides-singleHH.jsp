<!doctype html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="no-js" lang="">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>${viewObject.csfinfo.csfTitle}</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	
	


	
	
	
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
			border: .2rem dashed rgba(0, 0, 0, .2);
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
			border-color: rgba(0, 0, 0, .4);
			background-color: rgba(0, 0, 0, .05);
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
			color: rgba(0, 0, 0, .5);
		}

		.file-upload span i {
			color: #2d4b64;
			margin-right: 0rem;
		}

		.file-upload-previews>.MultiFile-label {
			border-radius: .4rem;
			background-color: rgba(0, 0, 0, .03);
			display: inline-block;
			border: .2rem solid rgba(0, 0, 0, .1);
			padding: 1rem;
			position: relative;
			margin-right: 1rem;
			width: 100%;
		}

		.file-upload-previews span.MultiFile-label {
			box-shadow: 0 0.2rem .7rem 0 rgba(0, 0, 0, .08);
			position: relative;
			text-align: center;
			display: inline-block;
			margin: 1rem;
		}

		.file-upload-previews span.MultiFile-label .MultiFile-title {
			position: absolute;
			background-color: rgba(0, 0, 0, .4);
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
			box-shadow: 0 0.2rem .7rem 0 rgba(0, 0, 0, .08);
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
			box-shadow: 0 0.2rem 0.7rem 0 rgba(0, 0, 0, .08);
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

		.file-upload-previews>.MultiFile-label {
			border-radius: .4rem;
			background-color: rgba(0, 0, 0, .03);
			display: inline-block;
			border: .2rem solid rgba(0, 0, 0, .1);
			padding: 1rem;
			position: relative;
			margin-right: 1rem;
			width: 100%;
		}

		.file-upload-previews span.MultiFile-label {
			box-shadow: 0 0.2rem .7rem 0 rgba(0, 0, 0, .08);
			position: relative;
			text-align: center;
			display: inline-block;
			margin: 1rem;
		}

		.file-upload-previews span.MultiFile-label .MultiFile-title {
			position: absolute;
			background-color: rgba(0, 0, 0, .4);
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
			box-shadow: 0 0.2rem .7rem 0 rgba(0, 0, 0, .08);
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

		input.custom-checkbox {
			width: 20px;
			height: 20px;
			border-radius: 50% !important;
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

		.round input[type="checkbox"]:checked+label {
			background-color: #66bb6a;
			border-color: #66bb6a;
		}

		.round input[type="checkbox"]:checked+label:after {
			opacity: 1;
		}

		.checkbox-round {
			width: 1.3em;
			height: 1.3em;
			background-color: white;
			border-radius: 50%;
			vertical-align: middle;
			border: 2px solid rgba(0, 0, 0, .125);
			-webkit-appearance: none;
			outline: none;
			cursor: pointer;
		}

		.checkbox-round:checked {
			background-color: #17a2b8;
			border: 1px solid #fff;
		}

		#border-box {
			border: 1px solid #ced4da;
			padding: 15px;
		}
#customId img{
			height: 400px;
		}
		#availble{
			border-top: 1px solid #dee2e6;
			border-bottom: 1px solid #dee2e6;
		}
		#addressid h4{
			font-family: 'Ubuntu', sans-serif;
			    font-size: 22px;
			margin-bottom: 10px;
			color: #2D66B0

		}
		#imageIcon p img{
			border: 1px solid #2D66B0;
			border-radius: 50%;
			padding: 5px;
		}
		
		
		
	</style>

	
	<style>
		.custm-card1{
			 padding-top: 10px;
    padding-bottom: 10px;
    background-color: #edeef3;
		}
		.carousel-item img{
			height: 450px;
		}
		   
		a i{
			color: #fff;
		}

		.pricecl{
			background: #f2a004;
			color: #fff;
		}
		
		
	</style>
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i>
		<img src="img/logo/rounded_logo.png" alt="">
	</div>
	
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
					<a class="navbar-brand" href="#">${prtyName}</a>
					<a class="navbar-brand hidden" href="./"><img src="resources/img/logo/rounded_logo.png" alt="Logo"></a>
				</div>
				
			</div>
			
		</header>
		
	

		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-9">
									<strong class="card-title"><a type="button" href="classifides.html" class="btn btn-info btn-sm" ><i class="fa fa-arrow-left"></i></a>&nbsp;&nbsp;Classifides Info</strong>
								</div>
								<div class="col">
									<div class="addButton" style="float: right">
										
										<a type="button" href="classifides.html" class="btn btn-info btn-sm" ><i class="fa fa-times"></i></a>
										
									</div>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							
							<div class="row" id="imgRow">
                       
                        <div class="col-md-8 col-sm-12 pl-4">
                           
                            <section>                                
                                <!--end section-title-->
								<div class="row">
									<div class="col">
										<div class="classifide-slider mt-3">
										<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/buldinginner/1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/buldinginner/2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/buldinginner/3.jpg" class="d-block w-100" alt="...">
    </div>
	  <div class="carousel-item">
      <img src="img/buldinginner/4.jpg" class="d-block w-100" alt="...">
    </div>
	  <div class="carousel-item">
      <img src="img/buldinginner/5.jpg" class="d-block w-100" alt="...">
    </div>
	  
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
											</div>
									</div>
								</div>
                                
                            </section>
                           
							<section class="my-3">								
									<div class="row">
										<div class="col-md-6 col-sm-12">
											<h4 class="pricecl text-center">For ${viewObject.csfinfo.csfType}</h4>						
										</div>
										<div class="col-md-6 col-sm-12">
											<h4 class="pricecl text-center">${viewObject.csfinfo.amount}/-</h4>
										</div>
									</div>
								<div class="row mt-3">
									<div class="col" id="addressid">
									<h4>${viewObject.csfinfo.csfTitle}</h4>
									</div>
									</div>
								<div class="row">
									<div class="col" id="addressTitle">
									<h4>${viewObject.csfinfo.prtyAddress}</h4>
									</div>
									</div>
								
							</section>
                            <section>
								
								<div class="row my-3" id="imageIcon">
									<div class="col-md-4">
										<p> <img src="resources/img/iocns/3.png" class="img-fluid"> <b>${viewObject.csfinfo.noofBeds}</b> Beds</p>
									</div>
									<div class="col-md-4">
										<p> <img src="resources/img/iocns/2.png" class="img-fluid"> <b>${viewObject.csfinfo.noofbaths}</b> Bath </p>
									</div>
									<div class="col-md-4">
										<p> <img src="resources/img/iocns/1.png" class="img-fluid"> <b>${viewObject.csfinfo.nofofparking}</b> Parking</p>
									</div>								
									<div class="col col-lg-4  col-md-4 col-sm-4">
								<p> <img src="resources/img/iocns/compass.png"> ${viewObject.csfinfo.facing} </p>
							</div>
							<div class="col col-lg-4  col-md-4 col-sm-4">
								<p> <img src="resources/img/iocns/square.png"> ${viewObject.csfinfo.areaSqft} Sq.ft </p>
							</div>
								</div>
								<div class="row my-3" >
									<div class="col-md-6 col-sm-12 pt-3 pb-2" id="availble">
										<p><b>Available:</b> ${viewObject.csfinfo.prtyavialbleon}</p>
									</div>
									
									
									<c:choose>
									<c:when test="${viewObject.csfinfo.csfType=='Rent'}">
										<div class="col-md-6 col-sm-12">
											<h4 class="pricecl text-center">${viewObject.csfinfo.advance}/-</h4>
										</div>
										</c:when>
										
										<c:when test="${viewObject.csfinfo.csfType=='Sale'}">
										<div class="col-md-6 col-sm-12">
										
											<h4 class="pricecl text-center">${viewObject.csfinfo.loanfacility}/-</h4>
										</div>
										</c:when>
									
									
									
									</c:choose>
								</div>
								<div class="row my-4">
									
									<div class="col-md-4">
										<p><img src="resources/img/iocns/4.png"> Power Backup</p>
									</div>
									<div class="col-md-4">
										<p><img src="resources/img/iocns/4.png"> Walking Track</p>
									</div>
									<div class="col-md-4">
										<p><img src="resources/img/iocns/4.png"> Gym</p>
									</div>
									<div class="col-md-4">
										<p><img src="resources/img/iocns/4.png">  Children Playground</p>
									</div>
									<div class="col-md-4">
										<p><img src="resources/img/iocns/4.png"> Lift Access</p>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<p>${viewObject.csfinfo.csfDesription} </p>
										
									</div>
								</div>
								<div class="row mt-4 mb-4">
									<div class="col">
										<p><b>GoogleMap Link:</b>&nbsp;&nbsp;<a href="https://www.google.com/maps" target="_blank" style="color: #2D66B0">${viewObject.csfinfo.gmapLink}</a></p>
									</div>
								</div>
								 <div class="row mb-5">
									<div class="col">
										<p><b>Listed: </b>${viewObject.csfinfo.postedon}</p>
										<p><b>Last updated </b>${viewObject.csfinfo.updatedon}</p>
									<!--  	<p><b>Views </b>16</p>-->
									</div>
								</div> 
								<div class="row">
									<div class="col">
										<p><b>Tags:</b>#classifides,#for rent,#for sale</p>
									</div>
									</div>
                                
                            </section>
							
                            
                            
                        </div>
								<div class="col-md-4 col-sm-12"></div>
                       
                        
                        
                        
                    </div>


							

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

	
	

	
	<script src="resources/js/preloader.js"></script>
	
	<script src="resources/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	
	
	


</body>

</html>