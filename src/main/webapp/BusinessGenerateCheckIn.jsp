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

#checkinLocation, input[type=date] {
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
	width: 72%;
	margin-bottom: 10px;
	float: left;
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

.nric {
	width: 30% !important;
}

.name {
	width: 30% !important;
}

.date {
	width: 20% !important;
}

.time {
	width: 20% !important;
}

#noRecords {
	color: red;
	float: left;
	text-align: center;
	width: 100%;
}

@media screen and (max-width: 500px) {
	html, body {
		background: #FFFFFF !important;
	}
}
</style>

<body>

	<div class="checkInContainer">
		<div class="navbar">
			<form method="post" action="BusinessHomeUI">
				<button class="checkInBackButton" type="submit" name="back"
					value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="vaccineInfoHeader">Generate Check Ins</p>
		</div>

		<span>Select a store and date to generate checkins</span>

		<div class="checkInSearchContainer">
			<form method="post" action="BusinessGenerateCheckInUI">
				<input type="date" name="date">
				<button type="submit" class="submitSearch" name="generateCheckIn"
					value="Generate">Generate</button>
			</form>
		</div>
		<c:choose>
			<c:when test="${ requestScope['default'] == 'Default' }">
			</c:when>
			<c:when test="${ requestScope['generateList'].get(0) == null }">
				<p id="noRecords">Records Not Found</p>
			</c:when>
			<c:when test="${ !requestScope['generateList'].isEmpty() }">
				<table>
					<tr>
						<td class="nric">NRIC</td>
						<td class="name">Name</td>
						<td class="date">Date</td>
						<td class="time">Time</td>
					</tr>
				</table>
				<table>
					<c:forEach items="${ generateList }" var="record">
						<c:set var="record" value="${fn:split(record, '_')}" />
						<tr>
							<td class="nric"><c:out value="${ record[0] } " /></td>
							<td class="name"><c:out value="${ record[1] } " /></td>
							<td class="date"><c:out value="${ record[2] } " /></td>
							<td class="time"><c:out value="${ record[3] } " /></td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
		</c:choose>
	</div>
</body>
<script src="js/vendor/jQuery.js"></script>
<script src="js/vendor/Tweenmax.js"></script>
<script src="js/main.js"></script>
<script>
	var now = new Date();
	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);
	var today = now.getFullYear() + "-" + (month) + "-" + (day);
	$('input[type="date"]').val(today);
</script>
</html>