<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script src="https://cdn.ckeditor.com/4.9.2/full/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script> 

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MPRTS|Dashboard</title>
<meta name="description" content="Maa Properties">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.navbar-brand {
	font-size: 18px !important;
}
</style>


</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> 
		<img src="img/logo/rounded_logo.png"
			alt="">
	</div>

	<div id="right-panel" class="right-panel" style="margin-top: 0px;">
		<!-- Header-->


		<!--    Modal popup for switch property start here-->


		<!--        Modal popup for switch property ends here-->
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="col-md-12 col-sm-12 col-xs-12" id="assetMblVersn">
					<div class="card" id="responseCard">
						<div class="card-header">
							<div class="row">
								<div class="col-8">
									<strong class="card-title">Terms and Conditions</strong>
								</div>
								<!-- <div class="col-4">
									<div class="addButton" id="NotificatinPlusAdd" style="float: right">
										<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#notificationAddModal"><i class="fa fa-plus"></i></button>
									</div>
								</div> -->
							</div>
						</div>
						<div class="card-body">

							<div class="ckeditor">
								<%-- <center>
													<button class='close' data-dismiss='modal' type='button'>&times;</button>
													<h3>View Comments</h3>
												</center> --%>
						<form action="saveTandC" method="post">
						<input type="hidden" name="prptyid" value="${prptyid}">
						<input type="hidden" name="prptyName" value="${prptyName}">
						<input type="hidden" name="userid" value="${userid}">
						<%-- <input type="hidden" name="tblpk" value="${tblpk}"> --%>
					<input type="hidden" name="terms" id="terms" value="${tandC}"> 
								<div class='modal-body'>
									
									<div style="margin-top: -8px;">
										<textarea id="tandc" name="tandc" data-rule-required='true'
											rows='1' class="ckeditor" class="form-control" required
											>${tandC} 										
										</textarea>
									</div>
								</div>
								<center><button type="submit" class="btn btn-info btn-sm">Save</button></center>
								</form>
								<%-- <button type="button" class="btn btn-secondary btn-sm" >Cancel</button></center> --%>


							</div>
							
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- .animated -->
		</div>
		<!-- /.content -->
		<div class="clearfix"></div>
		<!-- Footer -->
	<!-- 	<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2019 @Maa Properties</div>
				</div>
			</div>
		</footer> -->
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script>
$(document).ready(function(){
   var terms=$("#terms").val();
  
   //$("tandc").val(terms);
   CKEDITOR.instances.tandc.setData(terms);
});

	
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


	<!-- 	<script>
		var quillFull = new Quill('#document-full', {
			modules: {
				toolbar: toolbarOptions,
				autoformat: true
			},
			theme: 'snow',
			placeholder: "Write something..."
		});
	</script> 

	<script>
		var quillFull = new Quill('#documenEditor', {
			modules: {
				toolbar: toolbarOptions,
				autoformat: true
			},
			theme: 'snow',
			placeholder: "Write something..."
		});
	</script>-->

</body>

</html>