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
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="MyPageMainTop">
		<aside>
			<jsp:include page="myAside.jsp" />
		</aside>
		<div class="MyPageName"><h2>마이 페이지</h2></div>
	</div>
	<div class="MyPageMain">
		<table class="table table-hover">
			<tr class="table-secondary">
				<th scope="row" style="font-size: 20px;">적립금<br>0P</th>
				<td scope="row" style="font-size: 20px;">쿠폰<br>0장</td>
				<td scope="row" style="font-size: 20px;">주문내역<br>0권</td>
				<td scope="row" style="font-size: 20px;">문의<br>0권</td>
			</tr>
		</table>
	</div>
</body>
</html>