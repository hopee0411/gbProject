<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="writerHome">
	<img src="resources/images/img13.jpg" alt="프로필 사진" class="img-circle">
	<div class="profileInfo">
		<ul>
			<li class="bef1">공방 이름</li>
			<li class="bef1">메모</li>
		</ul>
		<a class="suc1" href="#">내정보 관리</a>
		<!-- 작가만 보이게 하기 -->
	</div>

	<hr>
	<!-- 중간 선 -->

	<button class="bef1">&hearts; 관심 작가</button>
	&nbsp;&#47;&nbsp;
	<button class="bef1">&curren; 공유</button>

	<hr>
	<!-- 중간 선 -->

	<table border="1" class="tbMenu">
		<tr>
			<th colspan="2"><h6>&lt;메뉴&gt;</h6></th>
		</tr>
		<tr>
			<td><a href="./w_writerHome">홈</a></td>
			<td><a href="./handmadeItd.jsp">공방소개</a></td>
		</tr>
		<tr>
			<td><a href="./productSale.jsp">판매작품</a></td>
			<td><a href="./w_writerReview.jsp">구매후기</a></td>
		</tr>
	</table>
	<a href="./w_wrtierQuestion.jsp">문의하기</a><br>

	<hr>
	<!-- 중간 선 -->

	<div class="orderManagement">
		<ul>
			<h6>&lt;주문 관리&gt;</h6>
			<li><a href="#">배송 관리</a></li>
			<li><a href="#">취소/교환/반품/환불</a></li>
			<li><a href="#">상품 등록/수정</a></li>
		</ul>
	</div>
</div>