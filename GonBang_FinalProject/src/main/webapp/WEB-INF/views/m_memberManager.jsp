<!-- 회원 정보 관리(정보수정) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리</title>
<link href="resources/css/kjs.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet"/>
<link href="resources/css/myAside.jsp" rel="stylesheet"/>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="MyPageMainTop">
		<aside>
			<jsp:include page="myAside.jsp"/>
		</aside>
		
		<div class="MyPageName">
			<h2>회원 정보 관리</h2>
		</div>
	</div>
	<div class="MyPageMain" style="margin-top: 70px;">
		<div class="row">
			<table class="table table-bordered"
				style="margin-top: 30px; text-align: center; margin-left: -45px;">
				<thead>
					<tr>
						<th>이름</th>
						<th>${memberdto.m_name}</th>
					</tr>
					<tr>
						<th>아이디</th>
						<th>${memberdto.m_id}</th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<th><input type="text" name="m_info_pwd"></th>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<th><input type="text" name="m_info_pwdchk"></th>
					</tr>
					<tr>
						<th>이메일</th>
						<th><input type="text" name="m_info_email"></th>
					</tr>
					<tr>
						<th>성별</th>
						<th><font style="vertical-align: inherit;"><input type='radio'
									name='gender' value='female' />여성 <input type='radio'
									name='gender' value='male' />남성</font></th>
					</tr>
					
					<tr>
						<th>생년월일</th>
						<th>
						 <select name="birth">
						
								<script>
										var num = 0;
									for(i = 1900; i<2021; i++){	
										var arrays = [];
										arrays[num] = i;
										document.write("<option>"+ arrays[num] + "</option>");
										num++;
									}
										</script>
								</select> 
						<select>
								<script>
									var b = [ '1', '2', '4', '5', '6', '7',
											'8', '9', '10', '11', '12' ];
									for (i = 0; i < 11; i++) {
										document.write("<option>" + b[i]
												+ "</option>");
									}
								</script>
						</select> 
						<select name="birth">
							<script>
									var c = [ '1', '2', '4', '5', '6', '7',
											'8', '9', '10', '11', '12', '13',
											'14', '15', '16', '17', '18', '19',
											'20', '21', '22', '23', '24', '25',
											'26', '27', '28', '29', '30', '31' ];
									for (j = 0; j < 30; j++) {
										document.write("<option>"
												+ "&nbsp&nbsp" + c[j]
												+ "&nbsp&nbsp" + "</option>");
									}
								</script>
						</select></th>
					</tr>
				</thead>
				</table>
			<div style= "text-align: center;" >
				<button type="reset" class="btn btn-primary btn-lg">
					<font style="vertical-align: inherit;"></font>
					<font style="vertical-align: inherit;">취 소</font>
				</button>
				<button type="submit" class="btn btn-primary btn-lg">
					<font style="vertical-align: inherit;"></font>
					<font style="vertical-align: inherit;">회원 정보 수정하기</font>
				</button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>