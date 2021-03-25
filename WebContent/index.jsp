<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>메인 화면</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="/css/login.css" rel="stylesheet">
<link href="assets/css/facebook.css" rel="stylesheet">
</head>
<script src="assets/js/jquery.js"></script>
<script>
	$(function() {
		var sessionUserId = "${sessionScope.user.userId}" + "" ;
		if( sessionUserId != null &&
				sessionUserId != "" ) {
			alert("로그인한 상태이므로 메인화면으로 이동합니다.") ;
			document.loginForm.method = "GET" ;
	    	document.loginForm.action = "main.do" ;
	    	document.loginForm.submit() ;
		}
		
	
    $("#signIn").click(function(){
    	
    	var id = document.loginForm.userId.value ;
    	var password = document.loginForm.password.value ;
    	
    	if( id == null || 
    	    password == null || 
    	    id == "" || 
    	    password == "" ) {
    		
    		alert("ID 또는 패스워드를 입력하세요.") ;
    		return ;
    	}
    	
    	document.loginForm.action = "login.do" ;
    	document.loginForm.submit() ;
    	
    	
    }); // End of click
}) ; //End of function

</script>
<body>
	<h2>로그인 화면 / 회원 가입 또는 회원 등록</h2>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
				<form>
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span> 
				<input type="text"placeholder="Name"/> 
				<input type="email" placeholder="Email"/>
				<input type="password" placeholder="Password"  />
				<button>Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="#" name="loginForm" method="post">
				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span>
				    <input type="text" placeholder="id" id="userId" name="userId"  value="user01" /> 
					<input type="password" placeholder="Password" id="password" name="password" value="1111"/>
					<a href="#">Forgot your password?</a>
				<button id="signIn" name="signIn">Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>

	<footer>	
		<p>
			Created with <i class="fa fa-heart"></i> by <a target="_blank"
				href="https://florin-pop.com">Florin Pop</a> - Read how I created
			this and how you can join the challenge <a target="_blank"
				href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
		</p>
	</footer>

</body>
</html>