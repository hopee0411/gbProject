<!-- 회원 작품 취소/환불/반품/교환 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/교환/환불</title>
<link href="resources/css/kjs.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
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
			<h2>취소 내역</h2>
		</div>
	</div>
	<div class="MyPageMain">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable" id="tabs-107511" style="">
						<ul class="nav nav-tabs" style="margin-top: 40px;">
							<li class="nav-item" style="margin-left: -50px;"><a
								class="nav-link active show" href="#tab1"><h4
										style="padding-right: 50px; padding-left: 50px;">취소</h4></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-content"
								style="border: hidden; background-color: lightgray; margin-top: 50px; padding: 40px 20px; margin-left: -50px;">
								<div class="tab-pane active" id="panel-48688">
									<div class="bxSearch">
										<table class="table">
											<thead>
												<tr>
													<form name="search" method="get">
														<fieldset style="width: 1000px;">
															<label for="">기간별 조회</label>
															<button type="button" id="term1" class="btnM btnWhite06"
																href="">1개월</button>
															<button type="button" id="term3" class="btnM btnWhite06"
																onclick="">3개월</button>
															<button type="button" id="term6" class="btnM btnWhite06"
																onclick="">6개월</button>
															<button type="button" id="term12" class="btnM btnWhite06"
																onclick="">12개월</button>

															<label for="">일자별 조회</label> <input type="date"
																id="sdate" name="sdate" title="조회 시작일 입력" value=""
																class="calendar"> <span class="bar">~</span> <input
																type="date" id="edate" name="edate" title="조회 마지막일 입력"
																value="" class="calendar">

															<button class="btnM btnGray01">조회</button>
														</fieldset>
													</form>
													</div>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<h6 style="margin-left: -50px; margin-top: 70px;">취소건수 0건</h6>
					<table class="table table-bordered"
						style="margin-top: 15px; text-align: center; margin-left: -45px;">
						<thead>
							<tr>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문내역</th>
								<th>주문금액</th>
								<th>주문상태</th>
								<th>비고</th>
							</tr>
						</thead>
						<c:if test=" ${empty receptCList}">
							<tr>
								<td colspan="6">조회되는 내용이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty receptCList}">
							<c:forEach var="bitem" items="${receptCList}">
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
			</div>
			<footer>
				<jsp:include page="footer.jsp" />
			</footer>
</body>
</html>