<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		.viewPatientVaccinationContainer {
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

		.viewPatientVaccinationContainer .navbar {
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

		.viewPatientVaccinationContainer .navbar img {
			max-height: 50px;
			margin: 0px 20px 0 20px;
			float: left;
		}

		.viewPatientVaccinationContainer span {
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

		.checkInSearchContainer {
			width: 90%;
			margin-left: 5%;
			margin-bottom: 30px;
		}

		#checkinLocation {
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
			width: 72%;
			float: left;
			margin-bottom: 20px;
			box-sizing: border-box;
		}

		.submitSearch {
			width: 24%;
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

		.viewPatientVaccinationContainer table, .viewPatientVaccinationContainer td
			{
			width: 90%;
			margin-left: 5%;
			border: 1px solid black;
			border-collapse: collapse;
			height: 30px;
			text-align: center;
			padding: 5px;
			margin-bottom: 15px;
		}

		.viewPatientVaccinationContainer tr {
			margin-top: 20px;
		}

		.nric {
			width: 30% !important;
		}

		.name {
			width: 44% !important;
		}

		.status {
			width: 26% !important;
		}

		.editVaccinationStatus {
			background: #2997BF;
			color: #FFFFFF !important;
		}

		.editVaccinationStatusButton {
			width: 100%;
			height: 30px;
			box-sizing: border-box;
			padding: none;
			background: none;
			border: none;
			color: #FFFFFF !important;
			cursor: pointer;
		}

		.editVaccinationStatus {
			padding: 0;
		}

		.vstatus {
			color: white;
			background: grey;
		}

		.vaccinated {
			background: green;
			color: white;
		}

		.noNRICRecord {
			width: 100%;
			color: red;
			text-align: center;
			float: left;
		}

		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
</style>

<body>
	<c:set var="recordDetail" value='${requestScope["recordDetail"]}' />
	<c:set var="record" value="${fn:split(recordDetail, '-')}" />
	<div class="viewPatientVaccinationContainer">
		<div class="navbar">
			<form method="post" action="HealthStaffHomeUI">
				<button class="sendAnnouncementBackButton" type="submit" name="back"
					value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="sentAnnouncementHeader">View Vaccination Status</p>
		</div>

		<span>Search patient to view vaccination status</span>

		<div class="checkInSearchContainer">
			<form method="post" action="ViewVaccinationStatusUI">
				<div class="searchField">
					<input type="text" placeholder="NRIC" name="NRIC" maxlength="9">
				</div>
				<button type="submit" class="submitSearch" name="search"
					value="Search">Search</button>
			</form>
		</div>

		<c:choose>
			<c:when test="${requestScope['noSuchUser'] == 'Invalid NRIC' }">
				<p class="noNRICRecord">Please enter valid NRIC</p>
			</c:when>
			<c:when test="${ requestScope['default'] == 'Default' }">

			</c:when>
			<c:when test="${ requestScope['recordDetail'] != ''  }">
				<table>
					<tr>
						<td class="nric">NRIC</td>
						<td class="name">Name</td>
						<td class="status">Vaccinated?</td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="nric"><c:out value="${ record[0] }" /></td>
						<td class="name"><c:out value="${ record[1] }" /></td>
						<c:if test="${ record[2] == 'Yes' }">
							<td class="status vaccinated vstatus"><c:out
									value="${ record[2] }" /></td>
						</c:if>
						<c:if test="${ record[2] == 'No' }">
							<td class="status vstatus"><c:out value="${ record[2] }" /></td>
						</c:if>
					</tr>
					<tr>
						<c:if test="${ record[2] == 'No' }">
							<td colspan="3" class="editVaccinationStatus">
								<form method="post" action="ViewVaccinationStatusUI">
									<button type="submit" class="editVaccinationStatusButton"
										name="editVaccinationNRIC" value="${ record[0] }">Edit
										Vaccination Status</button>
								</form>
							</td>
						</c:if>
					</tr>
				</table>
			</c:when>
		</c:choose>
	</div>

</body>
<script src="js/vendor/jQuery.js"></script>
<script src="js/vendor/Tweenmax.js"></script>
<script src="js/main.js"></script>
</html>