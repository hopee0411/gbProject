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
<style type="text/css">
.pageMa {
	text-decoration: none;
	color: black;
}
</style>
<title>로그인 페이지</title>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>	
	<center>
		<div class="login-all">
			<div class="person-all">
				<form action="./loginProc" method="post">
					<h2>
						<span>개인회원 로그인</span>
					</h2>
					<div>
						<div id="person-id-pwd">
							<input class="idinput a" type="text" name="id"
								placeholder=" 아이디"> <br> <input class="a" type="password"
								name="pwd" placeholder=" 비밀번호" maxlength="12" minlength="6">
						</div>
						<div class="loginbtn">
							<button class="btnStyle pageMa" type="submit">로그인</button>
						</div>
					</div>
				</form>
				<div id="per-sub-id-pwd">
					<div class="btnPdd">
						<button class="btnStyle" type="button" ><a class="pageMa" href="./m_joinMemberFrm">개인 회원가입</a></button>
					</div>
					<div class="btnPdd">
						<button class="btnStyle" type="button">아이디/비밀번호 찾기</button>
					</div>
				</div>
			</div>
			<div class="company-all">
				<form action="./loginProc" method="post">
					<h2>
						<span>작가 로그인</span>
					</h2>
					<div>
						<div id="company-id-pwd">
							<input type="text" name="id" placeholder=" 아이디"
								class="idinput a"> <br> <input type="password"
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
							<button class="btnStyle" type="button"><a class="pageMa" href="w_joinWriterFrm">작가 회원가입</a></button>
						</div>
						<div class="btnPdd">
							<button class="btnStyle" type="button">아이디/비밀번호 찾기</button>
						</div>
					</div>
			</div>
		</div>
	</center>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>