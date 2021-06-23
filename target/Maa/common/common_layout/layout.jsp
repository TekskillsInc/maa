 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<!DOCTYPE html PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN" "http:/www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<link href="resources/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="resources/css/icons.css">
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
    
    <link rel="stylesheet" href="resources/css/style.css">
  
<tilesx:useAttribute name="cssitems" />
<c:forEach var="href" items="${cssitems}">
    <link type="text/css" rel="stylesheet" href="${href}" />
    	
</c:forEach>
<tilesx:useAttribute name="jsitems" />
<c:forEach var="src" items="${jsitems}">
<script src="${src}" type="text/javascript"></script>
</c:forEach>

</head>
<body>
    <div>
    <tiles:insertAttribute name="left_bar" />
    <div id="right-panel" class="right-panel">
        <tiles:insertAttribute name="header" />
        </div>
        
        
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
    </div>
    
      
	
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
	
    </body>
</html> 