<!-- 마이페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/kjs.css" rel="stylesheet" />



</head>
<body>
정호용변경
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="MyPageMainTop">
		<div class="MyPageName"><h2>마이 페이지</h2></div>
	</div>
	<div class="MyPageMain">
	<table class="table table-hover">
		<tr class="table-secondary">
			<th scope="row">적립금</th>
			<td>쿠폰</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
	</table>
		<aside>
			<jsp:include page="myAside.jsp" />
		</aside>
	</div>
</body>
</html>