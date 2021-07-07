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
			<form class="table-secondary" action="">
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
									style="vertical-align: inherit;"> <input type="text"
										name="birth">
										<!-- 안되서 지워둠 <select name="birth">
										<script>
									for(i = 1900; i<2021; i++){										
										var arrays = [i];
										document.write("<option>"+ arrays[i] + "</option>");
									}
										</script>
								</select> -->
								<select>
											<script>
						var b=['1','2','4','5','6','7','8','9','10','11','12'];
						 for(i=0;i<11;i++){
						 	document.write("<option>"+b[i]+"</option>");
						} 
						</script>
									</select> 
									<select name="birth">
											<script>
						var c=['1','2','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21'
								,'22','23','24','25','26','27','28','29','30','31'];
						 for(j=0;j<30;j++){							 
							 document.write("<option>" + "&nbsp&nbsp" + c[j] + "&nbsp&nbsp" + "</option>");
						 }
						 </script>
									</select>
								</font></font></td>
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





