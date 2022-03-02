<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				
		.healthOrganisationHomeContainer {
			width: 100%;
			height: 100%;
			max-width: 420px;
			margin: 0 auto;
			background: #FFFFFF;
			opacity: 1;
			position: relative;
		}
				
		.profileHolder {
			width: 100%;
			height: 300px;
			background-repeat: no-repeat;
			background-size: cover;
		}
		
		.healthOrganisationHomeContainer .profileHolder {
			background-image: url("img/redBackground.jpg");
		}
		
		.profileContainer {
			width: 80%;
			height: 300px;
			background: #ededed;
			border-radius: 20px;
			margin-top: -240px;
			float: left;
			position: absolute;
			left: 50%;
			transform: translateX(-50%);
			box-shadow:
				0 2.8px 2.2px rgba(0, 0, 0, 0.034),
				0 6.7px 5.3px rgba(0, 0, 0, 0.048),
				0 12.5px 10px rgba(0, 0, 0, 0.06),
				0 22.3px 17.9px rgba(0, 0, 0, 0.072),
				0 41.8px 33.4px rgba(0, 0, 0, 0.086),
				0 100px 80px rgba(0, 0, 0, 0.12);
		}
		
		.profilePictureHolder {
			width: 100%;
			height: 200px;
			background: blue;
			position: relative;
			border-radius: 50%;
			width: 200px;
			height: 200px; 
			background-image: url("img/healthProfile1.jpg");
			background-repeat: no-repeat;
			background-size: cover;
			left: 50%;
			transform: translateX(-50%);
			margin-top: 10px;
			box-shadow:
				0 2.8px 2.2px rgba(0, 0, 0, 0.034),
				0 6.7px 5.3px rgba(0, 0, 0, 0.048),
				0 12.5px 10px rgba(0, 0, 0, 0.06),
				0 22.3px 17.9px rgba(0, 0, 0, 0.072),
				0 41.8px 33.4px rgba(0, 0, 0, 0.086),
				0 100px 80px rgba(0, 0, 0, 0.12);
		}
		
		.profileContainer p {
			margin-top: 30px;
		}
		
		.profileContainer p, .profileContainer span {
			text-align: center;
			font-size: 20px;
			display: block;
		}
		
		.accountsManagementButton {
			width: 80%;
			margin-left: 10%;
			height: 50px;
			margin-top: 100px;
			border-radius: 20px;
			cursor: pointer;
			border: 0;
		}
		
		.announcementSubContainerOne {
			width: 65%;
			height: 50px;
			line-height: 50px;
			text-align: right;
			float: left;
		}
		
		.healthStaffHomeContainer .announcementSubContainerOne, .healthOrganisationHomeContainer .announcementSubContainerOne {
			width: 100%;
			float: left;
			text-align: center;
		}
		
		.accountsManagementButton {
			width: 80%;
			margin-left: 10%;
			height: 50px;
			margin-top: 100px;
			border-radius: 20px;
			cursor: pointer;
		}
		
		.accountsManagementButton {
		  display: inline-block;
		  color: #fff;
		  text-transform: uppercase;
		  font-size: 1rem;
		  transition: all 0.3s;
		  position: relative;
		  overflow: hidden;
		  z-index: 1;
		}
		
		.accountsManagementButton:after {
		  content: "";
		  position: absolute;
		  bottom: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background-color: #3399ff;
		  border-radius: 10rem;
		  z-index: -2;
		}
		
		.accountsManagementButton:before {
		  content: "";
		  position: absolute;
		  bottom: 0;
		  left: 0;
		  width: 0%;
		  height: 100%;
		  background-color: #0066ff;
		  transition: all 0.3s;
		  border-radius: 10rem;
		  z-index: -1;
		}
		
		.accountsManagementButton:hover {
		  color: #fff;
		}
		
		.accountsManagementButton:hover:before {
		  width: 100%;
		}
		
		.homeSubMenuContainer {
			width: 80%;
			margin-left: 10%;
			margin-top: 25px;
		}
		
		.vaccineSubMenuContainer, .pastCheckInContainer {
			width: 48%;
			height: 200px;
			background: #FFFFFF;
			border-radius: 20px;
			position: relative;
			border: 3px solid grey;
			box-sizing: border-box;
			cursor: pointer;
			float: left;
		}
				
		.pastCheckInContainer {
			margin-left: 4%;
		}
		
		.businessUserHomeContainer .pastCheckInContainer, .healthStaffHomeContainer .vaccineSubMenuContainer {
			width: 100%;
			margin-left: 0;
		}
		
		.vaccineSubMenuContainer img, .pastCheckInContainer img {
			max-width: 100px;
			margin-top: -65px;
			position: absolute;
			left: 50%;
			transform: translateX(-50%);
		}
		
		.healthOrganisationHomeContainer .vaccineSubMenuContainer img, .healthOrganisationHomeContainer .pastCheckInContainer img {
			max-width: 90px !important;
		}
		
		.vaccineSubMenuContainer p, .pastCheckInContainer p {
			position: absolute;
			bottom: 10%;
			width: 100%;
			text-align: center;
			font-size: 16px;
			margin-left: -5px;
		}
		
		.homeActionsContainer {
			width: 80%;
			margin-left: 10%;
			float: left;
			margin-top: 30px;
		}
		
		.checkInButton, .checkOutButton {
			width: 48%;
			height: 50px;
			background: #FFFFFF;
			border-radius: 20px;
			position: relative;
			border: 3px solid grey;
			box-sizing: border-box;
			cursor: pointer;
			float: left;
			text-align: center;
			line-height: 46px;
		}
		
		.checkOutButton {
			margin-left: 4%;
		}
		
		.logout {
			float: left;
			text-align: center;
			width: 100%;
			margin-top: 40px;
			color: red;
			cursor: pointer;
			background: none;
			border: 0;
			margin-bottom: 50px;
		}
		
		.businessUserHomeContainer .logout{
			margin-top: 130px !important;
		}
		
		.healthStaffHomeContainer .logout{
			margin-top: 100px !important;
		}

		.viewAnnouncementStatus {
			margin-top: 10px;
			background: #922729
		}
		
		.sentAnnouncementStatus {
			text-align: center;
			margin-top: 10px;
			cursor: pointer;
		}
		
		.healthOrganisationHomeContainer .logout{
			margin-top: 120px !important;
		}
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
		
	</style>

<body>

	<div class="healthOrganisationHomeContainer">
		<div class="profileHolder"></div>
		<div class="profileContainer">
			<div class="profilePictureHolder">
				<div class="profilePicture">
				</div>
			</div>
			<p><c:out value="${ sessionScope['username'] }"/></p>
			<span><c:out value="${ sessionScope['name'] }"/></span>
		</div>
				
		<form method="post" action="HealthOrganisationHomeUI">
			<button class="accountsManagementButton" type="submit" name="accountsManagement" value="Accounts Management">Accounts Management
			</button>
		</form>
		
		<div class="homeSubMenuContainer">
			<form method="post" action="HealthOrganisationHomeUI">
				<button class="vaccineSubMenuContainer" name="generateReport" value="Generate Report">
					<img src="img/generateReport.png">
					<p>Generate reports/statistics</p>
				</button>
			</form>
			
<!-- 			<form method="post" action="pastCheckInUI">
				<button class="pastCheckInContainer">
					<img src="img/viewPatientDetails.png">
					<p>View COVID <br>patients details</p>
				</button>
			</form> -->
		</div>
		
		<form method="post" action="HomeUI">
			<input type="submit" name="logout" value="Logout" class="logout"/>
		</form>
		
	</div>
</body>
	
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
</html>