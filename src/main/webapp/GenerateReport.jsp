<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
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

	#noRecords {
		color: red;
		text-align: center;
		float: left;
		width: 100%;
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
		transition: .5s;
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

	#dailyCaseDate {
		margin-top: 20px;
	}

	.checkInSearchContainer {
		width: 90%;
		margin-left: 5%;
		margin-bottom: 30px;
		display: none;
	}

	.submitSearch, .generateReport, .downloadGeneratedReport, .generateDailyReport, .generateReportCases {
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
	
	.generateReportCases, .generateReport, .generateDailyReport, .downloadGeneratedReport {
		width: 50% !important;
		margin-left: 25% !important;
		margin-bottom: 30px;
	}
	
	.location {
		width: 70% !important;
	}
	
	.NRIC {
		width: 50% !important;
	}

 	textarea {
        overflow-y: scroll;
        height: 500px;
        width: 414px;
        resize: none; /* Remove this if you want the user to resize the textarea */
    }
    
	@media screen and (max-width: 500px) {
		html, body { background: #FFFFFF !important; }
	}
	
</style>

<body>

	<div class="checkInContainer">
		<div class="navbar">
			<form method="post" action="HealthOrganisationHomeUI">
				<button class="checkInBackButton" type="submit" name="back"
					value="Back">
					<img src="img/back.png" />
				</button>
			</form>
			<p class="vaccineInfoHeader">Generate Report</p>
		</div>

		<span>Select an option</span>

		<div class="accountsManagementContainer">
			<form method="post" action="GenerateReportUI">
				<div class="searchField">
					<select name="generateReport" class="dropDownSelector"
						id="dropdownList">
						<option value="Generate Cluster">Generate Cluster Report</option>
						<option value="Generate All Cases">Generate All Cases</option>
						<option value="Generate Daily Cases">Generate Daily Cases</option>
						<option value="Generate Statistics">Generate Statistics</option>
					</select>
				</div>
				<button type="submit" class="submitButton" name="generateCheckIn"
					value="checkIn">Go</button>
			</form>
		</div>
		<div class="checkInSearchContainer">
			<form method="post" action="GenerateReportUI">
				<input type="date" name="date">
				<button type="submit" class="generateDailyReport"
					name="generateDailyCases" value="Generate Daily Cases">Generate Daily Cases</button>
			</form>
		</div>
		<c:choose>
			<c:when test="${ requestScope['clusterList'].get(0) != null }">
				<div style="text-align: center">
					<form method="post" action="GenerateReportUI">
						<button type="submit" class="generateReportCases"
							name="downloadClusterReport" value="Download Cluster Report">Download
							Cluster Report</button>
					</form>
				</div>
				<div>
					<table class="casesReport">
						<tr>
							<td colspan="2">Report On Covid-19 Clusters</td>
						</tr>
						<tr>
							<td class="location">Location</td>
							<td>Date</td>
						</tr>
						<c:forEach items="${ clusterList }" var="clusterList">
							<c:set var="clusterRecord" value="${fn:split(clusterList, ',')}" />
							<tr>
								<td class="location"><c:out value="${ clusterRecord[0] }" /></td>
								<td><c:out value="${ clusterRecord[1] }" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:when>
			<c:when test="${ requestScope['caseList'].get(0) != null }">
				<form method="post" action="GenerateReportUI">
					<button type="submit" class="generateReportCases"
						name="downloadCaseReport" value="Download Case Report">Download Case Report</button>
				</form>
				<div>
					<table class="casesReport">
						<tr>
							<td colspan="2">Report On Covid-19 Cases</td>
						</tr>
						<tr>
							<td class="NRIC">NRIC</td>
							<td>Date Of Positive</td>
						</tr>
						<c:forEach items="${ caseList }" var="caseList">
							<c:set var="caseRecord" value="${fn:split(caseList, ',')}" />
							<tr>
								<td class="NRIC"><c:out value="${ caseRecord[0] }" /></td>
								<td><c:out value="${ caseRecord[1] }" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:when>
			<c:when test="${ requestScope['dailyCaseList'].get(0) != null }">
				<div style="text-align: center">
					<form method="post" action="GenerateReportUI">
						<button type="submit" class="downloadGeneratedReport"
							name="downloadDailyCaseReport" value="Download Daily Case Report">Download Daily Case Report</button>
					</form>
				</div>
				<div>
					<table class="casesReport">
						<tr>
							<td colspan="2">Report On Covid-19 Cases</td>
						</tr>
						<tr>
							<td class="NRIC">NRIC</td>
							<td>Date Of Positive</td>
						</tr>
						<c:forEach items="${ dailyCaseList }" var="dailyCaseList">
							<c:set var="dailyCaseRecord" value="${fn:split(dailyCaseList, ',')}" />
							<tr>
								<td class="NRIC"><c:out value="${ dailyCaseRecord[0] }" /></td>
								<td><c:out value="${ dailyCaseRecord[1] }" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:when>
			<c:when test="${ requestScope['reports'] != null }">
				<div style="text-align: center">
					<form method="post" action="GenerateReportUI">
						<button type="submit" class="downloadGeneratedReport"
							name="downloadStatisticReport" value="Download Statistic Report">Download
							Cluster Report</button>
					</form> 
				</div>
				<div>
						<textarea ><c:out value="${ requestScope['reports'] }"/></textarea>
				</div>
			</c:when>
			<c:when test="${ requestScope['default'] == 'Default' }">
			</c:when>
			<c:otherwise>
				<p id="noRecords">No Record Found</p>
			</c:otherwise>
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
	
	$(".dropDownSelector").on('change', function() {
		
		if (document.getElementById("dropdownList").selectedIndex == 2) {
			$(".casesReport").css("display", "none");
			$(".generateReportCases").css("display", "none");
			//$(".generateReport").css("display", "none");
			$(".generateDailyReport").css("display", "block")
		} else {
			$(".casesReport").css("display", "none");
			$(".generateReport").css("display", "none");
		    $(".generateReportCases").css("display", "none");
		    $(".downloadGeneratedReport").css("display", "none");
		    $(".generateDailyReport").css("display", "none")
		}
		
	});
	
	
	document.getElementById('dropdownList').addEventListener('input', function() {
		if (document.getElementById("dropdownList").selectedIndex == 2) {
			$(".checkInSearchContainer").show();
			$(".submitButton").hide();
		} else {
			$(".submitButton").show();
			$(".checkInSearchContainer").hide();
		}
	});
	


</script>
</html>