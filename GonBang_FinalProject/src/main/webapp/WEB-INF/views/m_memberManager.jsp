<!-- 회원 정보 관리(정보수정) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/kjs.css" rel="stylesheet" />
<link href="resources/css/myAside.jsp" rel="stylesheet" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="MyPageMainTop">
		<aside>
			<jsp:include page="myAside.jsp" />
		</aside>

		<div class="MyPageName">
			<h2>회원 정보 관리</h2>
		</div>
	</div>
	<div class="MyPageMain" style="height: 800px; margin-top: 70px;">
		<div class="row">
			<form method="post" action="m_InfoFix">
				<table class="table table-bordered"
					style="margin-top: 30px; text-align: center; margin-left: -45px;">
					<thead>
						<tr>
							<th>이름</th>
							<th>${memberdto.m_name}</th>
						</tr>
						<tr>
							<th>아이디</th>
							<th>${memberdto.m_id}</th>
						</tr>
						<tr>
							<th>비밀번호</th>
							<th><input type="text" name="m_pwd"></th>
						</tr>
						<!-- 					<tr>
						<th>비밀번호 확인</th>
						<th><input type="text" name="m_info_pwdchk"></th>
					</tr> -->
						<tr>
							<th>이메일</th>
							<th><input type="email" name="m_email"
								value="${memberdto.m_email}"></th>
						</tr>
						<tr>
							<th>성별</th>
							<th><font style="vertical-align: inherit;"><input
									type="text" value="${memberdto.m_gender}" name="m_gender"></font></th>
						</tr>

						<tr>
							<th>생년월일</th>
							<th><input type="text" value="${memberdto.m_birth}" name="m_birth">
							</th>
						</tr>
					</thead>
				</table>

				<div style="text-align: center;">
					<button type="reset" class="btn btn-primary btn-lg">
						<font style="vertical-align: inherit;"></font> <font
							style="vertical-align: inherit;">취 소</font>
					</button>
					<button type="submit" class="btn btn-primary btn-lg">
						<font style="vertical-align: inherit;"></font> <font
							style="vertical-align: inherit;">회원 정보 수정하기</font>
					</button>
				</div>
			</form>
		</div>
	</div>
	
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>