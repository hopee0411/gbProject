<!-- 회원 주문/ 배송관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/kjs.css" rel="stylesheet" />
<style type="text/css">
/* .container-fluid {
	height: 500px;
} */
.MyPageMain {
	height: 500px;
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
			<h2>주문/배송 내역</h2>
		</div>
	</div>
	<div class="MyPageMain">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable" id="tabs-107511" style="">
						<ul class="nav nav-tabs" style="margin-top: 40px;">
							<li class="nav-item" style="margin-left: -50px;">
								<a class="nav-link active show" href="#tab1">
									<h4 style="padding-right: 50px; padding-left: 50px;">주문/배송조회</h4>
								</a>
							</li>
						</ul>
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
															onclick="dDate(1m)">1개월</button>
														<button type="button" id="term3" class="btnM btnWhite06"
															onclick="dDate(3m)">3개월</button>
														<button type="button" id="term6" class="btnM btnWhite06"
															onclick="dDate(6m)">6개월</button>
														<button type="button" id="term12" class="btnM btnWhite06"
															onclick="dDate(12m)">12개월</button>

														<label for="">일자별 조회</label> <input type="date" id="sdate"
															name="sdate" title="조회 시작일 입력" value="" class="calendar">

														<span class="bar">~</span> <input type="date" id="edate"
															name="edate" title="조회 마지막일 입력" value="" class="calendar">

														<button class="btnM btnGray01">조회</button>
													</fieldset>
												</form>
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
				<h6 style="margin-left: -50px; margin-top: 70px;">조회건수 ${rNum}건</h6>
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
		</div>
	</div>
<footer style="width: 100%;">
	<jsp:include page="footer.jsp" />
</footer>
</body>

<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function dDate(start) {
	var num = start.substring(0, 1);
	var str = start.substring(1, 2);
	
	var today = new Date();
	
	var endDate = $.datepicker.formatDate('yy-mm-dd', today);
	$('$dDate').val(endDate);
	
	if(str == 'm') {
		today.setMonth(today.getMonth() - num);
		today.setDate(today.getDate() + 1);
	}
	
	var startdate = $.datepicker.formatDate('yy-mm-dd', today);
	$('#sdate').val(startdate);
	$("#dDate").datepicker( "option", "minDate", startDate );
    
    // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
    $("#sdate").datepicker( "option", "maxDate", endDate );
	
	
	
	
	
	
	/* 
	$.ajax({
		type : "GET",
		url : "dDate?date=" + date,
	}); */
}//dDate() end 
</script> -->
</html>








