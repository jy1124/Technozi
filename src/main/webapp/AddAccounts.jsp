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
			background: #AD2C38;
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
			width: 90%;
			margin-left: 5%;
			border: 1px solid black;
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

		.accountsManagementContainer {
			width: 90%;
			margin-left: 5%;
			margin-bottom: 30px;
		}

		.dropDownSelector, input[type=date] {
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

		input[type=date] {
			margin-bottom: 10px;
		}

		input[type=text]:focus {
			box-shadow: inset 0 0 0 2px #0972B5;
			box-sizing: border-box;
		}

		input[type=text] {
			padding: 10px;
			border-radius: 10px;
			outline: none;
			background: #ecf0f1;
			font-size: 20px;
			border: 0;
			width: 70%;
			display: block;
			box-sizing: border-box;
			transition: 0.5s;
			margin-bottom: 20px;
			float: right;
		}

		.searchField {
			width: 72%;
			float: left;
			margin-bottom: 20px;
			box-sizing: border-box;
		}

		.submitButton {
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

		.nric {
			width: 30% !important;
		}

		.name {
			width: 40% !important;
		}

		.addAccountContainer {
			width: 90%;
			margin-left: 5%;
			float: left;
		}

		.addAccountContainer p {
			width: 30%;
			float: left;
			line-height: 50px;
			font-size: 16px;
			text-align: right;
			padding-right: 10px;
			box-sizing: border-box;
		}

		.addAccountContainer .dropDownSelector {
			width: 70%;
		}

		.fieldContain {
			height: 50px;
			float: left;
			width: 100%;
		}

		.addAccountContainer .submitButton {
			width: 50%;
			margin-left: 25%;
			margin-top: 25px;
		}

		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
</style>

<body>

	<div class="checkInContainer">
		<div class="navbar">
			<form method="post" action="AccountsManagementUI">
				<button class="checkInBackButton" type="submit" name="back"
					value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="vaccineInfoHeader">Add An Account</p>
		</div>

		<span>Insert details of user</span>


		<div class="addAccountContainer">
			<form method="post" action="AddAccountsUI">
				<div class="fieldContain">
					<p>Name</p>
					<input type="text" name="name">
				</div>

				<div class="fieldContain">
					<p>ID</p>
					<input type="text" name="username">
				</div>

				<div class="fieldContain">
					<p>Password</p>
					<input type="text" name="password">
				</div>

				<div class="fieldContain">
					<p>Account Type</p>
					<select name="userType" class="dropDownSelector">
						<option value="0">Public User</option>
						<option value="1">Business</option>
						<option value="2">Health Staff</option>
					</select>
				</div>
				<button type="submit" class="submitButton" name="addUser"
					value="Add User">Add User</button>
			</form>
			<c:if test="${ requestScope['insertion'] != null }">
				<span><c:out value=" ${ requestScope['insertion'] }"/></span>
			</c:if>
		</div>

	</div>

</body>
<script src="js/vendor/jQuery.js"></script>
<script src="js/vendor/Tweenmax.js"></script>
<script src="js/main.js"></script>
</html>