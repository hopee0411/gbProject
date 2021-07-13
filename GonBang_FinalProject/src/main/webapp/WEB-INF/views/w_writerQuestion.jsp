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

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() { $( "#Date" ).datepicker({ }); 
});

</script>

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
				style="vertical-align: inherit;">작가정보 관리</font></font>
				<input type="text" id="Date">
		</h2>

	</div>
	<section class="se" style="padding-top: 70px;">
		<div class="queContent">
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