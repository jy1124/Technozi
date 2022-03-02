<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		.editPatientVaccinationContainer {
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

		.editPatientVaccinationContainer .navbar {
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

		.editPatientVaccinationContainer .navbar img {
			max-height: 50px;
			margin: 0px 20px 0 20px;
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

		.profileContainer {
			width: 80%;
			height: 300px;
			background: #ededed;
			border-radius: 20px;
			margin-top: 100px;
			float: left;
			position: absolute;
			left: 50%;
			transform: translateX(-50%);
			box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.034), 0 6.7px 5.3px
				rgba(0, 0, 0, 0.048), 0 12.5px 10px rgba(0, 0, 0, 0.06), 0 22.3px
				17.9px rgba(0, 0, 0, 0.072), 0 41.8px 33.4px rgba(0, 0, 0, 0.086), 0
				20px 80px rgba(0, 0, 0, 0.12);
		}

		.profilePictureHolder {
			width: 100%;
			height: 200px;
			background: blue;
			position: relative;
			border-radius: 50%;
			width: 200px;
			height: 200px;
			background-image: url("img/profile1.jpg");
			background-repeat: no-repeat;
			background-size: cover;
			left: 50%;
			transform: translateX(-50%);
			margin-top: 10px;
			box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.034), 0 6.7px 5.3px
				rgba(0, 0, 0, 0.048), 0 12.5px 10px rgba(0, 0, 0, 0.06), 0 22.3px
				17.9px rgba(0, 0, 0, 0.072), 0 41.8px 33.4px rgba(0, 0, 0, 0.086), 0
				100px 80px rgba(0, 0, 0, 0.12);
		}

		.profileContainer p {
			margin-top: 30px;
		}

		.profileContainer p, .profileContainer span {
			text-align: center;
			font-size: 20px;
			display: block;
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

		#editStatus, #vaccine, #selectLocation {
			padding: 5px;
			border-radius: 10px;
			outline: none;
			background: #ecf0f1;
			font-size: 15px;
			border: 0;
			display: block;
			box-sizing: border-box;
			transition: 0.5s;
		}

		input[type=text]:focus {
			box-shadow: inset 0 0 0 2px #0972B5;
			box-sizing: border-box;
		}

		.editStatusContainer {
			width: 100%;
			float: left;
			box-sizing: border-box;
		}

		.editStatusButton {
			width: 50%;
			height: 43px;
			float: left;
			margin-left: 25%;
			border: 0;
			border-radius: 5px;
			box-sizing: border-box;
			background: #0972B5;
			color: white;
			cursor: pointer;
			margin-top: 30px;
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

		.editPatientVaccinationContainer table, .editPatientVaccinationContainer td
			{
			width: 90%;
			margin-left: 5%;
			border: 1px solid black;
			border-collapse: collapse;
			height: 30px;
			text-align: center;
			padding: 5px;
		}

		.tVaccinationStatus {
			width: 30% !important;
		}
			
		.editStatus {
			width: 60% !important;
		}

		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
</style>

<body>

	<div class="editPatientVaccinationContainer">
		<div class="navbar">
			<form method="post" action="UpdateVaccinationStatusUI">
				<button class="sendAnnouncementBackButton" type="submit" name="back"
					value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="sentAnnouncementHeader">Update Vaccination Status</p>
		</div>

		<div class="profileContainer">
			<div class="profilePictureHolder">
				<div class="profilePicture"></div>
			</div>
			<p><c:out value="${ sessionScope['nric'] }"/></p>
		</div>
		<div style="margin-top: 480px;"></div>
		<form method="post" action="UpdateVaccinationStatusUI">
			<table>
				<tr>
					<td class="tVaccinationStatus">Details</td>
					<td class="editStatus">Edit Status</td>
				</tr>
				<tr>
					<td class="tVaccinationStatus">Not-Vaccinated</td>
					<td>
						<div class="editStatusContainer">
							<select name="editStatus" id="editStatus">
								<option value="">Vaccinated</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td><label for="vaccineType">Vaccine Type:</label></td>
					<td><select name="vaccineType" id="vaccine">
							<option value="0">Pfizer-BioNTech</option>
							<option value="1">Moderna</option>
							<option value="2">Arcturus</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="location">Location:</label></td>
						<td>
							<select name="location" id="selectLocation">
								<c:forEach items="${ locationList }" var="record" >
									<option value="${ record }"><c:out value="${ record }"/></option>
								</c:forEach>
							</select>
						</td>
				</tr>
			</table>
			<button type="submit" class="editStatusButton"
				name="updateVaccineRecord" value="Update Vaccine Record">Update
				Vaccination Status</button>
		</form>

	</div>

</body>
<script src="js/vendor/jQuery.js"></script>
<script src="js/vendor/Tweenmax.js"></script>
<script src="js/main.js"></script>
</html>