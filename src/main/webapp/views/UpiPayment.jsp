<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<div>
<form>
<input type="hidden" id="upi" name="upi" value="${uri}"> 
<a href='upi://pay?pa=kiran.ravi0908@ybl&pn=ravikiran&am=58&cu=INR' id='__UPI_BUTTON__' style='background: #ff912f;border: 2px solid #8a4100;padding: 10px;text-decoration: none;color: white;font-size: larger;border-radius: 10px;'>Pay using UPI</a>
									<input type="text" id="callback" value="${uri}">
									</form>
									</div>
									<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<!-- <script type="text/javascript">

		var linkToShare = document.getElementById("upi");
        
       
        var params = {
            'action': 'http://webintents.org/share',
            'type': 'text/uri-list',
            'data': linkToShare
        };

        // create the intent
        var intent = new WebKitIntent(params);

console.log(linkToShare);

        // start the intent, and pass in the callback
        // that is called on succes.
        window.navigator.webkitStartActivity(intent, function(data) {
            $("#callback").text("Received from invoked intent: " + data);
        });
   
</script> -->
</body>
</html>