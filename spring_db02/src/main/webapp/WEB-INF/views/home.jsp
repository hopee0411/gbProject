<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
$(function(){
	var chk = "${msg}";
	
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
	/* 슬라이더용 */
	$('.slider').bxSlider({
		auto: true,
		slideWidth: 600,
	});
	
	/* 화면 사이즈(폰화면)가 변경되면 가로길이 변경됨(bx슬라이더) */
	var mql = window.matchMedia("screen and (max-width: 768px)");
	mql.addListener(function(e){
		if(!e.matches){
			slider.reloadSlider();
		}
	});
});

</script>
</head>
<body>
<div class="wrap">
<header>
	<div class="top-bar">
		<div class="content">
			<h2 class="top-left">그냥 만든 홈</h2>
			<nav class="top-right">
				<ul>
					<li><a href="./loginFrm">Login</a></li>
					<li><a href="./joinFrm">Join</a></li>
				</ul>
			</nav>
		</div>
	</div>
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
	<div class="footer-bar">
		<div class="content">
			<div class="fcontents">
				<span class="footer-txt">&copy; JIP 2020</span>
			</div>
		</div>
	</div>
</footer>
</div>
</body>
</html>
