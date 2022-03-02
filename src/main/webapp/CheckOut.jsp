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
				
		.checkOutContainer {
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
		
		.checkOutContainer .navbar {
			width: 100%;
			height: 80px;
			background: #04A4B1;
			color: #FFFFFF;
			line-height: 80px;
			float: left;
			font-size: 20px;
			position: absolute;
		}
		
		.checkOutContainer .navbar img {
			max-height: 50px;
			margin: 0px 20px 0 20px;
			float: left;
		}
		
		.checkoutNavButton {
			height: 80px;
			background: none;
			border: none;
			cursor: pointer;
			float: left;
		}
		
		.checkOutContainer span {
			width: 90%;
			margin-left: 5%;
			margin: 100px 0 20px 5%;
			float: left;
		}
		
		.checkOutContainer table, .checkOutContainer td {
			width: 90%;
			margin-left: 5%;
			border: 1px solid black;
			border-collapse: collapse;
			height: 30px;
			text-align: center;
			padding: 5px;
			margin-bottom: 10px;
		}
		
		.checkOutContainer tr {
			margin-top: 10px;
		}
		
		
		.location {
			width: 45% !important;
		}
		
		.date {
			width: 30% !important; 
		}
		
		.time {
			width: 25% !important;
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
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
		
	</style>

<body>

	<div class="checkOutContainer">
		<div class="navbar">
			<form method="post" action="HomeUI">
				<button class="checkoutNavButton" type="submit" name="back" value="Back">
					<img src="img/back.png" />
					
				</button>
			</form>
			<p>Checkout</p>
		</div>
		
		<span>Here are places you're currently checked in to</span>
		
		<c:choose>
		    <c:when test="${requestScope['noRecordMsg'] == 'No Record Found'}"> 
			       <p id="noRecords"><c:out value="${ requestScope['noRecordMsg'] }"/></p>
	    	</c:when> 
	    	<c:otherwise>
				<table>
					<tr>
						<td class="location">Location</td>
						<td class="date">Date</td>
						<td class="time">Time</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
		<c:forEach items="${ locationList }" var="records" >
			<c:set var="record" value="${fn:split(records, ',')}" />
				<form method="post" action="CheckOutUI">
					<table>
							<tr>
								<td class="location"><c:out value="${record[1]}"/></td>
								<td class="date"><c:out value="${record[2]}"/></td>
								<td class="time"><c:out value="${record[3]}"/></td>
							</tr>
							<tr>
								<td colspan="3" style="background: green; color: white;"><button class="checkoutButton" type="submit" name="checkOut" value="${ record[1]  }">Check Out</button></td>
							</tr>
					</table>
				</form>
		</c:forEach>
	</div>
	
</body>
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
</html>