
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
		
		@keyframes gradient {
			0% {
				background-position: 0% 50%;
			}
			50% {
				background-position: 100% 50%;
			}
			100% {
				background-position: 0% 50%;
			}
		}	
		
		.indexPageContain {
			width: 100%;
			height: 100%;
			max-width: 420px;
			margin: 0 auto;
			background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
			background-size: 400% 400%;
			animation: gradient 15s ease infinite;
		}
		
		.heroIcon {
			width: 40%;
			border-radius: 10px;
			margin: 0 auto;
			padding-top: 140px;
		}
		
		.heroIcon img {
			max-width: 100%;
		}
		
		.homescreenContain {
			max-width: 380px;
			width: 90%;
			position: absolute;
			bottom: 0;
			left: 50%;
			transform: translateX(-50%);
		}
		
		.homescreenContain p {
			margin: 0;
			padding: 0;
			color: #FFFFFF;
		}
		
		.homescreenContain span {
			font-size: 24px;
			margin-bottom: 5px;
			display: block;
		}
		
		.homescreenActions {
			width: 100%;
			max-width: 420px;
		}
		
		.homescreenActions .login {
			width: 100%;
			height: 50px;
			background: #FFFFFF;
			border-radius: 10px;
			font-size: 20px;
			color: #086CF4;
			text-align: center;
			font-weight: bold;
			line-height: 48px;
			margin-bottom: 10px;
			box-sizing: border-box;
			opacity: 90%;
			cursor: pointer;
		}
		
		.homescreenActions .signup {
			width: 100%;
			height: 50px;
			border: 2px solid #FFFFFF;
			box-sizing: border-box;
			color: #FFFFFF;
			border-radius: 10px;
			font-size: 20px;
			text-align: center;
			font-weight: bold;
			line-height: 46px;
			margin-bottom: 30px;
		}
		
		@media only screen and (max-width: 455px) {
			.homescreenContain {
				max-width: 780px !important;
			}
			
		}
		
		@media screen and (max-width: 500px) {
			html, body { background: #FFFFFF !important; }
		}
		
	</style>

<body>
	
	<div class="indexPageContain">
		<div class="heroIcon">
			<img src="/covid19/img/icon.png" alt="Hero Icon">
		</div>
		
		<div class="homescreenContain">
			<p><span>Fake TraceTogether</span></p>
			<p>Use this app to receive latest updates <br>and more!</p>
			<br>
			<div class="homescreenActions">
			<form method="post" action="IndexUI">
				<input type="submit" value="Login" class="login">
				<div class="signup">Sign up</div>
			</form>

			</div>
		</div>
	</div>
	
</body>
	
	<script src="js/vendor/jQuery.js"></script>
	<script src="js/vendor/Tweenmax.js"></script>
	<script src="js/main.js"></script>
	<script>
		$(document).ready(function() {
			TweenMax.from($(".indexPageContain"), 1.5, { opacity: 0, ease:Quad.easeOut});
		})
	</script>
</html>