<!-- 작가홈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<section>
	<div class="w_boxs">
		<div class="w_box2">
			<h2>판매중인 작품</h2>
			<hr>
		</div>
		<div class="w_box1">
			<jsp:include page="w_writerHomeSide.jsp" />
			
			
		</div>
	</div>
</section>

<footer style="margin-top: 1000px;">
	<jsp:include page="footer.jsp" />
</footer>

</body>
</html>