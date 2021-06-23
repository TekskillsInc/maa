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
		#wrapperId .image-wrapper {
			/*border-radius: 50%;
			height: 150px;
			margin-left: 23%;
			text-align: center;
			width: 150px;*/
		}
		
		#itemId{
			
		}
		.background-image img {
           display: block; 
           width:100%;
           height:100%
           
         }
		
	</style>
</head>
<body>
    <div class="page sub-page">
        
        <header class="hero">
            <div class="hero-wrapper">
                <!--============ Secondary Navigation ===============================================================-->
                <div class="secondary-navigation">  
                    <div class="container">
                        <ul class="left">
                            <li>
                            <span>
                                <i class="fa fa-phone"></i> +91 123 456 789
                            </span>
                            </li>
                        </ul>
                        <!--end left-->
                        <ul class="right">                            
                            <li>
                                <a href="sign-in.html">
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
                                <img src="resources/web/img/logo/maa_logo1.png" alt="">
                            </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
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
                                                <a href="property-analaysis.html" class="nav-link">Property Analysis</a>
                                            </li>
                                            
                                        </ul>
                                       
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="vendors">Vendors</a>
                                        
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="classifides">Classifides</a>
                                        
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
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="vendors">Vendors</a></li>
                            
                        </ol>
                        <!--end breadcrumb-->
                    </div>
                    <!--end container-->
                </div>
                <!--============ End Main Navigation ================================================================-->
                <!--============ Page Title =========================================================================-->
                <div class="page-title">
                    <div class="container">
                        <h1>Vendors</h1>
                    </div>
                    <!--end container-->
                </div>
                <!--============ End Page Title =====================================================================-->
                <div class="background"></div>
                <!--end background-->
            </div>
            <!--end hero-wrapper-->
        </header>
        <!--end hero-->

        
        <section class="content">
            <section class="block">
                <div class="container">
					<div class="row flex-column-reverse flex-md-row">
                        <div class="col-md-10">
                    <!--============ Section Title===================================================================-->
                    <div class="section-title clearfix">
						<div class="float-left float-xs-none mr-5">
                            <label class="mr-3 align-text-bottom">Sort by: </label>
                            <select name="sorting" id="profession" class="small width-200px" 
                              data-placeholder="Default Sorting" >
                                <option value="">Select Profession</option>
														<option value="Electrician">Electrician</option>
														<option value="Carpenter">Carpenter</option>
														<option value="Painter">Painter</option>
														<option value="PLumber">Plumber</option>
														<option value="Repairs">Repairs</option>
														<option value="CarpetCleaner">CarpetCleaner</option>
														<option value="CurrentLineMan">Current Line Man</option>
														<option value="Driver Services">Driver Services</option>
														<option value="KeyMakers">Key Makers</option>
														<option value="Maid">Maid</option>
														<option value="Masons">Masons</option>
														<option value="PestControl">Pest Service</option>
														<option value="Repair">Repair</option>
														<option value="Watchman">Watchman</option>
														<option value="Garbage Collecting man">Garbage Collecting man</option>
														<option value="Water boy">Water boy</option>
														<option value="Management Fee">Management Services</option>
														<option value="Property tax">Property tax</option>
														<option value="Water bill">Water Supply</option>
														<option value="Electricity bill">Electricity Line Man</option>
														<option value="Broadband Bill">Internet Services</option>
														<option value="WaterTankerServices">Water Tanker Service</option>
														<option value="Surveillance">Surveillance</option>
														<option value="Lift Service">Lift Service</option>
														<option value="Water purifier">Water purifier</option>
														<option value="Milk Service">Milk Service</option>
														<option value="Others" id="othersControl">Others</option>
                            </select>
                            

                        </div>
                 
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <label class="mr-3 align-text-bottom">Location: </label>
                            <select name="location" id="location" class="small width-200px"
                             data-placeholder="Default Sorting" >
                                <option value="">Select your location</option>
                                <option value="Hyderabad">Hyderabad</option>
                               
                                <option value="Banglore">Banglore</option>
                                
                            </select>

                        </div>
                        
                        <div class="float-left float-xs-none mr-5">
						<button type="button" class="btn btn-info" onclick="getVendors()" style="height: 40px;">Search</button>
						</div>
						
                        <div class="float-right d-xs-none thumbnail-toggle">
                            <a href="#" class="change-class active" data-change-from-class="list" data-change-to-class="masonry" data-parent-class="authors">
                                <i class="fa fa-th"></i>
                            </a>
                            <a href="#" class="change-class" data-change-from-class="masonry" data-change-to-class="list" data-parent-class="authors">
                                <i class="fa fa-th-list"></i>
                            </a>
                        </div>
                    </div>
                    <!--============ Items ==========================================================================-->
                    <div class="authors masonry items grid-xl-3-items grid-lg-3-items grid-md-3-items" id="itemId">
                        
                      <c:forEach var="vlist" items="${vendorList}">
                      
                      <div class="item author" >
                            <div class="wrapper" id="wrapperId">
                                <div class="image">  
                                
                                
                                
                                 <c:choose>
                                                      <c:when test='${empty vlist.vendorimg}'>
                                                   
                                                   <a href="#" class="image-wrapper background-image">
                                        <img src="resources/maa-images/us2.jpg" alt="">
                                    </a>
                                                    </c:when>
                                                      <c:otherwise>
                                                     <a href="#" class="image-wrapper background-image">
                                        <img src="resources/maa-images/${vlist.vendorimg}" alt="">
                                    </a>
                                                     </c:otherwise>
                                                      </c:choose>
                                
                                </div>
                                
                                
                                
                                
                                
                                    
                                
                                
                                
                                
                                
                                <!--end image-->								
                                <h5 class="location pl-4 text-center pt-3">
									<a href="#" class="title">${vlist.vendorname}</a><br>
                                    <a href="#">${vlist.city},${vlist.state}</a>
                                </h5>
                                
                                <!--end meta-->
                                
                                <div class="additional-info">
                                    <ul>
										<li>
                                            <figure>Profile</figure>
                                            <aside>${vlist.profession}</aside>
                                        </li>
                                        <li>
                                            <figure>Email</figure>
                                            <c:choose>
                                            <c:when test="${empty vlist.email}">
                                            <aside>NA</aside>
                                            </c:when>
                                            <c:otherwise>
                                              <aside>${vlist.email}</aside>
                                            </c:otherwise>
                                            </c:choose>
                                          
                                        </li>
                                        <li>
                                            <figure>Phone</figure>
                                            <aside>${vlist.mobile}</aside>
                                        </li>
										
                                    </ul>
                                </div>
							
                                
                            </div>
                        </div>
                      
                      </c:forEach>
                        
                    </div>
                    <!--============ End Items ======================================================================-->
                    <div class="page-pagination">
                        <nav aria-label="Pagination">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">
                                            <i class="fa fa-chevron-left"></i>
                                        </span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">
                                            <i class="fa fa-chevron-right"></i>
                                        </span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!--end page-pagination-->
						</div>
					</div>
                </div>
                <!--end container-->
            </section>
            <!--end block-->
        </section>
        
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
        <!--end footer-->
    </div>     
    <!--end page-->
     <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

	<script src="resources/web/assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="resources/web/assets/js/popper.min.js"></script>
	<script type="text/javascript" src="resources/web/assets/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
	<script src="resources/web/assets/js/selectize.min.js"></script>
	<script src="resources/web/assets/js/masonry.pkgd.min.js"></script>
	<script src="resources/web/assets/js/icheck.min.js"></script>
	<script src="resources/web/assets/js/jquery.validate.min.js"></script>
	<script src="resources/web/assets/js/custom.js"></script>
	<script>
function getVendors(){
	var profession=$('#profession').val();
	var location=$('#location').val();
	window.location.href="getAllHomeVendors?profession="+profession+"&location="+location+"";
	}
</script> 

</body>
</html>