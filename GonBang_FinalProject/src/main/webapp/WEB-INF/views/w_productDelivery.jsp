<!-- 작가 작품배송관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 배송 관리</title>
<link href="resources/css/nyj.css" rel="stylesheet">
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet" />

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</script>
<style type="text/css">
a:hover {
	color:gray;
}
</style>

</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<!-- 왼쪽 사이드 -->
	<jsp:include page="w_writerHomeSide.jsp" />
	<div class="w_main">

		<h2>
			<font style="vertical-align: inherit;"><font
				style="vertical-align: inherit;">작가 배송 관리</font></font>
		</h2>
	</div>
	<section class="se" style="padding-top: 70px;">
		<div class="queContent">
			<table>
				<tr class="dTop">
					<td><h4 class="dTop_box">배송 준비 &nbsp&nbsp&nbsp&nbsp~건</h4></td>
					<td><h4 class="dTop_box">배송 완료 &nbsp&nbsp&nbsp&nbsp~건</h4></td>
				</tr>
			</table>
			<table>
				<tr class="dSearch">
					<td><h5 class="dSearch_box">배송 관리</h5></td>
					<td><h5 class="dSearch_box" id="a12"><a href="./w_productCancleFrm">배송 취소</a></h5></td>
				</tr>
			</table>



			<div class="bb">
				<form method="post" action="./">
					<table style="border: 1px solid black;">
						<tr>
							<td>검색</td>
							<td colspan="3"><select>
									<option value="orderNum">주문번호</option>
									<option value="orderId">주문자아이디</option>
							</select></td>
							<td style="padding-left: 7px;">입력 :</td>
							<td><input type="text" id="Date"></td>
						</tr>
						<tr>
							<td scope="row">주문일</td>
							<td><button type="button">오늘</button></td>
							<td><button type="button">어제</button></td>
							<td><button type="button">3일</button></td>
							<td><button type="button">7일</button></td>
							<td><button type="button">1개월</button></td>
							<td><button type="button">3개월</button></td>
							<td><button type="button">6개월</button></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td colspan="2"><input type="text"></td>
						</tr>
						<tr>
							<td>입금상태</td>
							<td><input type="radio" name="deposit" value="before">입금
								전</td>
							<td><input type="radio" name="deposit" value="after">입금
								후</td>
						</tr>
					</table>

					<div class="dButton">
						<button type="button" class="btn btn-primary btn-lg">
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">검 색</font></font>
						</button>
						<button type="reset" class="btn btn-primary btn-lg">
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">초 기 화</font></font>
						</button>
					</div>
				</form>
			</div>
			<div></div>
			<div class="dSResult">
				<table class="table table-hover">
					<tr class="table-light">
						<th>주문번호</th>
						<td>주문일</td>
						<td>주문자명</td>
						<td>주소</td>
						<td>상품명</td>
						<td>수량</td>
						<td>금액</td>
						<td>운송장정보</td>
						<td>상태</td>
					</tr>
					<tr class="table-light">
						<c:if test=" ${empty receptList}">
							<tr>
								<td colspan="9">조회되는 내용이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty receptList}">
							<c:forEach var="bitem" items="${receptList}">
								<tr>
									<td>${bitem.r_num}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
											value="${bitem.r_orderdate}" /></td>
									<td>${bitem.m_id}</td>
									<td>${bitem.r_deliver}</td>
									<td>${bitem.r_pname}</td>
									<td>${bitem.r_count}</td>
									<td>${bitem.r_price}</td>
									<td>${bitem.r_dnum}</td>
									<td>${bitem.r_dcondition}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tr>
				</table>
			</div>
		</div>


	</section>
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>






