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
								<div class="col-9">
									<strong class="card-title"><a type="button" href="complaints?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}" class="btn btn-info btn-sm" style="color:#fff">
									<i class="fa fa-arrow-left"></i></a>&nbsp;&nbsp;Complaints - Edit</strong>
								</div>
								
							</div> 	
						</div>
						<div class="card-body">

					<div class="ckeditor">
					  <form action="updateComplaintDetails" method="POST" onsubmit="return echeckForm(this);"> 
  						  <input type="hidden" class="form-control" id="prptyid" name="prptyid" value='${prptyid}'>
							<input type="hidden" class="form-control" id="prptyName" name="prptyName" value='${prptyName}'>
							<input type="hidden" class="form-control" id="roleid" name="roleid" value='${roleid}'>
							<input type="hidden" class="form-control" id="compId" name="compId" value='${compObj.complaints.id}'>
							<input type="hidden" class="form-control" id="fltId" name="fltId" value='${compObj.complaints.flatno}'>
							<input type="hidden" class="form-control" id="cdesc" name="cdesc" value='${compObj.complaints.description}'>
										<div class="form-group">
                                            <label for="company" class=" form-control-label">Asset Number</label>
                                            <div id="custm-select">
                                                <select class="custom-select" id="eflatno" name="eflatno" required>
                                                        <option value="">Select Asset</option>
                                                        <c:forEach var="asset" items="${assetList}">
                                                         <option value="${asset.flatno}">${asset.flatno}</option>
                                                         </c:forEach>
                                               </select>
                                            </div>
                                        </div>
                                          
										<div class="form-group">
											<label for="company" class=" form-control-label">Title</label><br>
											 <input type="text" id="etitle" name="etitle"  placeholder="Title" maxlength="75" class="form-control" value='${compObj.complaints.title}' required> 
										<span style="color:cyan">75 characters only allowed</span>
										</div>
										<div class="form-group" id="compstatus2">
											<label for="company" class=" form-control-label">Complaint Status</label><br>
											 <input type="text" id="estatus2" name="estatus2"  placeholder="Title" class="form-control" value='${compObj.complaints.status}' readonly >
											
										</div>
										<div class="form-group" id="edescriptionOT">
                                          <label for="company" class=" form-control-label">Description</label>
                                           <div class="editor-full">
                                           <div id="document-full" class="ql-scroll-y">
											<textarea id="edescription" name="edescription" data-rule-required='true'
											rows='1' class="ckeditor" class="form-control" required>									
										     </textarea>
                                          </div>
                                          </div>
                                        </div>
								<center><button type="submit" class="btn btn-info btn-sm">Save</button>
								<a href="complaints?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}" class="btn btn-secondary btn-sm" >Cancel</a>
								</center>
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
	<script type="text/javascript">
	$(document).ready(function(){
		   var cdesc=$("#cdesc").val();
		   CKEDITOR.instances.edescription.setData(cdesc);
		   
		   var fltId=$('#fltId').val();
		   var eflatno=$("select[name='eflatno']");
		   eflatno.find('option[value="'+fltId+'"]').attr('selected', true);  
	});
	  function echeckForm(form)
	     {
	    	 var roleId=$('#roleid').val();
	    	 if(roleId==3 || roleId==4){
	    		  var cmt_len=CKEDITOR.instances['edescription'].getData().replace(/<[^>]*>/gi, '').length;
	    		 
	    		  if(cmt_len==0) {
	    	           alert( 'Please enter complaint description' );
	    	           return false;
	    	       }
	    	 }
	       return true;
	     }
    </script>
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