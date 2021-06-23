<!doctype html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<head>
	<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="resources/images/favicon.ico" rel="shortcut icon">
<title>${blogInfo.title}</title>
<meta name="keywords" content="${blogInfo.tags}, maaproperties.com">
<link rel="canonical" href="blog-info?blog=${blogInfo.blogid}">
<!-- fsacebook -->
<!--<meta property="og:url"  content="http://maaproperties.com/blog" /> -->
<meta property="og:type"  content="article" />
<meta property="og:title" content="${blogInfo.title}" />
<meta property="og:description" content="article" />
<meta property="og:image" content="http://maaproperties.com/resources/blogimages/${blogInfo.image}" />
<meta property="fb:app_id" content="620522098851684"/>
<!-- twitter -->
   <meta name="twitter:site" content="@maaproperties">
    <meta name="twitter:creator" content="@maaproperties">
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="${blogInfo.title}">
    <meta name="twitter:description" content="article And News.">
    <meta name="twitter:image" content="http://maaproperties.com/resources/blogimages/${blogInfo.image}">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="icon" href="images/logo/maa_logo.png" type="image/gif" sizes="16x16">
	<link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Mansalva&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/homecss/fonts/font-awesome.css" type="text/css">
	<link rel="stylesheet" href="resources/homecss/owl/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/homecss/owl/owl.theme.default.min.css">
	<script src="https://kit.fontawesome.com/ea3bea9b30.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="resources/homecss/classfied.css">
	<link rel="stylesheet" href="resources/homecss/style.css">
	<script src="https://kit.fontawesome.com/ea3bea9b30.js" crossorigin="anonymous"></script>


	
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

		.custm-form button {}

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
			height: 60px;
			/*border: none;*/
			border-radius: 0px;
			font-size: 14px;
		}

		/*#custm-form{
			    padding-top: 37px;
		}*/
		/*.search-div-main {
			padding-left: 48px !important;
			color: #fff;
		}
*/
		.search-div-main .nav-pills .nav-link {
			color: #fff;
		}

		.blogs-img a img {
			min-height: 200px;
		}

		.hash-tags span {
			background-color: #DA5427;
			color: #fff;
			padding: 5px 1px;
		}

		.hash-tags span a {
			color: #fff;
			padding: 5px 10px;
		}
		.blogmain-head h4{
			    padding-top: 7%;
			    padding-left: 9%;
			    color: #fff;
		}
		.post-img{
			float: left;
			/*height: 80px;
			width: 80px;
			border-radius: 50%;*/
		}
		.post-img img{
			border-radius: 50%;
			height: 80px;
			width: 80px;
		}
		.post-head a{
			color:#212529;
			font-weight: 600;
		}
		.recent-post h4{
			font-size: 24px;
			font-family: 'Montserrat', sans-serif;
			font-weight: 600
		}
		.courtsy h6{
			font-size: 14px;
			font-weight: 600
		}
		
	</style>
</head>

<body>
	<!--Header section start here-->
	<section id="nav-section">
		<nav class="navbar navbar-expand-lg navbar-light bg-light" id="custm-navbar">
			<div class="container">
				<div class="row">
					<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2" id="logoPost">
						<a class="navbar-brand" id="custmNavbrnad" href="#"><img src="resources/homeimages/logo/logo.png" class="img-fluid"></a>
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
			<!--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>-->
		</nav>
		<nav class="navbar navbar-expand-lg navbar-light border" id="navbar-custm" style="background-color: #ecbe27">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item active">
							<a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="about">About</a>
						</li>
						<li class="nav-item dropdown active">
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
							<a class="nav-link" href="vendors">Home Vendors</a>
						</li>
						<li class="nav-item">
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
	<!--Header section ends here-->
	<section id="home-section">
		<div class="blog-img">
			<div class="blogmain-head">
				<h4>Blogs</h4>
			</div>
		</div>
	</section>
	<section id="bread">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb" id="vendor-bread">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html"><i class="fas fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Blogs</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>

	</section>
	<section id="classified" class="my-4">
		<div class="container">
			
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<div class="row my-5">
						<div class="col-10">
							<div class="common-title ">
				<h3>${blogInfo.title}</h3>
				<p>${blogInfo.postedon} by ${blogInfo.postedby}</p>
				<div class="hash-tag">
							<span><a href="#">${blogInfo.tags}</a></span>
							
						</div>
			</div>
						</div>
						<div class="col-2">
							
								<div class="sharebtn text-right">
									<span data-toggle="modal" data-target="#exampleModal"><i class="fas fa-share-alt"></i></span>
								</div>
							
						</div>
					</div>
					
					
					<div class="blog-image">
						<img src="resources/blogimages/${blogInfo.image}" class="img-fluid">
					</div>
					
					<div class="blog-content mt-4 text-justify">
						<p>${blogInfo.description}</p>
					</div>
					<div class="courtsy">
						<div class="row">
							<div class="col">
								<h6>Courtesy: <span>${blogInfo.postedby}</span></h6>
							</div>
							<div class="col">
								<h6>Postdate: <span>${blogInfo.postedon}</span></h6>
							</div>
						</div>
					</div>
					<!-- <div class="nxt-btn">
						<div class="row">
							<div class="col">
								<div class="backbtn">
									<a href="#"><img src="resources/images/blog/22.svg" class="img-fluid"> <span>Back</span></a> 
								</div>
							</div>
							
							<div class="col">
							<div class="nxtbtn" style="float: right">
									<a href="#"><img src="resources/images/blog/12.svg" class="img-fluid"> <span>Next</span></a> 
								</div>
							</div>
						</div>
					</div> -->
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="recent-post">
						<h4 class="my-5">Recent posts</h4>
						<div class="post-section">
						<c:forEach var="blog" items="${blogList}">
						
							<div class="post-sub-section">
								<div class="post-img mr-2">
									<img src="resources/blogimages/${blog.image}" class="img-fluid">
								</div>
								<div class="post-head mt-3">
									<a href="#">${blog.title}</a>
								</div>
								<p >${blog.postedby} by ${blog.postedon}</p>
							</div>
						
						</c:forEach>
						</div>
						
					</div>
				</div>
				
			</div>

			
		</div>
	</section>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<div class="copied-div">
						<div class="row no-gutters mt-3">
							<div class="col-3">
								<div class="image_property mr-2">
									<img src="resources/blogimages/${blogInfo.image}" class="img-fluid">
								</div>
							</div>
							<div class="col-9">
								<div class="title_property">
									${blogInfo.title}
								</div>
								<div class="address">									
			                      ${blogInfo.description}
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

					<input id="link" type="text" value="http://maaproperties.com/blog-info?blog=${blogInfo.blogid}" class="form-control">

		<button type="button" class="btn btn-light" data-clipboard-action="copy" data-clipboard-target="#link">Copy</button>

				  </div>
				  <div class="share-link mt-3">
					  <p>share:</p>
					  <div class="addthis_inline_share_toolbox"></div>
				<!--    <span class="fb"><a href="#"><i class="fab fa-facebook-square"></i></a></span>
					<span class="twt"><a href="#"><i class="fab fa-twitter-square"></i></a></span>
					<span class="pin"><a href="#"><i class="fab fa-pinterest"></i></a></span>
					<span class="lln"><a href="#"><i class="fab fa-linkedin"></i></a></span> 
					<span class="whatapp"><a href="https://wa.me/918099244422" target="_blank"><i class="fab fa-whatsapp-square"></i></a></span> --rk-->
				  </div>
				  </div>
			  </div>



		  </div>

		</div>
	  </div>
	</div>
	
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
				<span>Copyright © 2019 Maa Properties, All Rights Reserved.</span>
			</div>
		</div>
	</section>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="resources/js/owl.carousel/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script>
		$(document).ready(function() {
			$("#custmer-img").owlCarousel({
				items: 1,
				autoplay: true,
			});
		});
	</script>
	<script>
		$("#loveIicon").click(function() {
			$(this).find('i').toggleClass('fa fa-heart-o fas fa-heart');
		});
		$("#loveIicon2").click(function() {
			$(this).find('i').toggleClass('fa fa-heart-o fas fa-heart');
		});
		/*$("#loveIicon").hover(function () {    
    $(this).find('i').toggleClass('far fa-heart fas fa-heart');
});*/
	</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5e02176642a64109"></script>
</body>
<!--<i class="fas fa-grin-hearts"></i>-->

</html>