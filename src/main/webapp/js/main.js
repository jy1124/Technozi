$(document).ready(function() {
	
	$(".homescreenActions .login").click(function() {
		loginClicked();
	});	
	
//	$(".individual").click(function() {
//		window.location.href = "login.html?type=individual";
//	});
//	
//	$(".business").click(function() {
//		window.location.href = "login.html?type=business";
//	});
//
//	$(".healthstaff").click(function() {
//		window.location.href = "login.html?type=health%20staff";
//	});
//
//	$(".healthorganisation").click(function() {
//		window.location.href = "login.html?type=health%20organisation";
//	});
//	
//	var url_string = window.location.href;
//	var url = new URL(url_string);
//	var type = url.searchParams.get("type");
//	
//	$('#loginPara').text('LOGIN (' + type + ')' );
	
	function loginClicked () {
		TweenMax.to($(".heroIcon"), 1, { opacity: 0, display: "none", ease:Quad.easeOut});
		TweenMax.to($(".homescreenContain"), 1, { opacity: 0, ease:Quad.easeOut});
		//$(".homescreenContain").css("background-color");
		window.setTimeout(function(){
			window.location.href = "/covid19/login.jsp";
		}, 1000);
	}
})