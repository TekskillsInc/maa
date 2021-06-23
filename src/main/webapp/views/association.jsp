<!doctype html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="no-js" lang="">


<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Association|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <style>
        .right-panel .navbar-brand img {
            max-width: 47px;
        }

        .dropdown-menu {
            width: 350px !important;
        }

        .showAllBtn {
            float: right;
        }

        .showAllBtn [type="checkbox"] {
            width: 18px;
            height: 18px;
            position: absolute;
            top: 2px;
            background-color: #fff;
        }

        .custmsearchbtn {
            position: relative;
        }

        .custmsearchbtn button {
            position: absolute;
            right: 7%;
        }

        .custmsearchbtn input {
            width: 280px !important;
        }

        #cardcustm {
            height: 470px !important;
            overflow-y: scroll;
            overflow-x: hidden;
        }

        #userDisply {
            cursor: pointer;
        }

        .selectbtn {
            float: right;
        }

        .card img {
            height: 238px;
        }

        .card-header a {
            font-size: 23px;
        }

        #assoctionmembr {
            cursor: pointer;
        }

        .addAssocition {
            cursor: pointer;
            color: #27ae60;
        }

        .addAssocition i {
            color: #27ae60;
        }
        
        .headCustm{
        	margin-bottom:15px;
        }

        .headCustm a {
            font-size: 14px;
        }

        .headCustm h6 {
            font-weight: 600;
            font-size: 14px;
        }
    </style>
</head>

<body>
    <!-- Left Panel -->
  
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="resources/img/logo/rounded_logo.png" alt="">
    </div>

    <div class="clearfix"></div>
    <!-- Right Panel -->

        <div class="clearfix"></div>
        <!-- Content -->
        <div id="right-panel" class="right-panel" style="margin-top: 0px;">
       
        
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <strong class="card-title">Association</strong>
                                </div>
                                <div class="col-4">
                                   <c:if test='${roleid==1||roleid==2}'>
                                    <div class="addButton" style="float: right">
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#associtionAddModal" id="modalClose"><i class="fa fa-plus"></i></button>
                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
							
                            <div class="row">
						  <c:forEach var="aso" items="${assoiciationList}">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                    <div class="card-header user-header headCustm alt">
										<div class="iconsDiv" style="float: right">
											<a data-toggle="modal" data-target="#associatinIDModal" onclick="viewAssociation('${aso.name}','${aso.memType}','${aso.ownerid}','${aso.tenantid}',
											'${aso.startdate}','${aso.enddate}','${aso.contact}','${aso.email}','${aso.pic}')"><i class="fa fa-eye"></i></a>&nbsp;
										    <c:if test='${roleid==1||roleid==2}'>
											<a data-toggle="modal" data-target="#associtionEditModal" onclick="EditAssociation('${aso.id}','${aso.name}','${aso.memType}','${aso.ownerid}','${aso.tenantid}',
											'${aso.startdate}','${aso.enddate}','${aso.contact}','${aso.email}','${aso.pic}','${aso.flat}')"><i class="fa fa-edit"></i></a>
											</c:if>
										</div>
                                        <div class="media">
                                        <c:choose>
                                        <c:when test='${not empty aso.pic}'>
                                        <a href="#">
                                            <img class="align-self-center rounded-circle mr-1 mt-3" style="width:90px; height:90px;" alt="" src="resources/maa-images/${aso.pic}">
                                        </a>
                                        </c:when>
                                        <c:otherwise>
                                        <a href="#">
                                            <img class="align-self-center rounded-circle mr-1 mt-3" style="width:90px; height:90px;" alt="" src="resources/maa-images/us2.jpg">
                                        </a>
                                        </c:otherwise>
                                        </c:choose>
                                            
                                            <div class="media-body pt-4">
                                                <h6 class="display-6">${aso.name}</h6>
                                                <p><i class="fa fa-user"></i>&nbsp;${aso.memType} <br>
                                                    <i class="fa fa-phone"></i>&nbsp;<a href="${aso.contact}">&nbsp;${aso.contact}</a><br>
                                                    <i class="fa fa-calendar"></i>&nbsp;<fmt:formatDate value="${aso.startdate}" pattern="dd-MM-yyyy"/> To <fmt:formatDate value="${aso.enddate}" pattern="dd-MM-yyyy"/>
                                                    
                                                    
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
				
                    </div>
                </div>
                <!--                modal popup for ID association-->
                <div class="modal fade" id="associatinIDModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header vendorTitle">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="modal-title modalIDtitle" id="exampleModalLabel">Association Member Details</h5>
                                        
                                    </div>
                                    <div class="col">
                                        <div class="btnright" style="float: right">
                                            
                                            
                                            <button type="button" class="btn btn-sm btn-info" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-body">
                                <div class="row" id="idinformatinAsso">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <div class="profilePic">
                                                            <div class="tab-content" id="pills-tabContent">
                                                                <div class="tab-pane fade show active" id="pills-image" role="tabpanel" aria-labelledby="pills-image-tab">
                                                                    <div class="vendor-image my-4 text-center">
                                                                        <img id="Vi_pic" class="img-fluid">
                                                                    </div>
                                                                </div>
                                                          
                                                            </div>
                                                         
                                                        </div>
                                                    </div>
                                                  
                                                    <div class="col-md-7">
                                                        <h4 class="py-3">Information</h4>
                                                        <div class="row">
                                                            <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                <label class=" form-control-label"><i class="fa fa-user"></i>&nbsp;Member Type:</label></div>
                                                            <div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                                <p class="form-control-static" id="vi_memtype"> </p>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                <label class=" form-control-label"> <i class="fa fa-user"></i>&nbsp; Name:</label></div>
                                                            <div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                                <p class="form-control-static" id="vi_name"></p> 
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                <label class=" form-control-label"><i class="fa fa-user"></i>&nbsp;Designation:</label></div>
                                                            <div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                             
                                                                <p class="form-control-static" id="vi_usrType"></p>
                                                                
                                                                 
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                <label class=" form-control-label"> <i class="fa fa-phone"></i>&nbsp;Mobile No:</label></div>
                                                            <div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                                 <p class="form-control-static" id="vi_contact"></p> 
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                <label class=" form-control-label"><i class="fa fa-envelope"></i>&nbsp; Email:</label></div>
                                                            <div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                            <p class="form-control-static" id="vi_email"></p> 
                                                            </div>
                                                        </div>
                                                     
                                                        <div class="row">
                                                            <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                <label class=" form-control-label"><i class="fa fa-calendar"></i>&nbsp; Duration:</label></div>
                                                            <div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                                <p class="form-control-static"id="vi_duration"> </p>
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
                <!--                Modal popup add association start here-->
                <div class="modal fade" id="associtionAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header vendorTitle">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Association Member</h5>
                                    </div>
                                    <div class="col">
                                        <div class="btnright" style="float: right">
                                            <button type="button" class="btn btn-sm btn-info" id="VendorIdEdit">
                                   <!--  <i class="fa fa-save"></i> -->
                                </button>
                                            <button type="button" class="btn btn-sm btn-info" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form action="SaveAssoiciationUser" method="POST" id="addForm">
                            <div class="modal-body" id="addModalBody">
                              <div class="row">
                                    <div class="col-md-6">
                                    <div class="form-group">
                                    <input type="hidden" id="prtyId" name="prtyId" placeholder="Ex:PTY1" value="${prptyid}" class="form-control">
                                     <input type="hidden" id="prtyName" name="prtyName" placeholder="Ex:PTY1" value="${prptyName}" class="form-control">
                                     <input type="radio" id="chkBox" name="chkBox" value="O" onclick="getOwner('${prptyid}')" required> Owner
                                      <input type="radio" id="chkBox" name="chkBox" value="T" onclick="getTenant('${prptyid}')" required> Tenant
                                      <span style="color:red;">*</span>
                                     </div>
                                       <div class="form-group" id="userDiv">
                                            <label for="company" class=" form-control-label">User Type</label>
                                            <div id="custm-select" >
                                                <select class="custom-select" id="usergroup" name="usergroup" onchange="getUserDetails()" >
							          </select>
                                            </div>
                                        </div>
                                   <div class="form-group">
                                            <label for="company" class=" form-control-label">Name</label>
                                            <input type="text" id="usrName" name="usrName"  class="form-control" readonly>
                                             <input type="hidden" id="ownerid" name="ownerid"  class="form-control">
                                              <input type="hidden" id="tntId" name="tntId"  class="form-control">
                                              <input type="hidden" id="add_flatno" name="flatno" class="form-control" readonly>
                                        </div> 
                                                                		
                                        <div class="form-group">
                                            <label for="company" class=" form-control-label">Email Id</label>
                                            <input type="text" id="usrMail" name="usrMail" class="form-control" readonly>
                                              
                                        </div>
                                         
                                        <div class="form-group">
                                            <label for="company" class=" form-control-label">Mobile Number</label>
                                            <input type="text" id="usrcontact" name="usrcontact"  class="form-control" readonly>
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                    	
                                        <div class="form-group">
                                            <label for="company" class=" form-control-label">Member Type<span style="color:red;">*</span></label>
                                            <div id="custm-select">
                                                <select class="custom-select" id="memType" name="memType" required>
                                                        <option value="">Select Member</option>
                                                        <option value="President">President</option>
                                                        <option value="Vice President">Vice President</option>
                                                        <option value="Secretary">Secretary</option>
                                                        <option value="Joint Secretary">Joint Secretary</option>
                                                        <option value="Treasurer">Treasurer</option>
                                                        <option value="Member">Member</option>
                                                      </select>
                                            </div>
                                        </div>
                                   
										<div class="row">
											<div class="col">
										
												<div class="form-group">
                                            <label for="company" class=" form-control-label">Start Date <span style="color:red;">*</span></label>
                                            <input type="date" id="strtDate" name="strtDate" placeholder="Enter id number" class="form-control" required>
                                        </div>
											</div>
											<div class="col">
												<div class="form-group">
                                            <label for="company" class=" form-control-label">To Date<span style="color:red;">*</span></label>
                                            <input type="date" id="endDate" name="endDate" placeholder="Enter id number" class="form-control" required >
                                        </div>
                                        <div class="form-group">
                                        <img class="align-self-center rounded-circle mr-1 mt-3" style="width:90px; height:90px;" alt="" id="usrpicImg" >
                                        </div>
											</div>
											 
										</div>
                                      
                                        
                                    </div>
									
                                </div>
                            
                            </div>
							
							<div class="modal-footer">
                                <button type="submit" class="btn btn-secondary">Save</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div> 
                            </form>
                        </div>
                    </div>
                </div>
				
				
				
				<div class="modal fade" id="associtionEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header vendorTitle">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="modal-title">Edit Association Member</h5>
                                    </div>
                                    <div class="col">
                                        <div class="btnright" style="float: right">
                                            <button type="button" class="btn btn-sm btn-info" id="VendorIdEdit">
                                   <!--  <i class="fa fa-save"></i> -->
                                </button>
                                            <button type="button" class="btn btn-sm btn-info" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form action="updateAssoiciationUser" method="POST">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                    <input type="hidden" id="Ed_prtyId" name="Ed_prtyId" placeholder="Ex:PTY1" value="${prptyid}" class="form-control">
                                     <input type="hidden" id="Ed_prtyName" name="Ed_prtyName" placeholder="Ex:PTY1" value="${prptyName}" class="form-control">
                                     <input type="radio" id="owr_chkBox" name="Ed_chkBox" value="O" onclick="getOwnerEdit('${prptyid}')"> Owner
                                      <input type="radio" id="tnt_chkBox" name="Ed_chkBox" value="T" onclick="getTenantEdit('${prptyid}')"> Tenant
                                     </div>
                                       <div class="form-group" id="Ed_userDiv">
                                            <label for="company" class=" form-control-label">User Type</label>
                                            <div id="custm-select" >
                                                <select class="custom-select" id="Ed_usergroup" name="Ed_usergroup" onchange="EditgetUserDetails()">
							          </select>
                                            </div>
                                        </div>
                                       
                                         <div class="form-group">
                                            <label for="company" class=" form-control-label">Name</label>
                                            <input type="text" id="Ed_usrName" name="Ed-usrName"  class="form-control" readonly>
                                             <input type="hidden" id="Ed_ownerid" name="Ed_ownerid"  class="form-control">
                                              <input type="hidden" id="Ed_tntId" name="Ed_tntId"  class="form-control">
                                              <input type="hidden" id="Ed_associationId" name="Ed_associationId"  class="form-control">
                                              <input type="hidden" id="Ed_flatno" name="Ed_flatno" class="form-control" >
                                        </div> 
                                 		<!-- <div class="form-group">
                                            <label for="company" class=" form-control-label">Flat No</label>
                                            <input type="text" id="Ed_flatno" name="Ed_flatno" class="form-control" readonly>
                                              
                                        </div> -->
                                        <div class="form-group">
                                            <label for="company" class=" form-control-label">Email Id</label>
                                            <input type="text" id="Ed_usrMail" name="Ed_usrMail" class="form-control" readonly>
                                              
                                        </div>
                                         
                                        <div class="form-group">
                                            <label for="company" class=" form-control-label">Mobile Number</label>
                                            <input type="text" id="Ed_usrcontact" name="Ed_usrcontact"  class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="company" class=" form-control-label">Member Type<span style="color:red;">*</span></label>
                                            <div id="custm-select">
                                                <select class="custom-select" id="Ed_memType" name="Ed_memType" required>
                                                        <option selected>Select Member</option>
                                                        <option value="President">President</option>
                                                        <option value="Vice President">Vice President</option>
                                                        <option value="Secretary">Secretary</option>
                                                        <option value="Joint Secretary">Joint Secretary</option>
                                                        <option value="Treasurer">Treasurer</option>
                                                        <option value="Member">Member</option>
                                                      </select>
                                            </div>
                                        </div>
                                      
										<div class="row">
											<div class="col">
												<div class="form-group">
                                            <label for="company" class=" form-control-label">Start Date<span style="color:red;">*</span></label>
                                            <input type="date" id="Ed_strtDate" name="Ed_strtDate" placeholder="Enter id number" class="form-control" required>
                                        </div>
											</div>
											<div class="col">
												<div class="form-group">
                                            <label for="company" class=" form-control-label">To Date<span style="color:red;">*</span></label>
                                            <input type="date" id="Ed_endDate" name="Ed_endDate" placeholder="Enter id number" class="form-control" required>
                                        </div>
                                          <div class="form-group">
                                        <img class="align-self-center rounded-circle mr-1 mt-3" style="width:90px; height:90px;" alt="" id="Ed_usrpicImg" >
                                        </div>
											</div>
										</div>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-secondary">Save</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--                Association edit details ends here-->
				
				
				
				
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        
        <!-- /.site-footer -->
    </div>
   
   <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    

    
<script>
$('#modalClose').on('click',function(){
$('#addForm').trigger("reset");
});
</script>
<script>
$('#userDiv').hide();
function getOwner(prtyid){
	$('#userDiv').show();
	$('#usergroup').empty();
	$('#usergroup').append($('<option/>').attr("value", "").text("--Select Owner--"));
	$.ajax({
	    type: "POST",
	    url: "getownersByProperty?prtyid="+prtyid,
	    cache: false,
	    async: false,               
	    success: function(response){ 
	    	
	              if(response!=null){
		              for(var i=0;i<response.length;i++){
		            	  var ownername=response[i].ownername;
				            ownername=ownername.replace(/ /g,'-');
				            var flatno=response[i].flatno;
				            var pic=response[i].pic;
				          
				            if(pic==''){
					            pic="us2.jpg";
					            }
			              var ownerVal=response[i].ownerid+'_'+response[i].email+'_'+ownername+'_'+response[i].contact+'_'+response[i].flatno+'_'+pic;
	            	  $('#usergroup').append(
								'<option value=' +ownerVal+ '>' + ownername+'/'+flatno
										+ '</option>');
		              }
	            }
	       
	         },
	    error: function(){                                                                                 
	    }                                                       
	});      
	
}
function getTenant(prtyid){
	$('#userDiv').show();
	$('#usergroup').empty();
	$('#usergroup').append($('<option/>').attr("value", "").text("--Select Tenant--"));
	$.ajax({
	    type: "POST",
	    url: "geTenantsByProperty?prtyid="+prtyid,
	    cache: false,
	    async: false,               
	    success: function(response){  
	    
	              if(response!=null){
		              for(var i=0;i<response.length;i++){
			             
		            	  var tntname=response[i].tenantname;
				            tntname=tntname.replace(/ /g,'-');
				            var flatno=response[i].flatno;
				            var pic=response[i].pics;
				         
				            if(pic==''){
					            pic="us2.jpg";
					            }
			              var ownerVal=response[i].tenantid+'_'+response[i].email+'_'+tntname+'_'+response[i].contact+'_'+response[i].flatno+'_'+pic;
			              
	            	  $('#usergroup').append(
								'<option value=' +ownerVal+ '>' + tntname+'/'+flatno
										+ '</option>');
		              }
	            }
	       
	         },
	    error: function(){                                                                                 
	    }                                                       
	});      
}

function getOwnerEdit(prtyid){
	$('#Ed_userDiv').show();
	$('#Ed_usergroup').empty();
	$('#Ed_usergroup').append($('<option/>').attr("value", "").text("--Select Owner--"));
	$.ajax({
	    type: "POST",
	    url: "getownersByProperty?prtyid="+prtyid,
	    cache: false,
	    async: false,               
	    success: function(response){ 
	    	
	              if(response!=null){
		              for(var i=0;i<response.length;i++){
		            var ownername=response[i].ownername;
		            ownername=ownername.replace(/ /g,'-');
		          var  flatno=response[i].flatno;
		          var pic=response[i].pic;
		            if(pic==''){
			            pic="us2.jpg";
			            }
			              var ownerVal=response[i].ownerid+'_'+response[i].email+'_'+ownername+'_'+response[i].contact+'_'+response[i].flatno+'_'+pic;
	            	  $('#Ed_usergroup').append(
								'<option value=' +ownerVal+ '>' +ownername+'/'+flatno
										+ '</option>');
		              }
	            }
	       
	         },
	    error: function(){                                                                                 
	    }                                                       
	});      
	
}
function getTenantEdit(prtyid){
	$('#Ed_userDiv').show();
	$('#Ed_usergroup').empty();
	$('#Ed_usergroup').append($('<option/>').attr("value", "").text("--Select Tenant--"));
	$.ajax({
	    type: "POST",
	    url: "geTenantsByProperty?prtyid="+prtyid,
	    cache: false,
	    async: false,               
	    success: function(response){  
	    
	              if(response!=null){
		              for(var i=0;i<response.length;i++){
		            var tntname=response[i].tenantname;
		            tntname=tntname.replace(/ /g,'-');
		            var flatno=response[i].flatno;
		            var pic=response[i].pics;
		            if(pic==''){
			            pic="us2.jpg";
			            }
			              var ownerVal=response[i].tenantid+'_'+response[i].email+'_'+tntname+'_'+response[i].contact+'_'+response[i].flatno+'_'+pic;
			              
	            	  $('#Ed_usergroup').append(
								'<option value=' +ownerVal+ '>' + tntname+'/'+flatno
										+ '</option>');
		              }
	            }
	       
	         },
	    error: function(){                                                                                 
	    }                                                       
	});      
}



function getUserDetails(){


var tntid=0;
var ownerid=0;
var rent = $('#Ed_rentEditDisply').prop("checked");
var user = $('#usergroup').val();
var userVal = $('#usergroup').val();

var arr = userVal.split("_");
var radioBtn = $('#chkBox').prop("checked");

if(radioBtn==true){
	var radioval=$('#chkBox').val();
	if(radioval=='O'){
		ownerid=arr[0];
	
		$('#ownerid').val(arr[0]);
		}
	else if(radioval=='T'){
		tntid=arr[0];
		
		$('#tntId').val(arr[0]);
	}
	}


var usrMail=arr[1];
var userName = arr[2];
var contact=arr[3];
var flatno=arr[4];
var usrPic=arr[5];

userName=userName.replace(/-/g, " ");

$('#usrMail').val(usrMail);
$('#usrcontact').val(contact);
$('#usrName').val(userName);
$('#add_flatno').val(flatno);
//$('#usrpic').val(arr[3]);
var usrPic=arr[5];
var path = "resources/maa-images";
if(typeof usrPic=='undefined'){
	usrPic='u1.png';
	var oimage = path + "/" + usrPic;
	$("#usrpicImg").attr("src", oimage);

}else if(usrPic=='') {
	usrPic='u1.png';
	var oimage = path + "/" + usrPic;
	$("#Ed_usrpicImg").attr("src", oimage);
	}
else{

	var oimage = path + "/" + usrPic;
	$("#usrpicImg").attr("src", oimage);
	
}
	
}
function EditgetUserDetails(){


	var tntid=0;
	var ownerid=0;
	var rent = $('#Ed_rentEditDisply').prop("checked");
	
	var userVal = $('#Ed_usergroup').val();


	var arr = userVal.split("_");
	var OradioBtn = $('#owr_chkBox').prop("checked");
	var TradioBtn = $('#tnt_chkBox').prop("checked");
	var id=arr[0];
	if(OradioBtn==true){
		
			
		
			$('#Ed_ownerid').val(id);
			}
		else if(TradioBtn==true){
			
			
			
			$('#Ed_tntId').val(id);
		}
	var usrMail=arr[1]	;
	var userName = arr[2];
	var contact=arr[3];
	var flatno=arr[4];
	var usrPic=arr[5];
	
	userName=userName.replace(/-/g, " ");

	$('#Ed_usrMail').val(usrMail);
	$('#Ed_usrcontact').val(contact);
	$('#Ed_usrName').val(userName);
	$('#Ed_flatno').val(flatno);
	
	var path = "resources/maa-images";
	if(typeof usrPic=='undefined'){
		usrPic='u1.png';
		var oimage = path + "/" + usrPic;
		$("#Ed_usrpicImg").attr("src", oimage);
		}else if(usrPic=='') {
			usrPic='u1.png';
			var oimage = path + "/" + usrPic;
			$("#Ed_usrpicImg").attr("src", oimage);
			}else{
			
			var oimage = path + "/" + usrPic;
			$("#Ed_usrpicImg").attr("src", oimage);
			}

		
	}
function viewAssociation(name,memType,ownerid,tntid,startdate,enddate,contact,email,pic){
	
	var duration=startdate+" TO "+enddate;
	$('#vi_duration').text(duration);
	$('#vi_name').text(name);
	$('#vi_memtype').text(memType);
	$('#vi_contact').text(contact);
	$('#vi_email').text(email);
	if(ownerid!=0){
		$('#vi_usrType').text("Owner");
		}
	if(tntid!=0){
		$('#vi_usrType').text("Tenant");
		}
	var path = "resources/maa-images";
	if(pic!=''){
		var oimage = path + "/" + pic;
		$("#Vi_pic").attr("src", oimage);
		}else{
			pic='u1.png';
			var oimage = path + "/" + pic;
			$("#Vi_pic").attr("src", oimage);
			}
	
	
}


function EditAssociation(id,name,memType,ownerid,tntid,startdate,enddate,contact,email,pic,flatno){


	var prtyid=$('#Ed_prtyId').val();
	$('#Ed_usrName').val(name);
	$('#Ed_associationId').val(id);
	
	$('#Ed_usrcontact').val(contact);
	$('#Ed_usrMail').val(email);
	$('#Ed_endDate').val(enddate);
	$('#Ed_strtDate').val(startdate);

	
	if(ownerid!=0){
		
		$('#owr_chkBox').prop("checked",true);
		$('#Ed_userDiv').show();
		$('#Ed_usergroup').empty();
		$('#Ed_usergroup').append($('<option/>').attr("value", "").text("--Select Owner--"));
		$.ajax({
		    type: "POST",
		    url: "getownersByProperty?prtyid="+prtyid,
		    cache: false,
		    async: false,               
		    success: function(response){ 
		    	
		              if(response!=null){
			              for(var i=0;i<response.length;i++){
			            	 
				              var ownerVal=response[i].ownerid+'_'+response[i].email+'_'+response[i].ownername+'_'+response[i].contact+'_'+response[i].flatno+"_"+response[i].pic;

				            	  $('#Ed_usergroup').append(
									'<option value=' +ownerVal+ '>' + response[i].ownername+'/'+response[i].flatno
											+ '</option>');
			              }
		            }
		       
		         },
		    error: function(){                                                                                 
		    }                                                       
		});  
		//name=name.replace(/-/g, " ");
		var field=name+'/'+flatno;
		
		//$("#Ed_usergroup option[text='" + field +"']").prop("selected",true);
		 $('#Ed_usergroup option').map(function () {
             if ($(this).text() == field) return this;
         }).attr('selected', 'selected');
		}
	if(tntid!=0){
		
		$('#tnt_chkBox').prop("checked",true);
		$('#Ed_userDiv').show();
		$('#Ed_usergroup').empty();
		 $('#Ed_usergroup').append($('<option/>').attr("value", "").text("--Select Tenant--"));
			
		$.ajax({
		    type: "POST",
		    url: "geTenantsByProperty?prtyid="+prtyid,
		    cache: false,
		    async: false,               
		    success: function(response){  
		    
		              if(response!=null){
			              for(var i=0;i<response.length;i++){
			            
				              var ownerVal=response[i].tenantid+'_'+response[i].email+'_'+response[i].tenantname+'_'+response[i].contact+"_"+response[i].flatno+"_"+response[i].pics;
				              
		            	  $('#Ed_usergroup').append(
									'<option value=' +ownerVal+ '>' + response[i].tenantname+'/'+response[i].flatno
											+ '</option>');
			              }
		            }
		       
		         },
		    error: function(){                                                                                 
		    }                                                       
		});
		name=name.replace(/-/g, " ");
		var field=name+'/'+flatno;
		

			 $('#Ed_usergroup option').map(function () {
	                if ($(this).text() == field) return this;
	            }).attr('selected', 'selected');
		//$("#Ed_usergroup option[value='" + field +"']").attr("selected","selected");
		}
	 		
	$("#Ed_memType option[value='" + memType +"']").attr("selected","selected");
		
	var path = "resources/maa-images";
	
	if(pic!=''){
	var oimage = path + "/" + pic;
	$("#Ed_usrpicImg").attr("src", oimage);
	}else{
		pic='u1.png';
		var oimage = path + "/" + pic;
		
		$("#Ed_usrpicImg").attr("src", oimage);
		}
	
}
</script>
</body>
</html>