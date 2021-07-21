<!-- 로그인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/login.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var chk = "${msg}";	
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
});
</script>
<title>로그인 페이지</title>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>	
	<center>
		<div class="login-all">
			<div class="boxStyle person"><!-- person-all -->
				<form action="./loginProc" method="post" >
						<span class="mainText"><h2>&lt; 개인회원 로그인 &gt;</h2></span>
					<div class="box-log-pwd">
						<div id="person-id-pwd">
							<input class="idinput a" type="text" name="id"
								placeholder=" 아이디" required> <br> 
							<input class="a" type="password"
								name="pwd" placeholder=" 비밀번호" maxlength="12" minlength="6" required>
						</div>
						<div class="loginbtn">
							<button class="btnStyle pageMa" type="submit">로그인</button>
						</div>
					</div>
				</form>
				<div id="per-sub-id-pwd">
					<div class="btnPdd">
						<input type="button" class="btnStyle" href="./m_joinMemberFrm" value="개인 회원가입">					
					<!-- <button class="btnStyle" type="button" ><a class="pageMa" href="./m_joinMemberFrm">개인 회원가입</a></button> -->
					</div>
					<div class="btnPdd">
						<input class="btnStyle" type="button" value="아이디/비밀번호 찾기">
						<!-- <button class="btnStyle" type="button">아이디/비밀번호 찾기</button> -->
					</div>
				</div>
			</div>
			<div class="boxStyle company"><!-- company-all -->
				<form action="./loginProc" method="post">
					<h2>
						<span class="mainText">&lt; 작가 로그인 &gt;</span>
					</h2>
					<div>
						<div id="company-id-pwd" class="box-log-pwd">
							<input type="text" name="id" placeholder=" 아이디"
								class="idinput a"> <br> 
							<input type="password"
								name="pwd" placeholder=" 비밀번호" maxlength="12" minlength="6"
								class="a">
						</div>
						<div class="loginbtn">
							<button class="btnStyle pageMa" type="submit">로그인</button>
						</div>
					</div>
				</form>
				<div id="per-sub-id-pwd">
						<div class="btnPdd">
							<input class="btnStyle pageMa" type="button" value="작가 회원가입" href="w_joinWriterFrm">
						</div>
						<div class="btnPdd">
							<input class="btnStyle" type="button" value="아이디/비밀번호 찾기">
						</div>
					</div>
			</div>
		</div>
	</center>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>