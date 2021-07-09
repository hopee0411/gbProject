<!-- 일반 회원가입 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/join.css">
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
		<header>
		<jsp:include page="header.jsp" />
	</header>
	<section>
			<div class="content">
				<form name="joinFrm" class="login-form" action="./memInsert"
					method="post" onsubmit="return check()">
					<h2 class="login-header">회원 가입</h2>
					<input type="text" class="login-input" id="mid" title="아이디" name="m_id" autofocus placeholder="아이디" required> 
					<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()">
					<input type="password" class="login-input" title="비밀번호" name="m_pwd" placeholder="비밀번호"> 
					<input type="text" name="m_name" class="login-input" title="이름" placeholder="이름">
					<input type="text" name="m_email" class="login-input" title="이메일" placeholder="이메일">
					<input type="text" name="m_addr" class="login-input" title="주소" placeholder="주소">
					<font style="vertical-align: inherit;" class="login-input">
						<input type='radio' name='gender' value='female' />여성 
						<input type='radio' name='gender' value='male' />남성
					</font>
					<input type="text" name="m_birth" class="login-input" title="생일" placeholder="생일"> 
					
					
					<input type="submit" class="login-btn" value="가입">
				</form>
			</div>
		</section>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>