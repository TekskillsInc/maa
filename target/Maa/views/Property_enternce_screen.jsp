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
    <link href="resources/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="resources/css/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
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
             padding: 40px 50px 10px 50px ;
            height: 720px;

        }
    </style>
</head>

<body>
    <div class="right-panel" id="proced-panel" style="margin-top: 0px;">
        <!-- Header-->
        <!-- /#header -->
        <!-- Content -->
        <div class="content" id="contentWidth">
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="card modal-dialog-scrollable" >
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-9">
                                        <strong class="card-title">Please select your Property</strong>
                                    </div>

                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12  col-sm-12" id="singlePropety">
                                        <aside class="profile-nav alt">
                                        <c:forEach var="property" items="${propertyList}">
                                            <section class="card">
                                                <div class="card-header user-header alt bg-dark">
                                                    <div class="media">
                                                         <c:choose>
                                                      <c:when test='${empty property.prtyimg}'>
                                                        <a href="PropertyFetch?prptyid=${property.buildingid}">
                                                      <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="resources/images/maa_logo2.jpg">
                                                   </a> 
                                                    </c:when>
                                                      <c:otherwise>
                                                     <a href="PropertyFetch?prptyid=${property.buildingid}"> <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="resources/maa-images/${property.prtyimg}">
                                                     </a> </c:otherwise>
                                                      </c:choose>
                                                            
                                                        <div class="media-body mt-2">
                                                       
                                                           <a href="PropertyFetch?prptyid=${property.buildingid}&prptyname=${property.build_name}" style="color:#17a2b8">  <h4 class=" display-6">${property.build_name}</h4>
                                                         
                                                           </a>  
                                                            <c:choose>
															    <c:when test="${empty property.city}">
															        
															    </c:when>
															    <c:otherwise>
															        <p>${property.landmark},${property.city},<br>${property.dist},${property.state}</p>
															    </c:otherwise>
															</c:choose>
                                                            

                                                        </div>
                                                    </div>
                                                </div>

                                            </section>
                                            </c:forEach>
                                        </aside>
                                    </div>

                                   
                                       
                                    </div>

                                </div>
                            </div>
                        

                        </div>



                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- .animated -->
    </div>
   
    <div class="clearfix"></div>

    </div>
 
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/data-table/datatables.min.js"></script>
    <script src="resources/js/data-table/dataTables.bootstrap.min.js"></script>
    <script src="resources/js/data-table/dataTables.buttons.min.js"></script>
    <script src="resources/js/data-table/buttons.bootstrap.min.js"></script>
    <script src="resources/js/data-table/jszip.min.js"></script>
    <script src="resources/js/data-table/vfs_fonts.js"></script>
    <script src="resources/js/data-table/buttons.html5.min.js"></script>
    <script src="resources/js/data-table/buttons.print.min.js"></script>
    <script src="resources/js/data-table/buttons.colVis.min.js"></script>
    <script src="resources/js/datatables-init.js"></script>
    <script src="resources/js/custm.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>