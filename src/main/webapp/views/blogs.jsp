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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="css/icons.css">
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
	<link rel="stylesheet" href="resources/css/wizard/smart_wizard.css">
	<link rel="stylesheet" href="resources/css/quill.css">
	<!-- <link rel="stylesheet" href="resources/css/quill.snow.css">
	<link rel="stylesheet" href="resources/css/quill.bubble.css"> -->
	<link href="https://cdn.quilljs.com/1.1.6/quill.snow.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/style.css">
	 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<style>
		.blog-view h5 {
    font-size: 15px;
    font-weight: 600;
}
		.blog-view h6{
			font-size: 13px;
		}
		
		.blog-view span{
			font-size: 13px;
			font-weight: 600
		}
		
		.blog-view p{
			font-size: 13px;
			line-height: 22px;
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
                box-shadow: 0 1px 3px 1px rgba(0,0,0,0.4);
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
    </style>
</head>

<body>
	<!-- Left Panel -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="MasterDashboard"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
					</li>
					<li>
						<a href="admin-properties?userid=${userid}"><i class="menu-icon fa fa-building-o"></i>Properties </a>
					</li>
					<li>
						<a href="classifides-admin"><i class="menu-icon fa fa-cubes"></i>Classifieds </a>
					</li>
					<li>
						<a href="vendor-admin"><i class="menu-icon fa fa-user"></i>Vendors </a>
					</li>
					<li>
						<a href="vacancies-admin"><i class="menu-icon fa fa-search"></i>Vacancies</a>
					</li>
					<!-- <li>
						<a href="reports.html"><i class="menu-icon fa fa-file" aria-hidden="true"></i>Reports</a>
					</li> -->
					<li>
						<a href="blogs"><i class="fa fa-rss menu-icon" aria-hidden="true"></i>Blogs</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
					<a class="navbar-brand" href="MasterDashboard">MaaServices </a>
					<a class="navbar-brand hidden" href="./"><img src="resources/img/logo/rounded_logo.png" alt="Logo"></a>
				</div>
				
			</div>
			<div class="top-right">
				<div class="header-menu">
					<div class="header-left">
						<!-- <a href="#">
							
						</a> -->
			
					<div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="resources/images/admin.jpg" alt="User Avatar">
                        <span style="color:white"><b>Super Admin</b></span>
                       
                       </a>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>
                            <a class="nav-link" href="changePassword"><i class="fa fa-power -off"></i>Change Password</a>
                            <a class="nav-link" href="logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>
				</div>
			</div>
			</div>
		</header>
		
			<!-- Animated -->
			<div class="content">		<!-- Header-->
			<!-- Content -->
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12 col-sm-12 col-xs-12" id="blogListId">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Blogs</strong>
								</div>
								<div class="col-4">
								<c:if test='${roleid==2||roleid==1}'>
									<div class="addButton" id="ownerPlusAdd" style="float: right">
										<button type="button" class="btn btn-info btn-sm" onclick="addBlog();">
											<i class="fa fa-plus"></i>
										</button>

									</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="blogDetails" class="text-center" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
									<thead>
										<tr>
											 <th>Image</th> 
											<th>Title</th>
											<th>Posted By</th>											
											<th>Date</th>											
											<!-- <th>Status</th>	 -->	
											<td style="display:none" ></td>									
											<th class="custmheight">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="blog" items="${blogList}">
                                    <tr>
                                    <c:choose>
                                    <c:when test="${not empty blog.image}">
                                         <td><img class="photo_round" src="resources/blogimages/${blog.image}" style="width: 40px;height: 40px;border-radius: 50%;"></td> 
                                       </c:when> 
                                       <c:otherwise> <td><img class="photo_round" src="resources/images/home-images/3.jpg" style="width: 40px;height: 40px;border-radius: 50%;"></td></c:otherwise>
                                       </c:choose>
                                       <td>${blog.title}</td>
                                        <td>${blog.postedby}</td>
                                        <td>${blog.postedon}</td>
                                        <td style='display:none' id="blogDescTd${blog.blogid}">${blog.description}</td>
                                        <td><button type="button" class="btn btn-outline-info btn-sm custnBtn" data-toggle="modal" data-target="#blogsViewModal" 
                                        onclick="viewBlog('${blog.blogid}','${blog.title}','${blog.postedby}','${blog.postedon}','${blog.tags}','${blog.image}')"><i class="fa fa-eye"></i></button>
                                            <button type="button" class="btn btn-outline-info btn-sm custnBtn" 
                                            onclick="editBlog('${blog.blogid}','${blog.title}','${blog.postedby}','${blog.postedon}','${blog.tags}','${blog.image}')">
                                            <i class="fa fa-edit"></i></button>
                                             <button type="button" class="btn btn-outline-info btn-sm custnBtn"  
                                            onclick="deleteBlog(${blog.blogid})"><i class="fa fa-trash-o"></i></button>
                                        </td>
                                        </tr>
                                        </c:forEach>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12" id="blogsAddModalId" style="display:none;">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
								<c:if test='${roleid==2||roleid==1}'>
									<!-- <div class="addButton" id="ownerPlusAdd" style="float: right"> -->
										 <strong class="card-title"><a type="button" href="blogs" class="btn btn-info btn-sm" style="color: #fff"><i class="fa fa-arrow-left"></i></a>&nbsp; Add Blogs</strong>
									<!-- </div> -->
									</c:if>
								</div>
							</div>
						</div>
						<div class="card-body">
						<form action="saveBlog" method="post" enctype="multipart/form-data" id="blogsaveform" onsubmit="return checkForm(this);">
						 <div class="row">
                                <div class="col mx-auto">
                                    <div class="card">
                                       <!--  <div class="card-header"><strong>Notification Details</strong></div> -->
                                        <div class="card-body card-block">
                                        <div class="form-group">
													<label for="company" class=" form-control-label">image</label>
													<input type="file" id="files" name="files" placeholder="Blog Title" class="form-control" required>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Blog Title</label>
													<input type="text" id="blogtitle" name="blogtitle" placeholder="Blog Title" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Courtesy</label>
													<input type="text" id="postedby" name="postedby" placeholder="Courtesy" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Posted ON</label>
													<input type="date" id="postedon" name="postedon" placeholder="Date" class="form-control">
												</div>
												<div class="form-group">
                                          <label for="company" class=" form-control-label">Description</label>
                                          		<div class="editor-full">
														<div id="complaintEditAdd" class="ql-scroll-y" style="width: 100%;height:100%;">
														<textarea id="descriptionAdd" name="description"  style="display:none" data-rule-required='true'
											rows='1'  class="form-control" required maxlength="500">									
										     </textarea>
														</div>
													</div>
                             					</div>
												
												<div class="form-group">
													<label for="company" class=" form-control-label">Tags</label>
													<textarea class="form-control" rows="4" id="tags" name="tags"></textarea>
												</div>
                                        </div>
                                     </div>
                                  </div>
                           </div>
                           <center> <button type="submit" class="btn btn-info btn-sm"><i class="fa fa-save"></i>Save</button>
							</center> 
                           </form>
						</div>
					</div>
				</div>
				
				
				<div class="col-md-12 col-sm-12 col-xs-12" id="blogsEditModalId" style="display:none;">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
								<c:if test='${roleid==2||roleid==1}'>
									<!-- <div class="addButton" id="ownerPlusAdd" style="float: right"> -->
										 <strong class="card-title"><a type="button" href="blogs" class="btn btn-info btn-sm" style="color: #fff"><i class="fa fa-arrow-left"></i></a>&nbsp; Edit Blogs</strong>
									<!-- </div> -->
									</c:if>
								</div>
							</div>
						</div>
						<div class="card-body">
						<form action="updateblog" method="post" enctype="multipart/form-data" id="editBlogForm" onsubmit="return checkForm(this);">
						 <input type="hidden" id="ed_blogid" name="blogid">
						 <div class="row">
                                <div class="col mx-auto">
                                    <div class="card">
                                       <!--  <div class="card-header"><strong>Notification Details</strong></div> -->
                                        <div class="card-body card-block">
	                                         <div class="form-group">
													<label for="company" class=" form-control-label">image</label>
													<input type="file" id="ed_files" name="files" placeholder="Blog Title" class="form-control" >
												
												<span id="blogImageedit"></span>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Blog Title</label>
													<input type="text" id="ed_blogtitle" name="blogtitle" placeholder="Blog Title" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Courtesy</label>
													<input type="text" id="ed_postedby" name="postedby" placeholder="Courtesy" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Posted ON</label>
													<input type="date" id="ed_postedon" name="postedon" placeholder="Date" class="form-control">
												</div>
												
												
										<div class="form-group">
                                          <label for="company" class=" form-control-label">Description</label>
                                           <div class="editor-full">
                                           <div id="blogsEdit" class="ql-scroll-y" style="width: 100%;height:100%;">
                                          </div>
                                          <textarea id="descriptionEdit" name="description"   data-rule-required='true'
											rows='1'>								
										     </textarea>
                             			</div>
                             			</div>
                             			</div>
												
												<div class="form-group">
													<label for="company" class=" form-control-label">Tags</label>
													<textarea class="form-control" rows="4" id="ed_tags" name="tags"></textarea>
												</div>
                                        </div>
                                     </div>
                                  </div>
                           </div>
                           <center> <button type="submit" class="btn btn-info btn-sm"><i class="fa fa-save"></i>Save</button>
							</center> 
                           </form>
						</div>
					</div>
				</div>
				
				<div class="clearfix"></div>
				
				
				
				
<!-- <div class="modal fade" id="blogsEditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<form action="updateblog" method="Post" enctype="multipart/form-data" id="editBlogForm">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Edit Blog Details</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="card">
                                        <input type="hidden" id="ed_blogid" name="blogid" placeholder="Blog Title" class="form-control">
                                        <div class="card-body card-block">
                                        <div class="form-group">
													<label for="company" class=" form-control-label">image</label>
													<input type="file" id="ed_files" name="files" placeholder="Blog Title" class="form-control" >
												
												<span id="blogImageedit"></span>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Blog Title</label>
													<input type="text" id="ed_blogtitle" name="blogtitle" placeholder="Blog Title" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Courtesy</label>
													<input type="text" id="ed_postedby" name="postedby" placeholder="Courtesy" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Posted ON</label>
													<input type="date" id="ed_postedon" name="postedon" placeholder="Date" class="form-control">
												</div>
												
												
										<div class="form-group">
                                          <label for="company" class=" form-control-label">Description</label>
                                           <div class="editor-full">
                                           <div id="blogsEdit" class="ql-scroll-y" style="width: 100%;height:100%;">
                                          </div>
                                          <textarea id="descriptionEdit" name="description"   data-rule-required='true'
											rows='1'>style="display:none"									
										     </textarea>
                             			</div>
                             			</div>
                             			</div>
												
												<div class="form-group">
													<label for="company" class=" form-control-label">Tags</label>
													<textarea class="form-control" rows="4" id="ed_tags" name="tags"></textarea>
												</div>
											</div>
									
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
								<input type="submit" class="btn btn-primary btn-sm" value="Save">
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							</div>
							</div>
							
							</form>
						</div>
					</div> -->
				</div>


<div class="modal fade" id="blogsAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content ">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Blog Details</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="saveBlog" method="post" enctype="multipart/form-data" id="blogsaveform">
							<div class="modal-body">
								<div class="row">
								<div class="col mx-auto">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="card">

											<div class="card-body card-block">
											
											<div class="form-group">
													<label for="company" class=" form-control-label">image</label>
													<input type="file" id="files" name="files" placeholder="Blog Title" class="form-control" required>
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Blog Title</label>
													<input type="text" id="blogtitle" name="blogtitle" placeholder="Blog Title" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Courtesy</label>
													<input type="text" id="postedby" name="postedby" placeholder="Courtesy" class="form-control">
												</div>
												<div class="form-group">
													<label for="company" class=" form-control-label">Posted ON</label>
													<input type="date" id="postedon" name="postedon" placeholder="Date" class="form-control">
												</div>
												
												
												<div class="form-group">
                                          <label for="company" class=" form-control-label">Description</label>
                                          		<div class="editor-full">
														<div id="complaintEditAdd" class="ql-scroll-y" style="height: 300px;">
														<textarea id="descriptionAdd" name="description"  style="display:none" data-rule-required='true'
											rows='1'  class="form-control" required maxlength="500">									
										     </textarea>
														</div>
													</div>
                             					</div>
												
												<div class="form-group">
													<label for="company" class=" form-control-label">Tags</label>
													<textarea class="form-control" rows="4" id="tags" name="tags"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								</div>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary btn-sm" value="Save">
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>

							</div>
							</form>
						</div>
					</div>
				</div>
				
<div class="modal fade" id="blogsViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog  modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="blogmodalTitle"></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" >
								<div class="row">
									<div class="col">
										<div class="card">
											<div class="thumb-content">													
													<img class="card-img-top img-fluid"  id="blogImageView" alt="Card image cap">											
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-8">
														<h4 class="card-title"></h4>
													</div>
													
												</div>
												
												<div class="row">
													<div class="col">
														<div class="blog-view">
														<h5 class="card-title" id="vi_blogtitle"></h5>
														<h6 class="card-title">Courtesy: <span id="vi_postedby"></span> Posted On: <i class="fa fa-calendar"></i><span id="vi_postedon"></span> </h6>
															<p class="text-justify" id="vi_description"></p>
															</div>
														<div class="keywords blog-view">
															<h6>Tags:</h6>
															<p id="vi_tags"></p>
															
															
														</div>
													</div>													
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
			<!-- .animated -->
		</div>
		
		<!-- /.site-footer -->
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		
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
		<script src="resources/js/bootstrap-quill.js"></script>
		<script src="resources/js/sprite.svg.js"></script>
		<script src="https://cdn.quilljs.com/1.1.6/quill.js"></script>
		<script src="resources/js/main.js"></script>
		<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script> 
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		<script>
			var toolbarOptions = [
				[{
					'header': [1, 2, 3, 4, 5, 6, false]
				}],
				['bold', 'italic', 'underline', 'strike'], // toggled buttons
				['blockquote', 'code-block'],
				[{
					'header': 1
				}, {
					'header': 2
				}], // custom button values
				[{
					'list': 'ordered'
				}, {
					'list': 'bullet'
				}],
				[{
					'script': 'sub'
				}, {
					'script': 'super'
				}], // superscript/subscript
				[{
					'indent': '-1'
				}, {
					'indent': '+1'
				}], // outdent/indent
				[{
					'direction': 'rtl'
				}], // text direction
				[{
					'size': ['small', false, 'large', 'huge']
				}], // custom dropdown
				[{
					'color': []
				}, {
					'background': []
				}], // dropdown with defaults from theme
				[{
					'font': []
				}],
				[{
					'align': []
				}],
				['link', 'image'],
				['clean'] // remove formatting button
			];
		</script>
	<!--  <script>
			var quillFull1 = new Quill('#blogsEdit', {
				modules: {
					toolbar: toolbarOptions,
					autoformat: true
				},
				theme: 'snow',
				placeholder: "Write something..."
			});
		</script>  -->
	<script>
	 /*  $("#blogsaveform").on("submit",function(){
		//$("#description").val($("#complaintEditAdd").html());
		})
		
		$("#editBlogForm").on("submit",function(){
		//$("#ed_description").val($("#blogsEdit").html());
		}) */
	</script>
	<script>
	function viewBlog(blogid,title,postedby,postedon,tags,imagepath){
		var blogDes=$('#blogDescTd'+blogid).html();
		$('#vi_blogtitle').text(title);
		$('#blogmodalTitle').text(title);
		$('#vi_postedby').text(postedby);
		$('#vi_description').html(blogDes);
		$('#vi_postedon').text(postedon);
		$('#vi_tags').text(tags);
		var path = "resources/blogimages";
		var oimage = path + "/" + imagepath;
		
		$('#blogImageView').attr("src", oimage);
	}
	
	/* $('#blogsAddModal').on('shown.bs.modal', function() {
		//$('#descriptionAdd').summernote();
		$('#descriptionAdd').summernote({
			  dialogsInBody: true
			  //,airMode: true
			});
	}); */
	function addBlog() {
		$('#blogListId').hide();
		$('#blogsAddModalId').show();
		//$('#descriptionAdd').summernote();
		$('#descriptionAdd').summernote({
			  dialogsInBody: true
			  //,airMode: true
			});
	}
	function editBlog(blogid,title,postedby,postedon,tags,imagepath){
		$('#blogsEditModalId').show();
		$('#blogListId,#blogsAddModalId').hide();
		var blogDes=$('#blogDescTd'+blogid).html();
		$('#ed_blogtitle').val(title);
		$('#ed_blogid').val(blogid);
		$('#ed_postedby').val(postedby);
		$('#ed_postedon').val(postedon);
		$('#ed_tags').val(tags);
		$('#descriptionEdit').summernote('code', blogDes); 
		//CKEDITOR.instances.ed_description.setData(blogDes);
    	var srcval="resources/blogimages/"+imagepath;
		$('#blogImageedit').text(srcval);
	}
	
	function deleteBlog(id){
		var retVal = confirm("Do you want to delete?"); 
		  if( retVal == true ) {
				 $.ajax({
				    	type : "GET",
				        asyn : false,
				        contentType: "application/json", // NOT dataType!
				        url  : "deleteBlog?id="+id+"",
				        success  : function(response){
					        if(response=="success"){
						        alert("Blog deleted successfully");
						        window.location.href="blogs";
						        }
					        else{
					        	alert("Blog not deleted");
					        	 window.location.href="blogs";
						        }
				        }
					    });
	          return true;
	       } else {
	         // document.write ("User does not want to continue!");
	          return false;
	       } 
	}
	</script>
</body>
</html>