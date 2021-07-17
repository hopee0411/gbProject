<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Web & App 게시판 홈</title>
<!-- 반응형 웹을 만들 때는 다음 문장(1줄)이 필요함. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
$(function() {
	var chk = "${msg}";
	if(chk != "") {
		alert(chk);
	}
	
	//bxSloder 설정용 스크립트
	$('.slider').bxSlider({
		auto: true,
		slideWidth: 600,
	});
	
	var mql = window.matchMedid("screen and (max-width: 768px)")
	mql.addListener(function(e){
		if(!e.matches) {
			slider.reloadSlider();
		}
	});
});

</script>
</head>
<body>
<div class="wrap">
	<header>
		<jsp:include page="﻿header.jsp"/>
	</header>
	<section>
	<div class="content-home">
		<div class="slider">
			<div><img src="resources/images/Chrysanthemum.jpg"></div>
			<div><img src="resources/images/Desert.jpg"></div>
			<div><img src="resources/images/Lighthouse.jpg"></div>
			<div><img src="resources/images/Tulips.jpg"></div>
		</div>
	</div>	
	</section>
	<footer>
	<jsp:include page="footer.jsp"/>
	</footer>
</div>
</body>
</html>