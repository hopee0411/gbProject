<!-- 판매작품 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 홈 - 판매작품</title>
<link href="resources/css/styles.css" rel="stylesheet"/>
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet"/>
<link href="resources/css/productSale.css" rel="stylesheet"/>
</head>
<script type="text/javascript">
$(function() {
	//작가면 보이게 함
	if(num == 0){
		$(".suc").css("display", "block"); //보이게
	}
	
	//컨트롤러에서 전달하는 메시지 출력.
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
});
</script>
<body>
<header>
	<jsp:include page="header.jsp"/>
</header>

<aside>
	<jsp:include page="w_writerHomeSide.jsp" />
</aside>

<section class="whsection">
	<div class="w_boxs">
		<div class="w_box1">
			<h2>판매중인 작품</h2>
			<hr>
			<c:forEach var="pitem" items="${pList}">
				<!-- Portfolio Grid Items-->
				<div class="row justify-content" style="margin-top: 50px;">
					<!-- Portfolio Item 1-->
					<div class="product col-lg-4 mb-5">
						<div class="portfolio-item mx-auto" data-bs-toggle="modal"
							data-bs-target="#portfolioModal1">
							<div
								class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<div class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
							<img class="img-fluid" src="resources/images/img36.PNG" alt="..."
								style="height: 200px;" />
						</div>
					</div>
				</div>
			</c:forEach>
		<a class="hi_hiuf <!-- w_src -->" href="./productInUpFrm?wh_gbnum=${gbNM.whf_gbnum}">판매작품 등록/수정</a>
		</div>
	</div>
</section>

<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>