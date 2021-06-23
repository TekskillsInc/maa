<!doctype html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="no-js" lang="">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MPRTS|Dashboard</title>
    <meta name="description" content="Maa Properties">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
		
        .right-panel .navbar-brand img {
        
            max-width: 47px;
        }
        .card-header a {
            color: #27ae60;
        }
        .card-header {
            position: relative;
        }
        .addButton {
            position: absolute;
            right: 15px;
            bottom: -2px;
            font-size: 35px;
        }
    </style>
    <style>
        body {
            font-size: 13px;
        }
        .right-panel .navbar-brand img {
            max-width: 47px;
        }
        .card-header a {
            color: #27ae60;
        }
        .card-header {
            position: relative;
        }
        .addButton {
            position: absolute;
            right: 15px;
            bottom: -15px;
            font-size: 35px;
        }
        ::placeholder {
            font-size: 13px;
        }
        .card-title {
            font-size: 16px;
        }
        .nav-pills .nav-item {
            width: 33.3%;
        }
        #pills-address {
            /*            border: 1px solid rgb(168, 168, 168);*/
            margin-top: 1%;
            margin-left: 3%;
            margin-right: 3%;
            margin-bottom: 2%;
        }
        #pills-tab {
            margin-left: 3%;
            margin-right: 3%;
             margin-top: 2%;
            box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
        }
        .nav-pills .nav-link.active {
            background-color: #17a2b8 !important;
            color: #fff !important;
        }
        .nav-pills li a {
            color: #274552;
            font-size: 13px;
            text-align: center;
            text-transform: uppercase;
        }
        .nav-pills .nav-item {
            width: 33.3%;
        }
        .nav-pills .nav-link {
            padding-top: 17px;
            padding-bottom: 17px;
        }
        .nav-pills li a:hover {
            color: #3AAFE8 !important;
        }
        .dropdown-menu {
            width: 350px !important;
        }
        .switchname h5 {
            font-size: 16px;
            padding-top: 10px;
            font-weight: 600;
        }
        #proprtyPlusAdd {
            float: right;
        }
        .property-title {}
        #custm-card{
            margin-bottom: 10px!important;
        }
        .switchprpty-list{
            overflow-y: scroll;
    overflow-x: hidden;
        }
        .switchname span{
             font-size: 16px;
    padding-top: 10px;
    font-weight: 600;
        }
        .switchname a{
                font-size: 17px;
            cursor: pointer;
        }
        .proprtySwtichList i{
            font-size: 20px;
        }
        
        .modal-dialog-scrollable {
    max-height: calc(100% - 3.5rem);
}
    </style>
</head>
<body>
    <!-- Preloader -->
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="resources/img/logo/rounded_logo.png" alt="">
    </div>

    <!-- Right Panel -->
    <div id="right-panel" class="right-panel" style="margin-top: 0px;">
            <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">                      
                                <div class="col-8">
                                    <div class="switchname pt-2">
                                        <i class="fa fa-exchange"></i>&nbsp;&nbsp;
                                        <span>Switch Property</span>&nbsp;&nbsp;
                                        <a data-toggle="modal" data-target="#idModal">
  <i class="fa  fa-caret-square-o-down"></i>
</a>
                                        <div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Switch Property</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-12" id="singlePropety">
                                                            <aside class="profile-nav alt">
                                                    <c:forEach var="property" items="${propertyList}">
                                            <section class="card">
                                                <div class="card-header user-header alt bg-dark">
                                                    <div class="media">
                                                   
                                                          <c:choose>
                                                      <c:when test='${empty property.prtyimg}'>
                                                        <a href="PropertyFetch?prptyid=${property.buildingid}">
                                                      <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="resources/images/maa_logo2.jpg">
                                                   </a> 
                                                    </c:when>
                                                      <c:otherwise>
                                                     <a href="PropertyFetch?prptyid=${property.buildingid}"> <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="resources/maa-images/${property.prtyimg}">
                                                     </a> </c:otherwise>
                                                      </c:choose>
                                                
                                                            
                                                        
                                                        <div class="media-body">
                                                         <a href="PropertyFetch?prptyid=${property.buildingid}" style="color:#17a2b8">
                                                            <h4 class="mt-3 display-6">${property.build_name}</h4>
                                                            </a>
                                                            <p>${property.landmark},${property.city},<br>${property.dist},${property.state}</p>

                                                        </div>
                                                    </div>
                                                </div>

                                            </section>
                                            </c:forEach>
                                                                </aside>
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-info btn-sm">Ok</button>
                                                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <c:if test='${(roleid==1)||(username =="maaproperties123@gmail.com")}'>
                                <div class="col">
                                    <div id="proprtyPlusAdd">
                                        <button type="button" class="btn btn-info btn-sm"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                                </c:if>
                            </div>
                          
                        </div>
                       
                    </div>
                </div>
                
                <div class="col-md-12" id="proprtyIdDetails">
                
                                
                                 <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <strong class="card-title">Property Info - ${property.build_name}</strong>
                                </div>
                                <div class="col">
                              <c:if test='${roleid==2||roleid==1}'>
                                    <div class="btnright" style="float: right">
                                        <button type="button" class="btn btn-info btn-sm" 
                                        onclick="proprtyIdEdit('${property.buildingid}','${property.userid}','${property.build_name}','${property.upiid}',
                                        '${property.proptype}','${property.landmark}','${property.city}','${property.state}',
                                        '${property.dist}','${property.zip}','${property.contact}','${property.altcontact}',
                                        '${property.noofflats}','${property.eachfloorflats}','${property.meterno}','${property.watermeterno}','${property.usc}',
                                        '${property.mgr_name}','${property.mgr_phone}','${property.mgr_alt_phone}',
                                         '${property.mgr_email}','${property.status}','${property.secname}','${property.secphn}','${property.secemail}','${property.buldingmail}')">
                                    <i class="fa fa-edit"></i>
                               </button>
                                      <!--    <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-trash-o"></i>
                                </button> -->
                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="owner-image my-4 text-center">
                                    
                                    
                                       <c:choose>
                                                      <c:when test='${empty property.prtyimg}'>
                                                        
                                                      <img class="img-fluid" alt="" src="resources/images/maa_logo2.jpg">
                                                
                                                    </c:when>
                                                      <c:otherwise>
                                                    
                                                     <img class="img-fluid" src="resources/maa-images/${property.prtyimg}">
                                                      </c:otherwise>
                                                      </c:choose>
                                       
                                    </div>
                                </div>
                                <div class="col-md-4 pt-4">
                                    <div class="row">
                                     <input type="hidden" name="ptyId" id="ptyId" placeholder="ptyId" class="form-control" value="${property.buildingid}">
                                     <input type="hidden" name="userid" id="userid" placeholder="userid Name" class="form-control" value="${property.userid}">
                                     
                                     
                                      <input type="hidden" name="unitCount" id="unitCount" placeholder="userid Name" class="form-control" value="${property.noofflats}"  maxlength="3" required pattern="^[0-9]*$">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Property Type:</label></div>
                                        <div class="col col-md-6">
                                        
                                            <p class="form-control-static">${property.proptype}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Property Name:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">${property.build_name}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Property Id:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">PTY${property.buildingid}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Address:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">${property.landmark},${property.city},${property.dist},${property.state}</p>
                                        </div>
                                    </div>
                                       <div class="row">
										<div class="col col-md-5">
											<label class="form-control-label">Phone Number:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.contact}</p>
										</div>
									</div>
									<div class="row">
										<div class="col col-md-5">
											<label class=" form-control-label">Alt Phone No:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.altcontact}</p>
										</div>
									</div>
                                </div>
                                <div class="col-md-4 pt-4">
                                    <div class="row">
                                       <div class="col col-md-5">
                                            <label class=" form-control-label">No of Units:</label></div>
                                        <div class="col col-md-5">
                                        <p class="form-control-static">${property.noofflats}</p>
                                           <%--  <button type="button" class="btn btn-info btn-sm" id="vacanci-btn">${property.noofflats}</button> --%>
                                        </div>
                                    </div>
                                 
									<div class="row">
										<div class="col col-md-5">
											<label class=" form-control-label">Email ID:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.buldingmail}</p>
										</div>
									</div>
										<div class="row">
											<div class="col col-md-5">
												<label class=" form-control-label">uscNo:</label></div>
											<div class="col col-md-7">
												<p class="form-control-static">${property.usc}</p>
											</div>
									</div>
									
									
									    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Current Meter :</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.meterno}</p>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Water Meter :</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.watermeterno}</p>
                                                        </div>
                                                    </div>
								<%-- 	   <div class="row">
										<div class="col col-md-5">
											<label class="form-control-label">Bank A/c No:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.bankAcntNo}</p>
										</div>
									</div>
									<div class="row">
										<div class="col col-md-5">
											<label class=" form-control-label">IFSC Code:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.ifscCode}</p>
										</div>
									</div>
									<div class="row">
											<div class="col col-md-5">
												<label class=" form-control-label">UPID:</label></div>
											<div class="col col-md-7">
												<p class="form-control-static">${property.upiid}</p>
											</div>
									</div> --%>
                                </div>
                            </div>
                            		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-address-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="true">Contacts</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-flats-tab" data-toggle="pill" href="#pills-flats" role="tab" aria-controls="pills-flats" aria-selected="false">Units</a>
                                </li>
                              
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-expence-tab" data-toggle="pill" href="#pills-expence" role="tab" aria-controls="pills-expence" aria-selected="false">Expense</a>
                                </li> 
                            </ul> <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-address" role="tabpanel" aria-labelledby="pills-address-tab">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-header">
                                                    <strong>Manager Info</strong>
                                                </div>
                                                <div class="card-body card-block">
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Manager Name:</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.mgr_name}</p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Phone Number:</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.mgr_phone}</p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Alt Phone No:</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.mgr_alt_phone}</p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Email:</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.mgr_email}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-header">
                                                    <strong>Security Info</strong>
                                                </div>
                                                
                                                <div class="card-body card-block">
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Security Name:</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.secname}</p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label"> Phone No:</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.secphn}</p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Email ID:</label></div>
                                                        <div class="col col-md-7">
                                                            <p class="form-control-static">${property.secemail}</p>
                                                        </div>
                                                        <div class="col col-md-5">
                                                            <label class=" form-control-label">Note:</label></div> <div class="col col-md-7">
                                                            <p class="form-control-static" id="prtyNote">${property.note}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-header">
                                                    <strong>Bank Info</strong>
                                                </div>
                                                <div class="card-body card-block">
                                                
                                                		   <div class="row">
										<div class="col col-md-5">
											<label class="form-control-label">Bank A/c No:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.bankAcntNo}</p>
										</div>
									</div>
									<div class="row">
										<div class="col col-md-5">
											<label class=" form-control-label">AccountHolder Name:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.accountName}</p>
										</div>
										
									</div>
									<div class="row">
										<div class="col col-md-5">
											<label class=" form-control-label">IFSC Code:</label></div>
										<div class="col col-md-7">
											<p class="form-control-static">${property.ifscCode}</p>
										</div>
										
									</div>
									<div class="row">
											<div class="col col-md-5">
												<label class=" form-control-label">UPID:</label></div>
											<div class="col col-md-7">
												<p class="form-control-static">${property.upiid}</p>
											</div>
									</div>
                                                
                                                 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pills-flats" role="tabpanel" aria-labelledby="pills-flats-tab">
                                   
                                        <div class="card">
                                            <div class="card-header">
                                                <strong class="card-title">Flats/Portions</strong>
                                            </div>
                                            <div class="card-body">
											<div class="table-responsive">
                                                <table class="table table-striped table-bordered text-center">
                                                  <thead class="text-center">
                                                    <tr>
                                                        <th>Asset ID</th>
                                                        <th>Unit No</th>
                                                        <th>Occupied By</th>                                                        
                                                    </tr>
                                                    
                                     </thead>
                                      <tbody>
                                      <c:forEach var="asset" items="${assetList}">
                                        <tr>
                                            <td>AST00${asset.assetid}</td>
                                            <td>${asset.flatno}</td>
                                           <c:choose>
                                           <c:when test="${empty asset.occ_by||asset.occ_by=='V'}">
                                           <td>Available</td>
                                            </c:when>
                                            <c:when test="${asset.occ_by=='O'}">
                                             <td>Owner</td>
                                            </c:when>
                                             <c:when test="${asset.occ_by=='T'}">
                                             <td>Tenant</td>
                                            </c:when>
                                            </c:choose>
                                           
                                      
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                                   
                                                </table>
												</div>
                                            </div>
                                        </div>
                                    
                                </div>
                               
                               <div class="tab-pane fade" id="pills-expence" role="tabpanel" aria-labelledby="pills-expence-tab">
                                    
                                        <div class="card" id="responseCard">
                                            <div class="card-header">
                                                <strong class="card-title">Expence</strong>
                                            </div>
                                            <div class="card-body">
												<div class="table-responsive">
                                                <table class="table table-striped table-bordered text-center">
                                                <thead>
                                                 <tr>
                                                        <th>Expense ID</th>
                                                        <th>Expense Amount</th>
                                                        <th>Expense Date</th>
                                                        <th>Expense Cause</th>
                                                        <th>Description</th>
                                                    </tr>
                                                    </thead>
                                                <tbody>
                                                 <c:forEach var="exp" items="${expenseList}">
                                    <tr>
                                        <td>EXP00${exp.expenseid}</td>
                                        <td>${exp.expenseamount}</td>
                                         <td>${exp.expensedate}</td>                   
                                        <td>To ${exp.purpose}</td>
                                        <td>${exp.description}</td>
                                        
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                                   
                                                   
                                                </table>
                                            </div>
											</div>
                                        </div>
                                    
                                </div> 
                            </div>
                            
                        </div>
                    </div>
                    
                                       
            
                </div>
             
                <div class="col-md-12" id="proprtyAdd">
                 <form action="loadProperty" method="POST" enctype="multipart/form-data">
                 <div class="modal-body" id="addModalbody">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <strong class="card-title">Add Property</strong>
                                </div>
                                <div class="col">
                                    <div class="btnright" style="float: right">
                                        <button type="submit" class="btn btn-info btn-sm">
                                    <i class="fa fa-save"></i>
                                </button>
                                        <button type="reset" class="btn btn-warning btn-sm">
                                    <i class="fa fa-reply"></i>
                                </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                           
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="card-header"><strong>Bulding Details</strong></div>
                                        <div class="card-body card-block">
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Building Name<span style="color:red;">*</span></label>
                                                 <input type="hidden" name="userid" id="userid"  class="form-control" value="${userid}">
                                                  <input type="hidden" name="prtyname" id="prtyname"  class="form-control" value="${property.build_name}">
                                                   <input type="hidden" name="prtyid" id="prtyid"  class="form-control" value="${property.buildingid}">
                                              
                                                <input type="text" name="BuildingName" id="BuildingName" placeholder="Building Name" class="form-control" pattern="^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 #,-]*)?$" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">No of Units<span style="color:red;">*</span></label>
                                                <input type="number" name="noOfUnits" id="noOfUnits" placeholder="No of units" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-check-inline form-check">
                                                    <label for="inline-radio1" class="form-check-label "><span style="color:red;">*</span>
                                                    <input type="radio" id="proptype" name="proptype" value="Appartment" class="form-check-input" required>Appartment&nbsp;&nbsp;
                                                </label>
                                                    <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="proptype" name="proptype" value="House" class="form-check-input" required>House&nbsp;&nbsp;
                                                </label>
                                                    <label for="inline-radio3" class="form-check-label ">
                                                    <input type="radio" id="proptype" name="proptype" value="Commercial" class="form-check-input" required>Commercial
                                                </label>
                                                </div>
                                            </div>
                                             
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Building Locality<span style="color:red;">*</span></label>
                                                <input type="text" id="blocality" name="blocality" placeholder="Building Locality" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required >
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">City<span style="color:red;">*</span></label>
                                                <input type="text" id="City" name="City" placeholder="City" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">District<span style="color:red;">*</span></label>
                                                <input type="text" id="district" name="district" placeholder="district" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">State<span style="color:red;">*</span></label>
                                                <input type="text" id="State" name="State" placeholder="State" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required>
                                            </div>
                                              
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Pincode<span style="color:red;">*</span></label>
                                                <input type="text" id="Pincode" name="Pincode" placeholder="Pincode" class="form-control" minlength="6" maxlength="7" required pattern="^[0-9]*$" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="card-header"><strong>Bulding Contacts</strong></div>
                                        <div class="card-body card-block">
                                            <div class="form-group">
   
                    <label for="company" class=" form-control-label" id="inputGroupFileAddon01">Image</label>
                                                    <div class="custom-file">
                                                        <input type="file"  id="prtyImg" name="prtyImg" >
                                                   
                                                    </div>
                                                    
                                                </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Contact Number<span style="color:red;">*</span></label>
                                                <input type="text" id="bcontact" name="bcontact" placeholder="Contact Number" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Alternate Number</label>
                                                <input type="text"  id="altcontact" name="altcontact" placeholder="Alternate Number" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Email Address<span style="color:red;">*</span></label>
                                                <input type="email"  id="bEmail" name="bEmail" placeholder="Email Address" class="form-control"  pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" required>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Bank Account Number</label>
                                                <input type="text"  id="bAcntNo" name="bAcntNo" placeholder="Account Number" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Account Name</label>
                                                <input type="text"  id="accountname" name="accountname" placeholder="Account Name" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">IFSC Code</label>
                                                <input type="text"  id="ifscCode" name="ifscCode" placeholder="Ifsc Code" class="form-control">
                                            </div>
                                            
                                            
                                            
                                            
                                            
                                            
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">UPID</label>
                                                <input type="text"  id="upiId" name="upiId" placeholder="1234569874@okaxis" class="form-control">
                                            </div>
                                            
                                            <div class="form-group">
                               					 <label>USC NO <span style="color:red;">*</span></label>
                               					 <input type="text" class="form-control" placeholder="Unique service number" name ="uscNo"  id="uscNo" minlength="9" maxlength="15"  pattern="^[0-9]*$" required>
                           						 </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Common Water Meter</label>
                                                <input type="text"id="comnWtrMeter" name="comnWtrMeter" minlength="9" maxlength="12"  pattern="^[0-9]*$" placeholder="Common Water Meter" class="form-control" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="card-header"><strong>Property Manager Details</strong></div>
                                        <div class="card-body card-block">
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager Name</label>
                                                <input type="text" id="mgrName" name="mgrName" placeholder="Manager Name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager PhoneNumber</label>
                                                <input type="text" id="mgrPhn" name="mgrPhn" placeholder="Manager PhoneNumber" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Alternate Number</label>
                                                <input type="text" id="mgrAltPhn" name="mgrAltPhn" placeholder="Alternate Number" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager Email</label>
                                                <input type="text" id="mgrMail" name="mgrMail" placeholder="Manager Email" class="form-control" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$">
                                            </div>
                                            	<div class="form-group">
                                                <label for="company" class=" form-control-label">Security Name</label>
                                                <input type="text" name="SecName" id="SecName" placeholder="Security Name" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" class="form-control">
                                            </div>
											<div class="form-group">
                                                <label for="company" class=" form-control-label">Security phone No</label>
                                                <input type="text" name="SecPhn" id="SecPhn" placeholder="Security phone No" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$">
                                            </div>
											<div class="form-group">
                                                <label for="company" class=" form-control-label">Security Email ID</label>
                                                <input type="text" name="SecEMail" id="SecEMail" placeholder="Security Email ID" class="form-control" pattern="[A-Za-z0-9._%
                                                0+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Notes</label>
                                                <textarea rows="2" cols="50"class="form-control" id="notes" name="notes"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                </form>
                                
                                
                            </div>
                        
               
                <div class="col-md-12" id="proprtyEditDetails">
            
              
                <form action ="EditPropertyDetails" method="POST" enctype="multipart/form-data">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <strong class="card-title">Edit Property</strong>
                                </div>
                                <div class="col">
                                    <div class="btnright" style="float: right">
                                        <button type="submit" class="btn btn-info btn-sm">
                                            <i class="fa fa-save"></i>
                                </button>
                                       <!--  <button type="reset" class="btn btn-warning btn-sm">
                                    <i class="fa fa-reply"></i>
                                </button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="card-header"><strong>Bulding Details</strong></div>
                                        <div class="card-body card-block">
                   
                                        
                                      
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Building Name <span style="color:red;">*</span></label>
                                                <input type="hidden" name="iBuildingId" id="iBuildingId" placeholder="Building Id" class="form-control" value="${property.buildingid}">
                                                 <input type="hidden" name="iUserId" id="iUserId" placeholder="Building Id" class="form-control" value="${property.userid}">
                                                <input type="text" name="iBuildingName" id="iBuildingName" placeholder="Building Name" class="form-control" value="${property.build_name}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">No of Units <span style="color:red;">*</span></label>
                                                <c:choose>
                                                <c:when test="${not empty property.noofflats}">
                                              
                                                <input type="number" name="iNoOfUnits" id="iNoOfUnits" placeholder="No of units" class="form-control" value="${property.noofflats}" required>
                                           </c:when>
                                           <c:otherwise>
                                           <input type="number" name="iNoOfUnits" id="iNoOfUnits" placeholder="No of units" class="form-control"  required>
                                           </c:otherwise>
                                            </c:choose>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-check-inline form-check">
                                                    <label for="inline-radio1" class="form-check-label "><span style="color:red;">*</span>
                                                    <input type="radio" id="iPrtyType" name="iPrtyType" value="Appartment" class="form-check-input" required>Appartment&nbsp;&nbsp;
                                                </label>
                                                    <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="iPrtyType" name="iPrtyType" value="House" class="form-check-input" required>House&nbsp;&nbsp;
                                                </label>
                                                    <label for="inline-radio3" class="form-check-label ">
                                                    <input type="radio" id="iPrtyType" name="iPrtyType"  value="Commercial" class="form-check-input" required>Commercial
                                                </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Building Locality <span style="color:red;">*</span></label>
                                                <input type="text" name="iBLocality" id="iBLocality" placeholder="Building Locality" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" value="${property.landmark}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">City <span style="color:red;">*</span></label>
                                                <input type="text" name="iCity" id="iCity" placeholder="City" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" class="form-control" value="${property.city}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">District <span style="color:red;">*</span></label>
                                                <input type="text" name="iDistrict" id="iDistrict" placeholder="District" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" class="form-control" value="${property.dist}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">State <span style="color:red;">*</span></label>
                                                <input type="text" name="iState" id="iState" placeholder="State" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" class="form-control" value="${property.state}" required>
                                            </div>
                                             
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Pincode <span style="color:red;">*</span></label>
                                                <input type="text" name="iPincode" id="iPincode" placeholder="Pincode" class="form-control" value="${property.zip}" minlength="6" maxlength="7" required pattern="^[0-9]*$" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="card-header"><strong>Bulding Contacts</strong></div>
                                        <div class="card-body card-block">
                                            <div class="form-group">
                                                    <label for="company" class=" form-control-label">Image</label>
                                                    <div class="custom-file">
                                                        <input type="file" name="iprtyImg" id="iprtyImg" >
                                                        <span style="color:blue">${property.prtyimg}</span>
                                                       <!--  <label class="custom-file-label" for="customFileLangHTML" data-browse="ID">Upload image(Required)</label> -->
                                                    </div>
                                                </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Contact Number <span style="color:red;">*</span></label>
                                              
                                              <c:choose>
                                              <c:when test="${roleid==1}">
                                                <input type="text" name="iCntNo" id="iCntNo" placeholder="Contact Number" class="form-control" value="${property.contact}" minlength="10" maxlength="12"  pattern="^[0-9]*$" required >
                                            </c:when>
                                            <c:otherwise>
                                            <input type="text" name="iCntNo" id="iCntNo" placeholder="Contact Number" class="form-control" value="${property.contact}" minlength="10" maxlength="12"  pattern="^[0-9]*$" required disabled>
                                            </c:otherwise>
                                            </c:choose>
                                            
                                            
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Alternate Number</label>
                                                <input type="text" name="iAltNo" id="iAltNo" placeholder="Alternate Number" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$" value="${property.altcontact}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Email Address <span style="color:red;">*</span></label>
                                              
                                              <c:choose>
                                              <c:when test="${roleid==1}">
                                                <input type="email" name="iEmail" id="iEmail" placeholder="Email Address" class="form-control" value="${property.buldingmail}" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" required >
                                            </c:when>
                                            <c:otherwise>
                                             <input type="email" name="iEmail" id="iEmail" placeholder="Email Address" class="form-control" value="${property.buldingmail}" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" required disabled>
                                            
                                            </c:otherwise>
                                            </c:choose>
                                            </div>
                                            
                                            
                                             <div class="form-group">
                                                <label for="company" class=" form-control-label">Bank Account Number</label>
                                                <input type="text"  id="ibAcntNo" name="ibAcntNo" placeholder="Account Number" class="form-control" value="${property.bankAcntNo}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Account Name</label>
                                                <input type="text"  id="e_accountname" name="e_accountname" placeholder="Account Name" class="form-control" value="${property.accountName}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">IFSC Code</label>
                                                <input type="text"  id="e_ifscCode" name="e_ifscCode" placeholder="Ifsc Code" class="form-control" value="${property.ifscCode}">
                                            </div>
                                            
                                            
                                            
                                            
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">UPID</label>
                                                <input type="text" name="iUpiId" id="iUpiId" placeholder="1234569874@okaxis" class="form-control" value="${property.upiid}">
                                            </div>
            
                                       			<div class="form-group">
                               					 <label>Usc No <span style="color:red;">*</span></label>
                               					 <c:choose>
                                              <c:when test="${roleid==1}">
                               					 <input type="text" class="form-control" placeholder="Unique service number" name ="iusc"  id="iusc" value="${property.usc}" minlength="9" maxlength="15"  pattern="^[0-9]*$" required >
                           						 </c:when>
                           						 <c:otherwise>
                           						 
                           						 <input type="text" class="form-control" placeholder="Unique service number" name ="iusc"  id="iusc" value="${property.usc}" minlength="9" maxlength="15"  pattern="^[0-9]*$" required disabled>
                           						 </c:otherwise>
                           						 </c:choose>
                           						 
                           						 </div>
                                         
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Common Water Meter </label>
                                                <input type="text" name="iWtrCmnMeter" id="iWtrCmnMeter" placeholder="Common Water Meter" class="form-control" minlength="9" maxlength="12"  pattern="^[0-9]*$" value="${property.watermeterno}" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"> 
                                    <div class="card">
                                        <div class="card-header"><strong>Property Manager Details</strong></div>
                                        <div class="card-body card-block">
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager Name</label>
                                                <input type="text" name="iMgrName" id="iMgrName" placeholder="Manager Name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" value="${property.mgr_name}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager PhoneNumber</label>
                                                <input type="text" name="iMgrtNo" id="iMgrtNo" placeholder="Manager PhoneNumber" minlength="10" maxlength="12"  pattern="^[0-9]*$" class="form-control" value="${property.mgr_phone}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Alternate Number</label>
                                                <input type="text" name="iMgrtAltNo" id="iMgrtAltNo" placeholder="Alternate Number" minlength="10" maxlength="12"  pattern="^[0-9]*$" class="form-control" value="${property.mgr_alt_phone}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager Email</label>
                                                <input type="text" name="iMgrEmail" id="iMgrEmail" placeholder="Manager Email" class="form-control"  pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" value="${property.mgr_email}">
                                            </div>
                                                  	<div class="form-group">
                                                <label for="company" class=" form-control-label">Security Name</label>
                                                <input type="text" name="iSecName" id="iSecName" placeholder="Security Name" class="form-control" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" value="${property.secname}">
                                            </div>
											<div class="form-group">
                                                <label for="company" class=" form-control-label">Security phone No</label>
                                                <input type="text" name="iSecPhn" id="iSecPhn" placeholder="Security phone No" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$" value="${property.secphn}">
                                            </div>
											<div class="form-group">
                                                <label for="company" class=" form-control-label">Security Email ID</label>
                                                <input type="text" name="iSecEmail" id="iSecEmail" placeholder="Security Email ID" class="form-control" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" value="${property.secemail}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Notes</label>
                                                <textarea rows="2" name="iNotes" id="iNotes" cols="50" class="form-control" ></textarea>
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
                <!--                Property edit details ends here-->
                <div class="clearfix"></div>
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <!-- <footer class="site-footer">
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
    <script>
    $(document).ready(function() {
		  $("#proprtyAdd").on("hidden.bs.modal", function() {
		    $("#addModalbody").html("");
		  });
		});
    
        var unitcount=$("#unitCount").val();
     
         if(unitcount==0) {
             
        	  $("#proprtyAdd").hide();
        	 $("#proprtyEditDetails").show();
        	 $("#proprtyIdDetails").hide();
             }
         else{
        	 $("#proprtyEditDetails").hide();
        	 $("#proprtyIdDetails").show();
        	
        	  $("#proprtyAdd").hide();
             }
        
        $("#proprtyPlusAdd").click(function() {
            $("#proprtyIdDetails").hide();
            $("#proprtyEditDetails").hide();
            $("#proprtyAdd").show();
        });
        //        $("#proprtyIdDetails").hide();
        $("#proprtyIdshow").click(function() {
            $("#proprtyAdd").hide();
            $("#proprtyEditDetails").hide();
            $("#proprtyIdDetails").show();
        });
       
        function proprtyIdEdit(buildingid,userid,build_name,upiid,
                proptype,landmark,city,state,
                dist,zip,contact,altcontact, noofflats,eachfloorflats,meterno,watermeterno,usc
              ,mgr_name,mgr_phone,mgr_alt_phone
                 ,mgr_email,status,secName,secPhn,secEmail,buildingmail){
        
if(proptype=='Appartment'){
        $('input:radio[name=iPrtyType]:nth(0)').attr('checked',true);
}
else if(proptype=='House'){
        $('input:radio[name=iPrtyType]:nth(1)').attr('checked',true);
}
else if(proptype=='Commercial'){
        $('input:radio[name=iPrtyType]:nth(2)').attr('checked',true);
}
      
        
             $("#iBuildingId").val(buildingid);
             $("#iBuildingName").val(build_name);
             $("#iUserId").val(userid);
            // $("#iPrtyType").val(proptype);
             $("#iBLocality").val(landmark);
             $("#iNoOfUnits").val(noofflats);
             $("#iCity").val(city);

             $("#iState").val(state);
             $("#iPincode").val(zip);
             $("#iCntNo").val(contact);
             $("#iAltNo").val(altcontact);
             $("#iEmail").val(buildingmail);

             $("#iUpiId").val(upiid);
             $("#iusc").val(usc);
             $("#iWtrCmnMeter").val(watermeterno);
             $("#iMgrName").val(mgr_name);
             $("#iMgrtNo").val(mgr_phone);
             $("#iMgrtAltNo").val(mgr_alt_phone);
             $("#iDistrict").val(dist);
            

            
             $("#iMgrEmail").val(mgr_email);
             $("#iSecName").val(secName);
             $("#iSecPhn").val(secPhn);
             $("#iSecEmail").val(secEmail);
             
             var prtynote=$("#prtyNote").text();
             $("#iNotes").val(prtynote);
           


             $("#proprtyAdd").hide();
             $("#proprtyIdDetails").hide();
            
             $("#proprtyEditDetails").show();
             
            }
     
        $("#singlePropety").click(function() {
            $("#proprtyIdDetails").show();
        });
    </script>
</body>
</html>