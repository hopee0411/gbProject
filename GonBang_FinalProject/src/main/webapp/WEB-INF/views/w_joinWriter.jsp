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
					<input type="text" class="login-input" id="w_id" title="아이디" name="w_id" autofocus placeholder="아이디" required> 
					<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()" required>
					<input type="password" class="login-input" title="비밀번호" name="w_pwd" placeholder="비밀번호" required>
					<input type="text" class="login-input" title="전화번호" name="w_phonenum" placeholder="전화번호" required> 
				<input type="text"
					name="w_email" class="login-input mail_input" title="이메일"
					placeholder="이메일" required> 
				<input
					class="login-input mail_check_input" style="display: none;" disabled="disabled">
					<span id="mail_check_input_box_warn"></span> 
				<input
					type="button" class="idcheck-btn mailChk" value="인증번호전송">
				<input
					type="button" class="idcheck-btn mailNumChk" value="확인" style="display: none;">
					<input type="number" name="w_companynum" class="login-input" title="사업자등록번호" placeholder="사업자등록번호" required>
					
					<font style="vertical-align: inherit;" class="login-input">
						<input type='radio' name='w_gender' value='여성' />여성 
						<input type='radio' name='w_gender' value='남성' />남성
					</font>
					<input type="number" name="w_account" class="login-input" title="계좌번호" placeholder="계좌번호" required> 
					<input type="text" name="w_birth" class="login-input" title="생일" placeholder="생일" required> 
					<input type="text" name="w_addr" class="login-input" title="주소" placeholder="주소" required>					
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
	var id = $("#w_id").val();
	//id값을 입력했는지 확인
	if(id == ""){
		alert("아이디를 입력하세요");
		$("#w_id").focus();
		return;
	}
	var ckObj = {"id":id};
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
				$("#w_id").val("");//입력값 지움
				$("#w_id").focus();//아이디 입력칸에 포커스
			}				
		},//success function() end
		error: function(error) {
			console.log(error);
		}//error function() end
	});
	
}//incheck() end

$(".mailChk").click(function() {
	var email = $(".mail_input").val(); //입력한 이메일
	var checkBox = $(".mail_check_input");
	var mailChk = $(".mailChk");
	var mailNumChk = $(".mailNumChk");
	$.ajax({

		type : "GET",
		url : "mailCheck?email=" + email,

		success : function(data) {
			checkBox.attr("disabled", false);
			checkBox.attr("style", "display: block;");
			mailChk.attr("style", "display: none;");
			mailNumChk.attr("style", "dispaly: block;")
			code = data;
			alert("전송완료");
		},
		error : function(error) {
			console.log(error);
			
		}//error function() end

	});
});

 
/* 인증번호 비교 */
$(".mailNumChk").click(function(){
    
    var inputCode = $(".mail_check_input").val();        // 입력코드    
    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
    
    if(inputCode == code){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");        
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
    }    
    
});
</script>