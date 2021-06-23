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
	  <!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    <link href="resources/css/dist/imageuploadify.min.css" rel="stylesheet">
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
		   
	</style>
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i>
		<img src="img/logo/rounded_logo.png" alt="">
	</div>
	<!-- Left Panel -->
	<!-- Right Panel -->
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
									<strong class="card-title"><a type="button" href="classifides" class="btn btn-info btn-sm" ><i class="fa fa-arrow-left"></i></a>&nbsp;&nbsp;Classifides - Add</strong>
								</div>
								<div class="col">
									<div class="addButton" style="float: right">										
										<a type="button" href="classifides" class="btn btn-info btn-sm" ><i class="fa fa-times"></i></a>
										
									</div>
								</div>
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

											<div id="step-1">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="card-header">
																<strong class="card-title">Property Details</strong>
															</div>
															<div class="card-body card-block">
																<input type="radio" name="age" value="30" id="inlineRadioFtbtn" checked="checked" class="checkbox-round"> Flat For Rent &nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="age" value="60" id="inlineRadioSnbtn" class="checkbox-round"> Flat For Sale &nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" name="age" value="100" id="inlineRadioTdbtn" class="checkbox-round"> House Hunting&nbsp;&nbsp;

																<div class="row mt-4" id="inlineFtContent">
																	<div class="col-lg-6 col-md-6 col-sm-12">

																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type <span style="color: red">*</span></label>
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
																					<label for="company" class=" form-control-label">Area(s.ft)<span style="color: red">*</span></label>
																					<input type="text" id="company" placeholder="Area(s.ft)" class="form-control">
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Facing<span style="color: red">*</span></label>
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
																			<label for="company" class=" form-control-label">Property Address<span style="color: red">*</span></label>
																			<textarea rows="2" cols="50" class="form-control"></textarea>
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
																<div class="row mt-4" id="inlineSdContent">
																	<div class="col-md-6 col-sm-12">
																		<div class="form-group">
																			<label for="company" class=" form-control-label">Property Type<span style="color: red">*</span></label>
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
																					<label for="company" class=" form-control-label">Area(s.ft)<span style="color: red">*</span></label>
																					<input type="text" id="company" placeholder="Area(s.ft)" class="form-control">
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label for="company" class=" form-control-label">Facing<span style="color: red">*</span></label>
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
																			<label for="company" class="form-control-label">Property Address</label>
																			<textarea rows="2" cols="50" class="form-control"></textarea>
																		</div>


																	</div>
																	<div class="col-md-6 col-sm-12">
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
																<div class="row mt-4" id="inlineTdContent">
																	<div class="col-lg-6 col-md-6 col-sm-12">
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Name<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
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
																			<label for="company" class=" form-control-label">My interests (No Of beds, Locality, Budget...) </label>
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
																			<div class="container" style="width:500px;">
																				<form>
																					<input type="file"
																						accept=".xlsx,.xls,image/*,.doc,audio/*,.docx,video/*,.ppt,.pptx,.txt,.pdf"
																						multiple>
																				</form>
																			</div>
																			<!--    <div class="file-uploaded-images">
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
                            </div> -->
                           <!--  <div class="file-upload-previews"></div>
                            <div class="file-upload">
                                <input type="file" name="files[]" class="file-upload-input with-preview" multiple title="Click to add files" maxlength="10" accept="gif|jpg|png">
                                <span><i class="fa fa-plus-circle"></i>Click or drag images here</span>
                            </div> -->
																		
																		
																		
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
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">
																				
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Email<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="input-group">
																				<div class="input-group-prepend">
																					<div class="input-group-text">Phone<span style="color: red">*</span></div>
																				</div>
																				<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="">

																			</div>
																		</div>
																		<div class="form-group" id="border-box">
																			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
																			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
																			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
																			<input type="checkbox" name="age" value="100" class="checkbox-round "> Do u want any assistence
																			
																			
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


			</div>
			<!-- .animated -->
		</div>
		<!-- /.content -->
		<div class="clearfix"></div>
		<!-- Footer -->
	<!-- 	<footer class="site-footer">
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
	<script src="resources/js/state.js"></script>
	<script src="resources/js/countries.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	 <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	 <script src="resources/js/wizard/jquery.smartWizard.js"></script>
     <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <script type="text/javascript" src="resources/js/dist/imageuploadify.min.js"></script>
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