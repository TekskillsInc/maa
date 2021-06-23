
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MPRTS|Dashboard</title>
    <meta name="description" content="Maa Properties">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="resources/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">
    <style>
        .login-logo img {
            width: 15% !important;
        }

        ::placeholder {
            font-size: 13px;
        }

        body {
            font-size: 14px;
        }

        .page-header {
            background-color: rgba(0, 0, 0, 0.4);
        }

        .page-header-img {
            background-image: linear-gradient(to right bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(resources/images/main.jpg);
            /*            background-image: url(images/main.jpg);*/
            position: absolute;
            background-size: cover;
            background-position: center center;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .login-content h4 {
            color: #fff;
        }

        .login-form .form-control {
            background-color: transparent !important;
            border: 1px solid #E3E3E3;
            border-radius: 30px;
            /* padding: 23px 18px; */
        }

        .login-form .form-control::placeholder {
            color: #fff;
        }

        .login-form .form-control {
          color: #fff !important;
        }

        .login-form .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 255, 255, 0.5);
        }
        select.form-control{
        	color:#fff!important;
        	
        	
        }
        #role{
        	background-color: transparent!important;
        	color:#fff;
        }
        
        #role option{
        	 background: rgba(0, 0, 0, 0.4);
        	font-size:14px;
        }
        
        
#role{
	font-size:13px;
}


       
        
       

       
    </style>
</head>

<body>
    <div class="align-content-center">
        <div class="page-header">
            <div class="page-header-img">
                <div class="container">
                    <div class="login-content">
                        <div class="login-form">
                            <div class="login-logo">
                               <a href="home"> <img class="align-content img-fluid" src="resources/img/logo/rounded_logo.png" alt=""></a>
                            </div>
                            

                        <%-- <c:if test="${not empty message}">
        			  		<p style="font-size:20px;color:white;text-align: center;" id="displayMsg"><c:out value="${message}"></c:out></p>
         				 </c:if>  --%>
                            <h4 class="text-center pt-2">Log In</h4>
                            <form action='LoginValidation' method="POST">
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Enter Email" name="email" id="email" required onchange="getRole()">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Enter Password" name="password" id="password" required>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" name="role" id="role" required>
                               
                               
                              </select>
                              
                                </div>
                                <div class="checkbox">
                                 
                                    <label class="pull-right">
                                <a href="displayPassowdPage">Forgot Password?</a>
                            </label>
                                </div>
                                <button type="submit" class="btn btn-info btn-flat m-b-30 m-t-30">Sign in</button>
                                <div class="register-link m-t-15 text-center">
                                    <p>Don't have account ? <a href="UserRegistration"> Sign Up Here</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="myModal" class="modal"
				style="height: 80px; width: 400px; align-items: center; top: 40%; left: 40%;">
				<div class="modal-content" id="popup-modal"
					style="background: #205081; color: #fff !important;">

					<p id="addsummaryfields" style="font-size:20px;color:white;text-align: center;" ></p>
					<button type="button" class="close"  aria-label="Close" id="removeModal5">
									<span aria-hidden="true">&times;</span>
								</button>
					
					<!-- <button class="close" id="closePopupSave" style="color:white" data->
						<i class="far fa-times-circle"></i>
					</button> -->
				</div>

			</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <!-- <script src="assets/js/main.js"></script> -->
<!--     <script src="resources/js/toast.js"></script> -->
    <script>
    
    var text=JSON.parse('${message}');

    if(text!=''){
	$('#addsummaryfields').html(text);
	$('#myModal').show(); 
    }
    
</script> 
    <script>
    $('#role').empty();
    function getRole(){
    	$('#role').empty();
var mail=$('#email').val();
if(mail=='maaservices123@gmail.com'){
	/* $('#role').append($('<option/>').attr("value", "").text("--Select Role--")); */
	$('#role').append($('<option/>').attr("value",1).text("Super Admin"));
}
else{
	 $('#role').append($('<option/>').attr("value", "").text("--Select Role--")); 
	 $('#role').append($('<option/>').attr("value",2).text("Admin"));
	 $('#role').append($('<option/>').attr("value",3).text("Owner"));
	 $('#role').append($('<option/>').attr("value",4).text("Tenant"));
	 $('#role').append($('<option/>').attr("value",5).text("Employee"));
	
}
        
        }
    $("#removeModal5").click(function() {
    	$('#myModal').hide(); 
        
    });
    </script>
    
</body>

</html>