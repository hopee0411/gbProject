<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
$(function(){
	var chk = "${msg}";
	
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
});
</script>
</head>
<body>
<div class="wrap">
<header>
	<div class="top-bar">
		<div class="content">
			<h2 class="top-left"><a href="./">그냥 만든 홈</a></h2>
			<nav class="top-right">
				<ul>
					<li><a href="#">Login</a></li>
					<li><a href="./joinFrm">Join</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<section>
	<div class="content">
		<form class="login-form" action="./loginProc" method="post">
			<h2 class="login-header">로그인</h2>
			<input type="text" class="login-input" 
				name="m_id" required autofocus placeholder="아이디">
			<input type="password" class="login-input" 
				name="m_pass" required placeholder="비밀번호">
			<input type="submit" class="login-btn" value="로그인">
		</form>
	</div>
</section>
<footer>
	<div class="footer-bar">
		<div class="content">
			<div class="fcontents">
				<span class="footer-txt">&copy; JIP 2020</span>
			</div>
		</div>
	</div>
</footer>
</div>
</body>
</html>