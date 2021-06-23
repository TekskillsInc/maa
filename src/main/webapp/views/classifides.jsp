<!doctype html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="no-js" lang="">
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
	<style>
		.product-item{
			position: relative;
		}
		
		.sharebtn i{
			color:#fff;
		}
		.sharebtn{
			position: absolute;
    right: 0%;
    background-color: rgba(0,0,0,0.5);
    font-size: 20px;
    padding: 4px 12px;
		}
		.share-link span{
	font-size: 30px;
	margin-right: 15px
}
.share-link p{
	margin-bottom: 0px;
}
.fb a{
	color: #3b5998;
}
.twt a{
	color:#2c95e0;
}

.pin a{
	color: #BD081B;
}
.lln a{
	color: #2177b4;
}

.gplus a{
	color: #cc4338;
}

.title-prop h3{
	font-size: 30px;
	color: #DA5427 
}

.thumb-content a img{
	height:200px;
}

.product-item{
box-shadow: 0 0 20px -2px rgba(0, 0, 0, .35);
}

.card-title{
	    font-size: 13.5px!important;
    font-weight: 600;
}

.card-title a{
	font-size:12px;
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
										<a type="button" href="classifidesAdd?prtyid=${prptyid}&&prptyName=${prptyName}" class="btn btn-info btn-sm"><i class="fa fa-plus"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body" id="classifiedImg">
							<div class="row">
								
									
									<c:forEach var="csf" items="${classified.classifiedList}">
									
									<div class="col-sm-12 col-lg-4 col-md-6">
								
									<div class="product-item bg-light">
										<div class="card">
										<c:choose>
										
										<c:when test="${empty csf.csfImage}">
											<div class="thumb-content">
												
													<a href="VewClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs">
													<img class="card-img-top img-fluid" src="resources/maa-images/bulding1.jpeg" alt="Card image cap">
												</a>
											</div></c:when>
											<c:otherwise>
											<div class="thumb-content">
												
												<a href="VewClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs">
												
													<img class="card-img-top img-fluid" src="resources/Classified-Images/${csf.csfImage}" alt="Card image cap">
												</a>
											</div>
											</c:otherwise>
											</c:choose>
											<div class="sharebtn">
										<!-- <span class="mr-3" id="loveIicon"><i class="fa fa-heart"></i></span>
										<span data-toggle="modal" data-target="#exampleShareModal"><i class="fa fa-share-alt" ></i></span> -->
										</div>
										
											<div class="card-body">
												<div class="row">
													<div class="col-8">
														<h4 class="card-title">${csf.csfTitle}</h4>
													</div>
													<div class="col">
														<c:choose>
												<c:when test="${empty csf.csfstatus }">
												<c:choose><c:when test="${(roleid==3||roleid==4)&&(userid==csf.userid)}">
												<a type="button" href="EditClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs&&csfCategory=NA&&csfType=${csf.csfType}" class="btn btn-info btn-sm"  ><i class="fa fa-edit">
												</i></a>		
												</c:when>
												
												<c:when test="${(roleid==2||roleid==1)}">
												<a type="button" href="EditClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs&&csfCategory=NA&&csfType=${csf.csfType}" class="btn btn-info btn-sm"  ><i class="fa fa-edit">
												</i></a>		
												</c:when>
												<c:otherwise>
												
												
												</c:otherwise>
												</c:choose>
												</c:when>
												
												<c:otherwise>
												<span data-toggle="tooltip" title="You can't Edit "><a type="button"  class="btn btn-warning btn-sm"  ><i class="fa fa-exclamation-circle" aria-hidden="true">
												</i></a></span>
												</c:otherwise>
												</c:choose>
													 
														
													<a type="button" href="VewClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
													<c:choose><c:when test="${(roleid==3||roleid==4)&&(userid==csf.userid)}">
													<a type="button" onclick="deleteClassified('${csf.classified}','${csf.prtyid}','cs','${prptyName}')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
																
												</c:when>
												<c:when test="${(roleid==2||roleid==1)}">
												<a type="button" onclick="deleteClassified('${csf.classified}','${csf.prtyid}','cs','${prptyName}')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
														
												</c:when>
												<c:otherwise>
												
												
												</c:otherwise>
												</c:choose>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">Flat For ${csf.csfType}</a></h5>
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#">Rs.${csf.amount}/-</a></h5>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">${csf.facing}</a></h5>
														<h5 class="card-title"><a href="#">${csf.state},${csf.city}</a></h5>
														
													</div>
													<div class="col">
														<h5 class="card-title"><a href="#"><i class="fa fa-calendar"></i> ${csf.prtyavialbleon}</a></h5>
														
													</div>
												</div>

												
												
											
												<%-- <div class="row">
												<c:choose>
												<c:when test="${empty csf.csfstatus && csf.csfType=='Rent'}">
												<c:if test="${userid==csf.userid}">
												<div class="col"><button type="button" id="csfStatusBtn${csf.classified}" class="btn btn-info" onclick="MarkClassified('${csf.csfType}','${csf.classified}')">Mark as Rented</button></div>
												</c:if>
												</c:when>
												
												
												
												<c:when test="${empty csf.csfstatus && csf.csfType=='Sale'}">
												<div class="col"><button type="button" id="csfStatusBtn${csf.classified}" class="btn btn-info" onclick="MarkClassified('${csf.csfType}','${csf.classified}')">Mark as Sold</button></div>
												</c:when>
												
												<c:when test="${csf.csfstatus=='Rented'||csf.csfstatus=='Sold'}">
												<div class="col"><button type="button" id="csfStatusBtn${csf.classified}" class="btn btn-success" onclick="MarkClassifiedAvailable('${csf.csfType}','${csf.classified}')" href="EditClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs">Available</button></div>
												
												<div class="col"><a type="button" id="csfStatusBtn${csf.classified}" class="btn btn-success"  href="EditClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs&&csfCategory=Avail&&csfType=${csf.csfType}">Available</a></div>
												
												</c:when>
												
												<c:otherwise>
												<div class="col"><button type="button" id="csfStatusBtn${csf.classified}" class="btn btn-warning" >${csf.csfstatus}</button></div>
												</c:otherwise>
												</c:choose>
													<!--  <div class="col"><button type="button" class="btn btn-info" onclick="">Mark as Rented</button></div>-->
													<!-- <div class="col"><button type="button" class="btn btn-info">Asst for Tenant</button></div>
												</div>
												<div class="row mt-2">
													<div class="col">
														<button type="button" class="btn btn-info">Asst for TenancyManagement</button>
													</div>
												</div> -->
												
												
												
											</div> --%>
										</div>
										</div>
										</div>
										</div>
										</c:forEach>
										<c:forEach var="csfh" items="${classified.hhClassifiedList}">
										
														<div class="col-sm-12 col-lg-4 col-md-6">
								
									<div class="product-item bg-light">
										<div class="card">
											<div class="thumb-content">
												
												<a href="VewClassified?classifiedid=${csfh.id}&&prtyid=${csfh.prtyid}&&prptyName=${prptyName}&&type=hh">
												
													<img class="card-img-top img-fluid" src="resources/maa-images/HouseHuntImage.jpg" alt="Card image cap">
												</a>
												
											</div>
											<div class="sharebtn">
										<span class="mr-3" id="loveIicon"><i class="fa fa-heart"></i></span>
										<span data-toggle="modal" data-target="#exampleShareModal"><i class="fa fa-share-alt" ></i></span>
									</div>
											<div class="card-body">
												<div class="row">
													<div class="col-8">
														<h4 class="card-title"><b>${csfh.name}</b></h4>
													</div>
													<div class="col-8">
														<h4 class="card-title">${csfh.phone}</h4>
													</div>
													<div class="col">
													
													
															
												<a type="button" href="EditClassified?classifiedid=${csfh.id}&&prtyid=${csfh.prtyid}&&prptyName=${prptyName}&&type=hh&&csfCategory=NA&&csfType=${csf.csfType}" class="btn btn-info btn-sm"  ><i class="fa fa-edit"></i></a>
												
													 
														<a type="button" href="VewClassified?classifiedid=${csfh.id}&&prtyid=${csfh.prtyid}&&prtyName=${prptyName}&&type=cs" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
														<a type="button" onclick="deleteClassified('${csfh.id}','${csfh.prtyid}','HH','${prptyName}')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
													</div>
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">Hunting For ${csfh.huntingfor}</a></h5>
													</div>
		
												</div>
												<div class="row">
													<div class="col">
														<h5 class="card-title"><a href="#">${csfh.myinterests}</a></h5>
													</div>
													
												</div>

											</div>
										</div>
										</div>

								</div>
								
								
										</c:forEach>
									</div>
									</div>
						</div>
						<button type="button" class="btn btn-info btn-sm" onclick="loadMoreClassifieds()" style="width: auto;float: right;margin-right: 20Px;font-weight: bold;">More Classifieds</button>
				</div>
			
				<div class="clearfix"></div>

			</div>
			<!-- .animated -->
		</div>
		<div class="modal fade" id="exampleShareModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<div class="copied-div">
						<div class="row no-gutters mt-3">
							<div class="col-3">
								<div class="image_property mr-2">
									<img src="resources/images/home-images/img_3.jpg" class="img-fluid">
								</div>
							</div>
							<div class="col-9">
								<div class="title_property">
									3600 sq ft 4 BHK 5T Apartment for rent in Project at Tellapur Road, Hyderabad by Agent Nestaway
								</div>
								<div class="address">
									Apartment available for rent in Tellapur Road, Hyderabad by Agent Nestaway. This rental property off...						
								</div>

							</div>
						</div>

					</div>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
		  </div>
		  <div class="modal-body">
			  <div class="row">
			  <div class="col">
					<div class="copy-link">

					<input id="link" type="text" value="http://maaproperties.com/" class="form-control">

		<button type="button" class="btn btn-light" data-clipboard-action="copy" data-clipboard-target="#link">Copy</button>

				  </div>
				  <div class="share-link mt-3">
					  <p>share:</p>
					  <span class="fb"><a href="#"><i class="fa fa-facebook-square"></i></a></span>
					<span class="twt"><a href="#"><i class="fa fa-twitter-square"></i></a></span>
					<span class="pin"><a href="#"><i class="fa fa-pinterest"></i></a></span>
					<span class="lln"><a href="#"><i class="fa fa-linkedin"></i></a></span>
					<span class="whatapp"><a href="https://wa.me/918099244422" target="_blank"><i class="fa fa-whatsapp"></i></a></span>
				  </div>
				  </div>
			  </div>



		  </div>

		</div>
	  </div>
	</div>
	</div>
		<!-- /.content -->
		<div class="clearfix"></div>
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	
<script>
function MarkClassified(csftype,id){
	
	
	$.ajax({
        url: "updateClassifiedStatus", //this is the submit URL
        type: "POST",
        
       	data : {csftype:csftype,id:id},
        
        
        cache: false,
        success: function(response){
        	alert("Classified Marked as "+ response);
        	//$("#csfStatusBtn"+id).attr("disabled",true);
        	$("#editCsfBtn"+id).attr("disabled",true);
        	window.location.reload();
        	
        	//window.location.href="classifides?prtyid="+prtyid+"&prptyName="+prtyName+"";
        	
        }
    });
}
/* function MarkClassifiedAvailable(csftype,id){
	
	
	
} */

function deleteClassified(classified,prtyid,type,prptyName){
	
	$.ajax({
        url: "deleteClassified", //this is the submit URL ?classifiedid="+classified+"&prtyid="+prtyid+"&type="+type+"&prptyName="+prptyName+""
        type: "POST",
        
       	data : {"classifiedid":classified
       		,"prtyid":prtyid
       		,"type":type
       		,"prptyName":prptyName},
        
        
        cache: false,
        success: function(response){
        	if(response=='Success'){
        	alert("Classified deleted successfully ");
        	}else{
        		alert("Error while deleting Classified ");
        	}
        	window.location.reload();
        	
        	//window.location.href="classifides?prtyid="+prtyid+"&prptyName="+prtyName+"";
        	
        }
    });
	
	
	
	
	
	//window.location.href=;
}
function loadMoreClassifieds(prptyName,prptyid,userid,roleid){
	window.location.href="classifides";
	 
}



</script>
</body>

</html>