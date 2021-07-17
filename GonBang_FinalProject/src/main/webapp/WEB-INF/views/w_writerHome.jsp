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
<link href="resources/css/styles.css" rel="stylesheet"/>
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet"/>
<link href="resources/css/w_writerHome.css" rel="stylesheet"/>
</head>
<body>
<a href="./w_writerHomeFrm">작가홈</a>
&nbsp&nbsp&nbsp
<a href="./w_writerQuestionFrm">작가문의</a>
&nbsp&nbsp&nbsp
<a href="./w_productDeliveryFrm">작가 배송관리 페이지</a>
&nbsp&nbsp&nbsp
<a href="./w_writerManageSeeFrm">작가개인정보출력페이지</a>
&nbsp&nbsp&nbsp
<a href="./w_productCancleFrm">작가 상품 취소 페이지</a>
<header>
	<jsp:include page="header.jsp"/>
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
						<a class="Items" href="./productContentsFrm?bnum=${pitem.p_productnum}">
							${pitem.p_headphoto}
						</a>
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
			<hr><%-- 
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

</body>
</html>