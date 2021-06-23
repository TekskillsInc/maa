<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>User Admin|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">

	<link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
	<link rel="stylesheet" href="resources/css/style2.css">
	<link rel="stylesheet" href="resources/css/owl-slider/css/owl.theme.default.css">
	<link rel="stylesheet" href="resources/css/owl-slider/css/owl.carousel.min.css">
	
 
	<style>
		body {
			font-size: 13px;
		}

		.table-stats table td {
			font-size: 13px !important;
			
		}

		.card .card-footer {
			padding: 1px;
			border-top: 0px;
			
		}

		.table-stats table th img,
		.table-stats table td img {
			margin-right: 10px;
			max-width: 39px;
		}

		#venoderTable span {
			color: #607d8b;
			font-size: 11px;
			font-weight: 600;
			
		}

		.table-stats table th,
		.table-stats table td {
			border-bottom: 0px;
			
		}

		#dashboard .card {
			background-color: #e8e9ef;
			width:100%!important
		}
		
         #sliderbar  {
			width:100%!important
		}
		#sliderbar img {
			width: 110px;
			height: 110px;
		}

		#sliderbar-inner .card {
			background-color: #e8e9ef;
			width:100%!important
		}

		.rounded-circle {
			border: 2px solid #fff;
		}
		
		.round-img img{
			height:40px;
			width:40px;
		}
		
		/*#custmBarChart{
		height:320px!important
		width:100%!important
		}*/
		
		#barchart_material{
		height:220px!important;
		width:100%!important;
		}
		@media (max-width: 550px) {
	
	/*#newcontent {
		width: 100% !important;
	}*/
}
		
	</style>
</head>

<body>
		<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="resources/img/logo/rounded_logo.png" alt="">
	</div>
	
	<div id="right-panel" class="right-panel">
		<!-- Header-->
	
		<!--    Modal popup for switch property start here-->
	
		
		<div id="newcontentt" class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12">
					<div class="orders" id="sliderbar">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-body">
										<h4 class="box-title">Association</h4>
									</div>
									
								
									<div class="card-body" id="sliderbar-inner">
										<div class="row">
											<div class="col-md-12 owl-carousel owl-theme" style="display: block;">	
																				
										<div class="owl-stage-outer" >
										<div class="owl-stage">
										
										<c:forEach var="aso" items="${assoiciationList}">
										<div class="owl-item" style="width: 262.25px;">
												<div class="card ml-2 mr-2">
													<div class="card-body">
														<div class="mx-auto d-block">
														 	<c:choose>
                                        <c:when test='${not empty aso.pic}'>
                                       <!--  <a href="#"> -->
                                            <img class="rounded-circle mx-auto d-block"  alt="Card image cap" src="resources/maa-images/${aso.pic}">
                                       <!--  </a> -->
                                        </c:when>
                                        <c:otherwise>
                                        <!-- <a href="#"> -->
                                            <img class="rounded-circle mx-auto d-block"  alt="Card image cap" src="resources/maa-images/us2.jpg">
                                        <!-- </a> -->
                                        </c:otherwise>
                                        </c:choose> 
															<h5 class="text-center mt-2 mb-1">${aso.name}</h5>
															<div class="location text-center"><i class="fa fa-user"></i> ${aso.memType}</div>
														</div>
													</div>
												</div>
										</div>
										</c:forEach>
										</div></div>												
										</div>
									</div>
									
								</div> 
							</div>
							<!-- /.col-lg-6 -->
						</div>
					</div>
					</div>
					<div class="clearfix"></div>
					<!-- Orders -->
					<div class="orders">
						<div class="row">
							<div class="col-xl-6">
								<div class="card " id="dashboard">
									<div class="card-body" style="background-color: #f44336 !important;color: #fff">
										<h4 class="box-title">Dashboard</h4>
									</div>
									<div class="card-body py-3">
										<div class="row ml-2 mr-2">
											<div class="col col-lg-6 col-md-6 col-sm-6">
												<div class="card" style="background-color: #03a9f4 !important; color: #fff!important">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib white-color">
																<i class="pe-7s-users"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-text">${ownerCount}</div>
																	<div class="stat-heading">Owners</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col col-lg-6 col-md-6 col-sm-6">
												<div class="card" style="background-color: #f44336 !important;">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib white-color">
																<i class="ti-home"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-text"><c:out value='${assetCount}'></c:out></div>
																	<div class="stat-heading">Assets</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col col-lg-6 col-md-6 col-sm-6">
												<div class="card" style="background-color: #ff9800 !important;">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib white-color">
																<i class="pe-7s-users"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-text">${tenenatCount}</div>
																	<div class="stat-heading">Tenants</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col col-lg-6 col-md-6 col-sm-6">
												<div class="card" style="    background-color: #4caf50 !important;">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib white-color">
																<i class="pe-7s-cash"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-text">${vacancies}</div>
																	<div class="stat-heading">Vacancies</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
								</div>
								<!-- /.card -->
							</div>
								<div class="col-xl-6">
								<div class="card">
									<div class="card-body" style="background-color: #ff9800 !important;color: #fff">
										<h4 class="box-title">Month-Wise PayamentS & Expenses</h4>
									</div>
									<div class="card-body" id="custmBarChart">
									
									
									<div id="barchart_material" style="width: 550px; height: 400px;"></div>
										
											</div>
										</div>
										<!-- /.table-stats -->
									</div>
							
						</div>
					</div>
					<div class="orders">
						<div class="row">
							<div class="col-xl-6">
								<div class="card">
									<div class="card-body" style="background-color: #4caf50 !important;color: #fff">
										<h4 class="box-title">Notifications</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<div class="table-stats order-table ov-h ">
												<table class="table text-center">
													<thead>
														<tr>												
															
															<th>Notification </th>														
															<th>Notified By</th>
															<th>Date</th>
															<th>View</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="notf" items="${notificationList}">
													
														<tr>															
															<td>${notf.title}</td>
															<td>${notf.flatno}</td>
															<td>${notf.notificationdate}</td>
															<td><a href="#"><i class="fa fa-eye"></i></a></td>
														</tr>
														</c:forEach>
														
													</tbody>
												</table>
											</div>
										</div>
										<!-- /.table-stats -->
									</div>
									<div class="card-footer text-right">
									<button type="button" class="btn btn-info btn-sm" onclick="loadMoreNotifications('${prptyName}','${prptyid}','${userid}','${roleid}')">More</button>
										<!-- <button type="button" class="btn btn-info btn-sm">More</button> -->
										
									</div>
								</div>
								<!-- /.card -->
							</div>
							<div class="col-xl-6">
								<div class="card">
									<div class="card-body" style="background-color: #03a9f4!important;color: #fff">
										<h4 class="box-title">Complaints</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<div class="table-stats order-table ov-h ">
												<table class="table text-center">
													<thead>
										<tr>
											<th>Complaint ID</th>
											<th>From</th>
											<th>Date</th>
											<th>Title</th>
											<th>Status</th>
											
										</tr>
									</thead>
													<tbody>
													<c:forEach var="clist" items="${complaintList}">
													
														<tr>															
															<td>${clist.id}</td>    
                                        <td>${clist.flatno}</td>   
                                        <td>${clist.cdate}</td> 
                                        <td>${clist.title}</td>
                                        <td>${clist.status}</td>
														</tr>
														</c:forEach>
														
													</tbody>
												</table>
											</div>
										</div>
										<!-- /.table-stats -->
									</div>
									<div class="card-footer text-right">
									<button type="button" class="btn btn-info btn-sm" onclick="loadMoreComplaints('${prptyName}','${prptyid}','${userid}','${roleid}')">More</button>
										<!-- <button type="button" class="btn btn-info btn-sm">More</button> -->
										
									</div>
								</div>
								<!-- /.card -->
							</div>
						
						</div>
					</div>
					<div class="orders">
						<div class="row">
						<div class="col-xl-6 ">
								<div class="card">
									<div class="card-body" style="background-color: #ff9800 !important;color: #fff">
										<h4 class="box-title">Vendors</h4>
									</div>
									<div class="card-body">
										<div class="table-stats order-table ov-h">
											<table id="venClassTable" class="text-center" data-toggle="table"
									data-pagination="true" data-search="true"
									data-show-columns="true" data-show-pagination-switch="true"
									data-show-refresh="true" data-key-events="true"
									data-show-toggle="true" data-resizable="true"
									data-cookie="true" data-cookie-id-table="saveId"
									data-show-export="true" data-click-to-select="true"
									data-toolbar="#toolbar">
												<thead>
													<tr>
														<th class="avatar">Avatar</th>
														<th>Name</th>
														<th>Profession</th>
														<th>Number</th>
														<th>View</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="vendor" items="${vendorList}">
													<tr>
													
														
														<c:choose>
														<c:when test='${empty vendor.vendorimg}'>
                                                  	<td class="avatar">
															<div class="round-img">
																<a href="#"><img class="rounded-circle" src="resources/maa-images/us2.jpg" alt=""></a>
															</div>
														</td>
														</c:when>
														<c:otherwise>
                                                     	<td class="avatar">
															<div class="round-img">
											         <img class="rounded-circle" src="resources/maa-images/${vendor.vendorimg}" >
											         </div>
											          </td>
                                                  </c:otherwise>
														</c:choose>
														<td>${vendor.vendorname}</td>
														<td>${vendor.profession}</td>
														<td>${vendor.mobile}</td>
														<td><a href="#"><i class="fa fa-eye"></i></a></td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card-footer text-right">
									<button type="button" class="btn btn-info btn-sm" onclick="loadMoreVendors('${prptyName}','${prptyid}','${userid}','${roleid}')">More</button>
										<!-- <button type="button" class="btn btn-info btn-sm">More</button> -->
									</div>
								</div>
							
							</div>
							<div class="col-xl-6">
								<div class="card">
									<div class="card-body" style="background-color: #f44336 !important;color: #fff">
										<h4 class="box-title">Classifides</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<div class="table-stats order-table ov-h ">
												<table id="DashClassTable" class="text-center" data-toggle="table"
									data-pagination="true" data-search="true"
									data-show-columns="true" data-show-pagination-switch="true"
									data-show-refresh="true" data-key-events="true"
									data-show-toggle="true" data-resizable="true"
									data-cookie="true" data-cookie-id-table="saveId"
									data-show-export="true" data-click-to-select="true"
									data-toolbar="#toolbar">
													<thead>
														<tr>															
															<th>Category</th>
															<th>Facing</th>
															<th>Flat</th>
															<th>Available On</th>
															<th>View</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="csf" items="${classifiedList}">
													
														<tr>
															
															<td>${csf.csfType}</td>
															<td>${csf.facing}</td>
															<td>${csf.noofBeds} Bhk</td>
															<td>${csf.prtyavialbleon}</td>
															
															<td><a type="button" href="VewClassified?classifiedid=${csf.classified}&&prtyid=${csf.prtyid}&&prptyName=${prptyName}&&type=cs" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a></td>
														</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /.table-stats -->
									</div>
									<div class="card-footer text-right">
										<button type="button" class="btn btn-info btn-sm" onclick="loadMoreClassifieds('${prptyName}','${prptyid}','${userid}','${roleid}')">More</button>
									</div>
								</div>
								<!-- /.card -->
							</div>
							<!-- <div class="orders">
						<div class="row"> -->
							
								</div>
								
							</div>
					
						</div>
					</div>
					
				</div>
			</div>
			<!-- .animated -->
		
		<!-- /.content -->
		
		<div class="clearfix"></div>
		
		
	

	
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.1/owl.carousel.min.js"></script> -->
	
<script src="resources/js/owl.carousel231.min.js"></script>
	
	<script type="text/javascript" src="resources/js/custm.js"></script>

	 <script type="text/javascript" src="resources/js/ChartJS/loader.js"></script>
	 
	 <script type="text/javascript">
	 var expences = JSON.parse('${expensechatList}');
	    google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawChart);
	      
	      function drawChart() {
	    	  
	    	  var data = google.visualization.arrayToDataTable([]);
	    	  data.addColumn('string','Month');
	    		 data.addColumn('number','Payment');
	    		 data.addColumn('number','Expense');
	    		 
	    		 
	    	
	    		 for(var i=0;i<expences.length;i++){
	    				 data.addRow([expences[i].months,expences[i].paymentCount, expences[i].expenseCount]);
	    			    }
        var options = {
        		titleTextStyle: {
    		        color: '#757575',    // any HTML string color ('red', '#cc00cc')
    		        fontName: 'Roboto', // i.e. 'Times New Roman'
    		        fontSize: 16, // 12, 18 whatever you want (don't specify px)
    		        bold: true
    		    },
    		    /* chart:{
    		    	 title: 'Month-WISE Payments and Expenses',
    		    	 //subtitle:'AD, CDCMS, NCDCMS'
        		    }, */
         		 bars: 'vertical' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
	 
	 <script>
	 
	 function loadMoreClassifieds(prptyName,prptyid,userid,roleid){
		 window.location.href="propertyclassifides?prtyid="+prptyid+"&prptyName="+prptyName+"&userid="+userid+"&roleid="+roleid+""
		 
	 }
	 function loadMoreVendors(prptyName,prptyid,userid,roleid){
		 window.location.href="propertyvendors?prtyid="+prptyid+"&prptyName="+prptyName+"&userid="+userid+"&roleid="+roleid+""
		 
	 }
	 function loadMoreNotifications(prptyName,prptyid,userid,roleid){
		 window.location.href="notification?prtyid="+prptyid+"&prptyName="+prptyName+"&userid="+userid+"&roleid="+roleid+""
	 }
	 
	 function loadMoreComplaints(prptyName,prptyid,userid,roleid){
		 window.location.href="complaints?prtyid="+prptyid+"&prptyName="+prptyName+"&userid="+userid+"&roleid="+roleid+""
	 }
	 
	 
	 </script>
    
    
  
</head>
<body>
  
  
</body>
</html>
