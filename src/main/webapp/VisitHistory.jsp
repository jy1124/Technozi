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
				
		.checkInsContainer {
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
		
		.checkInsContainer .navbar {
			width: 100%;
			height: 80px;
			background: #04A4B1;
			color: #FFFFFF;
			line-height: 80px;
			float: left;
			font-size: 20px;
			position: absolute;
		}
		
		.checkInsContainer .navbar img {
			max-height: 50px;
			margin: 15px 20px 0 20px;
			float: left;
		}
		
		.checkInsContainer span {
			width: 90%;
			margin-left: 5%;
			margin: 100px 0 20px 5%;
			float: left;
		}
		
		.checkInsContainer table, .checkInsContainer td {
			width: 90%;
			margin-left: 5%;
			border: 1px solid black;
			border-collapse: collapse;
			height: 30px;
			text-align: center;
			padding: 5px;
			margin-bottom: 10px;
		}
		
		.checkInsContainer tr {
			margin-top: 10px;
		}
		
		
		.location {
			width: 72% !important;
		}
		
		.spacer {
			width: 100%;
			height: 20px;
		}
		
		#noRecords {
			color: red;
			text-align: center;
		}
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
		
	</style>

<style>
html, body {
	margin: 0;
	padding: 0;
	background: #6E6E6E;
	height: 100%;
	max-height: 844px;
	font-family: Arial;
}

p {
	margin: 0;
	padding: 0;
}

.checkInsContainer {
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

.checkInsContainer .navbar {
	width: 100%;
	height: 80px;
	background: #04A4B1;
	color: #FFFFFF;
	line-height: 80px;
	float: left;
	font-size: 20px;
	position: absolute;
}

.checkInsContainer .navbar img {
	max-height: 50px;
	margin: 0px 20px 0 20px;
	float: left;
}
	
.pastCheckInContainer {
	height: 80px;
	background: none;
	border: none;
	cursor: pointer;
	float: left;
}

.checkInsContainer span {
	width: 90%;
	margin-left: 5%;
	margin: 100px 0 20px 5%;
	float: left;
}

.checkInsContainer table, .checkInsContainer td {
	width: 90%;
	margin-left: 5%;
	border: 1px solid black;
	border-collapse: collapse;
	height: 30px;
	text-align: center;
	padding: 5px;
	margin-bottom: 10px;
}

.checkInsContainer tr {
	margin-top: 10px;
}

.location {
	width: 72% !important;
}

.spacer {
	width: 100%;
	height: 20px;
}

#noRecords {
	color: red;
	text-align: center;
}
</style>


<body>
	<div class="checkInsContainer">
		<div class="navbar">
			<form method="post" action="HomeUI">
				<button class="pastCheckInContainer" type="submit" name="back" value="Back">
					<img src="img/back.png" />
					
				</button>
			</form>
			<p>View Past Check-Ins</p>
		</div>
		<span>Here is your past CheckIns:</span>
		<table>
			<c:choose>
			    <c:when test="${requestScope['noRecordMsg'] == 'No Record Found'}"> 
			       <p id="noRecords">Record Not Found</p>
			    </c:when>    
			    <c:otherwise>
	      			<tr>
						<td class="location">Location</td>
						<td>Date</td>
						<td>Time</td>
					</tr>
			    </c:otherwise>
			</c:choose>
		</table>
		<table>
			<c:forEach items="${ visitRecord }" var="record">
				<c:set var="record" value="${fn:split(record, ',')}" />
				<tr>
					<td class="location"><c:out value="${record[1]}"/></td>
					<td class="date"><c:out value="${record[2]}"/></td>
					<td class="time"><c:out value="${record[3]}"/></td>
				</tr>
				<tr>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
</html>