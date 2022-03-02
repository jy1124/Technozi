<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Technozi</title>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0maximum-scale=1.0, user-scalable=no" />
</head>
	<style>
		
		html, body { margin: 0; padding: 0; background: #6E6E6E; height: 100%; max-height: 844px; font-family: Arial; }
		p { margin: 0; padding: 0; }
				
		.checkInContainer {
			width: 100%;
			height: 100%;
			max-width: 420px;
			margin: 0 auto;
			background: #FFFFFF;
			opacity: 1;
			position: relative;
			max-height: 100%;
			overflow-y: auto;
		}
		
		.checkInContainer .navbar {
			width: 100%;
			height: 80px;
			background: #04A4B1;
			color: #FFFFFF;
			line-height: 80px;
			float: left;
			font-size: 20px;
			position: absolute;
		}
		
		.checkInBackButton {
			height: 80px;
			background: none;
			border: none;
			cursor: pointer;
			float: left;
		}
		
		.checkInContainer .navbar img {
			max-height: 50px;
			margin: 0px 20px 0 20px;
			float: left;
		}
		
		.checkInContainer span {
			width: 90%;
			margin-left: 5%;
			margin: 100px 0 20px 5%;
			float: left;
		}
		
		.checkInContainer table, .checkInContainer td {
			border-collapse: collapse;
			height: 30px;
			text-align: center;
			padding: 5px;
			margin-bottom: 10px;
		}
		
		.checkInContainer tr {
			margin-top: 10px;
		}
		
		
		.location {
			width: 72% !important;
		}

		#noRecords {
			color: red;
			text-align: center;
		}
		
		.checkout {
			float: left;
			width: 100%;
			background: grey;
		}
		
		.checkoutButton {
			width: 100%;
			height: 40px;
			border: none; 
			background: none;
			color: white;
			cursor: pointer;
		}
		
		.checkInSearchContainer {
			width: 90%;
			margin-left: 5%;
			margin-bottom: 30px;
		}
		
		input[type=text] {
			padding: 10px;
			border-radius: 10px; 
			outline: none;
			background: #ecf0f1;
			font-size: 20px;
			border: 0;
			width: 100%;
			display: block;
			box-sizing: border-box;
			transition: 0.5s;
		}
		
		input[type=text]:focus {
			box-shadow: inset 0 0 0 2px #0972B5;
			box-sizing: border-box;
		}
		
		.searchField {
			width: 100%;
			float: left;
			margin-bottom: 20px;
			box-sizing: border-box;
		}
		
		.submitSearch {
			width: 100%;
			height: 43px;
			float: left;
			margin-left: 4%;
			border: 0;
			border-radius: 5px;
			box-sizing: border-box;
			background: #0972B5;
			color: white;
			cursor: pointer;
		}
		
		.checkInLocations {
			width: 90%;
			margin-left: 5%;
		}
		
		.checkInLocations table {
			border: 1px solid black;
		}
		
		.checkInButton {
			width: 30% !important;
		}
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}		
		
	</style>

<body>

	<div class="checkInContainer">
		<div class="navbar">		
			<form method="post" action="HomeUI">
				<button class="checkInBackButton" type="submit" name="back" value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="vaccineInfoHeader">Vaccine Info</p>
		</div>
		
		<span>Select a location to Check-In</span>
		
		<div class="checkInSearchContainer">
			<form method="post" action="CheckInUI">		
				<table>
					<tr>
						<td style="width:70%"><input type="text" name="searchBox" autoComplete="on" /></td>
						<td><button type="submit" class="submitSearch">Search</button></td>
					</tr>
				</table>
			</form>   
		</div>
		<c:choose>
		    <c:when test="${ requestScope['locationList'].isEmpty() }">
		    	<p> No Record Found </p>
		    </c:when>
			<c:when test="${ requestScope['locationList'] != null }">
				<div class="checkInLocations">		
				    <form method="post" action="CheckInUI">
				    	<table style="width: 100%;">
				    		<c:forEach items="${ locationList }" var="record">
					    		<tr>
					    			<td class="checkInLocationsTD"><c:out value="${record}"/></td>
					    			<td class="checkInButton"><button type="submit" class="submitSearch" value="${record}" name="checkIn">Check-In</button>
					    		</tr>
				    		</c:forEach>
				    	</table>				    
				    </form>
			    </div>  
		    </c:when>
		    <c:when test="${ requestScope['default'] != null }">
		    </c:when>
	    </c:choose>
	</div>

</body>
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
	
	<script>

	</script>
</html>