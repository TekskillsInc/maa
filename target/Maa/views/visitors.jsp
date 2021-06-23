<!doctype html>

<html class="no-js" lang="">

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

<!-- <link rel="stylesheet" href="resources/css/dist/jquery.timepicker.min.css"> -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> 
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" /> 
</head>
<style>
	body{
	font-size:13px;
	}
</style>
<body>
	<!-- Preloader -->
	<div id="preloader">
		<img src="resources/img/logo/rounded_logo.png" alt="">
	</div>

	<div id="right-panel" class="right-panel">

		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Visitors</strong>
								</div>
								<div class="col-4">
									<c:if test='${roleid==1||roleid==2}'>
										<div class="addButton" style="float: right">
											<button type="button" class="btn btn-info btn-sm"
												data-toggle="modal" data-target="#visitorAddModal">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="visitorDetails" class="text-center"
									data-toggle="table" data-pagination="true" data-search="true"
									data-show-columns="true" data-show-pagination-switch="true"
									data-show-refresh="true" data-key-events="true"
									data-show-toggle="true" data-resizable="true"
									data-cookie="true" data-cookie-id-table="saveId"
									data-show-export="true" data-click-to-select="true"
									data-toolbar="#toolbar">
									<thead>
										<tr>
											<th>Entry Date</th>
											<th>Name</th>
											<th>Mobile</th>
											<!-- <th>Address</th> -->
											<th>Title</th>
											<!-- <th>Flat No</th> -->
											<th>Purpose</th>
											<th>In Time</th>
											<th>Out Time</th>
											<c:if test='${roleid==1||roleid==2}'>
												<th>Action</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="vlist" items="${visitorList}">
											<tr>
												<td>${vlist.visitdate}</td>
												<td>${vlist.vname}</td>
												<td>${vlist.mobile}</td>
												<%--  <td>${vlist.address}</td> --%>
												<c:choose>
													<c:when test='${vlist.flag==1}'>
														<td>${vlist.persontomeet}</td>
													</c:when>
													<c:otherwise>
														<td>${vlist.flatno}</td>
													</c:otherwise>
												</c:choose>
												<td>${vlist.purpose}</td>
												<td>${vlist.intime}</td>
												<td>${vlist.outtime}</td>

												
												<c:if test='${roleid==1||roleid==2}'>
													<td>
														<button type="button"
															class="btn btn-outline-info btn-sm custnBtn"
															data-toggle="modal" onclick="editVisitor(${vlist.id})"
															data-target="#visitorEditModal">
															<i class="fa fa-edit"></i>
														</button>
														<button type="button"
															class="btn btn-outline-info btn-sm custnBtn"
															onclick="deleteVisitor(${vlist.id})">
															<i class="fa fa-trash-o"></i>
														</button>
													</td>
												</c:if>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<!--Visitor Add modal start here-->

				<div class="modal fade" id="visitorAddModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<form action="saveVisitorDetails" method="POST">
								<input type="hidden" class="form-control" name="prptyid"
									value='${prptyid}'> <input type="hidden"
									class="form-control" name="prptyName" value='${prptyName}'>
								
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Add Visitor
										Info</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
											<div class="card">
												<div class="card-header">
													<strong>Visitor Entry Form</strong>
												</div>
												<div class="card-body card-block">
													<!-- <div class="form-group">
														<label for="company" class=" form-control-label">Entry
															Date</label> <input type="date" id="company" name="visitDate"
															placeholder="Building Name" class="form-control" required>
													</div> -->

													<div class="form-group">
														<label for="company" class=" form-control-label">Name</label>
														<input type="text" id="company" placeholder="Name"
															name="name" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" class="form-control" required>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Mobile</label>
														<input type="text" id="company" placeholder="Mobile"
															name="mobile" minlength="10" maxlength="12"  pattern="^[0-9]*$" class="form-control" required><!-- pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" -->
													</div>
													<div class="form-group">
														<label for="company" class="form-control-label">Address</label>
														<textarea rows="2" cols="50" class="form-control"
															name="address" required maxlength="256"></textarea>
													</div>
												</div>
											</div>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title">Visitor Entry Form</strong>
												</div>
												<div class="card-body">
													<div class="form-group">
														<div class="form-check-inline form-check">
															<label for="inline-radio1" class="form-check-label ">
																<input type="radio" id="visitfor" name="visitfor"
																value="1" class="form-check-input" required>Person
															</label> &nbsp;&nbsp; <label for="inline-radio2"
																class="form-check-label "> <input type="radio"
																id="visitfor1" name="visitfor" value="0"
																class="form-check-input" required>Assets
															</label>
														</div>
													</div>
													<div class="form-group row" id="assetDiv">
														<label class="col-sm-12 col-form-label">Unit No</label>
														<div class="col-sm-12" id="custm-select">
															<select class="custom-select" id="flatno" name="flatno">
																<option value="">Select Asset</option>
																<c:forEach var="asset" items="${assetList}">
																	<option value="${asset.flatno}">${asset.flatno}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group row" id="pDiv">
														<label class="col-sm-12 col-form-label">Person</label>
														<div class="col-sm-12" id="custm-select">
															<input type="text" id="personTomeet" name="personTomeet"
																placeholder="Person To Meet" class="form-control"
																pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-12 col-form-label">Purpose</label>
														<div class="col-sm-12" id="custm-select">
															<input type="text" id="purpose" name="purpose"
																placeholder="Purpose"  class="form-control" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" required>
														</div>
													</div>

													<div class="form-group">
														<label for="company" class=" form-control-label">In
															Time</label>
															<div class="input-group date" id="datetimepicker1" 
															data-target-input="nearest">
															<input type="text"
																class="form-control datetimepicker-input"
																data-target="#datetimepicker1" name="intime" />
															<div class="input-group-append"
																data-target="#datetimepicker1"
																data-toggle="datetimepicker">
																<div class="input-group-text">
																	<i class="fa fa-calendar"></i>
																</div>
															</div>
														</div>
															
															
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Out
															Time</label>
															
															<div class="input-group date" id="datetimepicker2" 
															data-target-input="nearest">
															<input type="text"
																class="form-control datetimepicker-input"
																data-target="#datetimepicker2" name="outtime" />
															<div class="input-group-append"
																data-target="#datetimepicker2"
																data-toggle="datetimepicker">
																<div class="input-group-text">
																	<i class="fa fa-clock-o"></i>
																</div>
															</div>
														</div>
															
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info btn-sm">Save</button>
									<button type="button" class="btn btn-secondary btn-sm"
										data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>


				<!--Visitor Edit Modal start here-->
				<div class="modal fade" id="visitorEditModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<form action="updateVisitor" method="POST">
								<input type="hidden" class="form-control" name="prptyid"
									value='${prptyid}'> <input type="hidden"
									class="form-control" name="prptyName" value='${prptyName}'>
								<input type="hidden" class="form-control" id="visitId"
									name="visitId">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Edit
										Visitor Info</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
											<div class="card">
												<div class="card-header">
													<strong>Visitor Entry Form</strong>
												</div>
												<div class="card-body card-block">
													

													<div class="form-group">
														<label for="company" class=" form-control-label">Name</label>
														<input type="text" id="ename" placeholder="Name"
															name="ename" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" class="form-control" required>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Mobile</label>
														<input type="text" id="emobile" placeholder="Mobile"
															name="emobile" class="form-control" minlength="10" maxlength="12"  pattern="^[0-9]*$" required>
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Address</label>
														<textarea rows="2" cols="50" class="form-control"
															id="eaddress" name="eaddress" pattern="^[ A-Za-z0-9_@./#&+-]*$" required maxlength="256"></textarea>
													</div>
												</div>
											</div>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
											<div class="card">
												<div class="card-header">
													<strong class="card-title">Visitor Entry Form</strong>
												</div>
												<div class="card-body">
													<div class="form-group">
														<div class="form-check-inline form-check">
															<label for="inline-radio1" class="form-check-label ">
																<input type="radio" id="evisitfor" name="evisitfor"
																value="1" class="form-check-input" required>Person
															</label> &nbsp;&nbsp; <label for="inline-radio2"
																class="form-check-label "> <input type="radio"
																id="evisitfor1" name="evisitfor" value="0"
																class="form-check-input" required>Assets
															</label>
														</div>
													</div>
													<div class="form-group row" id="eassetDiv">
														<label class="col-sm-12 col-form-label">Unit No</label>
														<div class="col-sm-12" id="custm-select">
															<select class="custom-select" id="eflatno" name="eflatno">
																<option value="">Select Asset</option>
																<c:forEach var="asset" items="${assetList}">
																	<option value="${asset.flatno}">${asset.flatno}</option>
																	
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group row" id="epDiv">
														<label class="col-sm-12 col-form-label">Person</label>
														<div class="col-sm-12" id="custm-select">
															<input type="text" id="epersonTomeet"
																name="epersonTomeet" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" placeholder="Person To Meet"
																class="form-control" >
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-12 col-form-label">Purpose</label>
														<div class="col-sm-12" id="custm-select">
															<input type="text" id="epurpose" name="epurpose"
																placeholder="Purpose" class="form-control" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" required>
														</div>
													</div>

													


													<div class="form-group">
														<label for="company" class="form-control-label">In
															Time</label>
															<div class="input-group date"  id="edatetimepicker1"
															data-target-input="nearest">
															<input type="text"
																class="form-control datetimepicker-input"
																data-target="#edatetimepicker1"  id="edatetimepicker4" name="eintime" />
															<div class="input-group-append"
																data-target="#edatetimepicker1"
																data-toggle="datetimepicker">
																<div class="input-group-text">
																	<i class="fa fa-clock-o"></i>
																</div>
															</div>
														</div>
															
															
															
															
													</div>
													<div class="form-group">
														<label for="company" class=" form-control-label">Out
															Time</label> 
															
															<div class="input-group date" id="edatetimepicker2" 
															data-target-input="nearest">
															<input type="text"
																class="form-control datetimepicker-input"
																data-target="#edatetimepicker2"  id="edatetimepicker3" name="eouttime" />
															<div class="input-group-append"
																data-target="#edatetimepicker2"
																data-toggle="datetimepicker">
																<div class="input-group-text">
																	<i class="fa fa-clock-o"></i>
																</div>
															</div>
														</div>
															
															
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info btn-sm">Save</button>
									<button type="button" class="btn btn-info btn-sm"
										data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			<!-- .animated -->
		</div>
		<!-- /.content -->
		<div class="clearfix"></div>
		
	</div>

	
	 <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
			 
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
	
	<script>
  $('#pDiv').hide(); 
  $('#assetDiv').hide();
  $('#visitfor').click(function(){
    		$('#assetDiv').hide();
    		$('#pDiv').show();
    		$('#personTomeet').prop("required",true);
    		$('#flatno').prop("required",false);
    		$('#visitfor1').prop("checked",false);
            }) ;
   $('#visitfor1').click(function(){
        	   $('#visitfor').prop("checked",false);
            	$('#assetDiv').show();
            	$('#pDiv').hide();
            	$('#flatno').prop("required",true);
            	$('#personTomeet').prop("required",false);
    }) ;
</script>
	<script>
$(function() {
   $('#datetimepicker1').datetimepicker({
	  
  });
  $('#datetimepicker2').datetimepicker({
	 
     
  }); 
  $('#edatetimepicker1').datetimepicker({
	 
	 
  });
  $('#edatetimepicker2').datetimepicker({
	  
	 
  });  

});
</script>
	 
	<script>
/* function viewNotification(id){
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "getNotificationById?id="+id+"",
	        success  : function(response){
	        	var id1="NOTIFY-"+response.id;
	        	$('#vid').text(id1);
	        	$('#vtitle').text(response.title);
	        	$('#vdate').text(response.notificationdate);
	        	$('#vflatno').text(response.flatno);
	        	var htString=response.description
	        	var html = htString.replace(/<[^>]+>/gm, '').replace(/&nbsp;/g, ' ');
	        	$('#vdesc').text(html);
	        }
		    });
	}
 */
function deleteVisitor(id){
	var prptyid=$('#prptyid').val();
	var prptyName=$('#prptyName').val();
	var retVal = confirm("Do you want to delete?"); 
	  if( retVal == true ) {
			 $.ajax({
			    	type : "GET",
			        asyn : false,
			        contentType: "application/json", // NOT dataType!
			        url  : "deleteVisitor?id="+id+"",
			        success  : function(response){
				        if(response=="success"){
					        alert("Visitor deleted successfully");
					        //window.location.href="visitors?prtyid="+prptyid+"&prptyName="+prptyName+"";
					        window.location.reload();
					        }
				        else{
				        	alert("Visitor not deleted");
				        	window.location.reload();
					        }
			        }
				    });
          return true;
       } else {
         // document.write ("User does not want to continue!");
          return false;
       } 
}
$('#evisitfor').click(function(){
	    $('#eassetDiv').hide();
	    $('#epDiv').show();
	    $('#evisitfor1').prop("checked",false);
	    $('#eflatno').prop("required",false);
	    $('#epersonTomeet').prop("required",true);
    }) ;
$('#evisitfor1').click(function(){
	   $('#evisitfor').prop("checked",false);
	   $('#eassetDiv').show();
	   $('#epDiv').hide();
	   $('#eflatno').prop("required",true);
	   $('#epersonTomeet').prop("required",false);
    }) ;

function editVisitor(id){
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "getVisitorById?id="+id+"",
	        success  : function(response){  
	        	var id1="NOTIFY-"+response.id;
	        	$('#visitId').val(id);
	        //	$('#eid').text(id1);
	        	//$('#evisitDate').val(response.visitdate);
	        	$('#ename').val(response.vname);
	        	$('#emobile').val(response.mobile);
	        	$('#eaddress').val(response.address);
	        	$('#epersonTomeet').val(response.persontomeet);
	        	$('#eflatno').val(response.flatno);
	        	$('#epurpose').val(response.purpose);
	        	
	        	$('#edatetimepicker4').val(response.intime);
	        	$('#edatetimepicker3').val(response.outtime);
	        	if(response.flag==1){
	        		$('#eassetDiv').hide();
	        		$('#epDiv').show();
	        		$('#evisitfor').prop("checked",true)
	        		}
	        	else {
	        		$('#eassetDiv').show();
	        		$('#epDiv').hide();
	        		$('#evisitfor1').prop("checked",true)
	        		}
	        }
		    });
}
</script>

	<script type="text/javascript">
            $(function () {
                $('#datetimepicker3').datetimepicker({
                   /*  format: 'LT' */
                });
            });
        </script>
</body>
</html>