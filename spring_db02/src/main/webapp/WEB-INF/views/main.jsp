<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
$(function(){
	/* 수정이 완료됐다는 문구 */
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
			<h2 class="top-left"><a href="./">그냥 만든 홈</a></h2>
			<nav class="top-right">
				<ul>
					<li><a href="./updateFrm" title="정보수정">Modify</a></li>
					<li><a href="./logout" title="로그아웃">Logout</a></li>
					<li><a href="./resign" title="회원탈퇴">Resign</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<section>
	<div class="content">
		<p>ID: ${mem.m_id}</p>
		<p>NAME: ${mem.m_name}</p>
		<p>PHONE: ${mem.m_phone}</p>
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