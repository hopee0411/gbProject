<!-- 구매후기(작가) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 홈 - 구매후기</title>
<link href="resources/css/styles.css" rel="stylesheet"/>
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet"/>
<link href="resources/css/w_writerReview.css" rel="stylesheet"/>
</head>
<body>
<header>
	<jsp:include page="header.jsp"/>
</header>

<aside>
	<jsp:include page="w_writerHomeSide.jsp" />
</aside>

<section class="wr_whsection">
	<div class="wr_boxs">
		<div class="wr_box1">
		<h2>전체 후기</h2>
		<hr>
	<%-- <c:forEach var="" items="${dd}"> --%>
			<div class="wr_boxxx">
	<h2>전체 후기</h2>
	<hr>
		<%-- <c:forEach var="" items="${dd}"> --%>
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
</section>

<footer>
	<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>