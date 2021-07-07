<!-- 문의하기(작가) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기(작가)</title>
<link rel="stylesheet" href="resources/css/nyj.css">
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet" />

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script> -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  -->

</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div style="width: 280px; height: 400px;">
		<%-- <jsp:include page="queSide.jsp" /> --%>
		<jsp:include page="w_writerHomeSide.jsp" />
	</div>
	<section class="se" class="p-3 mb-2 bg-secondary text-white">
		<div>
			<h2>
				<font style="vertical-align: inherit;"><font
					style="vertical-align: inherit;">문의하기</font></font>
			</h2>
		</div>
		<div class="queContent">
		1111ddd ddddasd
			<h6>
				<h4>
					<img class="img-fluid" src="resources/images/img36.PNG" alt="프로필사진"
						style="height: 200px;" />
				</h4>
				~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 질문한 내용<br>
				~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				<form>
					<input type="text" name="답글달기">
					<button type="button" class="btn btn-primary">입력</button>
				</form>
				<h4>
					<img class="img-fluid" src="resources/images/img13.jpg" alt="프로필사진"
						style="height: 200px;" />
				</h4>
				~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 질문한 내용<br>
				~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				<form>
					<input type="text" name="답글달기">
					<button type="button" class="btn btn-primary">입력</button>
				</form>
			</h6>
		</div>
	</section>

	<!-- footer 바닥글 -->
	<jsp:include page="footer.jsp" />
</body>
</html>