<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="resources/css/icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
   <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="resources/css/datepicker.css">
    <link rel="stylesheet" href="resources/css/build.css">
    <link rel="stylesheet" href="resources/css/toggle.css">
    <link rel="stylesheet" href="resources/css/data-table/bootstrap-table.css">
    <link rel="stylesheet" href="resources/css/data-table/bootstrap-editable.css">
    
    <link rel="stylesheet" href="resources/css/style.css">
    
</head>

 <body> 
    <!-- Left Panel -->
   
   
   
   <!--  <div id="right-panel" class="right-panel"> -->
     <header id="header" class="header">
            <div class="top-left">
               
                <!--
                <div class="bulding-name">
                    <p>Manjeera Trinity Corporate</p>
                </div>
-->
                <!--
-->
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                       <!--  <div class="flash-msg">
                            <marquee behavior="scroll" direction="left" class="py-2">Maheshwar is a kingmaker&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hello welcome to Maa Properties</marquee>
                        </div> -->


                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="modal" data-target="#switchModalPopUp">
                                <i class="fa  fa-exchange"></i>
                            </button>
                        </div>
                        <a href="#">
                            <div class="dropdown for-notification">
                                <button class="btn btn-secondary dropdown-toggle" id="support">
                                <i class="fa fa-info-circle"></i>                                
                            </button>
                            </div>
                        </a>
                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">0</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 0 Notification</p>
                               <!--  <a class="dropdown-item media" href="#">
                                    <i class="fa fa-check"></i>
                                    <p>New Vendor Added</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-info"></i>
                                     <p>New Vendor Added</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-warning"></i>
                                     <p>New Vendor Added</p>
                                </a> -->
                            </div>
                        </div>
                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa  fa-user"></i>
                                <span class="count bg-primary">0</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="message">
                                <p class="red">You have 0 Requests</p>
                               <!--  <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/admin.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Veerababu</span>
                                        <span class="time float-right">Just now</span>
                                        <p class="my-2"><button type="button" class="btn btn-success btn-sm">Confirm</button>
                                    <button type="button" class="btn btn-outline-link btn-sm">Not now</button></p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/admin.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Durga</span>
                                        <span class="time float-right">Just now</span>
                                        <p class="my-2"><button type="button" class="btn btn-success btn-sm">Confirm</button>
                                    <button type="button" class="btn btn-outline-link btn-sm">Not now</button></p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/admin.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Mahesh</span>
                                        <span class="time float-right">Just now</span>
                                        <p class="my-2"><button type="button" class="btn btn-success btn-sm">Confirm</button>
                                    <button type="button" class="btn btn-outline-link btn-sm">Not now</button></p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/admin.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Veerababu</span>
                                        <span class="time float-right">Just now</span>
                                        <p class="my-2"><button type="button" class="btn btn-success btn-sm">Confirm</button>
                                    <button type="button" class="btn btn-outline-link btn-sm">Not now</button></p>
                                    </div>
                                </a>
                                <hr>
                                <p class="text-center"><a href="#">View All</a></p>
    -->                         </div>
                        </div>
                    </div>
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="resources/images/admin.jpg" alt="User Avatar">
                        </a>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>
                        <a class="nav-link" href="changePassword"><i class="fa fa-power -off"></i>Change Password</a>
                            <a class="nav-link" href="logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Content -->
        <div class="content" >
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="col-md-12" id="assetMblVersn">
                    <div class="card" id="responseCard">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <strong class="card-title">Master Admin Screen</strong>
                                </div>
                                
                            </div>
                        </div>
                        <div class="card-body">
							<div class="table-responsive">
                            <table id="masterAdmin" class="text-center table-borderless" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>
										<th>UserID</th>
                                        <th>Bulding Name</th>
                                        <th>Mobile</th>
                                        <th>Email</th>
										<th>USC No</th>
                                        <th>PinCode</th> 
                                         <th>Status</th>                                                  
										<th class="custmStatus">User Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                   <c:forEach var="ul" items="${userList}">
                                   <tr>
                                        <td><img class="photo_round" src="resources/maa-images/${ul.prtyimg}" style="width: 40px;height: 40px;border-radius: 50%;"></td>
										<td><u><a href="PropertyFetch?prptyid=${ul.buildingid}&prptyname=${ul.build_name}">${ul.build_name} </u> </a></td>
                                        <td>${ul.contact}</td>
                                        <td>${ul.buldingmail}</td>
                                        <td>${ul.uscno}</td>
										<td>${ul.zip}</td>
										<td>
										<c:choose>
                                        <c:when test="${ul.status==1}">
                                       <button class="btn btn-info btn-sm">Active</button>
                                        </c:when>
                                        <c:otherwise>
                                        <button class="btn btn-danger btn-sm">InActive</button>
                                        </c:otherwise>
                                        </c:choose>
										</td>
										<td>
										  <span>De-Activate</span> &nbsp;&nbsp;<label class="switch">
										  
										  
										<!-- <input type="hidden" id="toggleStatus" value="${ul.status}"> -->
										 <c:choose>
										<c:when test="${ul.status==1}">
                                       <input type="checkbox" checked id="checkId" onclick="getCheckVal(${ul.userid},${ul.buildingid},'${ul.build_name}','${ul.buldingmail}','${ul.uscno}','${ul.status}')">
                                        </c:when>
                                        <c:otherwise>
                                        <input type="checkbox"   id="checkId" onclick="getCheckVal(${ul.userid},${ul.buildingid},'${ul.build_name}','${ul.buldingmail}','${ul.uscno}','${ul.status}')">
                                        </c:otherwise>
                                        </c:choose>
										  <span class="sliderBtn round"></span>
										  </label>&nbsp;&nbsp;Activate
                                        </td>
                                        <td><button type="button" class="btn btn-outline-info btn-sm custnBtn" 
                                        data-toggle="modal" data-target="#masterIdModal"
                                        onclick="viewUserInfo(${ul.status},${ul.userid},${ul.buildingid},'${ul.build_name}','${ul.uscno}',
                                        '${ul.contact}','${ul.buldingmail}','${ul.zip}','${ul.prtyimg}')"><i class="fa fa-eye"></i></button>
                                       
                                        </td>
                                    </tr>
                                      </c:forEach>
                                </tbody>
                            </table>
								</div>
                        </div>
                    </div>
                </div>

				<!--MasterAdmin Id modal popup start here-->
				<div class="modal fade" id="masterIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Info</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<div class="row">
                                <div class="col-md-4">
                                    <div class="owner-image my-4 text-center">
                                        <img id='prtyimgfile' class="img-fluid">
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Name:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static"><span id="u_name"></span></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Mobile:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static"><span id="u_phone"></span></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Email:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static"><span id="u_email"></span></p>
                                        </div>
                                    </div>  
								<!-- 	<div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Status:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">Initial</p>
                                        </div>
                                    </div> -->
									<div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">USC No:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static"><span id="u_usc"></span></p>
                                        </div>
                                    </div> 
									<!-- <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Access Code:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">AA00020000</p>
                                        </div>
                                    </div> -->
									<div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">PINCODE:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static"><span id="u_zip"></span></p>
                                        </div>
                                    </div>
									<div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">User Status:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static"><span id="u_sts"></span></p>
                                        </div>
                                    </div>
									
									<!--<span>De-Activate</span> &nbsp;&nbsp;<label class="switch">
                                                                    <input type="checkbox" checked>
                                                                    <span class="sliderBtn round "></span>
                                                                </label>&nbsp;&nbsp;Active-->
									

                                </div>
                                
                            </div>
      </div>
      <div class="modal-footer">
		  
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
<!-- </div> -->
				
				

				
               

                <div class="clearfix"></div>


            </div>
            <!-- .animated -->
        </div></div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
       <!--  <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2019 @Maa Properties
                    </div>
                </div>
            </div>
        </footer> -->
        <!-- /.site-footer -->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="resources/js/datatable-new-backup/responsivebootstrap4.js"></script>
	<script src="resources/js/data-table/bootstrap-table.js"></script>
	<script src="resources/js/data-table/tableExport.js"></script>
	<script src="resources/js/data-table/data-table-active.js"></script>
	<script src="resources/js/data-table/bootstrap-table-editable.js"></script>
	<script src="resources/js/data-table/bootstrap-editable.js"></script>
	<script src="resources/js/data-table/bootstrap-table-resizable.js"></script>
	<script src="resources/js/data-table/colResizable-1.5.source.js"></script>
	<script src="resources/js/data-table/bootstrap-table-export.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/preloader.js"></script>
	<script src="resources/js/main.js"></script>
	
 <script>
 
  function getCheckVal(userid,buildingid,buildName,buldingmail,uscno,statusid){
	 
	  var status= 0;
	  var statusName=null;
	  //alert(status);
	  if(statusid==0){
		  status=1;
		  statusName="Activated";
		  }
	  else{
		  status=0;
		  statusName="De-activated";
	  }
	  
	  $.ajax({
	         type: "post",
	         url: "updateUserStatus?statusid="+status+"&userid="+userid+"&buildingid="+buildingid+"",
	         cache: false,
	         async: false, 
	         data:    {buldingmail:buldingmail,buildName:buildName,uscno:uscno},          
	         success: function(response){
				alert(" "+buildName+" "+statusName+" successfully");
				window.location.reload();
				
	         },
	         error: function(){                                                                                 
	         }                                                       
	     }); 
	  }
    function  viewUserInfo(status,userid,buildingid,build_name,uscNo,contact,buldingmail,zip,image){
        if(status==1){
        	$('#u_sts').text("Active");
         }else{
            $('#u_sts').text("InActive");
          }
        
        var path="resources/maa-images";
        var prtyimg=path+"/"+image;
        $("#prtyimgfile").attr("src",prtyimg);
    $('#u_zip').text(zip);
    $('#u_usc').text();
    $('#u_email').text(buldingmail);
    $('#u_phone').text(contact);
    $('#u_name').text(build_name);
    $('#u_usc').text(uscNo);
         
    }

    </script>
</body>

</html>