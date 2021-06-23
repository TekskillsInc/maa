<!doctype html>

<html class="no-js" lang="">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
	<link rel="stylesheet" href="resources/web/assets/bootstrap/css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="resources/web/assets/fonts/font-awesome.css" type="text/css">
	<link rel="stylesheet" href="resources/web/assets/css/selectize.css" type="text/css">
	<link rel="stylesheet" href="resources/web/assets/css/style.css">
	<link rel="stylesheet" href="resources/web/assets/css/user.css">
	<title>Hyderabad Real Estate, Buy Properties, Plots, Flats, Rent Apartments</title>
	<style>
		.sliderNew {
			background-color: #2d4b64;
		}

		.carousel-inner p {
			color: #fff;
		}

		.enquiry-form {
			position: fixed;
			bottom: 30%;
			z-index: 2000;
			right: 10px;

		}

		.enquiry-form img {
			height: 55px;
		}

		.enquiry-form p {
			font-weight: 600;
			color: red
		}

		.home-page {
			position: relative
		}

		.grid {
			width: 85%;
		}

		.grid .card-img-overlay {
			top: 175px !important;
		}

		.card img:hover {
			cursor: pointer;
			transform: scale(1.10) !important;
			transition: transform .6s;

		}

		.card {
			overflow: hidden
		}

		.serv-head {
			font-size: 2.8125rem;
			color: #4c4c4c;

		}

		.grid .card {
			border: 3px solid rgba(0, 0, 0, 0.125);
		}
	</style>
</head>

<body>
	<div class="page home-page">
		<header class="hero has-dark-background">
			<div class="hero-wrapper">
				<!--============ Secondary Navigation ===============================================================-->
				<div class="secondary-navigation">
					<div class="container">
						<ul class="left">
							<li>
								<span>
									<i class="fa fa-phone"></i> +91 80999 96222
								</span>
							</li>
						</ul>
						<!--end left-->
						<ul class="right">
							<li>
								<a href="login">
									<i class="fa fa-sign-in"></i>Sign In
								</a>
							</li>
							<li>
								<a href="register.html">
									<i class="fa fa-pencil-square-o"></i>Register
								</a>
							</li>
						</ul>
						<!--end right-->
					</div>
					<!--end container-->
				</div>
				<!--============ End Secondary Navigation ===========================================================-->
				<!--============ Main Navigation ====================================================================-->
				<div class="main-navigation">
					<div class="container">
						<nav class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="index.html">
								<img src="resources/web/img/logo/maa_logo1.png" style=" height: 65px;" alt="">
							</a>
							<button class="navbar-toggler" type="button" style=" background-color: white;"
							 data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbar">
								<!--Main navigation list-->
								<ul class="navbar-nav">
									<li class="nav-item active">
										<a class="nav-link" href="index.html">Home</a>

									</li>
									<li class="nav-item has-child">
										<a class="nav-link" href="#">Services</a>
										<ul class="child">
											<li class="nav-item">
												<a href="property-deals.html" class="nav-link">Property Deals</a>

											</li>
											<li class="nav-item">
												<a href="property-care.html" class="nav-link">Property Care</a>

											</li>
											<li class="nav-item">
												<a href="tenancy-management.html" class="nav-link">Tenancy Management</a>

											</li>
											<li class="nav-item">
												<a href="property-analaysis.html" class="nav-link">Quick Services</a>
											</li>

										</ul>

									</li>
									<li class="nav-item">
										<a class="nav-link" href="homevendors">Home Vendors</a>

									</li>
									<li class="nav-item">
										<a class="nav-link" href="classifides.html">Classifides</a>

									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">Contact</a>
									</li>


								</ul>
								<!--Main navigation list-->
							</div>
							<!--end navbar-collapse-->
						</nav>
						<!--end navbar-->
					</div>
					<!--end container-->
				</div>
				<!--============ End Main Navigation ================================================================-->
				<!--============ Page Title start here=========================================================================-->
				<div class="page-title">
					<div class="container">
						<h1 class="center">
							Maa Properties
							<!--<a href="#">Buy</a>, <a href="#">Sell</a> or <a href="#">Find</a> What You need-->
						</h1>
						<h4 class="center">Your property Guardian</h4>
					</div>
					<!--end container-->
				</div>
				<!--============ End Page Title ends here =====================================================================-->
				<div class="background">
					<div class="background-image original-size">
						<img src="resources/web/img/main/1.jpg" alt="">
					</div>
				</div>
				<!--end background-->
			</div>
			<!--end hero-wrapper-->
		</header>
		<div class="enquiry-form" data-toggle="modal" data-target="#exampleModal">
			<img src="resources/web/img/ads/enq.png" class="img-fluid">
           	<!--<p>Enquiry</p>-->
        </div>
        <a href="https://wa.me/918099244422" target="_blank" style="position: fixed;bottom: 40%;z-index: 2000; right: 0%;margin-right: 8px;height: 55px;width: 55px;"> <img src="resources/web/img/ads/wa.png" class="img-fluid" ></a>

		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Enquiry</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<label>I'm an</label>
									<figure>
										<label>
											<input type="radio" name="type" value="1" required>
											indian
										</label>
										<label>
											<input type="radio" name="type" value="2" required>
											NRI
										</label>
									</figure>
								</div>
								<div class="form-group">
									<label>Mode</label>
									<figure>
										<label>
											<input type="radio" name="type" id="chkBuy" value="1" required>
											Buy
										</label>
										<label>
											<input type="radio" name="type" id="chksell" value="2" required>
											Sell
										</label>
										<label>
											<input type="radio" name="type" id="chkRent" value="3" required>
											Rent
										</label>
										<label>
											<input type="radio" name="type" id="chkTent" value="4" required>
											Tenancy Management
										</label>
										<label>
											<input type="radio" name="type"  id="chkPlot" value="5" required>
											Plot Monitoring
										</label>
										<label>
											<input type="radio" name="type" id="chkOther" value="6" required>
											Others
										</label>										
									</figure>
								</div>

								<div class="form-group" id="Buy">
									<label>Property Type Buy</label>
									<select name="submit_category" id="searchable-select" data-placeholder="Select" data-enable-search="true">
												<option value="">Select</option>
												<option value="1">Apartments/Flats</option>
												<option value="2">Independent houses / Villas</option>
												<option value="3">Commercial space</option>
												<option value="4">Agricultural land / farm land</option>
												<option value="5">Industrial land</option>
											</select>									
									
								</div>
								<div class="form-group" id="sell">
									<label>Property Type sell</label>
									<select name="submit_category" id="searchable-select" data-placeholder="Select" data-enable-search="true">
												<option value="">Select</option>
												<option value="1">Apartments/Flats</option>
												<option value="2">Independent houses / Villas</option>
												<option value="3">Commercial space</option>
												<option value="4">Agricultural land / farm land</option>
												<option value="5">Industrial land</option>
											</select>									
									
								</div>
								<div class="form-group" id="rent">
									<label>Property Type rent</label>
									<select name="submit_category" id="searchable-select" data-placeholder="Select" data-enable-search="true">
												<option value="">Select</option>
												<option value="1">Apartments/Flats</option>
												<option value="2">Independent houses / Villas</option>
												<option value="3">Commercial space</option>												
												<option value="5">Service apartments</option>
											</select>									
									
								</div>
								<div class="form-group" id="mange">
									<label>Property Type Management</label>
									<select name="submit_category" id="searchable-select" data-placeholder="Select" data-enable-search="true">
												<option value="">Select</option>
												<option value="1">Apartments/Flats</option>
												<option value="2">Independent houses / Villas</option>
												<option value="3">Commercial space</option>												
												
											</select>									
									
								</div>
								<div class="form-group" id="moni">
									<label>Property Type Monitoring</label>
									<select name="submit_category" id="searchable-select" data-placeholder="Select" data-enable-search="true">
												<option value="">Select</option>
												<option value="1">Apartments/Flats</option>
												<option value="2">Independent houses / Villas</option>
												<option value="3">Commercial space</option>												
												
											</select>									
									
								</div>
								

								<div class="form-group">
									<label for="searchable-select" class="col-form-label">Name</label>
									<input name="title" type="text" class="form-control" id="title" placeholder="">


								</div>
								<div class="form-group">
									<label for="searchable-select" class="col-form-label">Email</label>
									<input name="title" type="text" class="form-control" id="title" placeholder="">


								</div>
								<div class="form-group">
									<label for="searchable-select" class="col-form-label">Phone</label>
									<input name="title" type="text" class="form-control" id="title" placeholder="">


								</div>
								<!--<div class="form-group">
									<label for="searchable-select" class="col-form-label">Budget</label>
									<div class="row">
										<div class="col">
											<input name="title" type="text" class="form-control" id="title" placeholder="">
										</div>
										<div class="col">
											<select name="submit_category" id="searchable-select" data-placeholder="Select" data-enable-search="true">
												<option value="">Select</option>
												<option value="1">Rupees</option>
												<option value="2">Dollars</option>
												<option value="3">Yen</option>
											</select>
										</div>
									</div>



								</div>-->
								<div class="form-group">
									<label for="searchable-select" class="col-form-label">City</label>
									<select name="submit_category" id="searchable-select" data-placeholder="Select" data-enable-search="true">
										<option value="">Select</option>
										<option value="1">Hyderabad</option>
										<option value="2">Vijayawada</option>
										<option value="3">Vizag</option>
									</select>


								</div>
								<div class="form-group">
									<label for="searchable-select" class="col-form-label">Req Description</label>
									<textarea name="title" type="text" class="form-control" id="title" placeholder=""></textarea>


								</div>


								<!--<div class="col-md-4">
									<div class="form-group">
                                        <label for="title" class="col-form-label required">Carpet Area</label>
                                        <input name="title" type="text" class="form-control" id="title" placeholder="Carpet Area">
                                    </div>
								</div>-->
</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info">Submit</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>
		<!--end -->
		<!--Content Start here-->
		<section class="content">
			<!--============ Our Services ===========================================================================-->
			<section class="block">
				<div class="row ">
					<!--<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						<div class="adsImg">
							<img src="img/ads/1.gif">
						</div>
						<div class="adsImg mt-4">
							<img src="img/ads/1.gif">
						</div>
						<div class="adsImg mt-4">
							<img src="img/ads/1.gif">
						</div>
						<div class="adsImg mt-4">
							<img src="img/ads/1.gif">
						</div>
						<div class="adsImg mt-4">
							<img src="img/ads/1.gif">
						</div>
					</div>-->
					<!--<div class="col"></div>-->
					<div class="col col-sm-12 col-xs-12">
						<div class="container my-5" id="services">
							<div class="block">
								<!--<div class="addview">
									<div class="sliderNew py-5">
										<div class="bd-example">
											<div id="carouselExampleCaptions text-center" class="carousel slide" data-ride="carousel">

												<div class="carousel-inner text-center">
													<div class="carousel-item active ">
														<p class="text-center">Stay informed about your Assets.</p>

													</div>
													<div class="carousel-item">
														<p class="text-center">Your Property Gaurdian</p>

													</div>
													<div class="carousel-item">
														<p class="text-center">Your Property Gaurdian</p>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>-->

								<div class="grid mx-auto">
									<h1 class="mb-5 serv-head text-center">What are you looking for?</h1>
									<p class="text-center">Worried about who might grab your precious piece of property? Protect it from hazards, occupations and land grabbing with Maa Properties’ property care solutions.</p>

									<div class="row no-gutters mt-5">
										<div class="col-8">
											<div class="card text-white">
												<img src="resources/web/test/1.jpeg" class="card-img" alt="...">
												<div class="card-img-overlay">
													<h2 class="card-title">Tenancy Management</h2>
													<p class="card-text">Locating Tenants/Lease Management/Rental Management</p>
												</div>
											</div>

										</div>
										<div class="col-4">
											<div class="card text-white">
												<img src="resources/web/test/4.jpeg" class="card-img" alt="...">
												<div class="card-img-overlay">
													<h2 class="card-title">Property Deals</h2>
													<p class="card-text">Buying  / Selling  / Registration </p>
												</div>
											</div>

										</div>
										<div class="col-4">
											<div class="card text-white">
												<img src="resources/web/test/6.jpeg" class="card-img" alt="...">
												<div class="card-img-overlay">
													<h2 class="card-title">Property Care</h2>
													<p class="card-text">Property Maintenance /Physical Inspections/Tax & Bill Payments</p>
												</div>
											</div>
										</div>
										<div class="col-8">
											<div class="card text-white">
												<img src="resources/web/test/2.jpeg" class="card-img" alt="...">
												<div class="card-img-overlay">
													<h2 class="card-title">Quick Services</h2>
													<p class="card-text">Rentel Agreement</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--end row-->
							</div>
							<!--end block-->
						</div>
					</div>
					<!--<div class="col"></div>-->
					<!--<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						<div class="adsImg">
							<img src="img/ads/2.gif">
						</div>
						<div class="adsImg mt-4">
							<img src="img/ads/2.gif">
						</div>
						<div class="adsImg mt-4">
							<img src="img/ads/2.gif">
						</div>
						<div class="adsImg mt-4">
							<img src="img/ads/2.gif">
						</div>
					</div>-->
				</div>
				<!--end container-->
				<div class="background" data-background-color="#fff"></div>
				<!--end background-->
			</section>
			<section class="block my-5">				
						<div class="container">							
							<div class="row">
								<div class="col"></div>
								<div class="col-10">
									<h2 class="mb-5">Properties to Buy in Hyderabad</h2>
									<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Buy</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Sell</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Rent</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-vendors" role="tab" aria-controls="pills-contact" aria-selected="false">Vendors</a>
										</li>
									</ul>
									<div class="tab-content" id="pills-tabContent">
										<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
											<div class="row no-gutters">
												<div class="col-md-3 col-sm-3">
													<div class="form-group">
														<select name="category" id="category" data-placeholder="Select By Location">
															<option value="">Select By Location</option>
															<option value="1">Hyderabad</option>
															<option value="2">Bengaluru</option>
															<option value="3">Vijayawada</option>
														</select>
													</div>
												</div>
												<div class="col-md-6 col-sm-3">
													<div class="form-group">
														<input name="title" type="text" class="form-control" id="title" placeholder="Pick Location Or Project">
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-3">
													<button type="button" class="btn btn-info">Search</button>

												</div>

											</div>
										</div>
										<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
											<div class="row no-gutters">
												<div class="col-md-3 col-sm-3">
													<div class="form-group">
														<select name="category" id="category" data-placeholder="Select By Location">
															<option value="">Select By Location</option>
															<option value="1">Hyderabad</option>
															<option value="2">Bengaluru</option>
															<option value="3">Vijayawada</option>
														</select>
													</div>
												</div>
												<div class="col-md-6 col-sm-3">
													<div class="form-group">
														<input name="title" type="text" class="form-control" id="title" placeholder="Pick Location Or Project">
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-3">
													<button type="button" class="btn btn-info">Search</button>

												</div>

											</div>
										</div>
										<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
											<div class="row no-gutters">
												<div class="col-md-3 col-sm-3">
													<div class="form-group">
														<select name="category" id="category" data-placeholder="Select By Location">
															<option value="">Select By Location</option>
															<option value="1">Hyderabad</option>
															<option value="2">Bengaluru</option>
															<option value="3">Vijayawada</option>
														</select>
													</div>
												</div>
												<div class="col-md-6 col-sm-3">
													<div class="form-group">
														<input name="title" type="text" class="form-control" id="title" placeholder="Pick Location Or Project">
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-3">
													<button type="button" class="btn btn-info">Search</button>

												</div>

											</div>
										</div>
										<div class="tab-pane fade" id="pills-vendors" role="tabpanel" aria-labelledby="pills-profile-tab">
											<div class="row no-gutters">
												<div class="col-md-3 col-sm-3">
													<div class="form-group">
														<select name="category" id="category" data-placeholder="Select By Location">
															<option value="">Select By Location</option>
															<option value="1">Hyderabad</option>
															<option value="2">Bengaluru</option>
															<option value="3">Vijayawada</option>
														</select>
													</div>
												</div>
												<div class="col-md-6 col-sm-3">
													<div class="form-group">
														<select name="category" id="category" data-placeholder="Select By Location">
															<option value="">Select By Vendor</option>
															<option value="1">Electrician</option>
															<option value="2">Plumber</option>
															<option value="3">Painter</option>
															<option value="4">Driver</option>
															<option value="5">Painter</option>
															<option value="6">Pest control</option>
															<option value="7">Carpenters</option>
															<option value="8">Water Services</option>
															<option value="8">Others</option>
														</select>
													</div>
													<!--end form-group-->
												</div>
												<div class="col-md-3">
													<button type="button" class="btn btn-info">Search</button>

												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="col"></div>

							</div>

						</div>


					
			</section>
			<section class="block my-5" style="background-color: #fff">
				<div class="container">
					<div class="row">
						<div class="col"></div>
						<div class="col-10">
							<h2 class="my-5">Home Vendors</h2>
					<ul class="categories-list clearfix">
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-furniture-b.png" alt="">
							</i>
							<h3><a href="#">Electrician</a></h3>
						</li>
						<!--end category item-->
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-pets-b.png" alt="">
							</i>
							<h3><a href="#">Plumber</a></h3>
						</li>
						<!--end category item-->
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-pets-b.png" alt="">
							</i>
							<h3><a href="#">Painter</a></h3>
						</li>
						<!--end category item-->
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-pets-b.png" alt="">
							</i>
							<h3><a href="#">Driver</a></h3>
						</li>
						<!--end category item-->
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-pets-b.png" alt="">
							</i>
							<h3><a href="#">Pest control</a></h3>
						</li>
						<!--end category item-->
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-pets-b.png" alt="">
							</i>
							<h3><a href="#">Carpenters</a></h3>
						</li>
						<!--end category item-->
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-pets-b.png" alt="">
							</i>
							<h3><a href="#">Water Services</a></h3>
						</li>
						<!--end category item-->
						<li>
							<i class="category-icon">
								<img src="resources/web/assets/icons/category-pets-b.png" alt="">
							</i>
							<h3><a href="#">Others</a></h3>
						</li>
						<!--end category item-->
					</ul>
						</div>
						<div class="col"></div>
					
					</div>
					
					<!--end categories-list-->
				</div>
				<!--end container-->
			</section>
		</section>
		<!--end content-->
		<footer class="footer">
			<div class="wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-5">
							<a href="#" class="brand">
								<img src="resources/web/img/logo/maa_logo1.png" alt="">
							</a>
							<p class="text-justify">Maa Properties have the in-depth knowledge about all aspects of selling, buying, renting and managing a range of real estate properties. Our experienced real estate professionals understand the market. We know what is available and what exactly matches your needs and budget, Maa properties provides property related transactions in Hyderabad like buy, sell, rent, lease, providing tenants and maintenance for NRI's under four services Property Deals, Property Analysis, Tenancy Management and Property Care.</p>
						</div>
						<!--end col-md-5-->
						<div class="col-md-3">
							<h2>Links</h2>
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<nav>
										<ul class="list-unstyled">
											<li>
												<a href="#">Home</a>
											</li>
											<li>
												<a href="#">Services</a>
											</li>
											<li>
												<a href="#">Classifides</a>
											</li>
											<li>
												<a href="#">Contact</a>
											</li>
											<li>
												<a href="#">Submit Ad</a>
											</li>
										</ul>
									</nav>
								</div>
								<div class="col-md-6 col-sm-6">
									<nav>
										<ul class="list-unstyled">
											<li>
												<a href="#">Sign In</a>
											</li>
											<li>
												<a href="#">Register</a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
						<!--end col-md-3-->
						<div class="col-md-4">
							<h2>Contact</h2>
							<address>
								<figure>
									Survey # 1050,Plot # S - 2,505 & 506, 5th Floor,Manjeera Trinity Corporate<br>JNTU Hi-tech City Road, KPHB 3rd Phase,<br> Kukatpally, Hyderabad - 500072
									New York, NY 10011
								</figure>
								<br>
								<strong>Email:</strong> <a href="#">info@maaproperties.com</a>
								<br>
								<br>
								<br>
							</address>
						</div>
						<!--end col-md-4-->
					</div>
					<!--end row-->
				</div>
				<div class="background">
					<div class="background-image original-size">
						<img src="resources/web/assets/img/footer-background-icons.jpg" alt="">
					</div>
					<!--end background-image-->
				</div>
				<!--end background-->
			</div>
		</footer>
	</div>
	
	
	
	<!--end page-->
	
	<script src="resources/web/assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="resources/web/assets/js/popper.min.js"></script>
	<script type="text/javascript" src="resources/web/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
	<!--<script type="text/javascript" src="http://maps.google.com/maps/api/js"></script>-->
	<script src="resources/web/assets/js/selectize.min.js"></script>
	<script src="resources/web/assets/js/masonry.pkgd.min.js"></script>
	<script src="resources/web/assets/js/icheck.min.js"></script>
	<script src="resources/web/assets/js/jquery.validate.min.js"></script>
	<script src="resources/web/assets/js/custom.js"></script>
	</body>

</html>