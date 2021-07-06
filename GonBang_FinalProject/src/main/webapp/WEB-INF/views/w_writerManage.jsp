<!-- 작가 개인 정보 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 개인 정보 관리</title>
<link href="resources/css/nyj.css" rel="stylesheet">
<link href="resources/css/w_info.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />

</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<!-- 왼쪽 사이드 -->
	<jsp:include page="queSide.jsp" />
		<div class="w_main">
		<h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작가정보 관리</font></font></h2>
		</div>
	<section class="se">
		<div class="queContent">
			<table class="table table-hover">
				<tbody>
					<tr class="table-secondary">
						<th scope="row"><font><font>공방이름</font></font></th>
						<td><font><font>열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">아이디</font></font></th>
						<td><font><font> 열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">비밀번호</font></font></th>
						<td><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">비밀번호확인</font></font></th>
						<td><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">이메일</font></font></th>
						<td><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">사업자 등록번호</font></font></th>
						<td><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">성별</font></font></th>
						<td><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">생년월일</font></font></th>
						<td><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">열 내용</font></font></td>
					</tr>
					<tr class="table-secondary">
						<th scope="row"><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">주소</font></font></th>
						<td><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">열 내용</font></font></td>
					</tr>
				</tbody>
			</table>
		

		
			<form class="table-secondary">
				공방이름 <input type="text" name="w_gona_name"><br>
				아이디 <input type="text" name="w_id"><br>
			</form>

			<button type="button" class="btn btn-primary btn-lg"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">취 소</font></font></button>
			<button type="button" class="btn btn-primary btn-lg"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">작가 정보 수정하기</font></font></button>
		</div>
	</section>
	
	
</body>
</html>





