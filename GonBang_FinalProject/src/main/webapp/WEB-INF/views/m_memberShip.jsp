<!-- 회원등급 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등급</title>
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
			<h2>회원등급</h2>
		</div>
	</div>
	<div class="m_memberShip" style="height: none;">
		<div class="row">
			<table class="table table-bordered"
				style="margin-top: 30px; text-align: center; margin-left: 20px; width: 90%;">
				<thead>
					<tr>
						<td><img class="img-fluid1" src="resources/images/bronze.jpg"></td>
						<td><img class="img-fluid1" src="resources/images/silver.jpg"></td>
						<td><img class="img-fluid1" src="resources/images/gold.jpg"></td>
						<td><img class="img-fluid1" src="resources/images/vip.jpg"></td>
					</tr>
				</thead>
				<tbody>
					<h3 style="text-align: center; margin-top: 30px;">등급별 혜택</h3>
					<tr>
						<td>최근 6개월간 5만원 미만구매</td>
						<td>최근 6개월간 10만원 이상 구매</td>
						<td>최근 6개월간 30만원이상 구매</td>
						<td>최근 6개월간 50만원이상 구매</td>
					</tr>
					<tr>
						<td>2% 적립</td>
						<td>4% 적립</td>
						<td>6% 적립</td>
						<td>8% 적립</td>
					</tr>
					<tr>
						<td>5% 할인</td>
						<td>10% 할인</td>
						<td>10% 할인</td>
						<td>15% 할인</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>5% 할인</td>
						<td>10% 할인</td>
					</tr>
				</tbody>
			</table>
			<h5>1. 할인쿠폰은 매월 등급별 발행됩니다.</h5>
			<h5>2. 회원등급은 매월 1일에 갱신됩니다.</h5>
		</div>
	</div>
	
<footer style="margin-top: 500px;">
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>