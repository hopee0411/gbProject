<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글쓰기</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var identy = "${mb.m_name}";
	$("#mname").html(identy + "님");
	$(".suc").css("display", "block");
	$(".bef").css("display", "none");
	
	//컨트롤러에서 전달하는 메시지 출력.
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
});
</script>
</head>
<body>
<div class="wrap">
	<header>
	<jsp:include page="﻿header.jsp"/>
	</header>
	
	<section>
	<div class="content">
		<form action="./WriteProc" class="write-form"
			method="post" enctype="multipart/form-data">
			<div class="user-info">
				<div class="user-info-sub">
					<p class="grade">등급 [${mb.g_name}]</p>
					<p class="point">POINT [${mb.m_point}]</p>
				</div>
			</div>
			<h2 class="login-header">글쓰기</h2>
			<input type="hidden" name="bid" value="${mb.m_id}">
			<input type="text" class="write-input"
				name="btitle" autofocus placeholder="제목"
				required>
			<textarea rows="15" name="bcontents"
				placeholder="내용을 적어주세요..."
				class="write-input ta"></textarea>
			<div class="filebox">
				<label for="file">업로드</label>
				<input type="file" name="files" id="file" multiple>
				<input class="upload-name" value="파일선택"
					readonly>
				<!-- 업로드할 파일이 있으면 1, 없으면 0
					자바스크립트로 value값을 변경 -->
				<input type="hidden" id="filecheck" value="0"
					name="fileCheck">
			</div>
			<div class="btn-area">
				<input class="btn-write" type="submit" value="W">
				<input class="btn-write" type="reset" value="R">
				<input class="btn-write" type="button" value="B"
					onclick="location.href='./list?pageNum=${pageNum}'">
			</div>
		</form>
	</div>
	</section>
	
	<footer>
	<jsp:include page="footer.jsp"/>
	</footer>
	
</div>
</body>
<script type="text/javascript">
//파일 업로드 용 자바스크립트
//업로드 버튼 클릭하여 파일 선택창이 뜨면, 업로드할 파일을 선택하게 되는데
//이 때 선택한 파일이름을 class가 'upload-file'인 input 태그에 출력.
//fileCheck의 value를 0 -> 1로 바꿈.
//fileCheck는 서비스에서 값을 확인하여 1일 경우 파일 업로드 처리 과정을 수행하고, 
//0일 경우 업로드 과정을 처리하지 않도록 분기하는데 사용하는 값.
$("#file").on("change", function(){
	//파일창으로 선택한 파일 목록 가져오기
	//파일이 객체처럼 들어감(여러개 가능) 
	var files = $("#file")[0].files;
	console.log(files);
	
	var fileName = "";
	
	/*
	//모든 파일명 출력
	for(var i = 0; i < files.length; i++) {
		fileName += files[i].name + " ";
	}  
	*/
	
	//파일명 + 외 몇개 로 출력
	if(files.length != 0) {
		fileName += files[0].name + " 외 " + (files.length - 1) + "개";
	}
	 
	if(files.length == 1) {
		fileName += files[0].name;
	}
	 
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