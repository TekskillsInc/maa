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
	<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script> 
	<link rel="shortcut icon" href="#">
	<style>
		.navbar-brand {
			font-size: 18px !important;
		}

		#custmSelect .form-control {
			font-size: 13px !important;
		}
	</style>
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="resources/img/logo/rounded_logo.png" alt="">
	</div>
	
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12 col-sm-12 col-xs-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Complaints</strong>
								</div>
								
								<input type="hidden" class="form-control" id="roleId" name="roleId" value='${roleid}'>
								<div class="col-4">
								 <c:if test='${roleid==3||roleid==4}'> 
									<div  class="addButton" style="float: right">
									  <a href="addcomplaints?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}" type="button" class="btn btn-info btn-sm" style="color:#fff" ><i class="fa fa-plus"></i></a>
									</div>
								  </c:if>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="complaintsTable" class="text-center" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
									<thead>
										<tr>
											<th>Complaint ID</th>
											<th>From</th>
											<th>Date</th>
											<th>Title</th>
											<th>Status</th>
											<th class="custmheight">Action</th>
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
                                    	<td>
                                    	<button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal"
                                    	 onclick="viewComplaint(${clist.id},${roleid})" data-target="#complaintIDModal"><i class="fa fa-eye"></i></button>
                                    	 <c:if test='${roleid==1||roleid==2}'>
                                    	  <button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal"
                                   			 onclick="editComplaint(${clist.id},${roleid})"  data-target="#complaintEditModal"><i class="fa fa-edit"></i></button>
                                    	 </c:if>
                                        <c:if test='${roleid==3||roleid==4}'>
                                         <a href="EditComplaints?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}&id=${clist.id}" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-edit"></i></a>
                                        </c:if>
                                           <c:if test='${roleid==3||roleid==4}'>
                                            <button type="button" class="btn btn-outline-info btn-sm custnBtn"  
                                            onclick="deleteComplaint(${clist.id})"><i class="fa fa-trash-o"></i></button>
                                            </c:if>
                                         </td>
                                    </tr> 
                                    </c:forEach>
									</tbody>
								</table>
							</div>
						</div>
			</div>
				</div>
				<div class="clearfix"></div>
				<div class="modal fade" id="complaintAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
						  <form action="saveComplaintDetails" method="POST" onsubmit="return checkForm(this);"> 
  						  <input type="hidden" class="form-control" id="prptyid" name="prptyid" value='${prptyid}'>
							<input type="hidden" class="form-control" id="prptyName" name="prptyName" value='${prptyName}'>
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Complaint</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col">
										<div class="form-group">
                                            <label for="company" class=" form-control-label">Asset Number<span style="color:red;">*</span></label>
                                            <div id="custm-select">
                                               <select class="custom-select" id="flatno" name="flatno" required>
                                                        <option value="">Select Asset</option>
                                                         <c:forEach var="asset" items="${assetList}">
                                                         <option value="${asset.flatno}">${asset.flatno}</option>
                                                         </c:forEach>
                                               </select>
                                            </div>
                                        </div>
										<div class="form-group">
											<label for="company" class=" form-control-label">Title<span style="color:red;">*</span></label>
											<input type="text" name="ctitle" id="ctitle" placeholder="Title" maxlength="250" class="form-control" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
											 required>
										</div>
										
										 <div class="form-group">
                                          <label for="company" class=" form-control-label">Description<span style="color:red;">*</span></label>
                                           <div class="editor-full">
                                           <div id="document-full" class="ql-scroll-y" style="height: 300px;">
											<textarea id="compdescription" name="description" data-rule-required='true'
											rows='1' class="ckeditor" class="form-control" required maxlength="500">									
										     </textarea>
                                          </div>
                                          </div>
                                        </div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-info btn-sm"">
									<i class="fa fa-save"></i>Save
								</button>
								<button type="button" class="btn btn-info btn-sm">
									<i class="fa fa-save"></i> Send
								</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
							</form>
						</div>
					</div>
				</div>
				<!--Complaint Edit Modal popup is Start here-->
				<div class="modal fade" id="complaintEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
						 <form action="updateComplaintDetails" method="POST" onsubmit="return echeckForm(this);"> 
  						  <input type="hidden" class="form-control" id="prptyid" name="prptyid" value='${prptyid}'>
							<input type="hidden" class="form-control" id="prptyName" name="prptyName" value='${prptyName}'>
							<input type="hidden" class="form-control" id="roleid" name="roleid" value='${roleid}'>
							<input type="hidden" class="form-control" id="compId" name="compId">
							<input type="hidden" class="form-control" id="eflat_no" name="eflatno">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Complaint<span id="eid"></span></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 mx-auto">
										<div class="form-group">
                                            <label for="company" class=" form-control-label">Asset Number<span style="color:red;">*</span></label><br>
                                            <span id="eflatno"></span>
                                        </div>
                                      
										<div class="form-group">
											<label for="company" class=" form-control-label">Title<span style="color:red;">*</span></label><br>
											<span id="etitle"></span>
										</div>
										<div class="form-group" id="compstatus1" style="display:none">
											<label for="company" class=" form-control-label">Complaint Status</label><br>
											 <select class="form-control" id="estatus1" name="estatus" required>
											    <option value="">Select Status</option>
											    <option value="Open">Open</option>
												<option value="Pending">Pending</option>
												<option value="In progress">In progress</option>
												<option value="Completed">Completed</option>
											</select>
										</div>
										<div class="form-group" id="compstatus2" style="display:none">
											<label for="company" class=" form-control-label">Complaint Status</label><br>
											 <input type="text" id="estatus2" name="estatus2"  placeholder="Title" class="form-control" readonly>
											
										</div>
										<div class="form-group" id="edescriptionOT" style="display:none">
                                          <label for="company" class=" form-control-label">Description</label>
                                           <div class="editor-full">
                                           <div id="document-full" class="ql-scroll-y">
											<textarea id="edescription" name="edescription" data-rule-required='true'
											rows='1' class="ckeditor" class="form-control" required>									
										     </textarea>
                                          </div>
                                          </div>
                                        </div>
                                        <div class="form-group" id="edescriptionAdmin" style="display:none">
                                          <label for="company" class=" form-control-label">Description</label>
                                           <div class="editor-full">
                                           <div id="document-full" class="ql-scroll-y">
											<span id="edescriptionAdmin1"></span>
                                          </div>
                                          </div>
                                        </div>
									</div>
								</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-info btn-sm">Save</button>
									<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
								</div>
								</form>
							</div>
						</div>
					</div>
				<!--Complaint ID Modal popup is start here-->
				<div class="modal fade" id="complaintIDModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Complaints Info <span id="vid"></span></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
										<div class="icon-container iconCustm ml-5 mb-5 mt-5">
											<span class="ti-comments"></span>
										</div>
									</div>
										    
									<div class="col-lg-3 mt-5">
										<div class="row">
											<div class="col">
												<label class=" form-control-label">Name:</label></div>
											<div class="col">
												<p class="form-control-static" id="vname"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-md-5">
												<label class=" form-control-label">Date:</label></div>
											<div class="col col-md-7">
												<p class="form-control-static" id="vdate"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-md-5">
												<label class=" form-control-label">Unit No:</label></div>
											<div class="col col-md-7">
												<p class="form-control-static" id="vflatno"></p>
											</div>
										</div>
										<div class="row">
											<div class="col col-md-5">
												<label class=" form-control-label">Status</label></div>
											<div class="col col-md-7">
												<p class="form-control-static" style="color:chocolate" id="vstatus"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-5 col-md-4 col-sm-12 col-xs-12 mt-4">
										<label class=" form-control-label pt-4">Title:</label>
										<p class="form-control-static text-justify" id="vtitle"></p>
										<label class=" form-control-label">Description:</label>
										<p class="form-control-static text-justify" id="vdescription"></p>
									</div>
								</div>
						<input type="hidden" class="form-control" id="vcompId" name="vcompId">
							<div class="row">
									<div class="col">
										<div class="card">
											<div class="card-header">
												<strong class="card-title">Comments History</strong>
											</div>
											<div class="card-body">
												<div class="chat-box"
													style="border: 1px solid #ced4da; font-size: 13px; padding: 10px;">
													<div class="row">
														<div class="col">
															<div class="mangemntdata"
																style="overflow-y: scroll; max-height: 180px;">
																<table>
																	<tbody id="chistory">
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
												<div class="row mt-3">
													<div class="col-10">
														<label for="message-text" class="col-form-label">Comments:</label>
														<input type="text" id="chathistory" name="chathistory"
													     placeholder="Enter Comments" class="form-control" >
													</div>
													<div class="col-2">
														<button type="button" id="chatId" class="btn btn-info btn-sm" onclick="submitQuery()"><i class="fa fa-paper-plane"></i></button>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.content -->
			<div class="clearfix"></div>
			
		</div>
	</div>
</div>
		<!-- /#right-panel -->
		<!-- Scripts -->
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
     <script type="text/javascript">
     function checkForm(form)
     {
       var cmt_len = CKEDITOR.instances['compdescription'].getData().replace(/<[^>]*>/gi, '').length;
       if(cmt_len==0) {
           alert( 'Please enter complaint description' );
           return false;
       }
       return true;
     }
    </script>
    <script type="text/javascript">
    
    function viewComplaint(id){
   	 $.ajax({
   	    	type : "GET",
   	        asyn : false,
   	        contentType: "application/json", // NOT dataType!
   	        url  : "getComplaintById?id="+id+"",
   	        success  : function(response){
   	        	var res1=response.comphlist;
   	        	var res=response.complaints;
   	        	var name=response.name;
   	        /* 	$('#vid').text(response.id);
   	        	$('#vtitle').text(response.title);
   	        	$('#vdate').text(response.notificationdate);
   	        	$('#vflatno').text(response.flatno); */
   	        	$('#vname').text(name);
   	        	var htString=res.description
   	        	var html = htString.replace(/<[^>]+>/gm, '').replace(/&nbsp;/g, ' ');
   	        	$('#vid').text(res.id);
   	        	$('#vcompId').val(res.id);
   	        	$('#vtitle').text(res.title);
   	        	$('#vflatno').text(res.flatno);
   	        	$('#vdate').text(res.cdate);
   	        	$('#vdescription').text(html);
   	        	$('#vstatus').text(res.status);
   	        	if(res.status=='Completed'){
   	        		$('#chatId').attr("disabled",true);
   	        	}else{
   	        		$('#chatId').attr("disabled",false);
   	        	}
   	        	
   	            $('#chistory').empty();
			   for(var i=0;i<res1.length;i++)
			    {
				   if(res1[i].roleId==1 &  res1[i].commentby==null){
					   var cmby="Super Admin";
					   var tr="<tr><td><span style='color:red;'>"+cmby+":&nbsp;</span><b>"+res1[i].description +"</b>&nbsp;&nbsp;"+res1[i].commentdate +"</td></tr>";
				   }else  if(res1[i].roleId==2 &  res1[i].commentby==null){
					   var cmby="Admin";
					   var tr="<tr><td><span style='color:red;'>"+cmby+":&nbsp;</span><b>"+res1[i].description +"</b>&nbsp;&nbsp;"+res1[i].commentdate +"</td></tr>";
				   }else{
					   var tr="<tr><td><span style='color:red;'>"+res1[i].commentby +":&nbsp;</span><b>"+res1[i].description +"</b>&nbsp;&nbsp;"+res1[i].commentdate +"</td></tr>";
				   }
			     
				  $('#chistory').append(tr);
			     } 
   	          }
   		 });
   	}

    function editComplaint(id,roleid){
   	 $.ajax({
   	    	type : "GET",
   	        asyn : false,
   	        contentType: "application/json", // NOT dataType!
   	        url  : "getComplaintById?id="+id+"",
   	        success  : function(response){
   	        	var res=response.complaints;
   	        	if(roleid==1 || roleid==2){
   		 	    $('#estatus1').prop('readonly', true);
   	        	$('#compId').val(res.id);
 	        	$('#eid').text(res.id);
 	        	$('#etitle').text(res.title);
 	        	$('#eflatno').text(res.flatno);
 	        	$('#eflat_no').val(res.flatno);
 	        	$('#compstatus1').show();
 	        	$('#compstatus2').hide();
 	        	$('#estatus1').val(res.status);
   	   	        var htString=res.description
   	   	        var html = htString.replace(/<[^>]+>/gm, '').replace(/&nbsp;/g, ' ');
   	        	$('#edescriptionAdmin').show();
   	        	$('#edescriptionOT').hide();
   	   	        $('#edescriptionAdmin1').text(html);
   	        	}/* else{
   	        		$('#estatus1').prop('required', false);
   	 	        	$('#eflatno').prop('readonly', false);
   	        		$('#eid').text(res.id);
   	   	        	$('#compId').val(res.id);
   	   	        	$('#etitle').val(res.title);
   	   	        	$('#eflatno').val(res.flatno);
   	   	            $('#compstatus1').hide();
   	   	            $('#compstatus2').show();
   	   	        	$('#estatus2').val(res.status);
   	   	            $('#edescriptionAdmin').hide();
   	   	      		$('#edescriptionAdmin1').text('');
   	   	            $('#edescriptionOT').show();
   	   	        	var htString=res.description
   	   	        	var html = htString.replace(/<[^>]+>/gm, '').replace(/&nbsp;/g, ' ');
   	   	        	CKEDITOR.instances.edescription.setData(html);
   	        	    CKEDITOR.instances['edescription'].setReadOnly(false);
   	             } */
   	         }
   	    });
   }
</script>
<script type="text/javascript">
     function echeckForm(form)
     {
    	 var roleId=$('#roleId').val();
    	 if(roleId==3 || roleId==4){
    		  var cmt_len = CKEDITOR.instances['edescription'].getData().replace(/<[^>]*>/gi, '').length;
    	       if(cmt_len==0) {
    	           alert( 'Please enter complaint description' );
    	           return false;
    	       }
    	 }
       return true;
     }
function submitQuery(){
	var compId=$('#vcompId').val();
	var comments=$('#chathistory').val();
	if(comments==""){
		alert("Please enter comments");
		}
	else{
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "addComment?comments="+encodeURIComponent(comments)+"&compId=" + compId + "",
			success : function(response) {
				$('#chathistory').val('');
				 $('#chistory').empty();
				 $('#vcompId').val(compId);
				  var res1=response.comphlist;
	   	         for(var i=0;i<res1.length;i++)
			      {
					   if(res1[i].roleId==1 &  res1[i].commentby==null){
						   var cmby="Super Admin";
						   var tr="<tr><td><span style='color:red;'>"+cmby+":&nbsp;</span><b>"+res1[i].description +"</b>&nbsp;&nbsp;"+res1[i].commentdate +"</td></tr>";
					   }else  if(res1[i].roleId==2 &  res1[i].commentby==null){
						   var cmby="Admin";
						   var tr="<tr><td><span style='color:red;'>"+cmby+":&nbsp;</span><b>"+res1[i].description +"</b>&nbsp;&nbsp;"+res1[i].commentdate +"</td></tr>";
					   }else{
						   var tr="<tr><td><span style='color:red;'>"+res1[i].commentby +":&nbsp;</span><b>"+res1[i].description +"</b>&nbsp;&nbsp;"+res1[i].commentdate +"</td></tr>";
					   }
			     //var tr="<tr><td><span style='color:red;'>"+res1[i].commentby +":&nbsp;</span><b>"+res1[i].description +"</b>&nbsp;&nbsp;"+res1[i].commentdate +"</td></tr>";
				  $('#chistory').append(tr);
			     } 
				$("#viewModal").show();
			}
		});
	}
}
function deleteComplaint(id){
	var prptyid=$('#prptyid').val();
	var prptyName=$('#prptyName').val();
	var retVal = confirm("Do you want to delete?"); 
	  if( retVal == true ) {
			 $.ajax({
			    	type : "GET",
			        asyn : false,
			        contentType: "application/json", // NOT dataType!
			        url  : "deleteComplaint?id="+id+"",
			        success  : function(response){
				        if(response=="success"){
					        alert("Complaint deleted successfully");
					        window.location.href="complaints?prtyid="+prptyid+"&prptyName="+prptyName+"";
					        }
				        else{
				        	alert("Complaint not deleted");
				        	window.location.href="complaints?prtyid="+prptyid+"&prptyName="+prptyName+"";
					        }
			        }
				    });
          return true;
       } else {
         // document.write ("User does not want to continue!");
          return false;
       } 
}
/* function AddComplaint(){
	window.location.href="AddComplaint.jsp";
} */
</script> 
</body>
</html>