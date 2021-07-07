<!-- 작가 개인 정보 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 개인 정보 관리</title>
<link href="resources/css/nyj.css" rel="stylesheet">
<link href="resources/css/w_info.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet" />

</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<!-- 왼쪽 사이드 -->
	<jsp:include page="w_writerHomeSide.jsp" />
	<div class="w_main">
		<h2>
			<font style="vertical-align: inherit;"><font
				style="vertical-align: inherit;">작가정보 관리</font></font>
		</h2>
	</div>
	<section class="se" style="padding-top: 70px;">
		<div class="queContent">
			<form class="table-secondary">
				<table class="table table-hover">
					<tbody class="table b">
						<tr class="table-secondary">
							<th scope="row"><font><font>공방이름</font></font></th>
							<td><font><font><input type="text"
										name="w_gona_name"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">아이디</font></font></th>
							<td><font><font><input type="text"
										name="w_gona_name"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">비밀번호</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										name="w_gona_name"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">비밀번호확인</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										name="w_gona_name"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">이메일</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="email"
										name="w_gona_name"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">사업자 등록번호</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										name="w_gona_name"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">성별</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type='radio'
										name='gender' value='female' />여성 <input type='radio'
										name='gender' value='male' />남성 </font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">생년월일</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><select name="birth"> 1부터 10까지
											제곱 구하기
											<p>

												<script language="Javascript">
													for (i = 1; i <= 10; i++) { // 변수 i 의 값이 1부터 시작해서 10보다 크게 될때까지 계속 순환문 작동

														document.write(i + "*"
																+ i + " = " + i
																* i + "<br>")

													}
												</script>




												<option value="2000">2000</option>
												<option value="2001">2001</option>
												<option value="2002">2002</option>
									</select><input type="text" name="w_gona_name"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">주소</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										name="w_gona_name"></font></font></td>
						</tr>
					</tbody>
				</table>
					<div>
				<button type="reset" class="btn btn-primary btn-lg">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">취 소</font></font>
				</button>
				<button type="submit" class="btn btn-primary btn-lg">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작가 정보 수정하기</font></font>
				</button>
			</div>
			</form>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>





