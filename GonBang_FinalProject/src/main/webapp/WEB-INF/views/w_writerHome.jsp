<!-- 작가홈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 홈</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet" />
<link href="resources/css/w_writerHome.css" rel="stylesheet" />

<script type="text/javascript">
	$(function() {

		$(".dateclick").dateclick(); // DateClick
		$(".searchDate").schDate();
	});

	// Search Date
	jQuery.fn.schDate = function() {
		var $obj = $(this);
		var $chk = $obj.find("input[type=button]");
		$chk.click(function() {
			$('input:not(:checked)').parent(".chkbox2").removeClass("on");
			$('input:checked').parent(".chkbox2").addClass("on");
		});
	};

	// DateClick
	jQuery.fn.dateclick = function() {
		var $obj = $(this);
		$obj.click(function() {
			$(this).parent().find("input").focus();
		});
	}

	// 기간 검색 버튼
	function setSearchDate(start) {

		var d = new Date();
		const c = new Date(new Date(new Date().toLocaleDateString()).getTime()
				+ 24 * 60 * 60 * 1000 - 1);

		var startDate = $.datepicker.formatDate('yy-mm-dd', d);
		$('#date2').val(startDate);

		if (start == '1d') {
			d.setDate(d.getDate() - 1)
		} else if (start == '7d') {
			var w = d.getDate();
			d.setDate(w - 7)
		} else if (start == '15d') {
			var w = d.getDate();
			d.setDate(w - 15)
		} else if (start == '1m') {
			var m = d.getMonth();
			d.setMonth(m - 1)
		} else if (start == '3m') {
			var m = d.getMonth();
			d.setMonth(m - 3)
		} else if (start == '6m') {
			var m = d.getMonth();
			d.setMonth(m - 6)
		} else {
			var y = d.getFullYear();
			d.setFullYear(y - 1)
		}

		var endDate = $.datepicker.formatDate('yy-mm-dd', d);
		$('#date1').val(endDate);

		$('#date1').datepicker();
		$('#date1').datepicker("option", "maxDate", $("#date2").val());
		$('#date1').datepicker("option", "onClose", function(selectedDate) {
			$("#date2").datepicker("option", "minDate", selectedDate);
		});

		$('#date2').datepicker();
		$('#date2').datepicker("option", "minDate", $("#date1").val());
		$('#date2').datepicker("option", "onClose", function(selectedDate) {
			$("#date1").datepicker("option", "maxDate", selectedDate);
		});
	}
</script>

</head>
<body>

	<a href="./w_writerHomeFrm">작가홈</a> &nbsp&nbsp&nbsp
	<a href="./w_writerQuestionFrm">작가문의</a> &nbsp&nbsp&nbsp
	<a href="./w_productDeliveryFrm">작가 배송관리 페이지</a> &nbsp&nbsp&nbsp
	<a href="./w_writerManageSeeFrm">작가개인정보출력페이지</a> &nbsp&nbsp&nbsp
	<a href="./w_productCancleFrm">작가 상품 취소 페이지</a>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<aside>
		<jsp:include page="w_writerHomeSide.jsp" />
		<!-- <a href="./w_writerHomeFrm">작가홈</a>
	<a href="./w_writerQuestionFrm">작가문의</a>
	<a href="./w_writerManageFrm">작가개인정보</a> -->
	</aside>

	<section class="whsection">
		<div class="w_boxs">
			<div class="w_box1">
				<h2>판매중인 작품</h2>
				<hr>
				<!-- 저장된 갯수대로 출력하게 하기 -->
				<c:forEach var="pitem" items="${pitemList}">
					<!-- Portfolio Grid Items-->
					<div class="Items">
						<div class="col-lg-4">
							<div class="portfolio-item mx-auto" data-bs-toggle="modal"
								data-bs-target="#portfolioModal1">
								<a class="Items"
									href="./productContentsFrm?bnum=${pitem.p_productnum}">
									${pitem.p_headphoto} </a>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 숫자 -->
			</div>
			<div class="w_box1">
				<jsp:include page="w_writerHomeSide.jsp" />

				<div class="w_box2">
					<h2>전체 구매후기</h2>
					<hr>
					<%-- <c:forEach var="" items="${dd}"> --%>
					<div class="wr_boxxx">
						<hr>
						<%-- 
			<c:forEach var="" items="${dd}"> --%>
						<div class="wr_box1">
							<ul>
								<li class="wr_box1_item">글번호</li>
								<li class="wr_box1_item">작성자</li>
								<li class="wr_box1_item">날짜</li>
							</ul>
							<br>
							<div class="wr_memo">후기 내용</div>
						</div>
					</div>
					<%-- </c:forEach> --%>
					<div class="wr_memo">후기 내용</div>
				</div>
				<%-- </c:forEach> --%>
			</div>
		</div>

		</div>
	</section>

	<footer style="margin-top: 1000px;">
		<jsp:include page="footer.jsp" />
	</footer>
	
	<a href="./w_writerHomeFrm">작가홈</a> &nbsp&nbsp&nbsp
	<a href="./w_writerQuestionFrm">작가문의</a> &nbsp&nbsp&nbsp
	<a href="./w_productDeliveryFrm">작가 배송관리 페이지</a> &nbsp&nbsp&nbsp
	<a href="./w_writerManageSeeFrm">작가개인정보출력페이지</a> &nbsp&nbsp&nbsp
	<a href="./w_productCancleFrm">작가 상품 취소 페이지</a>

	<header>
		<jsp:include page="header.jsp" />
	</header>

	<section></section>

	<footer style="margin-top: 1000px;">
		<jsp:include page="footer.jsp" />
	</footer>


</body>
</html>