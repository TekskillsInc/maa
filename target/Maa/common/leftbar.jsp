  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	.dropdown-menu{
	width: 203px !important;
	}
	
</style>




 <aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
		 
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<c:if test="${roleid == 1}">
					<li class="active">
						<a href="masterAdmin"><i class="menu-icon fa fa-laptop"></i>Home </a>
					</li>
					</c:if>
					  <li>
                        <a href="PropertyFetch?prptyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-building-o"></i>Property Details </a>
                    </li>
                    <li>
                        <a href="AssetDetails?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-cubes"></i>Asset Details </a>
                    </li>
                    <li>
                        <a href="Ownerdetails?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-user"></i>Owner Details </a>
                    </li>

					<li>
						<a href="Tenantdetails?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-users"></i>Tenants Details </a>
					</li>
					<li>
						<a href="AssociationDetails?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-users"></i>Association Details </a>
					</li>
					
					<%-- <c:choose> --%>
            		
					
					<li>
						<a href="meterReadings?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-bank"></i>Meter Readings </a>
					</li>
					<%-- <li>
						<a href="meterCosts?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-bank"></i>Meter Costs </a>
					</li>
					<li>
						<a href="GST?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-bank"></i>GST</a>
					</li> --%>
						
					<%-- 	</c:choose> --%>
					<li>
						<a href="invoice?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-bar-chart-o"></i>Invoice </a>
					</li>
					<li>
						<a href="payments?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-money"></i>Payment Details </a>
					</li>
					<li>
						<a href="vendors?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-credit-card"></i>Vendor Details </a>
					</li>
					<li>
						<a href="ExpenseDetails?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-car"></i>Expense Details</a>
					</li>
					<li>
						<a href="visitors?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-car"></i>Visitors </a>
					</li>

					<li>
						<a href="notification?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-bullhorn"></i>Notifications </a>
					</li>
					<li>
						<a href="complaints?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-comments"></i>Complaints </a>
					</li>
					<li>
						<a href="classifides?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-credit-card"></i>classifides </a>
					</li>
					<li>
						<a href="comingsoon?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-info-circle"></i>Events </a>
					</li>
					<c:if test="${roleid == 2||roleid == 1}">
					<li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cog"></i>Settings</a>
                        <ul class="sub-menu children dropdown-menu" style="width:200px!important">
                            <li>
						<a href="meterCosts?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-cog"></i>Meter Costs </a>
					</li>
					<li>
						<a href="GST?prtyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-cog"></i>GST</a>
					</li>
					<li>
						<a href="termsNConditions?prptyid=${prptyid}&prptyName=${prptyName}&userid=${userid}&roleid=${roleid}"><i class="menu-icon fa fa-cog"></i>Terms and conditions</a>

					</li>
                        </ul>
                    </li>
                    </c:if>
				</ul>
			</div>
		
			
			
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
<script>
$(function() {
    $( 'ul.nav li' ).on( 'click', function() {
          $( this ).parent().find( 'li.active' ).removeClass( 'active' );
          $( this ).addClass( 'active' );
    });
});

</script>

</html>