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
				
		.sentAnnouncementContainer {
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
		
		.sentAnnouncementContainer .navbar {
			width: 100%;
			height: 80px;
			background: #17BC7C;
			color: #FFFFFF;
			line-height: 80px;
			float: left;
			font-size: 20px;
			position: absolute;
		}
		
		.sentAnnouncementHeader {
			float: left;
		}
		
		.sendAnnouncementBackButton {
			height: 80px;
			background: none;
			border: none;
			cursor: pointer;
			float: left;
		}
		
		.sentAnnouncementContainer .navbar img {
			max-height: 50px;
			margin: 0px 20px 0 20px;
			float: left;
		}
		
		.sentAnnouncementContainer span {
			width: 90%;
			margin-left: 5%;
			margin: 100px 0 20px 5%;
			float: left;
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
		
		table, .sentAnnouncementContainer td {
			width: 90%;
			margin-left: 5%;
			border: 1px solid black;
			border-collapse: collapse;
			height: 30px;
			text-align: center;
			padding: 5px;
			margin-bottom: 10px;
			margin-top: 100px;
		}
		
		.announceContainer {
			width: 90%;
			margin-left: 5%;
			/background: blue;
			float: left;
			margin-top: 20px;
		}

		.announceInnerContainer {
			width: 100%;
			border-radius: 5px;
			margin-top: 5px;
			box-shadow:
				0 1px 2.2px rgba(0, 0, 0, 0.034),
				0 2.7px 5.3px rgba(0, 0, 0, 0.048),
				0 2px 10px rgba(0, 0, 0, 0.06),
				0 2px 17.9px rgba(0, 0, 0, 0.072),
				0 2px 33.4px rgba(0, 0, 0, 0.086),
				0 2px 2px rgba(0, 0, 0, 0.12);
		}
		
		.announceInnerContainer {
			font-size: 16px;
			padding: 10px;
			box-sizing: border-box;
			float: left;
		}
		
		.announceInnerContainer span {
			width: 50%;
			margin-top: 20px;
			display: block;
			color: #969696;
			float: left;
		}
		
		.person {
			text-align: right !important;
		}
		
		.acknowledgeAnnouncement, .messageTo {
			width: 100%;
			height: 30px;
			background: grey;
			float: left;
			border-radius: 5px;
			line-height: 30px;
			text-align: center;
			color: #FFFFFF;
			cursor: pointer;
			
		}
		
		.acknowledgeAnnouncement {
			border-radius: 5px !important;
		}
		
		.messageTo {
			background: #FFFFFF;
			color: black;
			margin-top: 20px;
		}
		
		.acknowledged {
			background: green !important;
		}
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
	</style>

<body>

	<div class="sentAnnouncementContainer">
		<div class="navbar">		
			<form method="post" action="HomeUI">
				<button class="sendAnnouncementBackButton" type="submit" name="back" value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="sentAnnouncementHeader">View Sent Announcement Status</p>
		</div>
		
		<div style="height: 100px"></div>
		
		<c:if test="${ requestScope['noRecords'] == 'Record Not Found' }">
			<p>Record Not Found</p>
		</c:if>
		<c:forEach items="${ sentAnnouncementList }" var="records" >
			<c:set var="record" value="${fn:split(records, ',')}" />
				<div class="announceContainer">
					<p style="float: left;"><c:out value="${ record[1]}"/></p>
					<p style="float: right;"><c:out value="${ record[2]}"/></p>
					<div class="announceInnerContainer">
						<div class="messageTo">
							Sent to: <c:out value="${ record[4]}"/>: <c:out value="${ record[5]}"/>
						</div>
						<c:choose>
							<c:when test="${ record[3] == 'Acknowledged' }">
								<div class="acknowledgeAnnouncement acknowledged">
									Messaged Status: <c:out value="${ record[3] }"/>
								</div>
							</c:when>
							<c:otherwise>
								<div class="acknowledgeAnnouncement">
									Messaged Status: <c:out value="${ record[3] }"/>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
		</c:forEach>
	</div>
</body>
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
</html>