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

		.fixed-table-toolbar {
			float: left;
		}

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
    <div id="right-panel" class="right-panel">        
        <!-- Header-->
      
        
        <!-- Content -->
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
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#expenceAddModal"><i class="fa fa-plus"></i></button>
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
                                        <th>Amount</th>
                                        <th>Unit No</th>                                        
                                        <th>Payee</th>
                                        <th>Description</th>
                                        <th class="custmheight">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="exp" items="${expenseList}">
                                    <tr>
                                        <td>${inv.expenseid}</td>
                                        <td>${inv.expensedate}</td>
                                        <td>${inv.expenseamount}</td>
                                        <td>${inv.flatno}</td>                                        
                                        <td>${inv.vendorname}</td>
                                        <td>${inv.description}</td>
                                        <td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#expenceIdModal"><i class="fa fa-eye"></i></button>
                                         <c:if test='${roleid==2||roleid==1}'>
                                            <button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#expenseEditModal"><i class="fa fa-edit"></i></button>
                                            <button type="button" class="btn btn-outline-info btn-sm custnBtn"><i class="fa fa-trash-o"></i></button>
                                        </c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
								</div>
                        </div>
						<div class="row mx-auto">
							<div class="col">
								<div class="banner-img">
									<img src="images/banner.jpg" class="img-fluid">
								</div>
							</div>
						</div>
                    </div>
                </div>

				<!--Expense Id modal popup start here-->
				<div class="modal fade" id="expenceIdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Expense Info - MSN Plaza</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<div class="row">
                                <div class="col-md-4">
                                    <div class="owner-image my-4 text-center">
                                        <img src="images/home-images/expence-icon.png" class="img-fluid">
                                    </div>
                                </div>
                                <div class="col-md-4 mt-5">
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Expense Date:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">05 June,2018</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Amount:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">1200</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-5">
                                            <label class=" form-control-label">Cause:</label></div>
                                        <div class="col col-md-7">
                                            <p class="form-control-static">Select</p>
                                        </div>
                                    </div>                                    

                                </div>
                                <div class="col-md-4 mt-5">
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <label class=" form-control-label">Expense Id:</label></div>
                                        <div class="col col-md-6">
                                            <p class="form-control-static">EXP000307</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <label class=" form-control-label">Property Name:</label></div>
                                        <div class="col col-md-6">
                                            <p class="form-control-static">Mantri</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <label class=" form-control-label">Description:</label></div>
                                        <div class="col col-md-6">
                                            <p class="form-control-static">testing23</p>
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
				
				
<!--				Expense Add Modal Popup start here-->
				
	<div class="modal fade" id="expenceAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Expense</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
                                    <div class="card">
                                        <div class="card-header"><strong>Expense Details</strong></div>
                                        <div class="card-body card-block">
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Amount Spent</label>
                                                <input type="text" id="amountspent" placeholder="Enter Amount" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Expense Date</label>
                                                <input type="text" id="expensedate" name="expensedate"  class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Payee</label> 
                                                <select class="custom-select" id="vendor" name="vendor">
                                                        <option selected>select</option>
                                                        <option value="1">Travel-Ramesh</option>
                                                        <option value="2">Insurence-Venkat</option>
                                                        <option value="3">Real Estate Taxes-Siva</option>
                                                        <option value="3">Property Taxes-Dinesh</option>
                                                      </select>
                                                </div>
                                            
                                            
                                            
                                             <div class="form-group">
                                                <label for="company" class="form-control-label">Expense Association</label>
                                                <input type="hidden" id="expensetype" name="expensetype" placeholder="Ex:AST1" class="form-control">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <input type="text" id="flatno" name="flatno" placeholder="Ex:AST1" class="form-control">
                                                         
                                                    </div>
                                                    <div class="col-2">
                                                        <button type="button" class="btn btn-info mb-1" data-toggle="modal" data-target="#ExpenseAssocition">
                          <i class="fa fa-search"></i>
                      </button>
                                                    </div>
                                                    <div class="col"></div>
                                                </div>
                                                <div class="modal fade" id="ExpenseAssocition" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="largeModalLabel">Asset List</h5>
                                                               
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <div class="form-check-inline form-check">
                                                                        <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="expensefor" name="expensefor" value="1" class="form-check-input">Full Property
                                                </label> &nbsp;&nbsp;
                                                                        <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="expensefor" name="expensefor"  value="0" class="form-check-input">Only Assets
                                                </label>
                                                                    </div>
                                                                </div>
																
																
                                                                <table id="expenceAssetAdddetails" class="text-center" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                                                    <thead>
                                                                        <tr>
                                                                            <th ></th>
                                                                            <th>Asset ID</th>
                                                                         
                                                                            <th>Unit No</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                      <c:forEach var="asset" items="${assetList}">
																											<tr>
																												<td><input type="radio" id="chkBox"
																													name="chkBox"></td>
																												<td >AST00${asset.assetid}</td>
																												<td><input type="hidden" id="flatno"
																													name="flatno" value="${asset.flatno}">${asset.flatno}</td>
																											</tr>
																										</c:forEach>
                                                                        
                                                                       
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-info btn-sm" onclick="appendFlatno('${prptyid}')">OK</button>
                                                        
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Description</label>
                                                <input type="text" id="description" name="description" placeholder="Description" class="form-control">
                                            </div>
                                               </div>
                                    </div>
                                </div>
                                

                            </div>
      </div>
      <div class="modal-footer">
		  <button type="button" class="btn btn-info btn-sm">Save</button>
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>							

				<div class="modal fade" id="expenseEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Expense Info - EXP000307</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mx-auto">
                                    <div class="card">
                                        <div class="card-header"><strong>Expense Details</strong></div>
                                        <div class="card-body card-block">
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Amount Spent</label>
                                                <input type="text" id="company" placeholder="Enter Amount" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Expense Date</label>
                                                <input type="date" id="company" placeholder="No of units" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Payee</label> 
                                                <select class="custom-select" id="inputGroupSelect01">
                                                        <option selected>select</option>
                                                        <option value="1">Travel-Ramesh</option>
                                                        <option value="2">Insurence-Venkat</option>
                                                        <option value="3">Real Estate Taxes-Siva</option>
                                                        <option value="3">Property Taxes-Dinesh</option>
                                                      </select>
                                                </div>
                                            
                                            
                                            
                                             <div class="form-group">
                                                <label for="company" class="form-control-label">Expense Unit</label>
                                                <div class="row">
                                                    <div class="col-9">
                                                        <input type="text" id="company" placeholder="Ex:Unit No" class="form-control">
                                                    </div>
                                                    <div class="col-2">
                                                        <button type="button" class="btn btn-info mb-1" data-toggle="modal" data-target="#ExpenseEditAssocition">
                          <i class="fa fa-search"></i>
                      </button>
                                                    </div>
                                                    <div class="col"></div>
                                                </div>
                                                <div class="modal fade" id="ExpenseEditAssocition" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="largeModalLabel">Asset List</h5>
                                                                <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>-->
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <div class="form-check-inline form-check">
                                                                        <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="inline-radio1" name="inline-radios" value="option1" class="form-check-input">Full Property
                                                </label> &nbsp;&nbsp;
                                                                        <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="inline-radio2" name="inline-radios" value="option2" class="form-check-input">Only Assets
                                                </label>
                                                                    </div>
                                                                </div>
																
																
                                                                <table id="expenceAssetEditdetails" class="text-center" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                                                    <thead>
                                                                        <tr>
																			<th data-checkbox="true"></th>
                                                                            <th>Asset ID</th>
                                                                            <th>Unit No</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
																			<td></td>
                                                                            <td><a href="#">2</a></td>
                                                                            <td>Rajeswari</td>

                                                                        </tr>
                                                                        <tr>
																			<td></td>
                                                                            <td><a href="#">2</a></td>
                                                                            <td>Manjeera Trinity</td>

                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-info btn-sm">OK</button>
                                                             
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="company" class=" form-control-label">Description</label>
                                                <input type="text" id="company" placeholder="Description" class="form-control">
                                            </div>
                                            
                                            
                                            
                                            

                                        </div>
                                    </div>
                                </div>
                                

                            </div>
      </div>
      <div class="modal-footer">
		  <button type="button" class="btn btn-info btn-sm">Save</button>
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
				
				
               

                <div class="clearfix"></div>

	<!-- <footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">
						 Copyright &copy; 2019 @Maa Properties 
					</div>
				</div>
			</div>
		</footer> -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2019 @Maa Properties
                    </div>
                </div>
            </div>
        </footer>
      
    </div>
    


    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
   
	
	
	
	
   <script>
        $(document).ready(function() {
            $('#expence-details').DataTable({
                lengthMenu: [[4, 10, 50, -1], [4, 10, 20, "All"]],
                "bLengthChange": true,
                responsive: true,
                columnDefs: [{
                    className: 'control',
                    orderable: false,
                }],
                order: [1, 'asc']
            });
        });
        
        $(document).ready(function() {
            $('#expenceAssetAdddetails').DataTable();
        });
        
        $(document).ready(function() {
            $('#expenceAssetEditdetails').DataTable();
        });
        
        
        
        
        
        
    </script>
  <script>
        $("#ExpensePlusAdd").on("click", function (event) {
       var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
           
            $('#expenceMblVersn').hide();
            $('#ExpenseAdd').show();
        } 
    });
        
        
        
      
    		function appendFlatno(prtyid){
    		var expensefor=$('#expenssefor').val();
    		if(expensefor==0){
		
		var flat='';
			$("#ownerInnerAddTable tr").each(function(){
				var tr = $(this);
		
				 var chkbox = $(this).find('input[type="radio"]').prop("checked");
				
				if(chkbox==true){
					
					  flat = $(this).find('input[type="text"]').val();
					
						
				}
				//else{
					//alert("Select one asset ");
					//}
		    //
	      });
			if(flat!=''){
			$('#flatno').val(flat);
			$('#expensetype').val(expensefor);
			 $(".custmModal").hide();
			}else{
				alert("Select one asset ");
				}
			}else{
			$('#flatno').val(flat);
			$('#expensetype').val(expensefor);
			}
			
	}
        
        
    
    </script>




</body>

</html>