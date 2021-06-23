 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                    <a class="navbar-brand" href="#">${prptyName}</a>
                    <a class="navbar-brand hidden" href="./"><img src="resources/img/logo/rounded_logo.png" alt="Logo"></a>
                </div>
              
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                       <!--  <div class="flash-msg">
                            <marquee behavior="scroll" direction="left" class="py-2">Maheshwar is a kingmaker&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hello welcome to Maa Properties</marquee>
                        </div> -->
                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="modal" data-target="#switchModalPopUp">
                                <i class="fa  fa-exchange"></i>
                            </button>
                        </div>
                        <a href="#">
                            <div class="dropdown for-notification">
                                <button class="btn btn-secondary dropdown-toggle" id="support">
                                    <i class="fa fa-info-circle"></i>
                                </button>
                            </div>
                        </a>
                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">${notfcount}</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have ${notfcount} Notification</p>
                            </div>
                        </div>
                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa  fa-user"></i>
                                <span class="count bg-primary">${compcount}</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="message">
                                <p class="red">You have ${compcount} Complaints</p>
                            
                            </div>
                        </div>
                    </div>
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="resources/images/admin.jpg" alt="User Avatar">
                        </a>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>
                            <a class="nav-link" href="changePassword"><i class="fa fa-power -off"></i>Change Password</a>
                            <a class="nav-link" href="logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
		

<div class="modal fade" id="switchModalPopUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
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
                                 <c:forEach var="property" items="${propertyList}">
                                          <div class="col-md-12">
                                        
                                         <aside class="profile-nav alt">
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
                                                       <%--  <a href="PropertyFetch?prptyid=${property.buildingid}">
                                                            <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="resources/maa-images/${property.prtyimg}">
                                                        </a> --%>
                                                        <div class="media-body">
                                                         <a href="PropertyFetch?prptyid=${property.buildingid}"  style="color:#17a2b8">
                                                            <h4 class="mt-3 display-6">${property.build_name}</h4>
                                                            </a>
                                                            <p>${property.landmark},${property.city},<br>${property.dist},${property.state}</p>

                                                        </div>
                                                    </div>
                                                </div>

                                            </section>
                                            </aside>
                                    </div>
                                            </c:forEach>
                                        
                               
                            </div>
                        </div>
                        <hr>
                        <!-- <p class="text-center"><a href="#">View All</a></p> -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info btn-sm">Ok</button>
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


</html> 