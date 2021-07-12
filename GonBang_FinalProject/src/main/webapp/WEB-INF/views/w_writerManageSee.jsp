<!-- 작가 개인 정보 출력 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 개인 정보 출력 페이지</title>
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

			<form class="table-secondary" method="post"
				action="w_AtPrivateInfoFix">
				<table class="table table-hover">
					<tbody class="table b">
						<tr class="table-secondary">
							<th scope="row"><font><font>공방이름</font></font></th>
							<td><font><font><input type="text" value="${w_infodto.wh_gbname}"
							name ="wh_gbname"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">아이디</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										style="background-color: silver;" value="${w_infodto.w_id}"
										name ="w_id"
										readonly="readonly"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">비밀번호</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										value="" name ="w_pwd"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">전화번호</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										value="${w_infodto.w_phonenum}" name="w_phonenum"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">이메일</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="email"
										value="${w_infodto.w_email}" name ="w_email"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">사업자 등록번호</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										value="${w_infodto.w_companynum}" name ="w_companynum"></font></font></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">성별</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										value="${w_infodto.w_gender}" name ="w_gender"></font></font></td>
										
						</tr>
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">생년월일</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										value="${w_infodto.w_birth}" name ="w_birth"></font></font></td>
										
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">주소</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										value="${w_infodto.w_addr}" name ="w_addr"></font></font></td>
										
						<tr class="table-secondary">
							<th scope="row"><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">계좌</font></font></th>
							<td><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"><input type="text"
										value="${w_infodto.w_account}" name ="w_account"></font></font></td>
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





