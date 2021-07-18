<!-- 일반 회원가입 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
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
			<form name="joinFrm" class="login-form" action="./memberJoinProc"
				method="post" onsubmit="return check()">
				<h2 class="login-header">회원 가입</h2>
				<input type="text" class="login-input" id="m_id" title="아이디"
					name="m_id" autofocus placeholder="아이디" required> 
				<input
					type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()"
					required> 
				<input type="password" class="login-input passCheck1"
					title="비밀번호" name="m_pwd" minlength="6" placeholder="비밀번호" required> 
				<input type="password" class="login-input passCheck2"
					title="비밀번호 확인" minlength="6" placeholder="비밀번호 확인" required> 
					<span class="pass_check_warn"></span>
					<input
					type="button" class="idcheck-btn passNumChk" value="비밀번호 확인"> 
				<input
					type="text" name="m_name" class="login-input" title="이름"
					placeholder="이름" required> 
				<input type="text"
					name="m_email" class="login-input mail_input" title="이메일"
					placeholder="이메일" required> 
				<input
					class="login-input mail_check_input" style="display: none;" disabled="disabled">
					<span id="mail_check_input_box_warn"></span> 
				<input
					type="button" class="idcheck-btn mailChk" value="인증번호전송">
				<input
					type="button" class="idcheck-btn mailNumChk" value="확인" style="display: none;">  
				<input
					type="text" name="m_addr" class="login-input" title="주소"
					placeholder="주소" required> <font
					style="vertical-align: inherit;" class="login-input"> 
				<input
					type='radio' name='m_gender' value='여성' />여성 <input
					type='radio' name='m_gender' value='남성' />남성
				</font> <input type="text" name="m_birth" class="login-input" title="생일"
					placeholder="생일" required> <input type="submit"
					class="login-btn" value="가입">
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
		if (id == "") {
			alert("아이디를 입력하세요");
			$("#m_id").focus();
			return;
		}
		var ckObj = {
			"id" : id
		};
		//ajax를 사용하여 controller로 전송
		$.ajax({
			url : "idCheck",
			type : "get",
			data : ckObj,
			success : function(result) {
				//중복된 id가 없으면 "ok", 있다면 "fail"
				if (result == "ok") {
					alert("아이디 사용 가능");
				} else {
					alert("사용할 수 없는 아이디");
					$("#m_id").val("");//입력값 지움
					$("#m_id").focus();//아이디 입력칸에 포커스
				}
			},//success function() end
			error : function(error) {
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
	        checkResult.html("인증번호가 일치하지 않습니다.");
	        checkResult.attr("class", "incorrect");
	    }    
	    
	});
	
	// 비밀번호 확인
	$(".passNumChk").click(function(){
		var passCheck1 = $(".passCheck1").val(); 
		var passCheck2 = $(".passCheck2").val(); 
		var passCheckResult = $(".pass_check_warn");
		
		if(passCheck1 != passCheck2){
			if(passCheck2 != ""){
				passCheckResult.html("비밀번호가 일치하지 않습니다.");
				passCheckResult.attr("class", "incorrect");
				alert("불일치");
				$(".passCheck2").val("");
				$(".passCheck2").focus();
			}
		}	
		else{
			alert("일치");
			passCheckResult.html("비밀번호가 일치합니다.");
			passCheckResult.attr("class", "correct");
		}
			
	});
	
	
	
	/* 이메일 인증, 비밀번호 확인 실패시 처리 */
	function check() { 
		var checkResult = $("#mail_check_input_box_warn");  
		var passCheckResult = $("#pass_check_warn");
		if(passCheckResult != "비밀번호가 일치하지 않습니다."){
			alert("비밀번호를 확인해주세요");
			$(".passCheck2").val("");
			$(".passCheck2").focus();
			return false;			
		}
		if(checkResult.html() == "인증번호가 일치합니다."){
			return true;
		}
		else{
			alert("인증번호를 확인해주세요");
			$(".mail_check_input").val("");
			$(".mail_check_input").focus();
			return false;
		}
	}//checck end
	
</script>
</html>