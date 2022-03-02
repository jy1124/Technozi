<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				
		.sendAnnouncementContainer {
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
		
		.sendAnnouncementContainer .navbar {
			width: 100%;
			height: 80px;
			background: #17BC7C;
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
		
		.sendAnnouncementContainer .navbar img {
			max-height: 50px;
			margin: 0px 20px 0 20px;
			float: left;
		}
		
		.sendAnnouncementContainer span {
			width: 90%;
			margin-left: 5%;
			margin: 100px 0 20px 5%;
			float: left;
		}
		
		.sendAnnouncementContainer table, .sendAnnouncementContainer td {
			width: 90%;
			margin-left: 5%;
			border: 1px solid black;
			border-collapse: collapse;
			height: 30px;
			text-align: center;
			padding: 5px;
			margin-bottom: 10px;
		}
		
		.sendAnnouncementContainer tr {
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
		
			
		.searchField {
			width: 100%;
			float: left;
			margin-bottom: 20px;
			box-sizing: border-box;
		}
		
		.submitSearch {
			width: 60%;
			height: 43px;
			float: left;
			margin-left: 20%;
			border: 0;
			border-radius: 5px;
			box-sizing: border-box;
			background: #0972B5;
			color: white;
			cursor: pointer;
		}
				
		textarea {
			max-width: 100%;
			width: 100%;
			border-radius: 5px;
			padding: 10px;
			box-sizing: border-box;
			outline: none;
			font-size: 16px;
			background: #ecf0f1;
			border: none;
			resize: vertical;
			min-height: 100px;
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
			margin-bottom: 20px;
		}
		input[type=text]:focus, textarea:focus {
			box-shadow: inset 0 0 0 2px #0972B5;
			box-sizing: border-box;
		}
		
		.correctNRICError {
			width: 100%;
			text-align: center;
			float: left;
			margin-bottom: 20px;	
			color: red !important;
		}
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
	</style>

<body>
	<div class="sendAnnouncementContainer">
		<div class="navbar">		
			<form method="post" action="HomeUI">
				<button class="checkInBackButton" type="submit" name="back" value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="vaccineInfoHeader">Send Announcement</p>
		</div>
		<span>Enter an NRIC/UEN to generate an announcement</span>
		<div class="checkInSearchContainer">
			<form method="post" action="SendAnnouncementUI">
				<div class="searchField">
					<input type="text" placeholder="NRIC/UEN" name="id" maxlength="9">
				</div>	
				<div>
					<c:if test="${ requestScope['sysMsg'] != null }" >
						<p class="correctNRICError"><c:out value="${ requestScope['sysMsg'] }"/><p>
					</c:if>
				</div>
				<button type="submit" class="submitSearch" name="generateAnnouncement" value="generate">Generate</button>
			</form>
		</div>	
	</div>
</body>
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
</html>