 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<!DOCTYPE html PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN" "http:/www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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

    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        

        <div class="modal fade" id="switchModalPopUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Switch Property</h5>
                        <button type="button" class="close custmClose" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                    </div>
                    <div class="modal-body">
                        <div class="switchprpty-list">
                            <div class="row">
                                <div class="col-md-12">
                                    <aside class="profile-nav alt">
                                        <section class="card" id="custm-card">
                                            <div class="card-header user-header alt bg-dark">
                                                <div class="media">
                                                    <a href="#">
                                            <img class="align-self-center rounded-circle mr-3" style="width:100px; height:100px;" alt="" src="images/home-images/home.png">
                                        </a>
                                                    <div class="media-body mt-3">
                                                        <h4 class="text-light display-6">Manjeera Trinity Corporate</h4>
                                                        <p>Kphb colony,<br>Jntu,Hyderabad</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </aside>
                                </div>
                                <div class="col-md-12">
                                    <a href="#">
                                        <aside class="profile-nav alt">
                                            <section class="card" id="custm-card">
                                                <div class="card-header user-header alt bg-dark">
                                                    <div class="media">
                                                        <a href="#">
                                           <img class="align-self-center rounded-circle mr-3" style="width:100px; height:100px;" alt="" src="images/home-images/home.png">
                                        </a>
                                                        <div class="media-body mt-3">
                                                            <h4 class="text-light display-6">Manjeera Trinity Corporate</h4>
                                                            <p>Kphb colony,<br>Jntu,Hyderabad</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </aside>
                                    </a>
                                </div>
                                <div class="col-md-12">
                                    <a href="#">
                                        <aside class="profile-nav alt">
                                            <section class="card" id="custm-card">
                                                <div class="card-header user-header alt bg-dark">
                                                    <div class="media">
                                                        <a href="#">
                                            <img class="align-self-center rounded-circle mr-3" style="width:100px; height:100px;" alt="" src="images/home-images/home.png">
                                        </a>
                                                        <div class="media-body mt-3">
                                                            <h4 class="text-light display-6">Manjeera Trinity Corporate</h4>
                                                            <p>Kphb colony,<br>Jntu,Hyderabad-500075</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </aside>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <p class="text-center"><a href="#">View All</a></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info">Ok</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        
                    </div>
                </div>
            </div>
        </div>

        <!--        Modal popup for switch property ends here-->
        <!-- Content -->
        <div class="content" >
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="col-md-12" id="assetMblVersn">
                    <div class="card" id="responseCard">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <strong class="card-title">Change Password</strong>
                                </div>
                                
                            </div>
                        </div>
                        <div class="card-body">
							<div class="row my-4">
								<div class="col-6 mx-auto">
									<form action="ChangeLoginPassword" method="post">
										<div class="form-group">
													<label for="company" class=" form-control-label">Current Password</label>
													<div class="input-group">
														<input type="password" class="form-control" id="currentpassword" name="currentpassword" placeholder="Current password">
													</div>
												</div>
										<div class="form-group">
													<label for="company" class=" form-control-label">New Password</label>
													<div class="input-group">
														<input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="New password">
													</div>
												</div>
										<div class="form-group">
													<label for="company" class=" form-control-label">Confirm Password</label>
													<div class="input-group">
														<input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Confirm password">
													</div>
												</div>
										<div class="text-center">
										
										<button type="submit" class="btn btn-info btn-sm" onclick="return Validate()"> Reset</button>
									<c:choose>
									<c:when test="${userid==1}">
									<a href="masterAdmin?userid=${userid}&roleid=${roleid}" class="btn btn-info btn-sm"> Cancel</a>
									</c:when>
									<c:otherwise>
									<a href="PropertyEntrance" class="btn btn-info btn-sm"> Cancel</a>
									</c:otherwise>
									</c:choose>
										
										</div>
									
									</form>
								
								</div>
							</div>
							
                        </div>
                    </div>
                </div>

				


            </div>
            <!-- .animated -->
        </div>
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
    </div>
    <!-- /#right-panel -->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<!--    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>-->
	<!--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>-->
	<!-- data table JS
		============================================ -->
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
		history.pushState(null, document.title, location.href);
		window.addEventListener('popstate',function(event){
		history.pushState(null,document.title, location.href);
		});
</script>
	
<script>
function Validate() {
    var newPassword = document.getElementById("newpassword").value;
    var confirmPassword = document.getElementById("confirmpassword").value;
    if (newPassword != confirmPassword) {
        alert("New Password and confirm Password does not match.");
        window.location.reload("change-password.jsp");
        return false;
    }else{
        
    return true;
    }
}
</script>
</body>

</html>