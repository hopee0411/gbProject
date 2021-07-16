<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="writerHome">
	<img src="resources/images/img13.jpg" alt="프로필 사진" title="${gbNM.whf_gbnum}" class="img-circle">
	<div class="profileInfo">
		<ul>
			<li>${gbNM.whf_gbname}</li> <!-- 공방이름 -->
			<li>${gbNM.whf_memo}</li> <!-- 메모 -->
		</ul>
		<a class="w_suc" href="#">내정보 관리</a>
		<!-- 작가만 보이게 하기 -->
	</div>

	<hr><!-- 중간 선 -->

	<!-- 관심작가 처리 안함 -->
	<button class="likeWriter" onclick="heartclick">
		&hearts; 관심 작가
	</button>
	&nbsp;&#47;&nbsp;
	
	<a class="copylink" onclick="clip(); return false;">&curren; 공유</a>
	
	<hr><!-- 중간 선 -->

	<table border="1" class="tbMenu"">
		<tr>
			<th colspan="2"><span>&lt;메뉴&gt;</span></th>
		</tr>
		<tr>
			<td><a href="./w_writerHomeFrm">홈</a></td>
			<td><a href="./handmadeItdFrm?wh_gbnum=${gbNM.whf_gbnum}">공방소개</a></td>
		</tr>
		<tr>
			<td><a href="./productSaleFrm?wh_gbnum=${gbNM.whf_gbnum}">판매작품</a></td>
			<td><a href="./w_writerReviewFrm?wh_gbnum=${gbNM.whf_gbnum}">구매후기</a></td>
		</tr>
	</table>
	<a href="./w_wrtierQuestionFrm" class="w_suc">문의하기</a><br>


	<div class="orderManagement" class="w_suc">
	<hr><!-- 중간 선 -->
		<ul>
			<span>&lt;주문 관리&gt;</span>
			<li><a href="#">배송 관리</a></li>
			<li><a href="#">취소/교환/반품/환불</a></li>
			<li><a href="#">상품 등록/수정</a></li>
		</ul>
	</div>
</div>


<script type="text/javascript">
//공유버튼 처리
function clip(){
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.");
}

//확실하지 않음
function heartclick(session) {  
	
	var idnum = "${session}";
	idnum = 1;
	if(idnum == 1){ //이거 왜 안돼잉
		//관심작가 등록 하기
		alert("관심작가 등록이 완료되었습니다.");
	}
	else {
		alert("로그인 후 관심작가 등록이 가능합니다.");
		location.href="./loginFrm";
	}
}
</script>
