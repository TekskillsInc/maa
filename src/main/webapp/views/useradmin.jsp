<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MPRTS|Dashboard</title>
    <meta name="description" content="Maa Properties">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <style>
    body{
    	font-size:13px;
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
            bottom: -2px;
            font-size: 35px;
        }

        ::placeholder {
            font-size: 13px;
        }

        #proced-panel {
            background: #f1f2f7;
            margin-left: 0px !important;
        }

        #contentWidth {
            padding: 40px 100px 10px 100px !important;
            height: 720px;
        }
    </style>
</head>

<body>
    <div class="right-panel" id="proced-panel" style="margin-top: 0px;">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><img src="resources/img/logo/rounded_logo.png" alt="MaaProperties-Logo"> Maa Properties</a>
                    <a class="navbar-brand hidden" href="./"><img src="resources/img/logo/rounded_logo.png" alt="Logo"></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">3</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 3 Notification</p>
                                <a class="dropdown-item media" href="#">
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
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="resources/images/admin.jpg" alt="User Avatar">
                        </a>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>
                            <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Change Password</a>
                            <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- /#header -->
        <!-- Content -->
        <div class="content" id="contentWidth">
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="col-md-12">
                 <form action="updateProperty" method="POST" enctype="multipart/form-data">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-9">
                                    <strong class="card-title">Please add your property details before proceeding</strong>
                                </div>
                                <div class="col-3">
                                    <div class="ActionBtns">
                                        <button type="submit" class="btn btn-success btn-sm">
                                            <i class="fa fa-save"></i>
                                        </button>
                                        <button type="reset" class="btn btn-danger btn-sm">
                                           <i class="fa fa-reply"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                             <div class="col-md-12" id="proprtyAdd">
                
                   
                         <c:forEach var="property" items="${propertyList}">
                       
                            <div class="row">
                           
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="card">
                                   
                                        <div class="card-header"><strong>Bulding Details</strong></div>
                                        <div class="card-body card-block">
                                        
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Building Name</label>
                                                 <input type="hidden" name="userid" id="userid"  class="form-control" value="${userid}">
                                                <input type="hidden" name="ptyId" id="prtyId" placeholder="prtyId" class="form-control" value="${property.buildingid}">
                                                <input type="text" name="BuildingName" id="BuildingName" placeholder="Building Name" class="form-control" value="${property.build_name}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">No of Units</label>
                                                <input type="number" name="noOfUnits" id="noOfUnits" placeholder="No of units" class="form-control" >
                                            </div>
                                            <div class="form-group">
                                                <div class="form-check-inline form-check">
                                                    <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="proptype" name="proptype" value="Appartment" class="form-check-input">Appartment&nbsp;&nbsp;
                                                </label>
                                                    <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="proptype" name="proptype" value="House" class="form-check-input">House&nbsp;&nbsp;
                                                </label>
                                                    <label for="inline-radio3" class="form-check-label ">
                                                    <input type="radio" id="proptype" name="proptype" value="Commercial" class="form-check-input">Commercial
                                                </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Building Locality</label>
                                                <input type="text" id="blocality" name="blocality" placeholder="Building Locality" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">City</label>
                                                <input type="text" id="City" name="City" placeholder="City" class="form-control">
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">District</label>
                                                <input type="text" id="district" name="district" placeholder="district" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">State</label>
                                                <input type="text" id="State" name="State" placeholder="State" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Pincode</label>
                                                <input type="text" id="Pincode" name="Pincode" placeholder="Pincode" class="form-control">
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
                                                        <input type="file" class="custom-file-input" id="bImage" name="bImage">
                                                        <label class="custom-file-label" for="customFileLangHTML" data-browse="ID">Upload image(Required)</label>
                                                    </div>
                                                </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Contact Number</label>
                                                <input type="text" id="bcontact" name="bcontact" placeholder="Contact Number" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Alternate Number</label>
                                                <input type="text"  id="altcontact" name="altcontact" placeholder="Alternate Number" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Email Address</label>
                                                <input type="email"  id="bEmail" name="bEmail" placeholder="Email Address" class="form-control" value="${property.buldingmail}">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">UPID</label>
                                                <input type="number"  id="upiId" name="upiId" placeholder="1234569874@okaxis" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Common Current Meter</label>
                                                <input type="text"  id="comnCurMeter" name="comnCurMeter" placeholder="Common Current Meter" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Common Water Meter</label>
                                                <input type="text"id="comnWtrMeter" name="comnWtrMeter" placeholder="Common Water Meter" class="form-control">
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
                                                <input type="text" id="mgrName" name="mgrName" placeholder="Manager Name" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager PhoneNumber</label>
                                                <input type="text" id="mgrPhn" name="mgrPhn" placeholder="Manager PhoneNumber" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Alternate Number</label>
                                                <input type="text" id="mgrAltPhn" name="mgrAltPhn" placeholder="Alternate Number" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Manager Email</label>
                                                <input type="text" id="mgrMail" name="mgrMail" placeholder="Manager Email" class="form-control">
                                            </div>
                                            	<div class="form-group">
                                                <label for="company" class=" form-control-label">Security Name</label>
                                                <input type="text" name="SecName" id="SecName" placeholder="Security Name" class="form-control">
                                            </div>
											<div class="form-group">
                                                <label for="company" class=" form-control-label">Security phone No</label>
                                                <input type="text" name="SecPhn" id="SecPhn" placeholder="Security phone No" class="form-control">
                                            </div>
											<div class="form-group">
                                                <label for="company" class=" form-control-label">Security Email ID</label>
                                                <input type="text" name="SecEMail" id="SecEMail" placeholder="Security Email ID" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Notes</label>
                                                <textarea rows="2" cols="50"class="form-control" id="notes" name="notes"></textarea>
                                            </div>
                                        </div>
                                    </div>
                               </div>
                               </div>
                               </c:forEach>
                               
                            </div>
                           
                        </div>

                    </div>
                     </form>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
      <!--   <footer class="site-footer">
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
    
</body>

</html>