<!doctype html>

<html class="no-js" lang="">


<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">
	   <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
		<link href="resources/css/wizard/smart_wizard.css" rel="stylesheet" type="text/css"/>
		
		<link href="resources/css/dist/imageuploadify.min.css" rel="stylesheet" type="text/css"/>
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
		
		/*button{
			width: 100%;
		}*/
		.carousel-item img{
			height: 450px;
		}
		a i{
color: #fff;
		}
		
		
		.stepContainer{
			height:0px!important;
		}
		   
	</style>
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i>
		<img src="resources/img/logo/rounded_logo.png" alt="">
	</div>
	
	<div id="right-panel" class="right-panel">
		
		
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12 col-sm-12 col-xs-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-9">
									<strong class="card-title"><a type="button" href="classifides?prtyid=${prptyid}&&prptyName${prptyName}" class="btn btn-info btn-sm" ><i class="fa fa-arrow-left"></i></a>&nbsp;&nbsp;Classifides - Add</strong>
								</div>
								<!-- <div class="col">
									<div class="addButton" style="float: right">										
										<a type="button" href="classifides.html" class="btn btn-info btn-sm" ><i class="fa fa-times"></i></a>
										
									</div>
								</div> -->
							</div>
						</div>
						
						<div class="card-body">							
							<div class="row">
								<div class="col">
									<div class="row">
									<div class="col">
										<div id="wizard" class="form_wizard wizard_horizontal mt-4">
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
									<form action="/" id="formAddCSF" method="POST">
											<div id="step-1">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="card-header">
																<strong class="card-title">Property Details</strong>
															</div>
															
															<div class="card-body card-block">
																<input type="radio" name="csfType" value="Rent" id="csfRent"  class="checkbox-round"  required> Flat For Rent &nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="csfType" value="Sale" id="csfSale" class="checkbox-round"   > Flat For Sale &nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="csfType" value="HHunting" id="csfHH" class="checkbox-round" > House Hunting&nbsp;&nbsp;

																<div class="row mt-4" id="HouseRentDiv">
																<div class="col-lg-6 col-md-6 col-sm-12">
															<input type="hidden" value="${prptyid}" id="r_prtyid" name="prtyid">
															<input type="hidden" value="${prptyName}" id="r_prtyName" name="prtyName">	
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type <span style="color: red">*</span></label>
																			<select class="form-control" id="csfPrtytype" name="csfPrtytype" required>
																				<option value="">Select property Type</option>
																				<option value="Apartment">Apartment</option>
																				<option value="House">House</option>
																				<option value="Townhouse">Townhouse</option>
																				<option value="Unit">Unit</option>

																			</select>
																		</div>


																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Beds</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="noofBeds" id="noofBeds" value="1" autocomplete="off" required> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="2" autocomplete="off" required> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="3" autocomplete="off" required> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds"  value="4" autocomplete="off" required> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="5" autocomplete="off" required> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="5+" autocomplete="off" required> 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Bathrooms</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="noofbaths" id="noofbaths" value="1" autocomplete="off" required> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofbaths" id="noofbaths" value="2" autocomplete="off" > 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofbaths" id="noofbaths" value="3" autocomplete="off" > 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofbaths" id="noofbaths" value="4" autocomplete="off" > 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofbaths" id="noofbaths" value="5" autocomplete="off" > 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofbaths" id="noofbaths" value="5+" autocomplete="off" > 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of parking</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="nofofparking" id="nofofparking" value="0" autocomplete="off" required> 0
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="1"autocomplete="off" > 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="3"  autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="4" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="5" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="5+" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>


																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Area(s.ft)<span style="color: red">*</span></label>
																					<input type="text" id="areaSqft" name="areaSqft" placeholder="Area(s.ft)" class="form-control" required>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Facing<span style="color: red">*</span></label>
																					<select class="form-control" id="facing" name="facing" required>
																						<option value="">Select facing</option>
																						<option value="East">East</option>
																						<option value="West">West</option>
																						<option value="North">North</option>
																						<option value="South">South</option>
																					</select>
																				</div>

																			</div>

																		</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Address<span style="color: red">*</span></label>
																			<textarea rows="2" cols="50" class="form-control" id ="prtyAddress" name="prtyAddress" required></textarea>
																		</div>


																	</div>
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">City</label>
																					<input type="text" id ="city" name="city" placeholder="City" class="form-control" required>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">State</label>
																					<input type="text" id ="state" name="state" placeholder="State" class="form-control" required>
																				</div>
																			</div>
																		</div>


																		<h5><b>Features</b></h5>
																		<div class="row mt-3">
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Power Backup" id="feature" name="feature" class="checkbox-round" required> Power Backup
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Children Playground" id="feature" name="feature" class="checkbox-round"> Children Playground
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Gym" id="feature" name="feature" class="checkbox-round"> Gym
																				</label>
																			</div>
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Walking Track" id="feature" name="feature" class="checkbox-round"> Walking Track
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Lift Access" id="feature" name="feature" class="checkbox-round"> Lift Access 
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Club House" id="feature" name="feature" class="checkbox-round"> Club House
																				</label>

																			</div>
																			<div class="col" id="newFeatureDiv">
																			

																			</div>
																			
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<input type="text" id="newfeature" placeholder="" class="form-control">
																				</div>
																			</div>
																		</div>
																		<button type="button" class="btn btn-info" onclick="addNewFeature()">Add more features</button>
																		<div class="form-group mt-3">
																			<label for="company" class=" form-control-label">GoogleMap Link</label>
																			<textarea rows="2" cols="50" class=" form-control" id="gmapLink" name="gmapLink"></textarea>
																			<small id="passwordHelpBlock" class="form-text">
  																		<a href="https://www.google.com/maps" target="_blank">click here for Googlemap</a>
																			</small>
																		</div>

																	</div>

																</div>
																<div class="row mt-4" id="HouseSaleDiv">
																	<div class="col-lg-6 col-md-6 col-sm-12">
													<input type="hidden" value="${prptyid}" id="s_prtyid" name="prtyid">
															<input type="hidden" value="${prptyName}" id="s_prtyName" name="prtyName">	
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type <span style="color: red">*</span></label>
																			<select class="form-control" id="s_csfPrtytype" name="csfPrtytype" required>
																				<option value="">Select Property Type</option>
																				<option value="Apartment">Apartment</option>
																				<option value="House">House</option>
																				<option value="Townhouse">Townhouse</option>
																				<option value="Unit">Unit</option>

																			</select>
																		</div>


																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Beds</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="s_noofBeds" id="noofBeds" value="1" autocomplete="off" required> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofBeds" id="noofBeds" value="2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofBeds" id="noofBeds" value="3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofBeds" id="noofBeds"  value="4" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofBeds" id="noofBeds" value="5" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofBeds" id="noofBeds" value="5+" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Bathrooms</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="s_noofbaths" id="noofbaths" value="1" autocomplete="off" required> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofbaths" id="noofbaths" value="2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofbaths" id="noofbaths" value="3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofbaths" id="noofbaths" value="4" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofbaths" id="noofbaths" value="5" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_noofbaths" id="noofbaths" value="5+" autocomplete="off"> 5+
																				</label>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of parking</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info active">
																					<input type="radio" name="s_nofofparking" id="nofofparking" value="0" autocomplete="off" required> 0
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_nofofparking" id="nofofparking" value="1" autocomplete="off" > 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_nofofparking" id="nofofparking" value="2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_nofofparking" id="nofofparking" value="3" autocomplete="off"> 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_nofofparking" id="nofofparking" value="4" autocomplete="off"> 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_nofofparking" id="nofofparking" value="5" autocomplete="off"> 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="s_nofofparking" id="nofofparking" value="5+" autocomplete="off"> 5+
																				</label>
																			</div>
																			
																		</div>


																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Area(sq.ft)<span style="color: red">*</span></label>
																					<input type="text" id="s_areaSqft" name="areaSqft" placeholder="Area(s.ft)" class="form-control" required>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Facing<span style="color: red">*</span></label>
																					<select class="form-control" id="s_facing" name="facing" required>
																						<option value="">Select Facing</option>
																						<option value="East">East</option>
																						<option value="West">West</option>
																						<option value="North">North</option>
																						<option value="South">South</option>
																					</select>
																				</div>

																			</div>

																		</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Address<span style="color: red">*</span></label>
																			<textarea rows="2" cols="50" class="form-control" id ="s_prtyAddress" name="prtyAddress" required></textarea>
																		</div>


																	</div>
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">City</label>
																					<input type="text" id ="s_city" name="city" placeholder="City" class="form-control" required>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">State</label>
																					<input type="text" id ="s_state" name="state" placeholder="State" class="form-control" required>
																				</div>
																			</div>
																		</div>


																		<h5><b>Features</b></h5>
																		<div class="row mt-3">
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Power Backup" id="s_feature" name="s_feature" class="checkbox-round" required> Power Backup
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Children Playground" id="s_feature" name="s_feature" class="checkbox-round"> Children Playground
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Gym" id="s_feature" name="s_feature" class="checkbox-round"> Gym
																				</label>
																			</div>
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Walking Track" id="s_feature" name="s_feature" class="checkbox-round"> Walking Track
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Lift Access" id="s_feature" name="s_feature" class="checkbox-round"> Lift Access 
																				</label><br>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Club House" id="s_feature" name="s_feature" class="checkbox-round"> Club House
																				</label>

																			</div>
																			<div class="col" id="newFeatureDivSale">
																			

																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<input type="text" id="sale_feature"  placeholder="" class="form-control">
																				</div>
																			</div>
																		</div>
																		<button type="button" class="btn btn-info" onclick="addNewFeatureSale()">Add more features</button>
																		<div class="form-group mt-3">
																			<label for="company" class=" form-control-label">GoogleMap Link</label>
																			<textarea rows="2" cols="50" class=" form-control" id="s_gmapLink" name="gmapLink" ></textarea>
																			<small id="passwordHelpBlock" class="form-text">
  																		<a href="https://www.google.com/maps" target="_blank">click here for Googlemap</a>
																			</small>
																		</div>

																	</div>

																</div>
																<div class="row mt-4" id="HouseHuntingDiv">
																	<div class="col-lg-6 col-md-6 col-sm-12">
																	<input type="hidden" value="${prptyid}" id="h_prtyid" name="prtyid">
															<input type="hidden" value="${prptyName}" id="h_prtyName" name="prtyName">	
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Name<span style="color: red">*</span></div>
																				</div>
																				<input type="text" id="hh_name" name="hh_name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"  required>
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="hh_email" name="hh_email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" required>

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="hh_phone" name="hh_phone" minlength="10" maxlength="12"  pattern="^[0-9]*$" required >

																			</div>
																		</div>
																		<div class="form-group">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Rent" id="HuntingFor" name="HuntingFor" class="checkbox-round" required> For Rent
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Buy" id="HuntingFor" name="HuntingFor" class="checkbox-round" > For Buy
																				</label>
																				
																			</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">My interests (No Of beds, Locality, Budget...) </label>
																			<textarea rows="2" cols="50" class=" form-control" id="Myinterests" name="Myinterests"></textarea>
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
																						<input type="text" class="form-control"
																							id="r_amount" name="amount">
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
																						<input type="text" class="form-control"
																							id="s_amount" name="amount">
																					</div>
																				</div>


																				<div class="form-group" id="advanceDiv">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Advance</div>
																						</div>
																						<input type="text" class="form-control"
																							id="advance" name="advance" placeholder="">

																					</div>
																				</div>
																				
																				<div class="form-group" id="loanFacility">
																					
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Loan Facility</div>
																						</div>
																					<select class="form-control" id="loanFacility" name="loanFacility" required>
																						<option value="">Select</option>
																						<option value="Yes">Yes</option>
																						<option value="No">No</option>																						
																					</select>
																				</div>
																				</div>

																				<div class="form-group">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Available on</div>
																						</div>
																						<input type="date" class="form-control"
																							id="prtyavialbleon" name="prtyavialbleon"
																							required>

																					</div>
																				</div>
																				
																				<div class="form-group">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Title</div>
																						</div>
																						<input type="text" id="csfTitle" name="csfTitle"
																						placeholder="Title" class="form-control" required>

																					</div>
																				</div>

																				

																				<div class="form-group">
																					<label for="company" class=" form-control-label">Description</label>
																					<textarea rows="2" cols="50" class="form-control"
																						id="csfDesription" name="csfDesription" required></textarea>
																				</div>

																			</div>
																			
																			<div class="col-lg-6 col-md-6 col-sm-12">
																		<h4>Gallery</h4>
																		 <div class="galleryBox mt-3" style="width:100%;">
																					<input type="file" name="files[]" id="showImage" required
																						accept="image/*,,audio/*,video/*"
																						multiple>
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
																					<div class="input-group-text">Name<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="name" name="name" placeholder="">
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="email" name="email" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="phone" name="phone" placeholder="">

																			</div>
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
											</form>

										</div>

									</div>
								</div>
								</div>
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
	


  
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	 <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	 <script src="resources/js/wizard/jquery.smartWizard.js"></script>
	 <script src="resources/js/formValidation.min.js"></script>
	<script src="resources/js/frameworkbootstrap.min.js"></script>
     <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <script type="text/javascript" src="resources/js/dist/imageuploadify.min.js"></script>
	<!-- <script>
	$('#formAddCSF').validate({
	 framework: 'bootstrap',
	    row: {
	        valid: 'field-success',
	        invalid: 'field-error'
	    },
       fields: {	          
    	   csfType: {
               validators: {
               	notEmpty: {
                       message: 'Please choose one option'
                   }
               }
           },   
           csfPrtytype: {
               validators: {
               	notEmpty: {
                       message: 'Please select Propertytype'
                   }
               }
           
           },
           noofBeds:{
               validators: {
               	notEmpty: {
                       message: 'Please choose No. of Beds'
               	 }
              }
         },
         noofbaths: {
              validators: {
              	notEmpty: {
                      message: 'Pleease choose No. of Baths'
                  		}
     			},
     			nofofparking: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Please choose parking'
    	                		}
    	            }
    	  			    
    	   			},
    	   			areaSqft: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'This feild is required'
    	                		}
    	  			    }
    	   			}, 
    	   			facing: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Please choose facing'
    	                		}
    	  			    }
    	   			},
    	   			prtyAddress: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Address is required'
    	                		}
    	              
    	   			
    	  			    }
    	   			},
    	   			City: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'City is required'
    	                		},
    	               regexp: {
    	                            regexp: /^[0-9]*$/,
    	                            message: 'Invoice No can only consist of digits'
    	                        }
    	  			    }
    	   			},
    	   		state: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'State should not be empty'
    	                		}
    	  			    }
    	   			},
    	   			feature: {
    	   		 validators: {
    	   			notEmpty: {
	                    message: 'Please choose atleast one feature '
	                		}
                   
                }
    		},
    		hh_name:{
            validators: {
           	 notEmpty: {
	                    message: 'Name feild is required'
	                		},
    		 stringLength: {
                min: 3,
                max: 50,
                message: 'Name must be more than 3 and  less than 50 letters long'
               },
            regexp: {
                    regexp: /^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$/,
                    message: 'Name accepts only characters'
                    }
               }
           },
           hh_email:{
               validators: {
               	notEmpty: {
                       message: 'Email is required'
               	 },
               	 regexp: {
                     regexp: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$/,
                     message: 'Please give correct email format'
                     }
               }
           },
           hh_phone: {
               validators: {
               	notEmpty: {
                       message: 'Phone is required'
                   		},
                   		stringLength: {
                            min: 10,
                            max: 12,
                            message: 'Phone number must be more than 10 and  less than 12 Numbers long'
                           },
                        regexp: {
                        	 	regexp: /^[0-9]*$/,
                                message: 'Phone Number can only consist of digits'
                                }
     			    }
      			},
      			HuntingFor: {
                validators: {
                	notEmpty: {
                        message: 'Please choose one option'
                    		}
      			    }
       		},
       		amount: {
       	     validators: {
       	            	notEmpty: {
       	                    message: 'amount is required'
       	                		},regexp: {
       	                            regexp: /^[0-9]*$/,
       	                            message: 'Amount  accepts only digits'
       	                        }
       	  			    }
       	   		},
       	   	advance: {
       	            validators: {
       	            	notEmpty: {
       	                    message: 'advance is required'
       	                		},
       	                regexp: {
       	                            regexp: /^[0-9]*$/,
       	                            message: 'Advance accepts only digits'
       	                        }
       	  			    }
       	   			},
       	   		loanFacility: {
        	            validators: {
        	            	notEmpty: {
        	                    message: 'loanFacility   is required'
        	                		}
        	  			    }
        	   		},
        	   		prtyavialbleon: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Prtyavialbleon is required'
    	                		    }
    	            }
        		    
    	   		},
    	   		csfTitle: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Please specify Title'
    	                		    }
    	            }
    	   		},
    	   		csfDesription: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Please specify Desription'
    	                		    }
    	            }
    	   		},
    	   		name: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Name required'
    	                		    }
    	            }
    	   		},
    	   		phone: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Phone number required'
    	                		    },
    	                       		stringLength: {
    	                                min: 10,
    	                                max: 12,
    	                                message: 'Phone number must be more than 10 and  less than 12 Numbers long'
    	                               },
    	                            regexp: {
    	                            	 	regexp: /^[0-9]*$/,
    	                                    message: 'Phone Number can only consist of digits'
    	                                    }
    	            }
    	   		},
    	   		email: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Email required'
    	                		    },
    	                          	 regexp: {
    	                                 regexp: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$/,
    	                                 message: 'Please give correct email format'
    	                                 }
    	            }
    	   		}
    	   		    	    }
       }
});
	</script> -->
	<script type="text/javascript">
            $(document).ready(function() {
                $('input[type="file"]').imageuploadify();
            })
     </script>
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
	$("#loanFacility").hide();
	$("#advanceDiv").hide();
		$("#saleClick").hide();
		/*$("#inlineFtContent").hide();*/
		$("#csfRent").click(function() {
			$("#HouseSaleDiv").hide();
			$("#HouseHuntingDiv").hide();
			$("#HouseRentDiv").show();
			$("#saleClick").hide();
			$("#rentClick").show();
			$("#loanFacility").hide();
			$("#advanceDiv").show();
			
		});
	</script>
	<script>
		$("#HouseSaleDiv").hide();
		$("#HouseHuntingDiv").hide();
		$("#csfSale").click(function() {
			$("#saleClick").show();
			$("#rentClick").hide();

			$("#HouseSaleDiv").show();
			$("#HouseHuntingDiv").hide();
			$("#HouseRentDiv").hide();
			$("#loanFacility").show();
			$("#advanceDiv").hide();
		});


		
		$("#csfHH").click(function() {
			$("#HouseSaleDiv").hide();
			$("#HouseRentDiv").hide();
			$("#HouseHuntingDiv").show();
		});

		function addNewFeature(){
			
			var newFeature=$('#newfeature').val();
			if(newFeature==''){
				alert("Empty value not accepted");
				}else{
			var input="<label class='checkbox-inline'><input type='checkbox' value="+newFeature+" id='feature' name='feature' class='checkbox-round' checked> "+newFeature+"</label>";
			$('#newFeatureDiv').append(input);
			$('#newfeature').val('');
			}
		}

		function addNewFeatureSale(){
			
			var newFeature=$('#sale_feature').val();
			if(newFeature==''){
				alert("Empty value not accepted");
				}else{
			var input="<label class='checkbox-inline'><input type='checkbox' value="+newFeature+" id='s_feature' name='s_feature' class='checkbox-round' checked> "+newFeature+"</label>";
			$('#newFeatureDivSale').append(input);
			$('#newfeature').val('');
				}
			}
	</script>

	<script>
function getToday(){
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();

	return today = dd + '/' + mm + '/' + yyyy;
}

	</script>
	



</body>

</html>