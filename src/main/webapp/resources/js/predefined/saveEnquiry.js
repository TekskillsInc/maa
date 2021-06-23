function saveEnquiryForm() {
			var arra1 = [];
			var Utype=$("input[name='ntype']:checked").val()
			var Etype = $('#mtype').val();
			var Uname = $('#Uname').val();
			var Uemail = $('#Uemail').val();
			var Uphone = $('#Uphone').val();
			var rDesc = $('#rDesc').val();
			var Ptype = $('#pType').val();
		  if(Utype!="" && Etype!="" &&Ptype!="" && Uname!="" && Uemail!="" && Uphone!="" && rDesc!="") {
				var enquiry = {
					userType : Utype,
					enquiryType : Etype,
					prptyType : Ptype,
					name : Uname,
					email : Uemail,
					phone : Uphone,
					description:rDesc
				}
				$
						.ajax({
							type : "post",
							url : "enquiry",
							cache : false,
							async : false,
							contentType : 'application/json',
							data : JSON.stringify(enquiry),
							success : function(response) {
								if(response=='Success'){
								alert("We will respond to your message within 24 hours.");
								}else{
									alert("Sorry enquiry not posted");
								}
								window.location.reload();
							},
							error : function() {
							}
						});
			}
			else {
				alert("All Details are mandatory");
				}
}