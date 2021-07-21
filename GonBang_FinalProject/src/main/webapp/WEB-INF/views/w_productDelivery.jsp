<!-- 작가 작품배송관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 배송 관리</title>
<link href="resources/css/nyj.css" rel="stylesheet">
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet" />

<style type="text/css">
a:hover {
	color: gray;
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
					<td><h4 class="dTop_box">배송 준비 &nbsp&nbsp&nbsp ${dwNum}건</h4></td>
					<td><h4 class="dTop_box">배송 완료 &nbsp&nbsp&nbsp ${deNum}건</h4></td>
				</tr>
			</table>
			<table>
				<tr class="dSearch">
					<td><h5 class="dSearch_box">배송 관리</h5></td>
					<td><h5 class="dSearch_box" id="a12">
							<a href="./w_productCancleFrm">배송 취소</a>
						</h5></td>
				</tr>
			</table>

			<div class="bb">
				<form name="search" method="get" action="wDSearchOption">
					<div style="border: solid 1px;">
						<fieldset style="width: 1000px; padding: 8px;">
							<label for="">검색</label>&nbsp&nbsp&nbsp
							<!-- <option value="orderNum" name="r_num">주문번호</option> -->


							주문자아이디 <input type="text" placeholder="주문자 아이디 입력" name="m_id">
							<br> 주문번호 <input type="text" placeholder="주문번호 입력"
								name="r_num"> <br> <label for="">주문일</label>
							<button type="button" id="termD" class="btnM btnWhite06"
								onclick="dDate()">오늘</button>
							<button type="button" id="termY" class="btnM btnWhite06"
								onclick="dDate()">어제</button>
							<button type="button" id="term3" class="btnM btnWhite06"
								onclick="dDate()">3일</button>
							<button type="button" id="term7" class="btnM btnWhite06"
								onclick="dDate()">7일</button>
							<button type="button" id="termM" class="btnM btnWhite06"
								onclick="dDate()">1개월</button>
							<button type="button" id="term3M" class="btnM btnWhite06"
								onclick="dDate()">3개월</button>
							<button type="button" id="term6M" class="btnM btnWhite06"
								onclick="dDate()">6개월</button>

							<label for="">일자별 조회 :</label> <input type="date" id="sdate"
								name="sdate" title="조회 시작일 입력" value="" class="calendar">
							<span class="bar">~</span> <input type="date" id="edate"
								name="edate" title="조회 마지막일 입력" value="" class="calendar">
							<button class="btnM btnGray01">조회</button>
							<br> <label for="">상품명 :</label> <input type="text"
								placeholder="입력" name="r_pname">

						</fieldset>
					</div>
					<button type="submit" class="btn btn-primary btn-lg">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">검 색</font></font>
					</button>
					<button type="reset" class="btn btn-primary btn-lg"
						onclick="location.href='w_productDeliveryFrm'">
						초 기 화 <font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"></font></font>
					</button>
				</form>
			</div>
			<div></div>
			<div class="dSResult">
				<form method="get" action="dNumPut" >
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
									<td>
										  <c:choose>
											<c:when test="${empty bitem.r_dnum}">
												<input id="i_${bitem.r_num}" type="text"
												value="${bitem.r_dnum}" name="r_dnum" placeholder="운송번호입력">
											</c:when>
											<c:when test="${!empty bitem.r_dnum}">
												<input id="i_${bitem.r_num}" type="text"
												value="${bitem.r_dnum}" name="r_dnum" placeholder="운송번호입력"
												style="background-color: pink">
											</c:when>							
										</c:choose> 
										 <%--  <input id="i_${bitem.r_num}" type="text"
											value="${bitem.r_dnum}" name="r_dnum" placeholder="운송번호입력">
											<c:if test="${!empty i_bitem.r_num}">											
													style="background-color: pink">
											</c:if>   --%>
									</td>		
									<td>
									<span id="id_${bitem.r_num}">${bitem.r_dcondition}</span>
									</td>
									<td><c:if test="${empty bitem.r_dnum}">
										<button type="button" value="${bitem.r_num}">확인</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</form>
			</div>
		</div>

	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
<script type="text/javascript">
$(function(){
	$("button").on("click", function(){
		var d = $(this); //확인버튼
		var i = $(this).val();
		console.log(i);
		var ids = "i_" + i;		
		var spanelm = $(this).parents("tr").children().eq(8).children("span");
		var dnum = $(this).parents("tr").children().eq(7).children("input").val();
		var ddnum = $(this).parents("tr").children().eq(7).children("input");
		console.log(dnum);
		console.log(spanelm);
		spanelm.html("배송중");
		var num = {
				"r_num" : i,
				"r_dnum" : dnum
		}	
	
	$.ajax({
			type : "GET",
			url : "dNumPut",
			data : num,
			success : function(result) {
				if("성공") {		
					
			ddnum.attr("readonly", true);
			//ddnum.attr("disabled", true);
			
			/* $(ddnum)
			.css("background", "pink"); */
			
			d.hide();
	} else {

							}
							console.log(num);

						},
						error : function(error) {

						}

					});

				})

	});

	/* $.ajax({
	 url: "replyIns",
	 type: "post",
	 data: replyFrm,
	 dataType: "json",
	 success: function(result){
	 var rlist = "";
	 var dlist = result.rList;
	
	 //목록 처리라서 반복
	 for(var i = 0; i < dlist.length; i++){
	 rlist += '<tr>'
	 + '<td width="20%">' + dlist[i].r_id + '</td>'
	 + '<td width="50%">' + dlist[i].r_contents + '</td>'
	 + '<td width="30%">' + dlist[i].r_date + '</td>'
	 + '</tr>';
	 }
	 $("#rtable").html(rlist);
	 },
	 error: function(error){
	 console.log(error);
	 alert("댓글 입력 실패");
	 }
	 }); */
</script>
</html>






