<!-- 공방 소개 등록/수정(작가) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 홈 - 공방소개 수정</title>
<link href="resources/css/styles.css" rel="stylesheet"/>
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet"/>
<link href="resources/css/handmadeItdInUP.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	/* 
	var identy = "${mb.m_name}";
	$("#mname").html(identy + "님");
	$(".suc").css("display", "block");
	$(".bef").css("display", "none"); 
	*/
	
	//컨트롤러에서 전달하는 메시지 출력.
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
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
		<br>
		<form class="w_box" action="./handmadeItdInUpProc" method="post">
			<aside class="b_img">
				<input type="hidden" name="bid" value="${mb.m_id}">
				<input type="file" name="wfiles" id="file" value="${gbi.gbi_orgfilename}"><br> 
				<input class="upload-name" value="파일이 없습니다." value="${gbi.gbi_savefilename}" readonly>
				<!-- 업로드할 파일이 있으면 1, 없으면 0 자바스크립트로 value값을 변경 -->
				<input type="hidden" id="filecheck" value="0" name="fileCheck">
			</aside>
			<div class="ssss">
				<div class="b_title">
					<input type="text" name="wtitle" autofocus placeholder="제목"
						required value="${gbi.gbi_title}">
				</div>
				<div class="b_contents">
					<textarea rows="4" cols="130" name="wcontents"
						placeholder="내용을 적어주세요." class="write-input">${gbi.gbi_contents}</textarea>
				</div>
				<!-- 업로드할 파일이 있으면 1, 없으면 0
				자바스크립트로 value값을 변경 -->
				<input type="hidden" id="filecheck" value="0" name="fileCheck">
			</div>
		<!-- 
	<br>
	<hr>
	<div class="w_box">
		<aside  class="b_img">
				<input type="file" name="files" id="file"><br>
				<input class="upload-name" value="파일이 없습니다.">
				업로드할 파일이 있으면 1, 없으면 0
					자바스크립트로 value값을 변경
				<input type="hidden" id="filecheck" value="0"
					name="fileCheck">
		</aside>
		<div class="ssss">
			<div class="b_title">
				<input type="text" name="btitle" autofocus placeholder="제목"
					required>
			</div>
			<div class="b_contents">
				<textarea rows="4" cols="130" name="bcontents" placeholder="내용을 적어주세요."
					class="write-input"></textarea>
			</div>
		</div>
	</div>
	<br>
	<hr>
	<div class="w_box">
		<aside  class="b_img">
				<input type="file" name="files" id="file"><br>
				<input class="upload-name" value="파일이 없습니다.">
				업로드할 파일이 있으면 1, 없으면 0
					자바스크립트로 value값을 변경
				<input type="hidden" id="filecheck" value="0"
					name="fileCheck">
		</aside>
		<div class="ssss">
			<div class="b_title">
				<input type="text" name="btitle" autofocus placeholder="제목"
					required>
			</div>
			<div class="b_contents">
				<textarea rows="4" cols="130" name="bcontents" placeholder="내용을 적어주세요."
					class="write-input"></textarea>
			</div>
		</div>
	</div>
	 -->
		<input class="hi_hiuf" type="submit" value="완료">
	</form>
</div>
</section>

<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>
<script type="text/javascript">
//선택한 파일 출력
$("#file").on("change", function(){
	var files = $("#file").files;
	console.log(files);

	var fileName = "";
	
	fileName = files.name + " ";
	console.log(fileName);
	
	$(".upload-name").val(fileName);
	
	//fileCheck의 value 변경(파일 선택 시 : 0 -> 1, 파일 취소 시 : 1 -> 0)
	if(fileName == "") {
		//파일 선택 취소한 경우(대소문자 주의)
		$("#filecheck").val(0);
		$(".upload-name").val("파일선택");
	}
	else {
		console.log("not empty");
		//파일을 선택한 경우
		$("#filecheck").val(1);
	}
	
});
</script>
</html>

















