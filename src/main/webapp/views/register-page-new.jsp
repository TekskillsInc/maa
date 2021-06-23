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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/cs-skin-elastic.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">
    
    <style>
    
    
     .login-content{
     background-image: linear-gradient( rgba(0,0,0,0.1), rgba(0,0,0,0.5) );
     }
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
/*            height: 100vh;*/
            z-index: -1;
        }

        .login-content h4 {
            color: #fff;
        }

        .login-form .form-control {
            background-color: transparent !important;
            border: 1px solid #E3E3E3;
            border-radius: 30px;
            padding: 23px 18px;
        }

        .login-form .form-control::placeholder {
            color: #ded5d5;
        }

        .login-form .form-control {
          color: #ded5d5 !important;
        }

        .login-form .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 255, 255, 0.5);
        }

        select option{
            background-color: transparent;
            border-radius: 50%;
/*            color: #fff;*/
            
        }
        
        select option[value="1"] {
  background: rgba(100, 100, 100, 0.3);
}
        
        .form-group label{
            color: #ded5d5;
        }

        }
        
        .login-form .form-control{
        	color:#fff!important;
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
                     <a href="home"><img class="align-content" src="resources/img/logo/rounded_logo.png" alt=""></a>
                </div>
                    <form action="saveUserRegistration" method="POST">
                        <div class="form-group">
                            <label for="company" class=" form-control-label">Register yourself as</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="form-check-inline form-check">
                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="aptAuthority" name="aptAuthority" value="option1" class="form-check-input" checked>Apartment Authority
                                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Bulding Name *</label>
                            <input type="text" class="form-control" placeholder="Bulding Name" name ="BuldingName"  id="BuldingName" pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" required>
                        </div>
                        <div class="form-group">
                            <label>Email address *</label>
                            <input type="email" class="form-control" placeholder="Email" name ="BuldingMail"  id="BuldingMail" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$"
                             onchange="checkMail()" required>
                        </div>
                        <div class="form-group">
                            <label>Mobile *</label>
                            <input type="text" class="form-control" placeholder="Mobile" name ="BuldingPhn"  id="BuldingPhn"  minlength="10" maxlength="12" required pattern="^[0-9]*$" required>
                        </div>
                        <div class="row">
                            <div class="form-group col-6">
                                <label>Password *</label>
                                <input type="password" class="form-control" placeholder="Password" name ="Password"  id="Password" required>
                            </div>
                            <div class="form-group col-6">
                                <label>Confirm Password *</label>
                                <input type="password" class="form-control" placeholder="Confirm Password" name ="cfmPassword"  id="cfmPassword"  required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-6">
                                <label>USC NO *</label>
                                <input type="text" class="form-control" placeholder="Unique service number" name ="uscNo"  id="uscNo"  minlength="9"  maxlength="15" required pattern="^[0-9]*$">
                                <a style="color:#06bbf5;cursor:pointer" data-toggle="modal" data-target="#exampleModal">View Sample Bill</a>
                            </div>
                            <div class="form-group col-6">
                                <label>Pincode *</label>
                                <input type="text" class="form-control" placeholder="pincode" name ="pincode"  id="pincode"  minlength="6" maxlength="7" required pattern="^[0-9]*$">
                            </div>
                        </div>
                        <div class="checkbox">
                            <label>*
                                <input type="checkbox" required> Agree the terms and policy
                            </label>
                        </div>
                        <button type="submit" class="btn btn-info btn-flat m-b-30 m-t-30" id="registerId" onclick="return Validate()">Register</button>
                        
                        <div class="register-link m-t-15 text-center">
                            <p>Already have account ? <a href="logout"> Sign in</a></p>
                        </div>
                    </form>
                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Sample bill</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
		  	<div class="col">
				<img src="resources/images/bill.jpg" class="img-fluid">
			</div>
		  </div>
      </div>
      
    </div>
  </div>
</div>
    
    
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
   <script type="text/javascript" src="/resources/assets/js/main.js">
</script>
</body>

<script>
$('#registerId').attr('disabled',true);
function Validate() {
    var password = document.getElementById("Password").value;
    var confirmPassword = document.getElementById("cfmPassword").value;
    if (password === confirmPassword) {
    	 return true;
        
       
    }
    else{
    	  alert(" Password and confirm Password do not match.");
    	 return false;
   
    }
}
function checkMail(){
	var email=$('#BuldingMail').val();
	
	$.ajax({
		type : "get",
	    url  : "checkBuildingMail?email="+email+"",
	    cache : false,
	    async : false,
	    success  : function(response){
	    	if(response!=''){
			 alert("This mail already resistered with us,change mail id or Continue to login"); 
			 $('#registerId').attr('disabled',true);
            }
	    	else{$('#registerId').attr('disabled',false);
		    	}
	    },
	    error: function(){  
	     alert('Asset List not available');
	    }
	});
	
}
</script>
<script>
              history.pushState(null, document.title, location.href);
              window.addEventListener('popstate',function(event){
              history.pushState(null,document.title, location.href);
              });
              
</script>

</html>