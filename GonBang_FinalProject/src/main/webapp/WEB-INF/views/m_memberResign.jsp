<!-- 회원 탈퇴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 탈퇴</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/kjs.css" rel="stylesheet" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="MyPageMainTop">
		<aside>
			<jsp:include page="myAside.jsp" />
		</aside>
		<div class="MyPageName">
			<h2>회원탈퇴</h2>
		</div>
	</div>
		<div>
		<div class="m_memberShip">
		<div class="row">
		<h5 style="text-align: center; margin-top: 40px;">안녕하세요? <span style="color: blue;">${memberdto.m_name}회원님</span> <br> 그 동안 소소한 진심을 이용해주셔서 정말 감사합니다.
		<br>앞으로 좀 더 나은 모습으로 회원님을 찾아 뵙겠습니다. 아래의 유의사항들을 확인하여
		<br>주시고 회원탈퇴를 진행해주세요.</h5>
			<table class="table table-bordered" 
				style="margin-top: 25px; text-align: center; margin-left: 20px; width: 90%; height: 150px;">
				<thead>
					<tr>
						<td style="padding-bottom:60px;">나의 적립금 ${saving_pointdto.pt_point} P</td>
						<td style="padding-bottom:60px;">나의 쿠폰 ${coupondto.c_couponhistory} 장</td>
					</tr>
				</thead>
			</table>
			<div style="margin-left: 30px;">
			<h5 style="margin-top: 30px;">쿠폰사용</h5>
			<h6>- 탈퇴 후에는 회원혜택을 이용하실 수 없습니다.
			<br>- 회원탈퇴를 하시면 현재까지 적립된 적립금,쿠폰이 모두 삭제됩니다.
			<br>- 회원 탈퇴 후에는 지금까지 주문하신 내역 등의 확인이 불가능 합니다.</h6>
			</div>
			<hr style="width: 80%; margin-left: 20px; margin-top: 20px;">
			<h5 style="text-align: center;">비밀번호 확인 <input type="text" name="m_pwd"></h5>
			<div style="text-align: center;">
			<button type="dropSubmit" class="btn btn-primary btn-lg" style="margin-top: 30px; width: 20%;">
				<font style="vertical-align: inherit;"></font> 
				<font style="vertical-align: inherit;">회원 탈퇴</font>
			</button>
			</div>
		</div>
	</div>
	</div>
<footer style="margin-top: 250px;">
	<jsp:include page="footer.jsp" />
</footer>
</body>
</html>