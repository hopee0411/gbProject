<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
$(function() {
	var chk = "${msg}";
	if(chk != "") {
		alert(chk);
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
		<form name="joinFrm" class="login-form" action="./memInsert"
				method="post" onsubmit="return check()">
			<h2 class="login-header">회원 가입</h2>
			<input type="text" class="login-input" id="mid" title="아이디"
				name="m_id" autofocus placeholder="아이디">
				
			<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()">
			
			<input type="password" class="login-input" title="비밀번호"
				name="m_pwd" placeholder="비밀번호">
			<input type="text" name="m_name" class="login-input" title="이름"
				placeholder="이름">
			<input type="text" name="m_birth" class="login-input" title="생일"
				placeholder="생일">
			<input type="text" name="m_addr" class="login-input" title="주소"
				placeholder="주소">
			<input type="text" name="m_phone" class="login-input" title="연락처"
				placeholder="연락처">
			<input type="submit" class="login-btn" value="가입">	
		</form>
	</div>	
	</section>
	<footer>
	<jsp:include page="footer.jsp"/>
	</footer>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
//formdml onsubmit의 이름과 같아야함 
function check() {

	//form 태그의 내용을 전부 가져오기
	var frm = document.joinFrm;
	console.log(frm);
	
	//submit 버튼을 제외한 나머지 input태그의 개수
	var length = frm.length - 1;
	
	//input 태그 중에서 value가 ""인 요소 확인(입력안된 요소)
	for(var i = 0; i < length; i++){
		if(frm[i].value == "" || frm[i].value == null) {
			alert(frm[i].title + " 입력!");
			//입력 안된 input 태그에 포커스를 줌.
			frm[i].focus();
			
			//하나라도 입력이 안되면 전달이 안되게 막음
			//action 부분이 실행되지 않음.
			return false; 
		}
	}
	
	//모든 input 태그에 입력이 다 되었을 경우. -> contrller로 전송.
	//action 부분이 실행됨.
	return true;
}

//아이디 중복 여부 확인 함구
//ajax를 사용하여 확인 결과 경고창에 띄움.
function idcheck() {
	//입력한 id 값 읽어오기
	var id = $("#mid").val();
	//id값을 입력했는지 확인
	if(id == ""){
		alert("아이디를 입력하세요.");
		$("#mid").focus();
		return;
	}
	
	var ckObj = {"mid":id};
	
	//ajax를 사용하여 controller로 전송
	$.ajax({
		url: "idCheck",
		type:"get",
		data:ckObj,
		success: function(result) {
			//중복된 id가 없으면 "ok", 있다면 "fail"전송 : 둘다 성공 케이스. 전송이 실패된게 아님
			if(result == "ok") {
				alert("아이디 사용 가능");
			}
			else {
				alert("사용할 수 없는 아이디");
				$("#mid").val(""); //입력값 지움
				$("#mid").focus(); //아이디 입력칸에 포커스
			}
		},
		error: function(error) {
			console.log(error);
		}
	});
}
</script>
</html>