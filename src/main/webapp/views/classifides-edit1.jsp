<!doctype html>

<html class="no-js" lang="">


<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">
	  <!--  <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
		<link href="resources/css/wizard/smart_wizard.css" rel="stylesheet" type="text/css"/> -->
		
	<link href="resources/dist/css/smart_wizard.css" rel="stylesheet" type="text/css" />
	<link href="resources/dist/css/smart_wizard_theme_dots.css" rel="stylesheet" type="text/css" />
    <!-- Optional SmartWizard theme -->
    <link href="resources/dist/css/smart_wizard_theme_circles.css" rel="stylesheet" type="text/css" />
    <link href="resources/dist/css/smart_wizard_theme_arrows.css" rel="stylesheet" type="text/css" />
		
		<link href="resources/css/dist/imageuploadify.min.css" rel="stylesheet" type="text/css"/>
	<style>
	.card .nav-tabs .active a {
    border-color: #e8e9ef;
    color: #03A9F4 !important;
     }
     
		.navbar-brand {
			font-size: 18px !important;
		}

		.mail span {
			font-size: 32px;
			color: #878787
		}

		
	</style>
	<style>
	
	.help-block{
     color: red;
	}
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
		
		.btn-toolbar {
          float: right !important;
		}

		.input-group-text {
			font-size: 13px;
		}
		
		.file-upload {
    position: relative;
    height: 10rem;
    margin-bottom: 2rem;
   /*  margin-top: 2rem; */
}
.file-upload .file-upload-input {
    border-radius: .4rem;
    width: 100%;
    border: .2rem dashed rgba(0,0,0,.2);
    height: 2rem;
    text-align: center;
    cursor: pointer;
    position: relative;
    display: inline-block;
    padding: 0rem 0 0 0;
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
		   input[type="file"] {
  display: block;
}
.imageThumb {
  max-height: 75px;
  border: 2px solid;
  padding: 1px;
  cursor: pointer;
}
.pip {
  display: inline-block;
  margin: 10px 10px 0 0;
}
.remove {
  display: block;
  background: #444;
  border: 1px solid black;
  color: white;
  text-align: center;
  cursor: pointer;
}
.remove:hover {
  background: white;
  color: black;
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
									<strong class="card-title"><a type="button" href="classifides?prtyid=${prtyid}&&prptyName=${prptyName}" class="btn btn-info btn-sm" ><i class="fa fa-arrow-left"></i></a>&nbsp;&nbsp;Classifides - Add</strong>
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
									<div class="container">
     		   						<br/>	
									 <form action="/" id="formAddCSF" method="POST">
										<div id="smartwizard">
							
													<ul>
														<li><a href="#step-1"><br />
															<small>Property Details</small></a></li>
														<li><a href="#step-2"><br />
															<small>Upload Photos</small></a></li>
														<li><a href="#step-3"><br />
															<small>Contact Details</small></a></li>
													</ul>

													<div>
											<div id="step-1">
											<div id="form-step-0" role="form" data-toggle="validator">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="card-header">
																<strong class="card-title">Property Details</strong>
															</div>
															
															<div class="card-body card-block">
															
															  <div class="form-group">
																<input type="radio" name="csfType" value="Rent" id="csfRent"  class="checkbox-round"  required>  For Rent &nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="csfType" value="Sale" id="csfSale" class="checkbox-round"   >  For Sale &nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="csfType" value="HHunting" id="csfHH" class="checkbox-round" > House Hunting&nbsp;&nbsp;
															 </div>

																<div class="row mt-4" id="HouseRentDiv">
																<div class="col-lg-6 col-md-6 col-sm-12">
															<input type="hidden" value="${prtyid}" id="prtyid" name="prtyid">
															<input type="hidden" value="${prptyName}" id="prtyName" name="prtyName">	
															<input type="hidden" value="${classifiedid}" id="classifedid" name="classifedid">	
															<input type="hidden" value="${csfCategory}" id="csfCategory" name="csfCategory">	
															
															
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type <span style="color: red">*</span></label>
																			<select class="form-control" id="csfPrtytype" name="csfPrtytype" required>
																				<option value="">Select property Type</option>
																				<option value="Apartment">Apartment</option>
																				<option value="House">House</option>
																				<option value="Commercial Space">Commercial Space</option>
																				<option value="Shop">Shop</option>
																				<option value="Unit">Unit</option>
																			</select>
																		</div>


																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Beds</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																			<label class="btn btn-outline-info " id="bedsLabel">
																					<input type="radio" name="noofBeds" id="r_noofBeds" value="1"  required> 0
																				</label>
																				<label class="btn btn-outline-info " id="bedsLabel">
																					<input type="radio" name="noofBeds" id="r_noofBeds" value="1"  > 1
																				</label>
																				<label class="btn btn-outline-info" id="bedsLabel">
																					<input type="radio" name="noofBeds" id="noofBeds" value="2"  > 2
																				</label>
																				<label class="btn btn-outline-info" id="bedsLabel">
																					<input type="radio" name="noofBeds" id="noofBeds" value="3"  > 3
																				</label>
																				<label class="btn btn-outline-info" id="bedsLabel">
																					<input type="radio" name="noofBeds" id="noofBeds"  value="4"  > 4
																				</label>
																				<label class="btn btn-outline-info" id="bedsLabel">
																					<input type="radio" name="noofBeds" id="noofBeds" value="5"  > 5
																				</label>
																				<label class="btn btn-outline-info" id="bedsLabel">
																					<input type="radio" name="noofBeds" id="noofBeds" value="5Plus"  > 5+
																				</label>
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Bathrooms</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																			<label class="btn btn-outline-info ">
																					<input type="radio" name="noofbaths" id="noofbaths" value="1" autocomplete="off" required> 0
																				</label>
																				<label class="btn btn-outline-info ">
																					<input type="radio" name="noofbaths" id="noofbaths" value="1" autocomplete="off" > 1
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
																					<input type="radio" name="noofbaths" id="noofbaths" value="5Plus" autocomplete="off" > 5+
																				</label>
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of parking</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info ">
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
																					<input type="radio" name="nofofparking" id="nofofparking" value="5Plus" autocomplete="off"> 5+
																				</label>
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>


																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Area(s.ft)<span style="color: red">*</span></label>
																					<input type="text" id="areaSqft" name="areaSqft" placeholder="Area(s.ft)" class="form-control" required>
																					<div class="help-block with-errors"></div>
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
																					<div class="help-block with-errors"></div>
																				</div>

																			</div>

																		</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Address<span style="color: red">*</span></label>
																			<textarea rows="2" cols="50" class="form-control" id ="prtyAddress" name="prtyAddress" required></textarea>
																			<div class="help-block with-errors"></div>
																		</div>


																	</div>
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">City</label>
																					<input type="text" id ="city" name="city" placeholder="City" class="form-control" required>
																					<div class="help-block with-errors"></div>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">State</label>
																					
																					<input type="text" id ="state" name="state" placeholder="State" class="form-control" required>
																					<input type="hidden" id ="ImageRemoveArr"  class="form-control" >
																					<div class="help-block with-errors"></div>
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
																				<div class="help-block with-errors"></div>
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
																
																<div class="row mt-4" id="HouseHuntingDiv">
																	<div class="col-lg-6 col-md-6 col-sm-12">
																	<input type="hidden" value="${prtyid}" id="h_prtyid" name="prtyid">
															<input type="hidden" value="${prptyName}" id="h_prtyName" name="prtyName">	
															<input type="hidden" value="${classifiedid}" id="h_classifedid" name="h_classifedid">
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Name<span style="color: red">*</span></div>
																				</div>
																				<input type="text" id="hh_name" name="hh_name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"  required>
																				<div class="help-block with-errors"></div>
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="hh_email" name="hh_email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" required>
																				<div class="help-block with-errors"></div>

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="hh_phone" name="hh_phone" minlength="10" maxlength="12"  pattern="^[0-9]*$" required >
																				<div class="help-block with-errors"></div>

																			</div>
																		</div>
																		<div class="form-group">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Rent" id="HuntingFor" name="HuntingFor" class="checkbox-round" required> For Rent
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Buy" id="HuntingFor" name="HuntingFor" class="checkbox-round" > For Buy
																				</label>
																				<div class="help-block with-errors"></div>
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
											</div>
													<div id="step-2">
													 <div id="form-step-1" role="form" data-toggle="validator">
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
																						<div class="help-block with-errors"></div>
																					</div>

																				</div>
																				<div class="form-group" id="saleClick">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">sale</div>
																						</div>
																						<input type="text" class="form-control"
																							id="s_amount" name="amount">
																							<div class="help-block with-errors"></div>
																					</div>
																					
																				</div>


																				<div class="form-group" id="advanceDiv">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Advance</div>
																						</div>
																						<input type="text" class="form-control"
																							id="advance" name="advance" placeholder="">
																							<div class="help-block with-errors"></div>

																					</div>
																				</div>
																				
																				<div class="form-group" id="loanFacilityDiv">
																					
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Loan Facility</div>
																						</div>&nbsp;&nbsp;&nbsp;&nbsp;
																						<div class="form-group">
																					<input type="radio" name="loanFacility" value="Yes" id="loanFacility"  class="checkbox-round"  required>Yes &nbsp;&nbsp;&nbsp;&nbsp;
																					<input type="radio" name="loanFacility" value="No" id="loanFacility" class="checkbox-round"   > No &nbsp;&nbsp;&nbsp;&nbsp;
																					
																					 </div>
																					<!-- <select class="form-control" id="loanFacility" name="loanFacility" required>
																						<option value="">Select</option>
																						<option value="Yes">Yes</option>
																						<option value="No">No</option>																						
																					</select> -->
																					<div class="help-block with-errors"></div>
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
																							<div class="help-block with-errors"></div>
																					</div>
																				</div>
																				
																				<div class="form-group">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Title</div>
																						</div>
																						<input type="text" id="csfTitle" name="csfTitle" maxlength='85'
																						placeholder="Title" class="form-control" required>
																						<span style="color:black"><b>85 Characters only</b></span>
																						<div class="help-block with-errors"></div>
																					</div>
																				</div>

																				

																				<div class="form-group">
																					<label for="company" class=" form-control-label">Description</label>
																					<textarea rows="2" cols="50" class="form-control" maxlength='500'
																						id="csfDesription" name="csfDesription" required></textarea>
																						<span style="color:black"><b>500 Characters only</b></span>
																						<div class="help-block with-errors"></div>
																				</div>

																			</div>
																			
																	
														<div class="col-lg-6 col-md-6 col-sm-12" >
																		<h4 class="my-1">Gallery</h4>
                             
                             <div class="file-upload-previews"></div>
                            <div class="form-group file-upload">
                                <input type="file" name="files[]"  style="margin-bottom: 10px;" id="showImage" class="form-control file-upload-input with-preview" multiple title="Click to add files" maxlength="10" accept="gif|jpg|png" >
                              <div class="help-block with-errors"></div>
                            </div>
                             <div class="file-uploaded-images" id="previewImage" style="overflow-y: scroll; max-height: 224px;padding-top:15px;">
                               
                            </div> 
																		
																		
																		
																	</div>
																		</div>
																	</div>

																</div>
															</div>
														</div>
													</div>
													</div>



											
											<div id="step-3">
											<div id="form-step-2" role="form" data-toggle="validator">
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
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="email" name="email" placeholder="">
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="phone" name="phone" placeholder="">
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Tags</div>
																				</div>
																				<input type="text" class="form-control" id="tags" name="tags" placeholder="255 Characters only" maxlength="255">
																				<span style="color:black"><b>255 Characters only</b></span>
																				<div class="help-block with-errors"></div>
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
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	   <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js"></script>
	 <script type="text/javascript" src="resources/dist/js/jquery.smartWizard.min.js"></script> 
	
     <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     
	   <script type="text/javascript">
        $(document).ready(function(){
        
            var btnFinish = $('<button></button>').text('Finish')
                                             .addClass('btn btn-info')
                                             .on('click', function(){
                                                    if(!$(this).hasClass('disabled')){
                                                        var elmForm = $("#formAddCSF");
                                                        if(elmForm){
                                                            elmForm.validator('validate');
                                                            var elmErr = elmForm.find('.has-error');
                                                            if(elmErr && elmErr.length > 0){
                                                                alert('Oops we still have error in the form');
                                                                return false;
                                                            }else{
                                                                alert('Great! we are ready to submit form');
                                                            	var today=getToday();
                                                            	
                                                           	 var radioValue = $("input[name='csfType']:checked").val();
                                                           	if(radioValue!='HHunting'){
                                                           		  var prtyid= $("#prtyid").val();
                                                                	 var prtyName= $("#prtyName").val();
                                                                	 var prtyidInt = parseInt(prtyid);
                                                           	  var csfPrtytype= $("#csfPrtytype").val();
                                                           	 var noofbaths= $("input[name='noofbaths']:checked").val();
                                                           	 var nofofparking= $("input[name='nofofparking']:checked").val();
                                                           	
                                                           	 var noofBeds=$("input[name='noofBeds']:checked").val();
                                                           	
                                                           	 var areaSqft= $("#areaSqft").val();
                                                           	 var facing= $("#facing").val();
                                                           	 var prtyAddress= $("#prtyAddress").val();
                                                           	 var city= $("#city").val();
                                                           	 var state= $("#state").val();
                                                           	 var csfTitle= $("#csfTitle").val();
                                                           	 var csfDesription= $("#csfDesription").val();
                                                           	 var gmapLink= $("#gmapLink").val();
                                                           	 var prtyavialbleon= $("#prtyavialbleon").val();
                                                           	
                                                           	 var amount= 0;
                                                           	 var clasifiedid= $("#classifedid").val();
                                                           	 var csfCategory= $("#csfCategory").val();
                                                           	 var advance=0;
                                                           	 var loanfacility='NO'
                                                           	 if(radioValue=='Rent'){
                                                           	  advance=$("#advance").val();
                                                           	   amount= $("#r_amount").val();
                                                           	 }if(radioValue=='Sale'){
                                                           		  loanfacility=$("#loanFacility").val(); 
                                                           		  amount= $("#s_amount").val();
                                                           	 }
                                                           	 var ImageRemoveArr=$("#ImageRemoveArr").val();
                                                           	 var name= $("#name").val();
                                                           	 var email= $("#email").val();
                                                           	 var phone= $("#phone").val();
                                                           	 var tags= $("#tags").val();
                                                           	 var features = [];
                                                           	 
                                                                $.each($("input[name='feature']:checked"), function(){
                                                               	 features.push($(this).val());
                                                                });
                                                               
                                                                var featureObj=features.toString();
                                                                var ImageRemoveObj=ImageRemoveArr.toString();
                                                               
                                                                
                                                                var form = $('#formAddCSF')[0];
                                                                var filedata = new FormData(form);
                                                             	 var classifiedRentObj={
                                                           			 csfType:radioValue,
                                                           			 csfPrtytype:csfPrtytype,
                                                           			 noofbaths:noofbaths,
                                                           			 nofofparking:nofofparking,
                                                           			 noofBeds:noofBeds,
                                                           			 areaSqft:areaSqft,
                                                           			 facing:facing,
                                                           			 prtyAddress:prtyAddress,
                                                           			 city:city,
                                                           			 state:state,
                                                           			 csfTitle:csfTitle,
                                                           			 csfDesription:csfDesription,
                                                           			 gmapLink:gmapLink,
                                                           			 prtyavialbleon:prtyavialbleon,
                                                           			 amount:amount,
                                                           			 advance:advance,
                                                           			 loanfacility:loanfacility,
                                                           			 name:name,
                                                           			 email:email,
                                                           			 phone:phone,
                                                           			 prtyid:prtyidInt,
                                                           			 updatedon:today,
                                                           			 tags:tags,
                                                           			 status:'Y'
                                                           			 
                                                           	 }
                                                           	 var classifiedDtoObj={
                                                           			 classifiedInfo:classifiedRentObj, 
                                                           			 classifiedFetures:featureObj,
                                                           			 imageRemoveArr:ImageRemoveObj
                                                           	 }
                                                           	 $.ajax({
                                                     	            url: "updateClassifiedRent?classifiedid="+clasifiedid+"&&csfCategory="+csfCategory+"", //this is the submit URL
                                                     	            type: "POST",
                                                     	            contentType :"application/json",
                                                     	           	data : JSON.stringify(classifiedDtoObj),
                                                     	            processData: false,
                                                     	            cache: false,
                                                     	            success: function(data){
                                                     	            	
                                                     	            	alert(data);
                                                     	            	$.ajax({
                                                         	            url: "saveClassifiedImages?id="+clasifiedid+"", //this is the submit URL
                                                         	            type: "POST",
                                                         	            enctype: 'multipart/form-data',
                                                        	            data: filedata,
                                                        	            processData: false,
                                                        	            contentType: false,
                                                         	            cache: false,
                                                         	            success: function(response){
                                                             	           if(response=='Success'){
                                                             	        
                                                         	            	window.location.href="classifides?prtyid="+prtyid+"&prptyName="+prtyName+"";
                                                             	           }
                                                             	           else{
                                                                 	           alert("Images not uploaded");}
                                                         	            },error: function (xhr, status, thrownError) {
                                                         	                if (xhr.responseText.indexOf("Session Expired") > 0) {
                                                         	                    //Session has Expired,redirect to login page
                                                         	                    window.location.href = "loginpage";
                                                         	                } else {
                                                         	                    //Other Exceptions/Errors
                                                         	                 alert(thrownError);
                                                         	                }
                                                         	            }
                                                     	            });
                                                     	            	
                                                     	            	
                                                     	            }
                                                     	        });
                                                             	
                                                           	  }
                                                           	 
                                                           	  else {
                                                           		
                                                           		  var prtyid= $("#h_prtyid").val();
                                                           		  var clasifiedid= $("#h_classifedid").val();
                                                                 	 var prtyName= $("#h_prtyName").val();
                                                           		  var name= $("#hh_name").val();
                                                           		 
                                                           		  var email= $("#hh_email").val();
                                                           		  var phone= $("#hh_phone").val();
                                                           		 
                                                           		  var huntingfor= $("input[name='HuntingFor']:checked"). val();
                                                           		  var myinterests= $("#Myinterests").val();
                                                           		
                                                           		  var status='Y';
                                                           		  
                                                           		  var hhuntingObj={
                                                           				  name:name,
                                                           				  email:email,
                                                           				  phone:phone,
                                                           				  huntingfor:huntingfor,
                                                           				  myinterests:myinterests,
                                                           				  status:status,
                                                           				  prtyid:prtyid
                                                           		  }
                                                           		  $.ajax({
                                                            	            url: "updateHHClassified?classifiedid="+clasifiedid, //this is the submit URL
                                                            	            type: "POST",
                                                            	            contentType :"application/json",
                                                            	           	data : JSON.stringify(hhuntingObj),
                                                            	            processData: false,
                                                            	            
                                                            	            cache: false,
                                                            	            success: function(data){
                                                            	            	alert("Classified posted");
                                                            	            	window.location.href="classifides?prtyid="+prtyid+"&prptyName="+prtyName+"";
                                                            	            	
                                                            	            },error: function (jqXHR, exception) {
                                                            	                var msg = '';
                                                            	                if (jqXHR.status === 0) {
                                                            	                    msg = 'Not connect.\n Verify Network.';
                                                            	                } else if (jqXHR.status == 404) {
                                                            	                    msg = 'Requested page not found. [404]';
                                                            	                } else if (jqXHR.status == 500) {
                                                            	                    msg = 'Internal Server Error [500].';
                                                            	                } else if (exception === 'parsererror') {
                                                            	                    msg = 'Requested JSON parse failed.';
                                                            	                } else if (exception === 'timeout') {
                                                            	                    msg = 'Time out error.';
                                                            	                } else if (exception === 'abort') {
                                                            	                    msg = 'Ajax request aborted.';
                                                            	                } else {
                                                            	                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                                                            	                }
                                                            	                alert("Error message----"+msg);
                                                            	            }
                                                            	        });
                                                           	  }
                                                            }
                                                        }
                                                    }
                                                });
         



            // Smart Wizard
            $('#smartwizard').smartWizard({
                    selected: 0,
                    theme: 'dots',
                    transitionEffect:'fade',
                    toolbarSettings: {toolbarPosition: 'bottom',
                                      toolbarExtraButtons: [btnFinish]
                                    },
                    anchorSettings: {
                                markDoneStep: true, // add done css
                                markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
                                removeDoneStepOnNavigateBack: true, // While navigate back done step after active step will be cleared
                                enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
                            }
                 });
            
            $("#smartwizard").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection) {
                
if(stepNumber==1){
                var numFiles = $("input:file")[0].files.length;
            	

            var count=	$("#previewImage").children().length;
            	//var chk=$('#previewImage')[0].hasChildNodes();
          
            	if ( count==0 && numFiles==0) {
			$("#showImage").attr('required',true);
            		 alert("Please select atleast one file--");
            		 return false;
            	}
            	else{
            		
            		
            			 $("#showImage").attr('required',false);
            		 return true;
            			 
            			
            		
            		
            		 
            		}
           
}else{
                var elmForm = $("#form-step-" + stepNumber);
                // stepDirection === 'forward' :- this condition allows to do the form validation
                // only on forward navigation, that makes easy navigation on backwards still do the validation when going next
                if(stepDirection === 'forward' && elmForm){
                    elmForm.validator('validate');
                    var elmErr = elmForm.find('.has-error');
                    if(elmErr && elmErr.length > 0){
                        // Form validation failed
                        return false;
                    }
                }
                return true;
}
            });
            
            $("#smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection) {
                // Enable finish button only on last step
                if(stepNumber == 3){
                    $('.btn-finish').removeClass('disabled');
                }else{
                    $('.btn-finish').addClass('disabled');
                }
            });

        });
</script>
	
	<script type="text/javascript">
	var imgArr=[];
	var checkFile=false;
	$(document).ready(function(){
		var arr =["Power Backup","Children Playground","Gym","Walking Track","Lift Access","Club House"]; // take an array to store values
		
		
		var data = JSON.parse('${images}');
		var type = JSON.parse('${type}');
	
		
		if(type=='cs'){
		var data1= JSON.parse('${viewObject}');
		
		var csfInfo=data1.csfinfo;
		
		var csftype=csfInfo.csfType;
		var csfPrtytype=csfInfo.csfPrtytype;
		var classifiedId=csfInfo.classified;
		
		var noofbeds=csfInfo.noofBeds;
		var noofbaths=csfInfo.noofbaths;
		var noofparking=csfInfo.nofofparking;
		var facing=csfInfo.facing;
		var areaSqft=csfInfo.areaSqft;
		var prtyAddress=csfInfo.prtyAddress;
		var city=csfInfo.city;
		var state=csfInfo.state;
		var csfTitle=csfInfo.csfTitle;
		var csfDesription=csfInfo.csfDesription;
		var prtyavialbleon=csfInfo.prtyavialbleon;
		var amount=csfInfo.amount;
		
		var name=csfInfo.name;
		var email=csfInfo.email;
		var phone=csfInfo.phone;
		var tags=csfInfo.tags;
		
		var gmapLink=csfInfo.gmapLink;
		$("#classifiedId").val(classifiedId);
		$("input[name=csfType][value=" + csftype + "]").prop('checked', true);
		var advance=csfInfo.advance;
		 var idTypeVal = $("select[name='csfPrtytype']");
		 idTypeVal.find('option[value="' + csfPrtytype + '"]').attr('selected', true);
		 $("input[name=noofBeds][value=" + noofbeds + "]").parent().addClass("active");
		 $("input[name=noofBeds][value=" + noofbeds + "]").prop('checked', true);
		 
		$("input[name=noofbaths][value=" + noofbaths + "]").parent().addClass("active");
		$("input[name=noofbaths][value=" + noofbaths + "]").prop('checked', true);
		$("input[name=nofofparking][value=" + noofparking+ "]").parent().addClass("active");
		$("input[name=nofofparking][value=" + noofparking+ "]").prop('checked', true);
		
		$("#areaSqft").val(areaSqft);
		 var facingVal =$("select[name='facing']");
		 facingVal.find('option[value="' + facing + '"]').attr('selected', true);
		$("#prtyAddress").val(prtyAddress);
		$("#city").val(city);
		$("#state").val(state);
		$("#gmapLink").val(gmapLink);
		
		if(csftype=='Rent'){
			
			$("#csfPrtytype,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing,#prtyAddress,#city,#state,#prtyavialbleon,#advance,#r_amount,#prtyavialbleon,#csfTitle,#csfDesription,#r_amount,#advance").attr("required", true);
		  	$("#name,#email,#phone").attr("required", true);
		  	$("#hh_name,#hh_email,#hh_phone,#HuntingFor,#s_amount,#loanFacility").attr("required", false);
			//alert("rent");
			$("#r_amount").val(amount);
			$("#advance").val(advance);
			$("#saleClick").hide();
			$("#rentClick").show();
			$("#loanFacilityDiv").hide();
			$("#advanceDiv").show();
			$('.sw-btn-next').show();
		}
		else if(csftype=='Sale'){
			$("#name,#email,#phone").attr("required", true);
			$("#csfPrtytype,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing,#prtyAddress,#city,#state,#prtyavialbleon,#advance,#r_amount,#prtyavialbleon,#csfTitle,#csfDesription,#s_amount,#loanFacility").attr("required", true);
		  	$("#hh_name,#hh_email,#hh_phone,#HuntingFor,#r_amount,#advance").attr("required", false);
		  	
		  	$("#s_amount").val(amount);
			var loanfacility=csfInfo.loanfacility;
			$("#loanFacilityDiv").show();
	
			
			$("input[name=loanFacility][value=" + loanfacility + "]").prop('checked', true);
			
			    $("#saleClick").show();
				$("#rentClick").hide();
				
				$("#advanceDiv").hide();
				$('.sw-btn-next').show();
		} else{
			$('.sw-btn-next').hide();
			$("#csfPrtytype,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing,#prtyAddress,#city,#prtyavialbleon,#advance,#r_amount,#name,#email,#phone,#prtyavialbleon,#csfTitle,#csfDesription,#r_amount,#advance,#s_amount,#loanFacility,#showImage").attr("required", false);
			$("#hh_name,#hh_email,#hh_phone,#HuntingFor").attr("required", true);
			
			}
		var features=data1.features;
		if(features!=''){
		for(var j = 0; j < features.length; j++) {
			var foundPresent = arr.indexOf(features[j]);
			if(foundPresent == -1){
				 var input="<label class='checkbox-inline'><input type='checkbox' value="+features[j]+" id='feature' name='feature' class='checkbox-round' checked> "+features[j]+"</label>";
					$('#newFeatureDiv').append(input);
				}
			else{
			 $("input[name=feature][value='" + features[j] + "']").prop('checked', true);}
			}
		}
			$("#csfTitle").val(csfTitle);
			$("#csfDesription").val(csfDesription);
			$("#prtyavialbleon").val(prtyavialbleon);
			$("#name").val(name);
			$("#phone").val(phone);
			$("#email").val(email);
			$("#tags").val(tags);
			}else{

			var data2= JSON.parse('${viewObject}');
			var classifiedId=data2.id;
			var name=data2.name;
			var email=data2.email;
			var phone=data2.phone;
			var huntingfor=data2.huntingfor;
			var myinterests=data2.myinterests;
			
			$("#hh_name").val(name);
			$("#hh_phone").val(phone);
			$("#hh_email").val(email);
			$("input[name=HuntingFor][value='" + huntingfor + "']").prop('checked', true);
			
			//$("#HuntingFor").val(huntingfor);
			$("#Myinterests").val(myinterests);

			}
		
		
		 var div=$("#previewImage");
		 //showImage

		
		 
		 for (var i = 0; i < data.length; i++) {
			
			
		          $("<div class=\"image\">" +
				          "<figure class='remove-image' ><i class='fa fa-close'></i></figure>"+
		            "<img src='resources/Classified-Images/"+data[i].imagename+"' class='csfImg' >" 
		             + "</div>").appendTo(div);
		         
		        }
		 		     $(".remove-image").click(function(){
				            var imageval=$(this).closest('.image').children('.csfImg').attr('src');
				            var filename = imageval.replace(/^.*[\\\/]/, '');
				            imgArr.push(filename);
				            $(this).parent(".image").remove();
				            $("#ImageRemoveArr").val(imgArr);
				          
				          });  
				      
		 		 
		      		div.insertAfter("#showImage");

		      		
		        });
		     
		
		//}
           
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
	$("#loanFacilityDiv").hide();
	$("#advanceDiv").hide();
		$("#saleClick").hide();
		/*$("#inlineFtContent").hide();*/
		$("#csfRent").click(function() {
		 	$("#csfPrtytype,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing,#prtyAddress,#city,#state,#prtyavialbleon,#advance,#r_amount,#prtyavialbleon,#csfTitle,#csfDesription,#r_amount,#advance,#showImage").attr("required", true);
		  	$("#name,#email,#phone").attr("required", true);
		  	$("#hh_name,#hh_email,#hh_phone,#HuntingFor,#s_amount,#loanFacility").attr("required", false);
			$("#HouseHuntingDiv").hide();
			$("#HouseRentDiv").show();
			$("#saleClick").hide();
			$("#rentClick").show();
			$("#loanFacilityDiv").hide();
			$("#advanceDiv").show();
			$('.sw-btn-next').show();
		});
	</script>
	<script>
		/* $("#HouseSaleDiv").hide(); */
		$("#HouseHuntingDiv").hide();
		$("#csfSale").click(function() {
			$("#saleClick").show();
			$("#rentClick").hide();
			
			$("#name,#email,#phone").attr("required", true);
			$("#csfPrtytype,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing,#prtyAddress,#city,#state,#prtyavialbleon,#advance,#r_amount,#prtyavialbleon,#csfTitle,#csfDesription,#s_amount,#loanFacility,#showImage").attr("required", true);
		  	$("#hh_name,#hh_email,#hh_phone,#HuntingFor,#r_amount,#advance").attr("required", false);
			
			$("#HouseHuntingDiv").hide();
			$("#HouseRentDiv").show();
			$("#loanFacilityDiv").show();
			$("#advanceDiv").hide();
			$('.sw-btn-next').show();
		});


		
		$("#csfHH").click(function() {
			$("#csfPrtytype,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing,#prtyAddress,#city,#prtyavialbleon,#advance,#r_amount,#name,#email,#phone,#prtyavialbleon,#csfTitle,#csfDesription,#r_amount,#advance,#s_amount,#loanFacility,#showImage").attr("required", false);
			$("#hh_name,#hh_email,#hh_phone,#HuntingFor").attr("required", true);
			//$("#HouseSaleDiv").hide();
			$("#HouseRentDiv").hide();
			$("#HouseHuntingDiv").show();
			$('.sw-btn-next').hide();
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
	var numFiles = $("input:file")[0].files.length;

	var chk=$('#previewImage')[0].hasChildNodes();
	
	
	
	if ( chk==true ) {
		
		$('#showImage').attr('required',false);
		
	}
	else{
		if(numFiles==0 )
		{
		$('#showImage').attr('required',true);
		}
		}

		    $("#showImage").on("change", function(e) {
		      var files = e.target.files,
		        filesLength = files.length;
		        if(filesLength>8){
				alert("You can choose only 8 images");
			        }else{
			        	
			        					        
		        var div=$("#previewImage");
				         
				             
		      for (var i = 0; i < filesLength; i++) {
		        var f = files[i]
		        var fileReader = new FileReader();
		        fileReader.onload = (function(e) {
		          var file = e.target;
		          
		          $("<div class=\"image\">" +
				          "<figure class='remove-image'><i class='fa fa-close'></i></figure>"+
		            "<img src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" +
		             + "</div>").appendTo(div);
		         $(".remove-image").click(function(){
		            $(this).parent(".image").remove();
		           
		          }); 
		        });
		        fileReader.readAsDataURL(f);
		      }
		      div.insertAfter("#showImage");
		     
		        }

		       



		        
		      
		    });
		   
	
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