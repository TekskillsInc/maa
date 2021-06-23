<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<html lang="en">

<head>
 <title>${viewObject.csfinfo.csfTitle}</title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="google-site-verification" content="d3Jz7uEqJGIqKvmh095LqVa8K6oSJfxuhYu2SljnJek" />
	<link href="resources/images/favicon.ico" rel="shortcut icon">
	
	
	<meta property="og:url" content="http://maaproperties.com/classifiedinfo,${viewObject.csfinfo.classified}" >
	<!--<meta property="og:url" content="http://maaproperties.com/${viewObject.csfinfo.csfTitle},${viewObject.csfinfo.classified}" >-->
	
	<meta property="og:title" content="${viewObject.csfinfo.csfTitle}" >
	<meta property="og:description" content="${viewObject.csfinfo.csfDesription}" >
	<meta property="og:image" content="http://maaproperties.com/resources/Classified-Images/${img}" >
	<meta property="keywords" content="${viewObject.csfinfo.tags}">
    <meta property="fb:app_id" content="620522098851684"/>
	<meta property="og:image:width" content="1200" >
	<meta property="og:image:height" content="630" >
	<meta name="keywords" content="${viewObject.csfinfo.tags}">
	
	
	<!--twitter:title -->
<meta name="twitter:title" content="${viewObject.csfinfo.csfTitle}">
 
<!--twitter:url -->
 <meta name="twitter:url" content="http://maaproperties.com/classifiedinfo,${viewObject.csfinfo.classified}"> 
<!--<meta name="twitter:url" content="http://maaproperties.com/${viewObject.csfinfo.csfTitle},${viewObject.csfinfo.classified}">--%>
 
<!--twitter:site -->
<!-- <meta name="twitter:site" content="@ToTheNew"> -->
 
<!--twitter:description -->
<meta name="twitter:description" content="${viewObject.csfinfo.csfDesription}">
 
<!--twitter:creator -->
<!-- <meta name="twitter:creator" content="@Rishabh"> -->
<meta name="twitter:creator" content="@maaproperties">
 
<!--twitter:image -->
<meta name="twitter:image" content="http://maaproperties.com/resources/Classified-Images/${img}">
 
<!--twitter:card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@maaproperties">
<link rel="canonical" href="http://maaproperties.com/classifiedinfo,${viewObject.csfinfo.classified}">

<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="icon" href="resources/homeimages/logo/maa_logo.png" type="image/gif" sizes="16x16">
	<!-- <link rel="icon" href="resources/homeimages/logo/maa_logo.png" type="image/gif" sizes="16x16"> -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Mansalva&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/fonts/font-awesome.css" type="text/css">
	<link rel="stylesheet" href="resources/homecss/classfied.css">
	<link rel="stylesheet" href="resources/homecss/style.css">
	<script src="https://kit.fontawesome.com/ea3bea9b30.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="resources/homecss/style.css">
	<link rel="stylesheet" href="resources/homecss/classfied.css">
	<style>
	p{
		margin-bottom:0px
	}
		.sharebtn span i {
			font-size: 22px;
			color: red;
		}
		
		#custmBorder{
			border: 1px solid #dee2e6;
			/* border-bottom: 1px solid #dee2e6; */
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.09);
			border-radius:5px;
		}
		.custmBorder2{
			border: 1px solid #dee2e6;
			/* border-bottom: 1px solid #dee2e6; */
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.09);
			border-radius:5px;
		}

		#loveIicon {
			color: red;
		}

		.animate-bottom {
			position: relative;
			animation: animatebottom 0.4s;
		}

		@keyframes animatebottom {
			from {
				bottom: -300px;
				opacity: 0;
			}

			to {
				bottom: 0;
				opacity: 1;
			}
		}

		.modal {
			top: 5%
		}
		
		/* .carousel-inner{
		height:450px;
		} */
		
		.carousel-item img{
			height:450px;
		}
		
		/* #imgRow{
			margin-left:0px!important;
		} */
	</style>

</head>

<body>
	<!--Header section start here-->
	<section id="nav-section">
		<nav class="navbar navbar-expand-lg navbar-light bg-light" id="custm-navbar">
			<div class="container">
				<div class="row">
					<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2" id="logoPost">
						<a class="navbar-brand" id="custmNavbrnad" href="home"><img src="resources/homeimages/logo/logo.png" class="img-fluid"></a>
					</div>
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12" id="bannerpost">
						<div class="banner text-center">
							<img src="resources/homeimages/gif/home2.gif" class="img-fluid">
						</div>
					</div>
					<div class="col col-lg-3 col-md-3 col-sm-4" id="addPost">
						<div class="postBtn">
							<div class="buttons text-center" id="mobileLI">
								<a href="login" class="mr-2"><i class="fa fa-user" aria-hidden="true"></i> Sign in</a>
								<a href="UserRegistration"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign up</a>
							</div>
							<div class="post-add text-center mt-2">
								<a href="#">Post your Add</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</nav>
		<nav class="navbar navbar-expand-lg navbar-light border" id="navbar-custm" style="background-color: #ecbe27">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="about">About</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Services
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="propertyDeals">Property Deals</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="tenancyManagement">Tenancy Management</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="propertyCare">Property care</a>
							</div>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="vendors">Vendors</a>
						</li>
						<li class="nav-item active">
							<a class="nav-link" href="classifides">Classifieds</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="blog">Blog</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="favourites">Favourites</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="contactus">Contact us</a>
						</li>
						<li class="nav-item" id="custmLi">
							<a class="nav-link" href="login"><i class="fa fa-user" aria-hidden="true"></i> Sign in</a>
						</li>
						<li class="nav-item" id="custmLi">
							<a class="nav-link" href="UserRegistration"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign up</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</section>
	
	<section id="mobile-div">
		<div class="mobile-inner">
			<div class="row">
				<div class="col">
					<div class="enq-section text-center">
						<a href="#" data-toggle="modal" data-target="#enquryModal"><span><i class="fas fa-envelope-open-text"></i></span>
							<p>Enquiry</p>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="enq-section text-center">
					<!--	<a href="https://wa.me/${viewObject.csfinfo.phone}"/?text=Hello target="_blank"><span><i class="fab fa-whatsapp"></i></span>
							<p>Whats app</p>
							
						</a>--RK-->
						<a href="https://api.whatsapp.com/send?phone=${viewObject.csfinfo.phone}&amp;text=Is this available?${viewObject.csfinfo.csfTitle}" target="_blank"><span><i class="fab fa-whatsapp"></i></span>
							<p>Whatsapp</p>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Enquiry Modal start here -->
	<div class="modal fade animate" id="enquryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content animate-bottom">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Enquiry</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<div class="tenancy-form2">
								
								<div class="enqiryImg text-center">
									<img src="resources/homeimages/icons/png/mail2.png" class="img-fluid">
								</div>
								<div class="row my-2">
									<div class="col">
										<!--<h4 class="custm-head">Enquiry &nbsp;&nbsp;&nbsp;</h4>-->
									</div>
									<div class="col"></div>
								</div>
								<p class="pt-3">Please use the Enquiry form if you have any questions or requests, concerning our services.
								</p>
								<div class="form-group mt-3">
									<input name="title" type="text" class="form-control" id="title" placeholder="Name">
								</div>
								<div class="form-group">
									<input name="title" type="text" class="form-control" id="title" placeholder="Email">
								</div>
								<div class="form-group">
									<input name="title" type="text" class="form-control" id="title" placeholder="Phone">
								</div>
								<div class="form-group">
									<textarea rows="4" class="form-control" cols="50">Ask  a  question or request a viewing€s
</textarea>
								</div>
								<div class="text-center centerbtn">
									<button type="button" class="btn mt-2" id="custm-innerbtn">Submit</button>
								</div>
								<p class="pt-3">We will respond to your message within 24 hours.</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<!--Header section ends here-->
	<section id="property-single">
		<div class="container">
			<div class="row" id="imgRow">
				<div class="col-md-8 col-sm-12 mb-5" >
					<!--Gallery Carousel-->

					<!--end section-title-->
					<div class="row">
						<div class="col">
					<div id="carousel" class="carousel slide" data-ride="carousel">
    
    <ol class="carousel-indicators"></ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner"></div>
    <!-- Controls -->
        <a class="carousel-control-prev" href="#carousel" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        </a>
    <a class="carousel-control-next" href="#carousel" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>
						</div>
					</div>

					
                
               
            
					<section class="my-3">
					<div class="col-12">
									<div class="sharebtn pt-2">
										<span class="mr-3" id="loveIicon"><i class="far fa-heart"></i></span>
										<span data-toggle="modal" data-target="#exampleModal"><i class="fas fa-share-alt"></i></span>
									</div>
								</div>
						<!---<div class="mt-5">--Veera-->
						     <div class="">
							<div class="row">
								<div class="col-12">
									<div class="title-prop">
										<h3>${viewObject.csfinfo.csfTitle}</h3>
									</div>
								</div>
								<!---<div class="col-4">
									<div class="sharebtn pt-2">
										<span class="mr-3" id="loveIicon"><i class="far fa-heart"></i></span>
										<span data-toggle="modal" data-target="#exampleModal"><i class="fas fa-share-alt"></i></span>
									</div>
								</div>--->
							</div>

						</div>
						<div class="row" >
							<div class="col" id="addressid">
								<h3>${viewObject.csfinfo.prtyAddress}</h3>
							</div>
						</div>
						<div class="rent-head">
							<div class="row" >
								<div class="col">
									<h3> ${viewObject.csfinfo.csfType}</h3>
								</div>
								
										<div class="col-md-6 col-sm-12">
											<h4 class="pricecl text-center">Rs. ${viewObject.csfinfo.amount}/-</h4>
										</div>
										
							</div>
						</div>

					</section>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<div class="copied-div">
										<div class="row no-gutters mt-3">
											<div class="col-3">
												<div class="image_property mr-2">
													
													<img src="resources/Classified-Images/${img}" class="img-fluid">
												</div>
											</div>
											<div class="col-9">
												<div class="title_property">
													${viewObject.csfinfo.csfTitle}
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

												<input id="link" type="text" value="http://maaproperties.com/classifiedinfo,${viewObject.csfinfo.classified}" class="form-control">

												<button type="button" class="btn btn-light" data-clipboard-action="copy" data-clipboard-target="#link">Copy</button>
	
											</div>
											<div class="share-link mt-3">
												<p>share:</p>
												
												
												
												 <div class="addthis_inline_share_toolbox"></div> 
											</div>
											<%-- <span class="fb"><div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http://pms.maa.properties/classifiedinfo/${viewObject.csfinfo.classified};src=sdkpreparse" class="fb-xfbml-parse-ignore"><i class="fab fa-facebook-square"></i></a></div></span> 
			  	<span class="twt"><a href="#"><i class="fab fa-twitter-square"></i></a></span>
			  	
			  	<span class="whatapp"><a href="https://wa.me/918099244422" target="_blank"><i class="fab fa-whatsapp-square"></i></a></span> 
			 --%>
										</div>
									</div>



								</div>

							</div>
						</div>
					</div>
					
					<section>
					
						<div class="row py-3 custmBorder2" id="imageIcon">
							<div class="col col-lg-3 col-md-4 col-sm-4">
								<p> <img src="resources/homeimages/icons/single/3.png"> <b> ${viewObject.csfinfo.noofBeds}</b>Beds </p>
							</div>
							<div class="col col-lg-3  col-md-4 col-sm-4">
								<p> <img src="resources/homeimages/icons/single/2.png"> <b> ${viewObject.csfinfo.noofbaths}</b> Bath </p>
							</div>
							<div class="col col-lg-3  col-md-4 col-sm-4">
								<p> <img src="resources/homeimages/icons/single/1.png"> <b> ${viewObject.csfinfo.nofofparking}</b> </p>
							</div><br><br>
							<div class="col col-lg-3  col-md-4 col-sm-4">
								<p> <img src="resources/homeimages/icons/single/compass.png"> ${viewObject.csfinfo.facing} </p>
							</div>
							<div class="col col-lg-3  col-md-4 col-sm-4">
								<p> <img src="resources/homeimages/icons/single/square.png"> ${viewObject.csfinfo.areaSqft} Sq.ft </p>
							</div>
						</div>
						<div class="row py-3" id="availble">
							<div class="col-md-6 col-sm-12 ">
								<p><b>Available:</b> ${viewObject.csfinfo.prtyavialbleon}</p>
							</div>
							
										<div class="col-md-6 col-sm-12 ">
										<c:choose>
							<c:when test="${viewObject.csfinfo.csfType eq 'Rent'}">
											<p class="pricecl text-center">Advance: Rs. ${viewObject.csfinfo.advance}/-</p>
											</c:when>
											<c:when test="${viewObject.csfinfo.csfType eq 'Sale'}">
										<p class="pricecl text-center">Loan Facility:${viewObject.csfinfo.loanfacility}</p>
										</c:when>
											<c:otherwise>
											<p class="pricecl text-center"></p>
											</c:otherwise>
							</c:choose>
										</div>
								
						</div>
						<div class="row py-3" id="custmBorder">
							
						<c:forEach var="csfeatures" items="${viewObject.features}">
									<div class="col-md-4">
										<p><img src="resources/img/iocns/4.png"> ${csfeatures}</p>
									</div>
									<br><br>
									</c:forEach>
						</div>
						<div class="row py-3" id="custmBorder">
							<div class="col">
								<p><b>Description</b>:${viewObject.csfinfo.csfDesription} </p>
							</div>
						</div>
						<div class="row py-3" id="custmBorder">
							<div class="col">
								<p><b>GoogleMap Link:</b>&nbsp;&nbsp;<a style="white-space: pre-wrap;word-break: break-word;"href="${viewObject.csfinfo.gmapLink}" target="_blank" style="color: #2D66B0"><img src="resources/images/mapico.png" class="img-fluid"></a></p>
							</div>
						</div>
						<div class="row py-3" id="custmBorder">
							<div class="col">
								<p><b>Listed: </b>${viewObject.csfinfo.postedon}</p>
								<p><b>Last updated: </b>${viewObject.csfinfo.updatedon}</p>
								
								
								
								
							</div>
						</div>
						<div class="row py-3" id="custmBorder">
							<div class="col">
								<p><b>Tags: </b>${viewObject.csfinfo.tags}</p>
							</div>
						</div>
					</section>

				</div>
				<div class="col-md-4 col-sm-12">
					<div class="tenancy-form mt-3">
						<div class="enqImg text-center">
							<img src="resources/homeimages/icons/png/mail2.png" class="img-fluid">
						</div>

						<h4 class="custm-head text-center my-2">Enquiry</h4>

						<p>Please use the Enquiry form if you have any questions or requests, concerning our services.
						</p>
							<form>
									
								<input name="classifiedid" type="hidden" class="form-control" id="classifiedid" value="${viewObject.csfinfo.classified}" >
								<div class="form-group">
									<label for="searchable-select" class="col-form-label">Name</label>
									<input name="name" type="text" class="form-control" id="Uname" placeholder="Name" required>
								</div>
								<div class="form-group">
									<label for="searchable-select" class="col-form-label">Email</label>
									<input name="email" type="text" class="form-control" id="Uemail" placeholder="Email" required>
								</div>
								<div class="form-group">
									<label for="searchable-select" class="col-form-label">Phone</label>
									<input name="phone" type="text" class="form-control" id="Uphone" placeholder="Phone" required>
								</div>
									
									<div class="form-group">
									<label for="searchable-select" class="col-form-label">Req Description</label>
									<textarea name="reqDesc" class="form-control" id="rDesc" placeholder="" required></textarea>
								    </div>
								</form>
						<div class="text-center centerbtn">
							<button type="button" class="btn mt-2" id="custm-innerbtn" onclick="saveEnquiryForm()">Submit</button>
						</div>
						<p class="pt-3">We will respond to your message within 24 hours.</p>
					</div>

					<div class="tenancy-form mt-5">

						<div class="enq-whatapp text-center my-3">
							<!--<h4 class="text-center">OR</h4>-->
							<div class="btn-app">
							<c:set var = "string1" value = "${viewObject.csfinfo.phone}"/>
							<c:set var = "string3" value = "${fn:substring(string1, 1, fn:length(string1))}"/>
								
      <c:choose>
      
    		<c:when test="${fn:startsWith(string1, '0')==true}">
			<a href="https://wa.me/91${string3}?text=Is this available?${viewObject.csfinfo.csfTitle}" target="_blank" id="custm-whatappbtn" class="btn"><i class="fab fa-whatsapp"></i> What's app</a>
				</c:when>
				<c:when test="${fn:startsWith(string1, '91')==true}">
						<a href="https://wa.me/${string1}?text=Is this available?${viewObject.csfinfo.csfTitle}" target="_blank" id="custm-whatappbtn" class="btn"><i class="fab fa-whatsapp"></i> What's app</a>
				</c:when>
				<c:otherwise>
				<a href="https://wa.me/91${string1}?text=Is this available?${viewObject.csfinfo.csfTitle}" target="_blank" id="custm-whatappbtn" class="btn"><i class="fab fa-whatsapp"></i> What's app</a>
				</c:otherwise>
				</c:choose>	</div>
						
							<h6 class="text-center my-3">Enquiry Through Whatsapp</h6>


						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<section id="contact-us">
		<div class="contact-us-box">
			<div class="container-fluid">
				<div class="row pt-5">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="about-box">
							<div class="about-head">
								<h6>Privacy & Disclaimer</h6>
							</div>
							<div class="about-desc text-justify">
								<p>Maa Properties have the in-depth knowledge about all aspects of selling, buying, renting and managing a range of real estate properties. Our experienced real estate professionals understand the market. We know what is available and what exactly matches your needs and budget, Maa properties provides property related transactions in Hyderabad like buy, sell, rent, lease, providing tenants and maintenance for NRI's under four services Property Deals, Property Analysis, Tenancy Management and Property Care.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
						<div class="quick-links-box">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="custmPadding">
									<div class="quick-head">
										<h6>Real Estate in Hyderabad</h6>
										<li><a href="#">Property in JNTU</a></li>
										<li><a href="#">Property in HI-TECH City</a></li>
										<li><a href="#">Property in Kondapur</a></li>
										<li><a href="#">Property in Madhapur</a></li>
										<li><a href="#">Property in S.R Nagar</a></li>
										<li><a href="#">Property in Manikonda</a></li>
									</div>
									<a href="privacy"><h6 class="mt-3">Privacy & Disclaimer </h6></a>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="custmPadding">
									<div class="essetial-box">
										<h6>Maa properties Essentials</h6>
										<li>
											<a href="#">Advertise with Us</a>
										</li>
										<li><a href="#">Advertisers Support</a></li>
									</div>
									<div class="services-box mt-3">
										<h6>Property Services</h6>
										<li><a href="propertyDeals">Property Deals</a></li>
										<li><a href="propertyCare">Property Care</a></li>
										<li><a href="tenancyManagement">Tenancy Management</a></li>
										<!-- <li><a href="#">Property Analysis</a></li> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<div class="contact-us-box">
							<div class="about-head">
								<h6>Contact Us</h6>
							</div>
							<div class="address-desc-box">
								<div class="addres-desc">
									<i class="fa fa-map-marker-alt"></i> Survey # 1050,Plot # S - 2,505 & 506, 5th Floor,Manjeera Trinity Corporate,<br> JNTU Hi-tech City Road, KPHB 3rd Phase,<br> Kukatpally, Hyderabad - 500072<br>
									<i class="fa fa-phone"> </i> +91 - 40 - 67285613<br>
									<i class="fa fa-envelope"></i> <a href="mailto:info@maaproperties.com">info@maaproperties.com</a>
									<br>
									<i class="fa fa-globe"></i> www.maaproperties.com
									<br>
								</div>
							</div>
							<div class="social-media my-3">
								<span class="facebook-icon mr-3">
									<a href="https://www.facebook.com/maaproperties/"  target="_blank">
										<i class="fab fa-facebook-square"></i>
									</a>
								</span>
								<span class="twitter-icon mr-3">
									<a href="https://twitter.com/maaproperties"  target="_blank">
										<i class="fab fa-twitter-square"></i>
									</a>
								</span>
								<span class="youtube-icon mr-3">
									<a href="https://www.youtube.com/channel/UCAMCuKB1COcICj0tP-l6fmg"  target="_blank"><i class="fab fa-youtube"></i></a>
								</span>
								<span class="pinterest mr-3">
									<a href="https://www.pinterest.com/maaproperties12/"  target="_blank"><i class="fab fa-pinterest"></i></a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copy-right text-center mt-3">
				<span>Copyright Â© 2019 Maa Properties, All Rights Reserved.</span>
			</div>
		</div>
	</section>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="resources/homejs/clipboard/clipboard.min.js"></script>
	
	<script src="resources/homejs/custom.js"></script>
	<script src="resources/homejs/main.js"></script>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v5.0"></script>
	
	
	
	
	<script>
		$("#loveIicon").click(function() {
			$(this).find('i').toggleClass('fa fa-heart fas fa-heart');
		});
		$("#loveIicon2").click(function() {
			$(this).find('i').toggleClass('fa fa-heart-o fas fa-heart');
		});
		/*$("#loveIicon").hover(function () {    
    $(this).find('i').toggleClass('far fa-heart fas fa-heart');
});*/
	</script>

	<script>
		
		$(document).ready(function(){
			var data = JSON.parse('${images}');
			for(let j = 0; j < data.length; j++) {
			  $('<div class="carousel-item"><img src="resources/Classified-Images/'+data[j]+'" width="100%">   </div>').appendTo('.carousel-inner');
			  $('<li data-target="#carousel" data-slide-to="'+j+'"></li>').appendTo('.carousel-indicators')
			}
			  $('.carousel-item').first().addClass('active');
			  $('.carousel-indicators > li').first().addClass('active');
			  $('#carousel').carousel();
			});
	</script>
	<script>
		var clipboard = new ClipboardJS('.btn');

		clipboard.on('success', function(e) {
			console.log(e);
		});

		clipboard.on('error', function(e) {
			console.log(e);
		});
	</script>
	<script type="text/javascript">
	function saveEnquiryForm() {
		var classifiedid=$('#classifiedid').val();
		
			var arra1 = [];
			/* var Utype=$("input[name='ntype']:checked").val()
			var Etype = $('#mtype').val(); */
			var Uname = $('#Uname').val();
			var Uemail = $('#Uemail').val();
			var Uphone = $('#Uphone').val();
			var rDesc = $('#rDesc').val();
		/* 	var Ptype = $('#pType').val(); */
		  if(Uname!="" && Uemail!="" && Uphone!="" && rDesc!="") {
				var enquiry = {
					name : Uname,
					email : Uemail,
					phone : Uphone,
					description:rDesc
				}
				$.ajax({
							type : "post",
							url : "classifiedenquiry?classifiedid="+classifiedid+"",
							cache : false,
							async : false,
							contentType : 'application/json',
							data : JSON.stringify(enquiry),
							success : function(response) {
								alert("We will respond to your message within 24 hours.");
								window.location.reload();
							},
							error : function() {
							}
						});
			}
			else {
					alert("All Details are mandatory");
				}
		}

	  function loadFB(csfTitle,classifiedid){

		var url="http://maaproperties.com/classifiedinfo,"+classifiedid+"";

		
		var image="resources/homeimages/classified-inner/4.jpg";
		jQuery("meta[property='og\\:url']").attr("content", url);
		jQuery("meta[property='og\\:title']").attr("content", csfTitle);
		jQuery("meta[property='og\\:image']").attr("content", image);

		alert("url---"+url);
		}  
		
		function viewClassifiedInfoByID(title,id){
	title = title.replace(/\s+/g, '-').toLowerCase();
	title=title+","+id;
	window.location.href=""+title+"";
}

function viewClassifiedDeatils(classified,prtyid){
	window.location.href="classifiedinfo?classified="+classified+"&prtyid="+prtyid+"";
}

		
		
</script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5e02176642a64109"></script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5e02176642a64109"></script>
<script src="resources/js/predefined/saveEnquiry.js"></script> 

</body>
<!--<i class="fas fa-grin-hearts"></i>-->

</html>