<!doctype html>

<html class="no-js" lang="">


<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">
	  
    <!-- Include SmartWizard CSS -->
    <link href="resources/dist/css/smart_wizard.css" rel="stylesheet" type="text/css" />
<link href="resources/dist/css/smart_wizard_theme_dots.css" rel="stylesheet" type="text/css" />
    <!-- Optional SmartWizard theme -->
    <link href="resources/dist/css/smart_wizard_theme_circles.css" rel="stylesheet" type="text/css" />
    <link href="resources/dist/css/smart_wizard_theme_arrows.css" rel="stylesheet" type="text/css" />
		
		<!-- <link href="resources/css/dist/imageuploadify.min.css" rel="stylesheet" type="text/css"/> -->
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

		/*
        .mail{
            border: 1px solid #878787;
        }
*/
	</style>
<style>
.help-block{
     color: red;
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
    margin-top: 2rem;
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
									<strong class="card-title"><a type="button" href="propertyclassifides?prtyid=${prptyid}&&prptyName${prptyName}" class="btn btn-info btn-sm" ><i class="fa fa-arrow-left"></i></a>&nbsp;&nbsp;Classifides - Add</strong>
								</div>
								
							</div>
						</div>
						
				
									 <div class="container">
        <br />
        <form action="/" id="formAddCSF" role="form" data-toggle="validator" method="post" accept-charset="utf-8">

        <!-- SmartWizard html -->
        <div id="smartwizard">
            <ul>
                <li><a href="#step-1"><br /><small>Property Details</small></a></li>
                <li><a href="#step-2"><br /><small>Upload Photos</small></a></li>
                <li><a href="#step-3"><br /><small>Contact Details</small></a></li>
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
																<input type="radio" name="csfType" value="Sale" id="csfSale" class="checkbox-round"   required>  For Sale &nbsp;&nbsp;&nbsp;&nbsp;
																<!-- <input type="radio" name="csfType" value="HHunting" id="csfHH" class="checkbox-round" required> House Hunting&nbsp;&nbsp; -->
																<div class="help-block with-errors"></div>
																</div>

																<div class="row mt-4" id="HouseRentDiv">
																<div class="col-lg-6 col-md-6 col-sm-12">
															<input type="hidden" value="${prptyid}" id="r_prtyid" name="prtyid">
															<input type="hidden" value="${userid}" id="userid" name="userid">
															<input type="hidden" value="${prptyName}" id="r_prtyName" name="prtyName">	
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type <span style="color: red">*</span></label>
																			<select class="form-control" id="csfPrtytype" name="csfPrtytype" >
																				<option value="">Select property Type</option>
																				<option value="Apartment">Apartment</option>
																				<option value="House">House</option>
																				<option value="Commercial Space">Commercial Space</option>
																				<option value="Shop">Shop</option>
																				<option value="Unit">Unit</option>
																			</select>
																			<div class="help-block with-errors"></div>
																		</div>


																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Beds</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																			<label class="btn btn-outline-info ">
																					<input type="radio" name="noofBeds" id="noofBeds" value="0" autocomplete="off"> 0
																				</label>
																				<label class="btn btn-outline-info ">
																					<input type="radio" name="noofBeds" id="noofBeds" value="1" autocomplete="off"> 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="2" autocomplete="off"> 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="3" autocomplete="off" > 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds"  value="4" autocomplete="off" > 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="5" autocomplete="off" > 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="noofBeds" id="noofBeds" value="5+" autocomplete="off" > 5+
																				</label>
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of Bathrooms</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																			<label class="btn btn-outline-info ">
																					<input type="radio" name="noofbaths" id="noofbaths" value="0" autocomplete="off" > 0
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
																					<input type="radio" name="noofbaths" id="noofbaths" value="5+" autocomplete="off" > 5+
																				</label>
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>

																		<div class="form-group">
																			<label for="company" class=" form-control-label">No of parking</label><br>
																			<div class="btn-group btn-group-toggle" data-toggle="buttons">
																				<label class="btn btn-outline-info ">
																					<input type="radio" name="nofofparking" id="nofofparking" value="0" autocomplete="off" > 0
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="1"autocomplete="off" > 1
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="2" autocomplete="off" > 2
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="3"  autocomplete="off" > 3
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="4" autocomplete="off" > 4
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="5" autocomplete="off" > 5
																				</label>
																				<label class="btn btn-outline-info">
																					<input type="radio" name="nofofparking" id="nofofparking" value="5+" autocomplete="off" > 5+
																				</label>
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>


																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Area(s.ft)<span style="color: red">*</span></label>
																					<input type="text" id="areaSqft" name="areaSqft" placeholder="Area(s.ft)" class="form-control" >
																					<div class="help-block with-errors"></div>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Facing<span style="color: red">*</span></label>
																					<select class="form-control" id="facing" name="facing" >
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
																			<textarea rows="2" cols="50" class="form-control" id ="prtyAddress" name="prtyAddress" ></textarea>
																			<div class="help-block with-errors"></div>
																		</div>


																	</div>
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">City</label>
																					<!-- <input type="text" id ="city" name="city" placeholder="City" class="form-control" > -->
																					<select class="form-control" id="city" name="city" onchange="getArea()">
																						<option value="">Select City</option>
																						 <option value="Hyderabad">Hyderabad</option>
																						<option value="Bengalore">Bengalore</option>
																						<option value="Vizag">Vizag</option>
<option value="Vijayawada">Vijayawada</option>
																						
																					</select>
																					
																					
																					
																					<div class="help-block with-errors"></div>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Area</label>
																					<select class="form-control" id="state" name="state" >
																						
																						
																						
																					</select>
																					<!-- <input type="text" id ="state" name="state" placeholder="State" class="form-control" > -->
																					<div class="help-block with-errors"></div>
																				</div>
																			</div>
																		</div>


																		<h5><b>Features</b></h5>
																		<div class="row mt-3">
																			<div class="col">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Power Backup" id="feature" name="feature" class="checkbox-round" > Power Backup
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
																					<input type="text" id="newfeature" placeholder="newfeature" class="form-control">
																					
																				</div>
																			</div>
																		</div>
																		<button type="button" class="btn btn-info" onclick="addNewFeature()">Add more features</button>
																		<div class="form-group mt-3">
																			<label for="company" class=" form-control-label">GoogleMap Link</label>
																			<textarea rows="2" cols="50" class=" form-control" id="gmapLink" name="gmapLink"></textarea>
																			<div class="help-block with-errors"></div>
																			<small id="passwordHelpBlock" class="form-text">
  																		<a href="https://www.google.com/maps" target="_blank"><font size="3">click here for Googlemap</font></a>
																			</small>
																		</div>

																	</div>

																</div>
														
																<div class="row mt-4" id="HouseHuntingDiv">
																	<div class="col-lg-6 col-md-6 col-sm-12">
																	<input type="hidden" value="${prptyid}" id="h_prtyid" name="prtyid">
																	<input type="hidden" value="${userid}" id="hh_userid" name="userid">
															         <input type="hidden" value="${prptyName}" id="h_prtyName" name="prtyName">	
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Name<span style="color: red">*</span></div>
																				</div>
																				<input type="text" id="hh_name" name="hh_name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"  >
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="hh_email" name="hh_email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" >
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="hh_phone" name="hh_phone" minlength="10" maxlength="12"  pattern="^[0-9]*$"  >
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>
																		<div class="form-group">
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Rent" id="HuntingFor" name="HuntingFor" class="checkbox-round" > For Rent
																				</label>
																				<label class="checkbox-inline">
																					<input type="checkbox" value="Buy" id="HuntingFor" name="HuntingFor" class="checkbox-round" > For Buy
																				</label>
																				<div class="help-block with-errors"></div>
																			</div>
																		<div class="form-group">
																			<label for="company" class=" form-control-label">My interests (No Of beds, Locality, Budget...) </label>
																			<textarea rows="2" cols="50" class=" form-control" id="Myinterests" name="Myinterests" maxlength="1000"></textarea>
																			<span style="color:black"><b>1000 Characters only</b></span>
																			<div class="help-block with-errors"></div>
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
																							id="advance" name="advance" placeholder="Advance">
																							<div class="help-block with-errors"></div>
																					</div>
																				</div>
																				
																				<div class="form-group" id="loanFacilityDiv">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Loan Facility</div>
																						</div>
																					<select class="form-control" id="loanFacility" name="loanFacility">
																						<option value="">Select</option>
																						<option value="Yes">Yes</option>
																						<option value="No">No</option>																						
																					</select>
																					<div class="help-block with-errors"></div>
																				</div>
																				</div>

																				<div class="form-group">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Available on</div>
																						</div>
																						<input type="date" class="form-control"
																							id="prtyavialbleon" name="prtyavialbleon">
																							<div class="help-block with-errors"></div>
																					</div>
																				</div>
																				
																				<div class="form-group">
																					<div class="input-group">
																						<div class="input-group-prepend">
																							<div class="input-group-text">Title</div>
																						</div>
																						<input type="text" id="csfTitle" name="csfTitle" maxlength='85'
																						placeholder="Title" class="form-control">
																						<span style="color:black"><b>85 Characters only</b></span>
																						<div class="help-block with-errors"></div>
																					</div>
																				</div>

																				

																				<div class="form-group">
																					<label for="company" class=" form-control-label">Description</label>
																					<textarea rows="2" cols="50" class="form-control" maxlength='500'
																						id="csfDesription" name="csfDesription"></textarea>
																						<span style="color:black"><b>500 Characters only</b></span>
																						<div class="help-block with-errors"></div>
																				</div>

																			</div>
																			
																	
											<div class="col-lg-6 col-md-6 col-sm-12" >
																		<h4 class="my-1">Gallery</h4>
                             
                             <div class="file-upload-previews"></div>
                            <div class="form-group file-upload">
                                <input type="file" name="files[]" multiple style="margin-bottom: 10px;" id="showImage" class="form-control file-upload-input with-preview" title="Click to add files" maxlength="10" accept="gif|jpg|png">
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
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Name<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="name" name="name" placeholder="Name" >
																				<div class="help-block with-errors"></div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="email" name="email" placeholder="Email" >
																				<div class="help-block with-errors"></div>

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone">
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
  <script type="text/javascript" src="resources/dist/Json/cities.json"></script>
	
   <!--   <script type="text/javascript" src="resources/js/dist/imageuploadify.min.js"></script> -->
       <script type="text/javascript">
      

       
        $(document).ready(function(){
            // Toolbar extra buttons
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
                                                           		 
                                                        		  var prtyid= $("#r_prtyid").val();
                                                             	 var prtyName= $("#r_prtyName").val();
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
                                                        	 var advance=0;
                                                        	 var loanfacility='NO'
                                                        	 if(radioValue=='Rent'){
                                                        	  advance=$("#advance").val();
                                                        	   amount= $("#r_amount").val();
                                                        	 }if(radioValue=='Sale'){
                                                        		  loanfacility=$("#loanFacility").val(); 
                                                        		  amount= $("#s_amount").val();
                                                        	 }
                                                        	
                                                        	 var name= $("#name").val();
                                                        	 var email= $("#email").val();
                                                        	 var phone= $("#phone").val();
                                                        	 var tags= $("#tags").val();
                                                        	 var userid=$("#userid").val();
                                                        	 var features = [];
                                                        	 
                                                             $.each($("input[name='feature']:checked"), function(){
                                                            	 features.push($(this).val());
                                                             });
                                                            
                                                             var featureObj=features.toString();
                                                            
                                                            
                                                             
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
                                                        			 postedon:today,
                                                        			 tags:tags,
                                                        			 userid:userid,
                                                        			 status:'Yes'
                                                        			 
                                                        	 }
                                                           	 var classifiedDtoObj={
                                                           			 classifiedInfo:classifiedRentObj, 
                                                           			 classifiedFetures:featureObj
                                                           			 
                                                           	 }
                                                           	 $.ajax({
                                                     	            url: "saveClassifiedSale", //this is the submit URL
                                                     	            type: "POST",
                                                     	            contentType :"application/json",
                                                     	           	data : JSON.stringify(classifiedDtoObj),
                                                     	            processData: false,
                                                     	            cache: false,
                                                     	            success: function(data){
                                                     	            	
                                                     	            	$.ajax({
                                                         	            url: "saveClassifiedImages?id="+data+"", //this is the submit URL
                                                         	            type: "POST",
                                                         	            enctype: 'multipart/form-data',
                                                        	            data: filedata,
                                                        	            processData: false,
                                                        	            contentType: false,

                                                         	            
                                                         	            cache: false,
                                                         	            success: function(response){
                                                             	         if(response=='Success'){
                                                         	            	alert("Classified posted");
                                                         	            	window.location.href="propertyclassifides?prtyid="+prtyid+"&prptyName="+prtyName+"";
                                                             	         }else{
                                                                 	         alert("Images not uploaded");
                                                                 	         }
                                                         	            }
                                                     	            });
                                                     	            	
                                                     	            	
                                                     	            }
                                                     	        });
                                                             	
                                                           	  }
                                                           	
                                                           	  else{
                                                           		
                                                           		  var prtyid= $("#h_prtyid").val();
                                                                  var prtyName= $("#h_prtyName").val();
                                                           		  var name= $("#hh_name").val();
                                                           		 
                                                           		  var email= $("#hh_email").val();
                                                           		  var phone= $("#hh_phone").val();
                                                           		 var userid=$("#hh_userid").val();
                                                           		  var huntingfor= $("input[name='HuntingFor']:checked"). val();
                                                           		  var myinterests= $("#Myinterests").val();
                                                           		
                                                           		  var status='Yes';
                                                           		  
                                                           		  var hhuntingObj={
                                                           				  name:name,
                                                           				  email:email,
                                                           				  phone:phone,
                                                           				  huntingfor:huntingfor,
                                                           				  myinterests:myinterests,
                                                           				  status:status,
                                                           				  userid:userid,
                                                           				  prtyid:prtyid
                                                           		  }
                                                           		  $.ajax({
                                                            	            url: "saveHHClassified", //this is the submit URL
                                                            	            type: "POST",
                                                            	            contentType :"application/json",
                                                            	           	data : JSON.stringify(hhuntingObj),
                                                            	            processData: false,
                                                            	            
                                                            	            cache: false,
                                                            	            success: function(data){
                                                            	            	alert("Classified posted");
                                                            	            	window.location.href="propertyclassifides?prtyid="+prtyid+"&prptyName="+prtyName+"";
                                                            	            	
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
                                                                
                                                                //elmForm.submit();
                                                                return false;
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
<!-- <script type="text/javascript">
            $(document).ready(function() {
                $('input[type="file"]').imageuploadify();
            })
</script> -->
<script type="text/javascript">
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
	</script>
	<script>
	$("#loanFacilityDiv").hide();
	$("#advanceDiv").hide();
		$("#saleClick").hide();
		/*$("#inlineFtContent").hide();  ,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing */
		$("#csfRent").click(function() {
		  	$("#csfPrtytype,#prtyAddress,#city,#state,#prtyavialbleon,#advance,#r_amount,#prtyavialbleon,#csfTitle,#csfDesription,#r_amount,#advance,#showImage").attr("required", true);
		  	$("#name,#email,#phone").attr("required", true);
		  	$("#hh_name,#hh_email,#hh_phone,#HuntingFor,#s_amount,#loanFacility").attr("required", false);
			$("#HouseRentDiv").show();
			$("#HouseHuntingDiv").hide();
			$("#saleClick").hide();
			$("#rentClick").show();
			$("#loanFacilityDiv").hide();
			$("#advanceDiv").show();
			  $('.sw-btn-next').show();
		});
	</script>
	<script>
		$("#HouseHuntingDiv").hide();
		$("#csfSale").click(function() {
		/* 	,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing */
			$("#saleClick").show();
			$("#rentClick").hide();
			$("#name,#email,#phone").attr("required", true);
			$("#csfPrtytype,#prtyAddress,#city,#state,#prtyavialbleon,#advance,#r_amount,#prtyavialbleon,#csfTitle,#csfDesription,#s_amount,#loanFacility,#showImage").attr("required", true);
		  	$("#hh_name,#hh_email,#hh_phone,#HuntingFor,#r_amount,#advance").attr("required", false);
			$("#HouseHuntingDiv").hide();
			$("#HouseRentDiv").show();
			$("#loanFacilityDiv").show();
			$("#advanceDiv").hide();
			  $('.sw-btn-next').show();
		});

		$("#csfHH").click(function() {
		/* 	,#noofbaths,#nofofparking,#noofBeds,#areaSqft,#facing */
			$("#csfPrtytype,#prtyAddress,#city,#prtyavialbleon,#advance,#r_amount,#name,#email,#phone,#prtyavialbleon,#csfTitle,#csfDesription,#r_amount,#advance,#s_amount,#loanFacility,#showImage").attr("required", false);
			$("#hh_name,#hh_email,#hh_phone,#HuntingFor").attr("required", true);
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
function getToday(){
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();

	return today = dd + '/' + mm + '/' + yyyy;
}





function getArea(){
	
	var city=$('#city').val();
	var area;
	var myArea={
			   
	        "Hyderabad": [" Kapra","Dr AS Rao Nagar","Cherlapally"," Meerpet HB Colony","Mallapur","Nacharam","Chilukanagar","Habsiguda","Ramanthapur",
"Uppal","Nagole"," Mansoorabad","Hayaat nagar","BN Reddy Nagar","Vanasthalipuram","Hastinapuram","Champapet","Lingojiguda",
" Saroornagar"," Rama Krishna Puram","Kothapet"," Chaitanyapuri"," Gaddiannaram"," Saidabad"," Moosrambagh","Old Malakpet",
"Akberbagh"," Azampura"," Chawani","Dabeerpura"," Rein Bazar"," Talabchanchalam"," Gowlipura"," Kurmaguda"," IS SADAN","Santosh Nagar",
"Lalithbagh","Riyasath Nagar"," Kanchanbagh"," Barkas"," Chandrayangutta","  Uppuguda"," Jangammet","  Pathergatti"," Moghalpura",
"Shalibanda","Ghansi Bazar","Puranapul","Falaknuma","Nawab Saheb Kunta","Doodbowli","Jahanuma","Ramnaspura"," Kishanbagh",
" Rajendra Nagar"," Attapur"," Suleman Nagar","Shastri puram","Mylardevpally"," Mehdipatnam"," Gudimalkapur"," Asif Nagar",
"Vijayanagar Colony","Ahmed Nagar","Red Hills","Mallepally"," Ziaguda","Karwan","Langer House"," Golconda","Tolichowki","Nanalnagar",
"Begum Bazar"," Gosha Mahal","Manghalhat","Dattathreyanagar","Jambagh(Nampally)","Gunfoundry","Adikmet","Musheerabad","Ramnagar",
"Bholakpur"," Gandhinagar","Kavadiguda"," Himayathnagar","Kachiguda Barkatpura","Nallakunta","Golnaka","Amberpet"," Bagh Amberpet"," Khairtabad",
"Somajiguda","Ameerpet","Sanathnagar"," Venkateshwara Colony"," Banjara Hills","Shaikh pet","Jubilee Hills"," Yousufguda","Vengalrao Nagar"," Erragadda",
" Rahamath Nagar","Borabanda"," Kondapur"," Gachibowli","Serilingampally"," Bharathinagar(P)","Madhapur"," Miyapur"," Hafeezpet","Chanda Nagar","Bharathinagar(P)",
" Ramachandrapuram","Patancheruvu","KPHB Colony","Balajinagar","Allapur","Moosapet","Fathe Nagar","Old Bowenpally","Balanagar","Kukatpally","Vivekananda Nagar Colony",
" Hydernagar"," Allwyn Colony","Rangareddy nagar"," Subhashnagar","Qutbullapur","Jeedimetla","Gajula Ramaram","Jagadgirigutta","Chintal","Suraram"," Macha Bollaram",
"Alwal","Venkatapuram"," Neredmet","Vinayak Nagar","Moula-Ali","East Anandbagh"," Malkajgiri"," Gautham Nagar","Addagutta","Tarnaka","Mettuguda"," Sitaphalmandi",
" Boudha Nagar","Bansilalpet"," Ramgopal Pet","Begumpet","Monda Market","Mallampet","Bachupally"],
	        "Bengalore":["Kempegowda","Chowdeshwari","Attur","Yelahanka Satellite Town","Jakkur","Thanisandra","Byatarayanapura","Kodigehalli","Vidyaranyapura","Doddabommasandra","Kuvempu Nagar",
"Shettyhalli","Mallasandra","Bagalagunte","T-Dasarahalli","Jalahalli","J.P.Park","Radhakrishna Temple","Sanjay Nagar","Ganga Nagar","Hebbal","Vishwanathnagenahalli",
"Nagavara","HBR Layout","Horamavu","Ramamurthy Nagar","Banaswadi","Kammanahalli","Kacharakanahalli","Kadugondanahalli","Kushal Nagar","Kavalbyrasandra","Manorayanapalya",
"Gangenahalli","Aramane Nagar","Mathikere","Yeshwanthpur","H.M.T","Chokkasandra","Dodda Bidarkallu","Peenya Industrial Area","Lakshmidevi Nagar","Nandini Layout",
"Marappana Palya","Malleshwaram","Jayachamarajendra Nagar","Devarajeevanahalli","Muneshwara Nagar","Lingarajapuram","Benniganahalli","Vijanapura","K.R.Puram","Basavanapura",
"Hoodi","Devasandra","A.Narayanapura","C.V.Raman Nagar","Hosathippasandra","Maruthiseva Nagar","Sagayapuram","S.K.Garden","Ramaswamy Palya","Jayamahal","Rajamahal","Kadumalleshwara",
"Subramanya Nagar","Nagapura","Mahalakshmipuram","Laggere","Rajagopala Nagar","Hegganahalli","Herohalli","Kottigepalya","Shakthiganapathi Nagar","Shankaramata","Gayathri Nagar",
"Dattathreya Temple","Pulikeshi Nagar","Sarvagna Nagar","Hoysala Nagar","Vignana Nagar","Garudacharpalya","Kadugudi","Hagadooru","Doddanekkundi","Marathalli","HAL Airport",
"Jeevanbhima Nagar","Jogupalya","Ulsoor","Bharathi Nagar","Shivaji Nagar","Vasanth Nagar","Gandhi Nagar","Subhash Nagar","Okalipuram","Dayananda Nagar","Prakash Nagar",
"Rajaji Nagar","Basaveshwara Nagar","Kamakshipalya","Vrushabhavathi","Kaveripura","Govindraja Nagara","Agrahara Dasarahalli","Dr.Rajkumar Ward","Shiva Nagar","Sri Rammandira",
"Chickpete","Sampangiram Nagar","Shanthala Nagar","Domlur","Konena Agrahara","Agaram","Vannarpet","Neelasandra","Shanthi Nagar","Sudam Nagar","Dharmarayaswamy Temple Ward",
"Cottonpet","Binnipet","Kempapura Agrahara","Vijay Nagar","Hosahalli","Marenahalli","Maruthi Mandira Ward","Moodalapalya","Nagarabhavi","Jnanabharathi Ward","Ullalu",
"Nayandanahalli","Attiguppe","Hampi Nagar","Bapuji Nagar","Padarayanapura","Jagareevanram Nagar","Rayapuram","Chalavadipalya","K.R.Market","Chamrajpet","Azad Nagar",
"Sunkenahalli","Visvesvarapuram","Siddapura","Hombegowda Nagar","Lakkasandra","Adugodi","Ejipura","Varthur","Bellandur","Koramangala","Sudduguntepalya","Jayangar","Basavanagudi",
"Hanumantha Nagar","Sri Nagar","Gali Anjaneya Swamy Temple Ward","Deepanjali Nagar","Kengeri","Rajarajeshwari Nagar","Hosakerehalli","Giri Nagar","Katriguppe","Vidyapeetha",
"Ganeshmandira Ward","Karisandra","Yadiyuru","Pattabhiram Nagar","Byrasandra","Jayanagar East","Gurappanapalya","Madiwala","Jakkasandra","HSR Layout","Bommanahalli",
"BTM Layout","J.P.Nagar","Sarakki","Shakambari Nagar","Banashankari Temple Ward","Kumaraswamy Layout","Padmanabha Nagar","Chikkalasandra","Uttarahalli","Yelachenahalli",
"Jaraganahalli","Puttenahalli","Bilekahalli","Hongasandra","Mangammanapalya","Singasandra","Begur","Arakere","Gottigere","Konanakunte","Anjanapur","Vasanthapura","Hemmigepura"],

"Vizag":["Asilmetta","Auto Nagar","Balaji Nagar","Balayya Sastri Layout","Beach Road","Bowdra Ring Road","Butchirajupalem","CBM Compound","Chengal Rao Peta","Chinna Waltair",
"China Mushidiwada","Collector Office Junction","Daba Garden Road","Daba Gardens","Daspalla Hills","Dayal Nagar","Diamond Park Road","Doctors Colony","Dondaparthy",
"Duvvada","Dwaraka Nagar","Dwarakanagar Road","East Point Colony","Fishing Harbour","Gajuwaka","Gnanapuram","Gopalapatnam","H B Colony","Hanumanthawaka Road","Industrial Estate",
"Isakathota","Jagadamba Junction","Jail Road","KGH Down Road","Kailasapuram","Kancharapalem","Kanithi Junction","Kirlampudi Layout","Krantinagar","Krishna Nagar","Kurmannapalem",
"Lalitha Nagar","Lawsons Bay Colony","MVP Double Road","MVP Main Road","Maddilapalem","Madhavadhara","Madhuranagar","Madhurawada","Maharani Peta","Malkapuram","Marripalem",
"Mudasarlova Road","Mindi","Murlinagar","MVP Colony","N A D","Naidu Thota","Narasimhanagar","Nathayyapalem","New Gajuwaka","Nowroji Road","One Town","Old Bus Stop","Old Gajuwaka",
"Old Post Office Road","P&T Colony Park","Panduranga Layout","Paravada","Pedda Waltair","Pedagantyada","Pendurthi","Pithapuram Colony","Purna Market","Port Area",
"Pothinamallayya Palem","Prahaladapuram","Railway New Colony","Rajaram Mohanrai Road","Rajendra Nagar","Ram Nagar","Rama Talkies Junction","Rednam Gardens","Resapuvanipalem",
"RK Beach","RTC Complex","Rushikonda","Sagar Nagar","Salagramapuram","Shankara Matam","Santhipuram","Saraswathi Junction","SBI Colony","Seethammadhara","Seethammadwara Road",
"Seetamma Peta","Santhi Puram","Sheela Nagar","Simchachalam Road","Simhachalam","Simhachalam Road","Siripuram","Sivajipalem Road","Sriharipuram","Stadium Road","Railway Station Road",
"Steel Plant Road","Super Bazar","Suryabagh","TPT Colony","Thatichetlapalem","Town Kotha Road","Town Main Road","Ukkunagaram","Vadlapudi Junction","Venkojipalem","Vepagunta",
"Vidhya nagar","Vishaka Diary","Vishalakshi Nagar","Vuda Colony","Waltair Main Road"],

"Vijayawada": ["Ajit Singh Nagar","Arul Nagar","Ashok Nagar","Auto Nagar","Ayodhya Nagar","Ayyappa Nagar","Bandar Road","Bapanayyanagar","Bavajipet","Benz Circle","Bhagat Singh Nagar",
"Bharathi Nagar","Bhavanipuram","Bhimannavaripeta","Bramanadha Reddy Nagar","Canal Road","Chalasani Nagar","Chittinagar","Chowdhary Pet","Christurajupuram","Currency Nagar",
"Devi Nagar","Durga Agraharam","Enikepadu","Fakirgudem","Fraserpeta","Gayatri Nagar","Gollapudi","Governorpet","Gunadala","Hanumanpet","Jojinagar","Kaleswara Rao Market",
"Kamayyathopu","Kanuru","Krishnalanka","Labbipeta","LEPL Icon","LIC Colony","Lurdhunagar","Mallikarjunapeta","Milk Colony","Moghalrajpuram","Mylavaram Vari Street",
"Nehru Nagar","New Rajarajeswaripeta","NH-9","Nidamanuru","Patamata","Payakapuram","PNT Colony","Poranki","Ramalingeswara Nagar","Ramarajunagar","Ramavarapupadu",
"Ranga Nagar","Ranigaritota","RR Nagar","RTC Colony","Sanath Nagar","Satyanarayanapuram Main Road","Satyaranayana Puram","Sidhartha Nagar","Sri Ramachandra Nagar",
"Sriram Nagar","Stata Bank Colony","Station Road","Surya Rao Peta","Tadigadapa Main Road","Tarapet","Tulasi Nagar","Vambay Colony","Vidhyadharpuram","Vinchipeta",
"Yanamalakuduru"]


	    
	}
	switch (city) { 
	case 'Hyderabad': 
		area=myArea.Hyderabad;
		
		break;
	case 'Bengalore': 
		area=myArea.Bengalore;
		break;
		case 'Vizag': 
		area=myArea.Vizag;
		break;
		case 'Vijayawada': 
		area=myArea.Vijayawada;
		break;
	
}
	$('#state').empty();
	$('#state').append('<option value=""> Select Area </option>');
	for(var i=0;i<area.length;i++){
	
		$('#state').append('<option value="' + area[i] + '"> ' + area[i] + '</option>'); 
				
           
                        
       
    }
	
}







	</script>
	



</body>

</html>