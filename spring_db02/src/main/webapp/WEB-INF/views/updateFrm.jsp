<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
$(function(){
	var chk = "${msg}";
	
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
	
	//세션에 id가 없으면 첫(home)페이지로 강제 이동
	var lid = "${id}";
	if(lid == "" || lid == null){
		location.href = "./";
	}
});
</script>
</head>
<body>
<div class="wrap">
<header>
	<div class="top-bar">
		<div class="content">
			<h2 class="top-left"><a href="./main">그냥 만든 홈</a></h2>
			<nav class="top-right">
				<ul>
					<li><a href="#" title="정보수정">Modify</a></li>
					<li><a href="./logout" title="로그아웃">Logout</a></li>
					<li><a href="./resign" title="회원탈퇴">Resign</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<section>
	<div class="content">
		<form name="joinFrm" class="login-form" action="./updateProc" method="post">
			<h2 class="login-header">회원 정보 수정</h2>
			<input type="text" class="login-input" id="m_id" title="아이디"
				name="m_id" autofocus placeholder="아이디" readonly value="${mem.m_id}">
			<input type="password" class="login-input" title="비밀번호"
				name="m_pass" placeholder="비밀번호" value="${mem.m_pass}">
			<input type="text" name="m_name" class="login-input" title="이름"
				placeholder="이름" value="${mem.m_name}">
			<input type="text" name="m_phone" class="login-input" title="연락처"
				placeholder="연락처" value="${mem.m_phone}">
			<input type="submit" class="login-btn" value="수정">
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