<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Technozi</title>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0maximum-scale=1.0, user-scalable=0'" />
</head>
	<style>
		
		html, body { margin: 0; padding: 0; background: #6E6E6E; height: 100%; max-height: 844px; font-family: Arial; }
		body {
		}
				
		.loginContain {
			width: 100%;
			height: 100%;
			max-width: 420px;
			margin: 0 auto;
			background: #FFFFFF;
			animation: gradient 15s ease infinite;
			opacity: 0;
		}
		
		.loginContain .heroIcon {
			width: 50px;
			float: right;
		}
		
		.loginContain .heroIcon img {
			width: 100%;
		}
		
		.loginHeroImage {
			background-image: url("img/loginHero.jpg");
			width: 100%;
			height: 300px;
			background-repeat: no-repeat;
			background-size: cover;
		}
		
		.loginDiv {
			opacity: 1;
			width: 90%;
			margin-left: 5%;
			background: #FFFFFF;
			float: left;
			margin-top: -70px;
			box-shadow:
				0 2.8px 2.2px rgba(0, 0, 0, 0.034),
				0 6.7px 5.3px rgba(0, 0, 0, 0.048),
				0 12.5px 10px rgba(0, 0, 0, 0.06),
				0 22.3px 17.9px rgba(0, 0, 0, 0.072),
				0 41.8px 33.4px rgba(0, 0, 0, 0.086),
				0 100px 80px rgba(0, 0, 0, 0.12);
		}
		
		#loginPara {
		}
		
		.loginReturn {
			width: 80%;
			height: 50px;
			margin-left: 10%;
			text-align: center;
			margin-top: 20px;
			float: left;
		}
		
		input {
			width: 80%;
			margin-left: 10%;
			border-radius: 5px;
			height: 40px;
			box-sizing: border-box;
			border: 1px solid grey;
			padding: 10px;
			font-size: 20px;
			background: #E6EBF1;
		}
		
		input:focus, textarea:focus, select:focus{
			outline: none;
		}
		
		input[type=submit] {
			background: #467BEF;
			color: #FFFFFF;
			border: 0;
			margin-bottom: 40px;
		}
		
		#fpassword {
			text-align: center;
			font-size: 14px;
			margin: 0;
			margin-bottom: 10px;
		}
		
		a { text-decoration: none; }
		
		.loginPara {
			width: 29%;
			height: 100px;
			font-size: 22.5px;
			text-transform: uppercase;
			text-align: right;
			font-weight: bold;
			line-height: 100px;
			float: left;
		}
		
		.loginTypeSelection {
			width: 60%;
			height: 100px;
			float: right;
			position: relative;
		}
		
		select {
			/background: red;
			float: right;
			padding: 10px;
			position: absolute;
			top: 50%;
			transform: translateY(-50%);
			margin-left: 20px;
			border-radius: 5px;
		}
		
		#errorMsg {
			color: red;
			font-size: 15px;
		}
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
	</style>

<body>
	<div class="loginContain">
		<div class="heroIcon">
			<a href="index.html"><img src="img/icon.png" alt="Hero Icon"></a>
		</div>
		<div class="loginHeroImage"></div>
		
		<div class="loginDiv">
			<div class="loginPara">Login</div>
			<div class="loginTypeSelection">

			</div>
			<form action="LoginUI" method="post">
				<input type="text" placeholder="NRIC" name="username">
				<br><br>
				<input type="password" placeholder="Password" name="password">
				<br><br>
				<br>
				<input type="submit" value="LOGIN">
				<div style="text-align:center;">
				<span id="errorMsg"><%= (request.getAttribute("errorMsg") != null ? request.getAttribute("errorMsg") : "" ) %></span>
				</div>
				
			</form>
		</div>
	</div>
</body>
	
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
	<script>
		$(document).ready(function() {
			TweenMax.to($(".loginContain"), 1, { opacity: 1, ease:Quad.easeOut});
			TweenMax.from($(".loginDiv"), 1, { opacity: 0, 'margin-top': '-20px', ease:Quad.easeOut});
		})
	</script>
</html>