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
    <link rel="shortcut icon" href="#">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="resources/css/style.css">
   
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
            padding: 23px 18px;
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

        select option{
            background-color: transparent;
            border-radius: 50%;
/*            color: #fff;*/
            
        }
        
        select option[value="1"] {
  background: rgba(100, 100, 100, 0.3);
}

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
                                <img class="align-content img-fluid" src="img/logo/rounded_logo.png" alt="">
                            </div>
                            <h4 class="text-center pt-2">Forgot Password</h4>
                            <form>
                                <div class="form-group">
                                <input type="hidden" id="prtyname" value="">
                                
                                    <input type="email" class="form-control" name="usermail" id="usermail" placeholder="Enter Email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$"
                                     required>
                                </div>                               
                                <div class="row">
                                	<div class="col">
                                	<button type="button" class="btn btn-info btn-flat m-b-30 m-t-30" onclick="submitMail()">Send My Password</button>
                                	</div>
                                	<div class="col">
                                	<a href="login" class="btn btn-info btn-flat m-b-30 m-t-30">Sign In</a>
                                	</div>
                                </div>
                                
                                
								
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script>
function submitMail(){;
	var mail=$('#usermail').val();
	var prtyname=$('#prtyname').val();
	var data={"mail":mail,"prtyname":prtyname};
	$.ajax({
        type: "post",
        url: "forgotPassword?mail="+mail+"",
        cache: false,
        async: false, 
        data:data,
        success: function(response){
	      alert(response!=null);
	        	 alert("Password sent to given mail");
				window.location.reload();
		         
        },
        error: function(){                                                                                 
        }                                                       
    }); 
}

    </script>
</body>

</html>