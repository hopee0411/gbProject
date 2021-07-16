<!-- 문의내역 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="resources/css/kjs.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/myAside.jsp" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
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
			<h2>문의내역</h2>
		</div>
			</div>
	<div class="MyPageMain">
		<div class="row">
			<table class="table table-bordered"
				style="margin-top: 30px; text-align: center; margin-left: -45px; width: 100%;">
				<thead>
					<tr>
						<th>상품이름</th>
						<th>질문한 내용</th>
						<th>답변 내용</th>
						<th>상태</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>