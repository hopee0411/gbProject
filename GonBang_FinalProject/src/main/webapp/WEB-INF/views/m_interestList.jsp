<!-- 관심작품 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="resources/css/kjs.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/myAside.jsp" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심작품</title>
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
			<h2>관심작품</h2>
		</div>
	</div>
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>