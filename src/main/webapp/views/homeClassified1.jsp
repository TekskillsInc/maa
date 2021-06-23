<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<link href="resources/images/favicon.ico" rel="shortcut icon">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta property="og:url"
	content="http://maaproperties.com/classifides" />
<<meta property="og:title" content="hyderabad Real Estate, Real Estate classifieds, Flats, Plots, Buy, Sell, Rent ">
<meta property="og:description" content="Maaproperties provides the users with the information in buy, sell options in residential, commercial properties and real estate services in Hyderabad.">
<meta property="og:image" content="http://maaproperties.com/resources/homeimages/service/home-service.png">
<meta name="keywords" content="Hyderabad Real Estate, Flats, Plots, Buy, Sell, Rent, Real Estate News, homes for sale, buy a property, rental property, Vijayawada house, Vijayawada flats.">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Hyderabad Real Estate, Buy Properties, Plots, Flats, Rent
	Apartments</title>
<link rel="icon" href="resources/homeimages/logo/maa_logo.png"
	type="image/gif" sizes="16x16">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat|Roboto&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Mansalva&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/homecss/fonts/font-awesome.css"
	type="text/css">
<link rel="stylesheet" href="resources/homecss/owl/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/homecss/owl/owl.theme.default.min.css">
<script src="https://kit.fontawesome.com/ea3bea9b30.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/homecss/classfied.css">
<link rel="stylesheet" href="resources/homecss/style.css">
<script src="https://kit.fontawesome.com/ea3bea9b30.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/homecss/style.css">
<link rel="stylesheet" href="resources/homecss/classfied.css">
<style>
.nav-pills .nav-link.active {
	background-color: #DA5427 !important;
}

.search-div {
	width: 100%;
	position: relative;
}

.search-div {
	padding: 50px;
	/*			box-shadow: 0 0 20px -2px rgba(0, 0, 0, .35);*/
}

#custm-form input {
	width: 100%;
	padding: 30px;
	/*box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.125);
			box-shadow: 0 0 20px -2px rgba(0, 0, 0, .35);*/
	font-size: 14px;
	border: none;
	border-radius: 0px;
}

.custm-btn {
	position: absolute;
	right: 6%;
}

.custm-form button {
	
}

/* .btn {
  border: none;
  outline: none;
  padding: 10px 16px;
  background-color: #f1f1f1;
  cursor: pointer;
  font-size: 18px;
}

/* Style the active class, and buttons on mouse-over */
.active, .btn:hover {
  background-color: ;
  color: white;
} */



#orangebtn {
	background-color: #DA5427;
	color: #fff;
	font-size: 14px;
	border-radius: 20px;
	padding: 7px 25px !important;
}

.search-div ul li a {
	color: #fff;
	letter-spacing: 1px;
}

/*.city{
			    padding-top: 37px;
		}*/
.city select {
	height: 40px;
	/*border: none;*/
	border-radius: 0px;
	font-size: 14px;
}


.search-div-main .nav-pills .nav-link {
	color: #fff;
}

.flex-child>h6 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.flex-child p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.classfied-img img{
	height:180px;
	width:100%;
}

.classified-head{
	border-top:2px solid #fff;
}
</style>
<style>
.pagination {
  display: inline-block;
   padding-left: 50%;
  
   
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: blue;
  border: 1px solid #4CAF50;
 
}
.pagination a.current{
cursor:pointer;
 background:black;
 color:white;
}

.pagination a:hover:not(.active) {
background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
</style>


</head>

<body>
	<!--Header section start here-->
	<section id="nav-section">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"
			id="custm-navbar">
			<div class="container">
				<div class="row">
					<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2" id="logoPost">
						<a class="navbar-brand" id="custmNavbrnad" href="home"><img
							src="resources/homeimages/logo/logo.png" class="img-fluid"></a>
					</div>
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12" id="bannerpost">
						<div class="banner text-center">
							<img src="resources/homeimages/gif/home2.gif" class="img-fluid">
						</div>
					</div>
					<div class="col col-lg-3 col-md-3 col-sm-4" id="addPost">
						<div class="postBtn">
							<div class="buttons text-center" id="mobileLI">
								<a href="login" class="mr-2"><i class="fa fa-user"
									aria-hidden="true"></i> Sign in</a> <a href="UserRegistration"><i
									class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign up</a>
							</div>
							<div class="post-add text-center mt-2">
								<a href="#">Post your Add</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</nav>
		<nav class="navbar navbar-expand-lg navbar-light border"
			id="navbar-custm" style="background-color: #ecbe27">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="home">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="about">About</a>
						</li>
						<li class="nav-item dropdown "><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Services </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="propertyDeals">Property Deals</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="tenancyManagement">Tenancy
									Management</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="propertyCare">Property care</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="vendors">Vendors</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="classifides">Classifieds</a></li>
						<li class="nav-item"><a class="nav-link" href="blog">Blog</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="favourites">Favourites</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contactus">Contact
								us</a></li>
						<li class="nav-item" id="custmLi"><a class="nav-link"
							href="login"><i class="fa fa-user" aria-hidden="true"></i>
								Sign in</a></li>
						<li class="nav-item" id="custmLi"><a class="nav-link"
							href="UserRegistration"><i class="fa fa-pencil-square-o"
								aria-hidden="true"></i> Sign up</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</section>

	<!--Header section ends here-->
	<section id="home-section">
		<div class="classified-img">
			<div class="classified2">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="search-div-main">
								<ul class="nav nav-pills " id="propertyValue">
									<li class="nav-item "><button class="nav-link active" id="propertype">BUY</button>
									</li>
									<!-- <li class="nav-item"><a class="nav-link" href="#">SELL</a>
									</li> -->
									<li class="nav-item"><button class="nav-link" id="propertype">RENT</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row no-gutters">
						<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
							<div class="city">
								<select class="form-control" id="city" name="city" onchange="getArea()" >
																						<option value="">Select City</option>
																						 <option value="Hyderabad">Hyderabad</option>
																						<option value="Bengalore">Bengalore</option>
																					</select>
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
							<div class="city">
								<select class="form-control" id="state" name="state" >
								<option value="">Select Location</option>
																						
																					</select>
							</div>
						</div>
						<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
							<div class="city">
						<select class="form-control" id="proptype" name="proptype" >
																				<option value="">Select property Type</option>
																				<option value="Apartment">Apartment</option>
																				<option value="House">House</option>
																				<option value="Commercial Space">Commercial Space</option>
																				<option value="Shop">Shop</option>
																				<option value="Unit">Unit</option>
																			</select>
						
						</div>
						</div>
						
						
						
						
						<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
							<div class="classifided-btn">
								<button class="btn btn-light" type="button" onclick="getClassifiedsBySearch()" >Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="bread" class="custmbread">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb" id="vendor-bread">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home"><i
									class="fas fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Classifieds</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<section id="classified1">
		<div class="container">
			<div class="common-title text-center py-5">
				<h3>Recent properties</h3>
			</div>
			<div class="row">
				
 <c:forEach var="csf" items="${classified.classifiedList}">
					
							<div class="col-lg-3 col-md-6 col-sm-12 mb-3" id="custmMargin">
								<div class="classified-property ">
								<c:set var = "newTitle" value = "${fn:replace(csf.csfTitle,' ', '-')}" />
								
						<c:choose>
						<c:when test="${empty csf.csfImage}">
									<div class="classfied-img">
										<a href="#" onclick="viewClassifiedInfoByID('${newTitle}','${csf.classified}')">
										
											<img
											src="resources/Classified-Images/55.jpg" class="img-fluid"></a> 
											
									
									
									<!-- </form> -->
									</div>
									</c:when>
						<c:otherwise>
							<div class="classfied-img">
										
										
										<%-- <a href="VewHomeClassified?Title=${newTitle}&&id=${csf.classified}"> --%>
										
										<%-- <a href="VewClassified/${newTitle}/${csf.classified}"> --%>
										<a href="#" onclick="viewClassifiedInfoByID('${newTitle}','${csf.classified}')">
										
										<img
											src="resources/Classified-Images/${csf.csfImage}" class="img-fluid"></a> 
									
									
									
									</div></c:otherwise>
									</c:choose>
									<br>
									<div class="sale">
										<div class="row">
											<div class="col">
												<div class="salebtn pl-3">
													<span>${csf.csfType}</span>
												</div>
											</div>
											<!-- <div class="col">
												<div class="wishlist text-right">
													<span id="loveIicon"><i class="fa fa-heart-o"
														aria-hidden="true"></i></span>
												</div>
											</div> -->
										</div>
									</div>
									<div class="rupee">
										<p>
											<span><i class="fas fa-rupee-sign"></i></span>${csf.amount}</p>
									</div>
							<%-- <a 
										href="#" onclick="viewClassifiedDeatils('${csf.classified}','${csf.prtyid}')"> --%>	
										<a href="#" onclick="viewClassifiedInfoByID('${newTitle}','${csf.classified}')">
										<div class="classified-head py-3 pl-3 pr-2 mb-2">
											<h5>${csf.csfTitle}</h5>
											<div class="flex-child">
												<h6>
													<span><i class="fa fa-map-marker" aria-hidden="true"></i></span>
													${csf.prtyAddress}
												</h6>
											</div>
										</div>
										</a>
							
									<div class="row pl-3 pb-2">
										<div class="col">
											<p>
												<span><i class="fas fa-vector-square"></i></span>${csf.areaSqft}Sq.ft</p>
										</div>
										<div class="col">
											<p>
												<span><i class="fa fa-car" aria-hidden="true"></i></span>&nbsp;${csf.nofofparking}
												
											</p>
										</div>
									</div>
									<div class="row pl-3 pb-2">
										<div class="col">
											<p>
												<span><i class="fa fa-bed" aria-hidden="true"></i></span>&nbsp;${csf.noofBeds}
												Beds
											</p>
										</div>
										<div class="col">
											<p>
												<span><i class="fas fa-bath"></i></span>&nbsp;${csf.noofbaths}
												Baths
											</p>
										</div>
									</div>
									<div class="row pl-3 pb-2">
										<div class="col">
											<p>
												<span><i class="fa fa-user" aria-hidden="true"></i></span>&nbsp;Owner
											</p>
										</div>

									
									
									
										<div class="col">
											<c:choose>
											<c:when test="${csf.postedDays eq ' days ago'}">
											<p></p>
											
											</c:when>
											<c:otherwise><p>${csf.postedDays}</p>
											</c:otherwise>
											</c:choose>
											
											
										</div>
									</div>
								</div>
							</div>
						
				</c:forEach>
				<div class="row my-5">
					<div class="col text-center">
						<button type="button" class="btn mt-2" id="custm-innerbtn" onclick="loadClassifieds()">Load
							More</button>
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
								<p>Maa Properties have the in-depth knowledge about all
									aspects of selling, buying, renting and managing a range of
									real estate properties. Our experienced real estate
									professionals understand the market. We know what is available
									and what exactly matches your needs and budget, Maa properties
									provides property related transactions in Hyderabad like buy,
									sell, rent, lease, providing tenants and maintenance for NRI's
									under four services Property Deals, Property Analysis, Tenancy
									Management and Property Care.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
						<div class="quick-links-box">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"
									id="custmPadding">
									<div class="quick-head">
										<h6>Real Estate in Hyderabad</h6>
										<li><a href="#">Property in JNTU</a></li>
										<li><a href="#">Property in HI-TECH City</a></li>
										<li><a href="#">Property in Kondapur</a></li>
										<li><a href="#">Property in Madhapur</a></li>
										<li><a href="#">Property in S.R Nagar</a></li>
										<li><a href="#">Property in Manikonda</a></li>
									</div>
									<a href="privacy"><h6 class="mt-3">Privacy &
											Disclaimer</h6></a>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"
									id="custmPadding">
									<div class="essetial-box">
										<h6>Maa properties Essentials</h6>
										<li><a href="#">Advertise with Us</a></li>
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
									<i class="fa fa-map-marker-alt"></i> Survey # 1050,Plot # S -
									2,505 & 506, 5th Floor,Manjeera Trinity Corporate,<br>
									JNTU Hi-tech City Road, KPHB 3rd Phase,<br> Kukatpally,
									Hyderabad - 500072<br> <i class="fa fa-phone"> </i> +91 -
									40 - 67285613<br> <i class="fa fa-envelope"></i> <a
										href="mailto:info@maaproperties.com">info@maaproperties.com</a>
									<br> <i class="fa fa-globe"></i> www.maaproperties.com <br>
								</div>
							</div>
							<div class="social-media my-3">
								<span class="facebook-icon mr-3"> <a
									href="https://www.facebook.com/maaproperties/" target="_blank">
										<i class="fab fa-facebook-square"></i>
								</a>
								</span> <span class="twitter-icon mr-3"> <a
									href="https://twitter.com/maaproperties" target="_blank"> <i
										class="fab fa-twitter-square"></i>
								</a>
								</span> <span class="youtube-icon mr-3"> <a
									href="https://www.youtube.com/channel/UCAMCuKB1COcICj0tP-l6fmg"
									target="_blank"><i class="fab fa-youtube"></i></a>
								</span> <span class="pinterest mr-3"> <a
									href="https://www.pinterest.com/maaproperties12/"
									target="_blank"><i class="fab fa-pinterest"></i></a>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="resources/homejs/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/homejs/main.js"></script>
	<script>
		$(document).ready(function() {
			$("#custmer-img").owlCarousel({
				items: 1,
				autoplay: true,
			});
		});
		
		
		var cityVal = $("select[name='city']");
		var citynew='${city}';
		 	cityVal.find('option[value="' + citynew + '"]').attr('selected', true);
		
		var locationval = $("select[name='state']");
		var locationnew='${location}';
		 	locationval.find('option[value="' + locationnew + '"]').attr('selected', true);
		
		var propTypeVal = $("select[name='proptype']");
		var propnew='${proptype}';
		 	propTypeVal.find('option[value="' + propnew + '"]').attr('selected', true);
	</script>
	<script>
		$("#loveIicon").click(function() {
			$(this).find('i').toggleClass('fa fa-heart-o fas fa-heart');
		});
		$("#loveIicon2").click(function() {
			$(this).find('i').toggleClass('fa fa-heart-o fas fa-heart');
		});
		
function callClassified(){

	$('#homeClassified').submit();
}
function loadClassifieds(){

	window.location.href="classifides";
}

function getArea(){
	
	var city=$('#city').val();
	var area;
	var myArea={
			   
	        "Hyderabad": [ "Gachibowli", "Shamshabad", "Kukatpally","Hi Tech City","Jubilee Hills", "Secunderabad","Banjara Hills","Ameerpet","Sainikpuri","L B Nagar","Vanasthalipuram","Lingampally","Chandanagar"],
	        "Bengalore":["Kormangala","BTM Layout","Jaya Nagar","Banshankari","Electoronic city" ,"Marthali","Whitefeild"]
	    
	}
	switch (city) { 
	case 'Hyderabad': 
		area=myArea.Hyderabad;
		
		break;
	case 'Bengalore': 
		area=myArea.Bengalore;
		break;
	
}
	$('#state').empty();
	$('#state').append('<option value=""> Select Area </option>');
	for(var i=0;i<area.length;i++){
	
		$('#state').append('<option value="' + area[i] + '"> ' + area[i] + '</option>'); 
				
           
                        
       
    }
}

var header = document.getElementById("propertyValue");
var btns = header.getElementById("propertype");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  alert("current--"+current[0].className );
  current[0].className = current[0].className.replace(" active", "");
  alert("current[0].className --"+current[0].className );
  this.className += " active";
  });
}

/* function activeLink(val){
	alert("activeLink"+val);
	var propvalue=val;
	if(val=='RENT'){
		$('#rentVal').val('RENT');
	}else if(val=='BUY'){
		$('#rbuyVal').val('BUY');
	}
	var current = document.getElementsByClassName("propertyValue");
	  current[0].className = current[0].className.replace(" active", "");
	  this.className += " active";
}
 */	function getClassifiedsBySearch(){
		var city=$('#city').val();
		var area=$('#state').val();
		var proptype=$('#proptype').val();
		
		var location;
		/* if(area==''){
			location='all';
		}else{
			location=area;
		} */
		window.location.href="classifides-location?city="+city+"&location="+area+"&proptype="+proptype+"";
	
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
	<!-- <script>

(function($) {
	var pagify = {
		items: {},
		newcontainer: null,
		totalPages: 1,
		perPage: 3,
		currentPage: 0,
		createNavigation: function() {
			this.totalPages = Math.ceil(this.items.length / this.perPage);

			$('.pagination', this.newcontainer.parent()).remove();
			var pagination = $('<div class="pagination"></div>').append('<a class="nav prev disabled" data-next="false"><</a>');

			for (var i = 0; i < this.totalPages; i++) {
				var pageElClass = "page";
				if (!i)
					pageElClass = "page current";
				var pageEl = '<a class="' + pageElClass + '" data-page="' + (
				i + 1) + '">' + (
				i + 1) + "</a>";
				pagination.append(pageEl);
			}
			pagination.append('<a class="nav next" data-next="true">></a>');

			this.container.after(pagination);

			var that = this;
			$("body").off("click", ".nav");
			this.navigator = $("body").on("click", ".nav", function() {
				var el = $(this);
				that.navigate(el.data("next"));
			});

			$("body").off("click", ".page");
			this.pageNavigator = $("body").on("click", ".page", function() {
				var el = $(this);
				that.goToPage(el.data("page"));
			});
		},
		navigate: function(next) {
			// default perPage to 5
			if (isNaN(next) || next === undefined) {
				next = true;
			}
			$(".pagination .nav").removeClass("disabled");
			if (next) {
				this.currentPage++;
				if (this.currentPage > (this.totalPages - 1))
					this.currentPage = (this.totalPages - 1);
				if (this.currentPage == (this.totalPages - 1))
					$(".pagination .nav.next").addClass("disabled");
				}
			else {
				this.currentPage--;
				if (this.currentPage < 0)
					this.currentPage = 0;
				if (this.currentPage == 0)
					$(".pagination .nav.prev").addClass("disabled");
				}

			this.showItems();
		},
		updateNavigation: function() {

			var pages = $(".pagination .page");
			pages.removeClass("current");
			$('.pagination .page[data-page="' + (
			this.currentPage + 1) + '"]').addClass("current");
		},
		goToPage: function(page) {

			this.currentPage = page - 1;

			$(".pagination .nav").removeClass("disabled");
			if (this.currentPage == (this.totalPages - 1))
				$(".pagination .nav.next").addClass("disabled");

			if (this.currentPage == 0)
				$(".pagination .nav.prev").addClass("disabled");
			this.showItems();
		},
		showItems: function() {
			this.items.hide();
			var base = this.perPage * this.currentPage;
			this.items.slice(base, base + this.perPage).show();

			this.updateNavigation();
		},
		init: function(newcontainer, items, perPage) {
			this.container = container;
			this.currentPage = 0;
			this.totalPages = 1;
			this.perPage = perPage;
			this.items = items;
			this.createNavigation();
			this.showItems();
		}
	};

	// stuff it all into a jQuery method!
	$.fn.pagify = function(perPage, itemSelector) {
		var el = $(this);
		var items = $(itemSelector, el);

		// default perPage to 5
		if (isNaN(perPage) || perPage === undefined) {
			perPage = 3;
		}

		// don't fire if fewer items than perPage
		if (items.length <= perPage) {
			return true;
		}

		pagify.init(el, items, perPage);
	};
})(jQuery);

$(".newcontainer").pagify(7, ".single-item");




</script>
 --></body>
<!--<i class="fas fa-grin-hearts"></i>-->

</html>