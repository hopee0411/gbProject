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
		<div class="MyPageName">
			<h2>마이 페이지</h2>
		</div>
	</div>
	<div class="MyPageMain">
		<div class="row">
			<table class="table table-bordered" style="margin-top: 30px; text-align: center; margin-left: -45px;">
				<thead>
					<tr>
						<th>적립금</th>
						<th>쿠폰</th>
						<th>주문 내역</th>
						<th>문의</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0P</td>
						<td>0장</td>
						<td>0건</td>
						<td>0건</td>
					</tr>
				</tbody>
				</table>
			</div>
		<div class="row">
		<h5 style="margin-left: -45px; margin-top: 30px;">최근주문내역</h5>		
			<table class="table table-bordered" style="margin-top: 25px; text-align: center; margin-left: -45px;">
				<thead>
					<tr>
						<th>주문일자</th>
						<th>주문번호</th>
						<th style="margin: 0 20px;">주문내역</th>
						<th>주문금액</th>
						<th>주문상태</th>
						<th>비고</th>
					</tr>
				</thead>
				<tr>
				<td colspan="6"><c:if test="true">조회되는 내용이 없습니다.</c:if></td>
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td><td></td><td></td>
				</tr>
			</table>
		</div>
</body>
</html>