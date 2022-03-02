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
				
		.vaccineInfoContainer {
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
		
		.vaccineInfoContainer .navbar {
			width: 100%;
			height: 80px;
			background: #04A4B1;
			color: #FFFFFF;
			line-height: 80px;
			float: left;
			font-size: 20px;
			position: absolute;
		}
		
		.vaccineInfoContainer .navbar img {
			max-height: 50px;
			margin: 15px 20px 0 20px;
			float: left;
		}
		
		.profileHolder {
			width: 100%;
			height: 300px;
			background-image: url("img/vaccineInfoBackground.png");
			background-repeat: no-repeat;
			background-size: cover;
		}
		
		.vaccineProfileContainer {
			width: 80%;
			height: 300px;
			background: #ededed;
			border-radius: 20px;
			margin-top: -180px;
			float: left;
			position: absolute;
			left: 50%;
			transform: translateX(-50%);
			box-shadow:
				0 2.8px 2.2px rgba(0, 0, 0, 0.034),
				0 6.7px 5.3px rgba(0, 0, 0, 0.048),
				0 12.5px 10px rgba(0, 0, 0, 0.06),
				0 10px 10px rgba(0, 0, 0, 0.072),
				0 20px 20px rgba(0, 0, 0, 0.086),
				0 50px 50px rgba(0, 0, 0, 0.12);
		}
		
		.vaccineHolder {
			width: 100%;
			height: 200px;
			background: blue;
			position: relative;
			border-radius: 50%;
			width: 200px;
			height: 200px; 
			background-image: url("img/vaccineShot.png");
			background-repeat: no-repeat;
			background-size: cover;
			left: 50%;
			transform: translateX(-50%);
			margin-top: 10px;
			box-shadow:
				0 2.8px 2.2px rgba(0, 0, 0, 0.034),
				0 6.7px 5.3px rgba(0, 0, 0, 0.048),
				0 12.5px 10px rgba(0, 0, 0, 0.06),
				0 10px 10px rgba(0, 0, 0, 0.072),
				0 20px 20px rgba(0, 0, 0, 0.086),
				0 50px 50px rgba(0, 0, 0, 0.12);
		}
		
		.profilePictureHolder p {
			text-align: center;
			margin-top: 30px;
		}
		
		.profilePictureHolder span { text-align: center; }
		
		.dose1, .dose2 {
			width: 80%;
			margin-left: 10%;
			height: 150px;
			background: #ededed;
			border-radius: 20px;
			box-shadow:
				0 2.8px 2.2px rgba(0, 0, 0, 0.034),
				0 6.7px 5.3px rgba(0, 0, 0, 0.048),
				0 12.5px 10px rgba(0, 0, 0, 0.06),
				0 2px 2px rgba(0, 0, 0, 0.072),
				0 2px 2px rgba(0, 0, 0, 0.086),
				0 2px 2px rgba(0, 0, 0, 0.12);
		}
		
		.dose1 { margin-top: 180px; }
		
		.dose1details {
			width: 60%;
			text-align: right;
			float: left;
			padding-right: 1%;
			box-sizing: border-box;
		}
		
		.doseContainer h1 {
			font-size: 24px;
			padding-top: 5%;
			padding-left: 5%;
		}
		
		.dose1MoreDetails {
			width: 40%;
			float: left;
			padding-left: 1%;
			box-sizing: border-box;
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

.vaccineInfoContainer {
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

.vaccineInfoContainer .navbar {
	width: 100%;
	height: 80px;
	background: #04A4B1;
	color: #FFFFFF;
	line-height: 80px;
	float: left;
	font-size: 20px;
	position: absolute;
}

.vaccineInfoContainer .navbar img {
	max-height: 50px;
	margin: 0px 20px 0 20px;
	float: left;
}
	
.vaccineInfoHeader {
	height: 80px;
	float: left;
}
	
.vaccineInfoBackButton {
	height: 80px;
	background: none;
	border: none;
	cursor: pointer;
	float: left;
}

.profileHolder {
	width: 100%;
	height: 300px;
	background-image: url("img/vaccineInfoBackground.png");
	background-repeat: no-repeat;
	background-size: cover;
}

.vaccineProfileContainer {
	width: 80%;
	height: 300px;
	background: #ededed;
	border-radius: 20px;
	margin-top: -180px;
	float: left;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.034), 0 6.7px 5.3px
		rgba(0, 0, 0, 0.048), 0 12.5px 10px rgba(0, 0, 0, 0.06), 0 10px 10px
		rgba(0, 0, 0, 0.072), 0 20px 20px rgba(0, 0, 0, 0.086), 0 50px 50px
		rgba(0, 0, 0, 0.12);
}

.vaccineHolder {
	width: 100%;
	height: 200px;
	background: blue;
	position: relative;
	border-radius: 50%;
	width: 200px;
	height: 200px;
	background-image: url("img/vaccineShot.png");
	background-repeat: no-repeat;
	background-size: cover;
	left: 50%;
	transform: translateX(-50%);
	margin-top: 10px;
	box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.034), 0 6.7px 5.3px
		rgba(0, 0, 0, 0.048), 0 12.5px 10px rgba(0, 0, 0, 0.06), 0 10px 10px
		rgba(0, 0, 0, 0.072), 0 20px 20px rgba(0, 0, 0, 0.086), 0 50px 50px
		rgba(0, 0, 0, 0.12);
}

.profilePictureHolder p {
	text-align: center;
	margin-top: 30px;
}

.profilePictureHolder span {
	text-align: center;
}

.dose1, .dose2 {
	width: 80%;
	margin-left: 10%;
	height: 150px;
	background: #ededed;
	border-radius: 20px;
	box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.034), 0 6.7px 5.3px
		rgba(0, 0, 0, 0.048), 0 12.5px 10px rgba(0, 0, 0, 0.06), 0 2px 2px
		rgba(0, 0, 0, 0.072), 0 2px 2px rgba(0, 0, 0, 0.086), 0 2px 2px
		rgba(0, 0, 0, 0.12);
}

.dose1 {
	margin-top: 180px;
}

.dose1details {
	width: 60%;
	text-align: right;
	float: left;
	padding-right: 1%;
	box-sizing: border-box;
}

.doseContainer h1 {
	font-size: 24px;
	padding-top: 5%;
	padding-left: 5%;
}

.dose1MoreDetails {
	width: 40%;
	float: left;
	padding-left: 1%;
	box-sizing: border-box;
}
</style>

<body>
<c:set var="vaccineRecord" value = '${requestScope["vaccineRecord"]}'/>
<c:set var="record" value="${fn:split(vaccineRecord, ',')}" />
	<div class="vaccineInfoContainer">
		<div class="navbar">
			<form method="post" action="HomeUI">
			</form>
			<img src="img/back.png"/>
			<p>Vaccine Info</p>
		</div>
		
		<div class="navbar">		
			<form method="post" action="VaccineCertUI">
				<button class="vaccineInfoBackButton" type="submit" name="back" value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="vaccineInfoHeader">Vaccine Info</p>
		</div>

		<div class="profileHolder"></div>
		<div class="vaccineProfileContainer">
			<div class="profilePictureHolder">
				<div class="vaccineHolder">
				</div>
				<c:choose>
				    <c:when test="${ record[0].isEmpty() }">
				       <p><c:out value="No Vaccine Records Found"/></p>
				    </c:when>    
				    <c:otherwise>
				       <p><c:out value="${record[1]}"/></p>
				    </c:otherwise>
				</c:choose>
			</div>
		</div>

		<c:if test="${ !record[0].isEmpty() }">
		<div class="doseContainer">
			<div class="dose1">

				<h1>Dose 1</h1>
				<div class="dose1details">
					<p>Vaccination Date:</p>
					<p>Vaccination Location:</p>
					<p>Certification Number:</p>
				</div>
				
				<div class="dose1MoreDetails">
					<p><c:out value="${record[4]}"/></p>
					<p><c:out value="${record[2]}"/></p>
					<p><c:out value="${record[0]}"/></p>
				</div>
			</div>
		</div>
		</c:if>
	</div>
	
</body>
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
</html>
