<!-- 공방 소개 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 홈 - 공방소개</title>
<link href="resources/css/styles.css" rel="stylesheet"/>
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet"/>
<link href="resources/css/handmadeItd.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	var chk = "${msg}";
	
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
	
/* 	//세션에 id가 없으면 첫(home)페이지로 강제 이동
	var lid = "${id}";
	if(lid == "" || lid == null){
		location.href = "./";
	} */
});
</script>
</head>
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
		<h2>공방 소개</h2>
		<hr>
		<aside class="b_img">
			<img src="resources/images/img13.jpgs">
			<%--<img src="resources/update/gbi.gbi_savefilename" 
				 title="${gbi.gbi_orgfilename}" >--%>
		</aside>
		<div class="tt">
			<div class="b_title tt">${gbi.gbi_title}</div>
			<div class="b_contents tt">${gbi.gbi_contents}</div>
		</div> 
	</div>
</div>
<br>
<%-- <input class="hi_hiuf" type="button" value="공방소개 등록/수정"  href="./handmadeItdInUpFrm" readonly> --%>
<a class="hi_hiuf" href="./handmadeItdInUpFrm?gbi_gbnum=${gbNM.whf_gbnum}">공방소개 등록/수정</a>
</section>

<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>