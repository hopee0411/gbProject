<!-- 작가 회원가입 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 회원 가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/join.css">
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
		<header>
		<jsp:include page="header.jsp" />
	</header>
	<section>
			<div class="content">
				<form name="joinFrm" class="login-form" action="./writerJoinProc"
					method="post">
					<h2 class="login-header">작가 회원 가입</h2>
					<input type="text" class="login-input" id="w_id" title="아이디" name="m_id" autofocus placeholder="아이디" required> 
					<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()" required>
					<input type="password" class="login-input" title="비밀번호" name="w_pwd" placeholder="비밀번호" required>
					<input type="text" class="login-input" title="전화번호" name="w_phonenum" placeholder="전화번호" required> 
					<input type="text" name="w_email" class="login-input" title="이메일" placeholder="이메일" required>
					<input type="number" name="w_companynum" class="login-input" title="사업자등록번호" placeholder="사업자등록번호" required>
					<input type="text" name="m_addr" class="login-input" title="주소" placeholder="주소" required>
					<font style="vertical-align: inherit;" class="login-input">
						<input type='radio' name='m_gender' value='female' />여성 
						<input type='radio' name='m_gender' value='male' />남성
					</font>
					<input type="text" name="m_birth" class="login-input" title="생일" placeholder="생일" required> 					
					<input type="submit" class="login-btn" value="가입">
				</form>
			</div>
		</section>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
<script type="text/javascript">
function idcheck() {
	//입력한 id 값 읽어오기
	var id = $("#m_id").val();
	//id값을 입력했는지 확인
	if(id == ""){
		alert("아이디를 입력하세요");
		$("#m_id").focus();
		return;
	}
	var ckObj = {"m_id":id};
	//ajax를 사용하여 controller로 전송
	$.ajax({
		url: "idCheck",
		type: "get",
		data: ckObj,
		success: function(result){
			//중복된 id가 없으면 "ok", 있다면 "fail"
			if(result == "ok"){
				alert("아이디 사용 가능")
			}
			else {
				alert("사용할 수 없는 아이디");
				$("#m_id").val("");//입력값 지움
				$("#m_id").focus();//아이디 입력칸에 포커스
			}				
		},//success function() end
		error: function(error) {
			console.log(error);
		}//error function() end
	});
	
}//incheck() end	
</script>