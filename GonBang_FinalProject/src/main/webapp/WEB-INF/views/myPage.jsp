<!-- 마이페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/kjs.css" rel="stylesheet" />
<style type="text/css">
.MyPageMain {
	height: 1000px;
}
</style>
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
			<table class="table table-bordered"
				style="margin-top: 30px; text-align: center; margin-left: -45px; width: 100%;">
				<thead>
					<tr>
						<th>적립금</th>
						<th>쿠폰 내역</th>
						<th>주문 건수</th>
						<th>문의 건수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${saving_pointdto.pt_point}p</td>
						<td>${coupondto.c_couponhistory}%</td>
						<td>${rNum}건</td>
						<td>${qNum}건</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row">
			<h5 style="margin-left: -45px; margin-top: 30px;">최근주문내역</h5>
			<table class="table table-bordered"
				style="margin-top: 25px; text-align: center; margin-left: -45px; width: 100%;">
				<thead>
					<tr>
						<th>주문일자</th>
						<th>주문번호</th>
						<th>주문내역</th>
						<th>주문금액</th>
						<th>주문상태</th>
						<th>수량</th>
					</tr>
				</thead>
				<c:if test=" ${empty receptList}">
					<tr>
						<td colspan="6">조회되는 내용이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty receptList}">
					<c:forEach var="bitem" items="${receptList}">
						<tr>
							<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
									value="${bitem.r_orderdate}" /></td>
							<td>${bitem.r_num}</td>
							<td>${bitem.r_pname}</td>
							<td>${bitem.r_price}</td>
							<td>${bitem.r_dcondition}</td>
							<td>${bitem.r_count}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<h5 style="margin-left: -45px; margin-top: 30px; width: 80%;">관심작품</h5>
		<hr style="margin-left: -45px;">

		<c:if test="${empty pi_viewList}">
			<div class="col mb-5" id="scroll"
				style="width: 250px; height: 100px;">
				<h4 style="color: lightgray">관심작품이 없습니다.</h4>
			</div>
		</c:if>
		<c:if test="${!empty pi_viewList}">
			<c:forEach var="piItem" items="${pi_viewList}">
				<div class="col mb-5" id="scroll"
					style="width: 250px; height: 330px;">

					<div class="card h-100">
						<!-- Product image-->
						</button>
						<img class="card-img-top" src="resources/images/Desert.jpg">
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h6 style="text-align: left;">공방이름 : ${piItem.wh_gbname}</h6>
								<h6 style="text-align: left;">제품이름 :
									${piItem.p_productname}</h6>
								<!-- Product price-->
								<h6 style="text-align: left;">가격 : ${piItem.p_price}원</h6>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<h5 style="margin-left: -45px; margin-top: 30px; width: 80%;">관심작가</h5>
		<hr style="margin-left: -45px;">
		<div class="col mb-5" id="scroll" style="width: 250px; height: 280px;">
			<div class="card h-100">
				<!-- Product image-->
				</button>
				<img class="card-img-top" src="resources/images/Desert.jpg">
				<!-- Product details-->
				<div class="card-body p-4">
					<div class="text-center">
						<!-- Product name-->
						<h6 style="text-align: left;">공방 이름</h6>
						<h5 style="text-align: left;">작가 이름</h5>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>