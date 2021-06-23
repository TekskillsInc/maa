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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

		::placeholder {
			font-size: 13px;
		}

		.card-title {
			font-size: 16px;
		}

		.nav-pills .nav-item {
			width: 25%;
		}

		

		#pills-tab {
			/*margin-left: 3%;
            margin-right: 3%;*/
			box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
		}


		.nav-pills li a {
			color: #274552;
			font-size: 13px;
			text-align: center;
			text-transform: uppercase;
		}

		.nav-pills .nav-item {
			width: 33.33%;
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

		.form-group select {
			font-size: 13px;
		}

	/* 	.fixed-table-toolbar {
			float: left;
		} */

		#ownerDetails button i {
			font-size: 17px;
			color: #000;
		}

		#ownerDetails button i:hover {
			color: #fff;
		}

		#ownerDetails button.custnBtn {
			border-color: transparent;
	</style>
	<style>
		.assetTablist .nav-pills .nav-item {
			width: 33.33% !important;
		}

		.modal-header {
			background-color: #17a2b8;
		}

		.modal-header h5 {
			color: #fff;
			font-size: 15px;
			font-weight: 600
		}

		.fixed-table-toolbar .dropdown-menu.show {
			top: 100% !important;
		}

		.fixed-table-toolbar .dropdown-menu.show {
			width: 160px !important;
		}



		.fixed-table-toolbar .dropdown-menu>li>a {
			display: block;
			padding: 3px 20px !important;
			clear: both;
			font-weight: 400;
			line-height: 1.42857143;
			color: #333;
			white-space: nowrap;
			font-size: 13px;
		}

		.fixed-table-toolbar .dropdown-menu>li>label {
			display: block;
			padding: 3px 20px !important;
			clear: both;
			font-weight: 400;
			line-height: 1.42857143;
			color: #333;
			white-space: nowrap;
			font-size: 13px;
		}

		.pull-right.pagination {
			display: table !important;
		}

		.close {
			color: #fff !important
		}
		.owner-image img {
			width: 120px;
			height: 120px;
		}
	</style>
	<style>
		.switch {
			position: relative;
			display: inline-block;
			width: 51px;
			height: 20px;
		}

		.switch input {
			opacity: 0;
			width: 0;
			height: 0;
		}

		.sliderBtn {
			position: absolute;
			cursor: pointer;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background-color: #ccc;
			-webkit-transition: .4s;
			transition: .4s;
		}

		.sliderBtn:before {
			position: absolute;
			content: "";
			height: 26px;
			width: 26px;
			left: 0px;
			bottom: -2px;
			background-color: #fff;
			box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.4);
			-webkit-transition: .4s;
			transition: .4s;
		}

		input:checked+.sliderBtn {
			background-color: #17a2b8;
		}

		input:focus+.sliderBtn {
			box-shadow: 0 0 1px #2196F3;
		}

		input:checked+.sliderBtn:before {
			-webkit-transform: translateX(26px);
			-ms-transform: translateX(26px);
			transform: translateX(26px);
		}

		/* Rounded sliders */

		.sliderBtn.round {
			border-radius: 34px;
		}

		.sliderBtn.round:before {
			border-radius: 50%;
		}
		
		.profilePic .nav-pills .nav-item{
			width: 50%;
		}
		.owner-image img{
			width: 130px;
			height: 130px;
		}
		
		#ownerViewModal .modal-body{
			padding: 0px!important;
		}
	</style>


</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="resources/img/logo/rounded_logo.png" alt="">
    </div>
    <!-- Left Panel -->
   
    <!-- /#left-panel -->
    <!-- Right Panel -->
   <div id="right-panel" class="right-panel" style="margin-top: 0px;">      
        <!-- Header-->
           
       
        <div class="content" >
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="col-md-12" id="assetMblVersn">
                    <div class="card" id="responseCard">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <strong class="card-title">Expenses List</strong>
                                </div>
                                <c:if test='${roleid==2||roleid==1}'>
                                <div class="col-4">
                                    <div class="addButton" style="float: right">
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#expenceAddModal" id="modalClose"><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="card-body">
							<div class="table-responsive">
                            <table id="expenceDetails" class="text-center table-borderless" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>
                                        <th>Expense ID</th>
                                        <th>Date</th>
                                         <th>Month</th>
                                        <th>Unit No</th>                                        
                                        <th>Payee</th>
                                         <th>Amount</th>
                                        <th>Description</th>
                                        <th class="custmheight">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="exp" items="${expenseList}">
                                    <tr>
                                        <td>EXP00${exp.expenseid}</td>
                                        <td>${exp.expensedate}</td>
                                        <td>${exp.month}</td>
                                        <c:choose>
                                         <c:when test='${exp.flag==1}'>
                                         <td>Full-property</td>      
                                        </c:when>    
                                        <c:otherwise>
                                         <td>${exp.flatno}</td>    
                                         </c:otherwise>  
                                         </c:choose>                            
                                        <td>${exp.vendorname}</td>
                                        <td>${exp.expenseamount}</td>
                                        <td ><input type="hidden" value="${exp.description}" id="expDescription${exp.expenseid}">${fn:substring(exp.description, 0, 20)}</td>
                                        <td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#expenceIdModal" 
                                        onclick="viewExpense('${exp.expenseid}','${exp.expensedate}','${exp.expenseamount}','${exp.purpose}','${exp.flatno}','${exp.vendorid}','${exp.vendorname}',
                                        '${exp.flag}','${exp.month}')"><i class="fa fa-eye"></i></button>
                                         <c:if test='${roleid==2||roleid==1}'>
                                            <button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#expenseEditModal" 
                                            onclick="editExpense('${exp.expenseid}','${exp.expensedate}','${exp.expenseamount}','${exp.purpose}','${exp.flatno}','${exp.vendorid}','${exp.vendorname}','${exp.flag}','${exp.month}')">
                                            <i class="fa fa-edit"></i></button>
                                           <!--  <button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o"></i></button> -->
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

				<!--Expense Id modal popup start here-->
				<div class="modal fade" id="expenceIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Expense Info - ${prptyName}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<div class="row">
                                <div class="col-md-4">
                                    <div class="owner-image my-4 text-center">
                                        <img src="resources/images/home-images/expence-icon.png" class="img-fluid">
                                    </div>
                                </div>
                                <div class="col-md-4 mt-5">
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Expense Date:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static" id="expDate_v"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Amount:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static" id="expAmount_v"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Paid To:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static" id="payee_v"></p>
                                        </div>
                                        
                                    </div>    
                                       <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Cause:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static" id="purpose_v"></p>
                                        </div>
                                    </div>                                  

                                </div>
                                <div class="col-md-4 mt-5">
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <label class=" form-control-label">Expense Id:</label></div>
                                        <div class="col col-md-6">
                                            <p class="form-control-static" id="expId_v"></p>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col col-md-6">
                                            <label class=" form-control-label">Expense Period:</label></div>
                                        <div class="col col-md-6">
                                            <p class="form-control-static" id="expMonth_v"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <label class=" form-control-label">Expense For:</label></div>
                                        <div class="col col-md-6">
                                            <p class="form-control-static" id="flag_v"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <label class=" form-control-label">Description:</label></div>
                                        <div class="col col-md-6">
                                            <p class="form-control-static" id="expDescrption_v"></p>
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
				

				
	<div class="modal fade" id="expenceAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Expense</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form action="saveExpense" method="POST" id="addForm">
      <div class="modal-body" id="addModalbody">
     
        <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
                                    <div class="card">
                                        <div class="card-header"><strong>Expense Details</strong></div>
                                        <div class="card-body card-block">
                                        <input type="hidden" class="form-control" id="prptyid" name="prptyid" value='${prptyid}'>
										<input type="hidden" class="form-control" id="prptyName" name="prptyName" value='${prptyName}'>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Amount Spent<span style="color:red;">*</span></label>
                                                <input type="number" id="amountspent" name="amountspent" placeholder="Enter Amount" class="form-control" maxlength="9"  required>
                                            </div>
                                            <div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<select class="form-control" id="month_tnt"
																			name="month_tnt">
																		</select>
											</div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Expense Date<span style="color:red;">*</span></label>
                                                <input type="Date" id="expensedate" name="expensedate"  class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Payee<span style="color:red;">*</span></label> 
                                                <select class="custom-select" id="vendor" name="vendor" required>
                                                        <option value="">Select Vendor</option>
                                                         <c:forEach var="vendor" items="${activeVendorList}">
                                                        <option value="${vendor.vendorid}/${vendor.vendorname}/${vendor.profession}">${vendor.vendorname}-${vendor.profession}</option>
                                                        </c:forEach>
                                                      </select>
                                                </div>
                                                    <div class="form-group">
                                                                    <div class="form-check-inline form-check">
                                                                        <label for="inline-radio1" class="form-check-label "><span style="color:red;">*</span>
                                                    <input type="radio" id="expensefor" name="expensefor" value="1" class="form-check-input" required>Full Property
                                                </label> &nbsp;&nbsp;
                                                                        <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="expensefor1" name="expensefor" value="0" class="form-check-input" >Only Assets
                                                </label>
                                                                    </div>
                                                                </div>
                                                
                                                    <div class="form-group" id="assetDiv">
                                                <label for="company" class=" form-control-label">Asset</label> 
                                                <select class="custom-select" id="flatno" name="flatno">
                                                        <option value="">Select Asset</option>
                                                         <c:forEach var="asset" items="${assetList}">
                                                         <option value="${asset.flatno}">AST${asset.flatno}</option>
                                                         </c:forEach>
                                                      </select>
                                                </div>
                                                
                                                
                          
                                              <div class="form-group">
                                                <label for="company" class=" form-control-label">Description<span style="color:red;">*</span></label>
                                                <input type="text" id="description" name="description" placeholder="Description" class="form-control" pattern="^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 #,-]*)?$" required>
                                            </div>
                                                   </div>
                                                </div>
                                            </div>
                                            
                                           
                                               </div>
                                               <div class="modal-footer">
		  <button type="submit" class="btn btn-info btn-sm">Save</button>
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>        
      </div>
   
                                    
                                </div>
                                
</form>
                            </div>
     
     
     </div></div>
      				

				<div class="modal fade" id="expenseEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Expense Info - ${prptyName}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form action="updateExpense" method="POST">
      <div class="modal-body">
        	<div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
                                    <div class="card">
                                        <div class="card-header"><strong>Expense Details</strong></div>
                                        <div class="card-body card-block">
                                        <input type="hidden" id="expenseId_ed" name="expenseId_ed"  class="form-control">
                                         <input type="hidden" class="form-control" id="prptyid" name="prptyid" value='${prptyid}'>
										<input type="hidden" class="form-control" id="prptyName" name="prptyName" value='${prptyName}'>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Amount Spent<span style="color:red;">*</span></label>
                                                <input type="number" id="amountspent_ed" name="amountspent_ed" placeholder="Enter Amount" class="form-control" maxlength="9" required>
                                            </div>
                                            <div class="form-group">
																		<label for="company" class=" form-control-label">Month</label>
																		<select class="form-control" id="ed_month"
																			name="ed_month">
																		</select>
											</div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Expense Date<span style="color:red;">*</span></label>
                                                <input type="date" id="expensedate_ed" name="expensedate_ed" placeholder="No of units" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Payee<span style="color:red;">*</span></label> 
                                                <select class="custom-select" id="vendor_ed" name="vendor_ed" required>
                                                        <option value="">select Payee</option>
                                                         <c:forEach var="vendor" items="${activeVendorList}">
                                                        <option value="${vendor.vendorid}/${vendor.vendorname}/${vendor.profession}">${vendor.vendorname}-${vendor.profession}</option>
                                                        </c:forEach>
                                                      </select>
                                                      
                                                </div>
                                                    <div class="form-group">
                                                                    <div class="form-check-inline form-check">
                                                                        <label for="inline-radio1" class="form-check-label "><span style="color:red;">*</span>
                                                    <input type="radio" id="expensefor_ed" name="expensefor_ed" value="1" class="form-check-input" required>Full Property
                                                </label> &nbsp;&nbsp;
                                                                        <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="expensefor_ed1" name="expensefor_ed" value="0" class="form-check-input" >Only Assets
                                                </label>
                                                                    </div>
                                                                </div>
                                                      <div class="form-group" id="assetDiv_ed">
                                                <label for="company" class=" form-control-label">Asset</label> 
                                                <select class="custom-select" id="flatno_ed" name="flatno_ed">
                                                        <option value="">Select Asset</option>
                                                         <c:forEach var="asset" items="${assetList}">
                                                         <option value="${asset.flatno}">AST${asset.flatno}</option>
                                                         </c:forEach>
                                                      </select>
                                                </div>
                                            
                                        
                   
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Description<span style="color:red;">*</span></label>
                                                <textarea rows="4" cols="50" id="description_ed" name="description_ed" placeholder="Description" maxlength="100" class="form-control" required>
                                           </textarea>
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
    </div>
       </div>
          
        </div>
    


    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    
   
	
	
	
<script>
function loadMonthYear() {
	var dt = new Date();
	var cur_month = dt.getMonth();
	var prev_month = 0;
	if (cur_month != 0) {
		prev_month = cur_month - 1;
	}
	var mlist = [ "Select Month", "January", "February", "March",
			"April", "May", "June", "July", "August", "September",
			"October", "November", "December" ];
	for (var i = 0; i < mlist.length; i++) {
		$('#month_tnt').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
		$('#ed_month').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
	}
}
window.onload = loadMonthYear;

$('#modalClose').on('click',function(){
$('#addForm').trigger("reset");
});
</script>
  <script>
  
  $('#assetDiv').hide();
        $("#ExpensePlusAdd").on("click", function (event) {
       var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
           
            $('#expenceMblVersn').hide();
            $('#ExpenseAdd').show();
        } 
    });
        $('#expensefor').click(function(){
            
    		$('#assetDiv').hide();
    		$('#expensefor1').prop("checked",false);
    		$('#flatno').prop("required",false);
           
            }) ;
        $('#expensefor1').click(function(){
         
            
        	$('#expensefor').prop("checked",false);
        	
            	$('#assetDiv').show();
            	$('#flatno').prop("required",true);
                //}
            }) ;

        $('#expensefor_ed').click(function(){
       
    		$('#assetDiv_ed').hide();
    		$('#expensefor_ed1').prop("checked",false);
    		$('#flatno_ed').prop("required",true);
               
           
            }) ;
        $('#expensefor_ed1').click(function(){
         
            
        	$('#expensefor_ed').prop("checked",false);
            	$('#assetDiv_ed').show();
            	$('#flatno_ed').prop("required",true);
                //}
            }) ;
     
    	
    </script>
    <script>

function viewExpense(expenseid,expensedate,expenseamount,purpose,flatno,vendorid,vendorname,flag,month){
	var expDescription=$('#expDescription'+expenseid).val();
	$('#expId_v').text("EXP00"+expenseid);
	$('#expDate_v').text(expensedate);
	$('#expAmount_v').text(expenseamount);
	$('#payee_v').text(vendorname);
	$('#purpose_v').text(purpose);
	$('#expMonth_v').text(month);
	if(flag==0){
		$('#flag_v').text(flatno);
		}
	else{
		$('#flag_v').text("Full Property");
		}
	
	$('#expDescrption_v').text(expDescription);
}


function editExpense(expenseid,expensedate,expenseamount,purpose,flatno,vendorid,vendorname,flag,month){
	var expDescription=$('#expDescription'+expenseid).val();
	$('#amountspent_ed').val(expenseamount);
	 var newdate = expensedate.split("-").reverse().join("-");
	//$('input[name=expensedate_ed]').val(expensedate);
	$('#expensedate_ed').val(newdate);
	$('#description_ed').val(expDescription);
	$('#expenseId_ed').val(expenseid);
	if(flag==1){
		$('#assetDiv_ed').hide();
		$('#expensefor_ed').prop("checked",true)
		}
	else {
		$('#assetDiv_ed').show();
		$('#expensefor_ed1').prop("checked",true)
		}
	//loadMonthYear;
	if(month!=""){
		 var $dropdown4 = $("select[name='ed_month']");
		 $dropdown4.find('option[value="' + month + '"]').attr('selected', true);
	}else{
		$('select#ed_month option').removeAttr("selected");
	 }
	/* $('#vendor_ed').val(description); */
	var vendor=vendorid+"/"+vendorname+"/"+purpose;

	var $dropdown2 = $("select[name='vendor_ed']");
	 $dropdown2.find('option[value="' + vendor + '"]').attr('selected', true);

	if(flatno!=0){
		var $dropdown3 = $("select[name='flatno_ed']");
		 $dropdown3.find('option[value="' + flatno + '"]').attr('selected', true);
		}
}

$(function() {  
    $("textarea[maxlength]").bind('input propertychange', function() {  
        var maxLength = $(this).attr('maxlength');  
        if ($(this).val().length > maxLength) {  
            $(this).val($(this).val().substring(0, maxLength));  
        }  
    })  
});
</script>




</body>

</html>