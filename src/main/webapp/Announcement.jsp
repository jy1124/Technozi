<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Technozi</title>
<meta name="viewport"
	content="width=device-width,height=device-height,initial-scale=1.0maximum-scale=1.0, user-scalable=no" />
</head>
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
	
	.annoucementContainer {
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
	
	.annoucementContainer .navbar {
		width: 100%;
		height: 80px;
		background: #9B1C1E;
		color: #FFFFFF;
		line-height: 80px;
		float: left;
		font-size: 20px;
	}
	
	.sendAnnouncementBackButton {
		height: 80px;
		background: none;
		border: none;
		cursor: pointer;
		float: left;
	}
	
	.annoucementContainer .navbar img {
		max-height: 50px;
		margin: 0px 20px 0 20px;
		float: left;
	}
	
	.announceContainer {
		width: 90%;
		margin-left: 5%; /
		background: blue;
		float: left;
		margin-top: 20px;
	}
	
	.announceInnerContainer {
		width: 100%; /
		background: green;
		border-radius: 5px;
		margin-top: 5px;
		box-shadow: 0 1px 2.2px rgba(0, 0, 0, 0.034), 0 2.7px 5.3px
			rgba(0, 0, 0, 0.048), 0 2px 10px rgba(0, 0, 0, 0.06), 0 2px 17.9px
			rgba(0, 0, 0, 0.072), 0 2px 33.4px rgba(0, 0, 0, 0.086), 0 2px 2px
			rgba(0, 0, 0, 0.12);
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
	
	.acknowledgeAnnouncement {
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
	
	.acknowledgeAnnoucement {
		width: 80%;
		margin-left: 10%;
		height: 60px;
		line-height: 50px;
		text-align: center;
		float: left;
		margin-top: 50px;
		border-radius: 20px;
		border: 3px solid green;
		box-sizing: border-box;
		color: green;
		cursor: pointer;
	}
	
	.annoucementAcknowledged {
		width: 80%;
		margin-left: 10%;
		height: 60px;
		line-height: 60px;
		text-align: center;
		float: left;
		margin-top: 50px;
		border-radius: 20px;
		background: green;
		box-sizing: border-box;
		color: white;
		cursor: pointer;
	}
	
	#noRecords {
		text-align: center;
		margin-top: 30px;
		float: left;
		width: 80%;
		margin-left: 10%;
		padding: 10px;
		background: #ecf0f1;
		border-radius: 20px;
	}
	
	.vaccineReady {
		width: 80%;
		margin-left: 10%;
		border-radius: 20px;
		float: left;
		text-align: center;
		margin-top: 50px;
		padding: 10px;
		background: #ecf0f1;
		box-sizing: border-box;
	}
	
	@media screen and (max-width: 500px) {
		html, body { background: #FFFFFF !important; }
	}
</style>

<body>
	<c:set var="count" value="0" scope="page" />
	<div class="annoucementContainer">
		<div class="navbar">
			<form method="post" action="HomeUI">
				<button class="sendAnnouncementBackButton" type="submit" name="back"
					value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="sentAnnouncementHeader">View Announcement</p>
		</div>
		<c:choose>
			<c:when test="${ requestScope['vaccineReady'] != null }">
				<p class="vaccineReady"><c:out value="${ requestScope['vaccineReady'] }"/></p>
			</c:when>
			<c:when test="${requestScope['announcementList'].get(0) == null  &&  requestScope['vaccineReady'] == null }">
				<p id="noRecords">No Announcement</p>
			</c:when>
		</c:choose>
		<c:forEach items="${ announcementList }" var="records">
			<c:set var="record" value="${fn:split(records, ',')}" />
			<c:choose>
				<c:when test="${ !record[1].equals(record[6]) }">
					<div class="announceContainer">
						<div class="announceInnerContainer">
							<c:choose>
								<c:when test="${ sessionScope['userType'] == 'Public' }">
									<p>
										A COVID-19 patient has recently visited
										<c:out value="${record[2]}" />
										on
										<c:out value="${record[4]}" />
										at
										<c:out value="${record[3]}" />
										which result in possible exposure of COVID-19
									</p>
									<form method="post" action="AnnouncementUI">
										<button class="acknowledgeAnnoucement" type="submit"
											name="acknowledge" value="${ record[7] }">Acknowledge</button>
									</form>
								</c:when>
								<c:when test="${ sessionScope['userType'] == 'Business' }">
									<p>
										A COVID-19 patient has recently visited your premises on
										<c:out value="${record[4]}" />
										at
										<c:out value="${record[3]}" />
										which result in possible exposure of COVID-19
									</p>
									<form method="post" action="AnnouncementUI">
										<button class="acknowledgeAnnoucement" type="submit"
											name="acknowledge" value="${ record[7] }">Acknowledge</button>
									</form>
								</c:when>
							</c:choose>
							<div class="annoucementDetails">
								<span class="time"></span> <span class="person"><c:out
										value="${record[0]}" /></span>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:set var="count" value="${count + 1}" scope="page" />
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${ count > 0 }">
			<p id="noRecords">You are tested POSITIVE with COVID-19</p>
		</c:if>
	</div>

</body>
<script src="js/vendor/jQuery.js"></script>
<script src="js/vendor/Tweenmax.js"></script>
<script src="js/main.js"></script>
</html>