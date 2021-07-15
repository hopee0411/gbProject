<!-- 장바구니 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>장바구니</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/m_sBasket.css" />
<script type="text/javascript" src="./10-11.js"></script>
<style type="text/css">
header {
	margin-bottom: 50px;
}

.basketdiv {
	height: auto;
	
}

.row {
	height: 93px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<form name="orderform" id="orderform" method="post" class="orderform"
		action="/Page" onsubmit="return false;">

		<input type="hidden" name="cmd" value="order">
		<div class="basketdiv" id="basket">
			<div class="row head">
				<div class="subdiv">
					<div class="check">선택</div>
					<div class="img">이미지</div>
					<div class="pname">상품명</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">가격</div>
					<div class="num">수량</div>
					<div class="sum">합계</div>
				</div>
				<div class="subdiv">

					<div class="basketcmd">삭제</div>
				</div>
				<div class="split"></div>
			</div>
			<c:if test="${empty basketlist}">
				<h3>장바구니에 담긴 상품이 없습니다.</h3>
			</c:if>
			<c:if test="${!empty basketlist}">
			<c:forEach var="bitem" items="${basketlist}">
				<div class="row data">
					<div class="subdiv">
						<div class="check">
							<input type="checkbox" name="buy" value="260" checked=""
								onclick="javascript:basket.checkItem();">&nbsp;
						</div>
						<div class="img">
							<img src="resources/images/flowers.png" width="60" height="60">
						</div>
						<div class="pname">
							<span>${bitem.sb_optionname}</span>
						</div>
					</div>
					<div class="subdiv">
						<div class="basketprice">
							<input type="hidden" name="p_price" id="p_price1" class="p_price"
								value="${bitem.sb_optionprice}">${bitem.sb_optionprice}원
						</div>
						<div class="num">
							<div class="updown">
								<input type="text" name="p_num1" id="p_num1" size="2"
									maxlength="4" class="p_num" value="${bitem.sb_count}"
									onkeyup="javascript:basket.changePNum(1);"> 
							</div>
						</div>
						<div class="sum">${bitem.sb_totalprice}원</div>
					</div>
					<div class="subdiv">
						<div class="basketcmd">
							<a href="javascript:void(0)" class="abutton"
								onclick="javascript:basket.delItem();">삭제</a>
						</div>
					</div>
				</div>
				</c:forEach>
			</c:if>

			<div class="row data">
				<div class="subdiv">
					<div class="check">
						<input type="checkbox" name="buy" value="261" checked=""
							onclick="javascript:basket.checkItem();">&nbsp;
					</div>
					<div class="img">
						<img src="resources/images/img13.jpg" width="60" height="60">
					</div>
					<div class="pname">
						<span>노바 요거팜(JP-268T)</span>
					</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">
						<input type="hidden" name="p_price" id="p_price2" class="p_price"
							value="19000">19,000원
					</div>
					<div class="num">
						<div class="updown">
							<input type="text" name="p_num2" id="p_num2" size="2"
								maxlength="4" class="p_num" value="1"
								onkeyup="javascript:basket.changePNum(2);"> <span
								onclick="javascript:basket.changePNum(2);"><i
								class="fas fa-arrow-alt-circle-up up"></i></span> <span
								onclick="javascript:basket.changePNum(2);"><i
								class="fas fa-arrow-alt-circle-down down"></i></span>
						</div>
					</div>
					<div class="sum">19,000원</div>
				</div>
				<div class="subdiv">
					<div class="basketcmd">
						<a href="javascript:void(0)" class="abutton"
							onclick="javascript:basket.delItem();">삭제</a>
					</div>
				</div>
			</div>


			<div class="row data">
				<div class="subdiv">
					<div class="check">
						<input type="checkbox" name="buy" value="262" checked=""
							onclick="javascript:basket.checkItem();">&nbsp;
					</div>
					<div class="img">
						<img src="resources/images/img36.PNG" width="60" height="60">
					</div>
					<div class="pname">
						<span>아날도 바시니 보스톤 가방 20인치 (ab-380)</span>
					</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">
						<input type="hidden" name="p_price" id="p_price3" class="p_price"
							value="15200">15,200원
					</div>
					<div class="num">
						<div class="updown">
							<input type="text" name="p_num3" id="p_num3" size="2"
								maxlength="4" class="p_num" value="1"
								onkeyup="javascript:basket.changePNum(3);"> <span
								onclick="javascript:basket.changePNum(3);"><i
								class="fas fa-arrow-alt-circle-up up"></i></span> <span
								onclick="javascript:basket.changePNum(3);"><i
								class="fas fa-arrow-alt-circle-down down"></i></span>
						</div>
					</div>
					<div class="sum">15,200원</div>
				</div>
				<div class="subdiv">
					<div class="basketcmd">
						<a href="javascript:void(0)" class="abutton"
							onclick="javascript:basket.delItem();">삭제</a>
					</div>
				</div>
			</div>

		</div>

		<div class="right-align basketrowcmd">
			<a href="javascript:void(0)" class="abutton"
				onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> <a
				href="javascript:void(0)" class="abutton"
				onclick="javascript:basket.delAllItem();">장바구니비우기</a>
		</div>

		<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:
			4개</div>
		<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액:
			74,200원</div>

		<div id="goorder" class="">
			<div class="clear"></div>
			<div class="buttongroup center-align cmd">
				<a href="javascript:void(0);">선택한 상품 주문</a>
			</div>
		</div>
	</form>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
<script type="text/javascript">
	let basket = {
		totalCount : 0,
		totalPrice : 0,
		//체크한 장바구니 상품 비우기
		delCheckedItem : function() {
			document.querySelectorAll("input[name=buy]:checked")
					.forEach(
							function(item) {
								item.parentElement.parentElement.parentElement
										.remove();
							});
			//AJAX 서버 업데이트 전송

			//전송 처리 결과가 성공이면
			this.reCalc();
			this.updateUI();
		},
		//장바구니 전체 비우기
		delAllItem : function() {
			document.querySelectorAll('.row.data').forEach(function(item) {
				item.remove();
			});
			//AJAX 서버 업데이트 전송

			//전송 처리 결과가 성공이면
			this.totalCount = 0;
			this.totalPrice = 0;
			this.reCalc();
			this.updateUI();
		},
		//재계산
		reCalc : function() {
			this.totalCount = 0;
			this.totalPrice = 0;
			document
					.querySelectorAll(".p_num")
					.forEach(
							function(item) {
								if (item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true) {
									var count = parseInt(item
											.getAttribute('value'));
									this.totalCount += count;
									var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
											.getAttribute('value');
									this.totalPrice += count * price;
								}
							}, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
		},
		//화면 업데이트
		updateUI : function() {
			document.querySelector('#sum_p_num').textContent = '상품갯수: '
					+ this.totalCount.formatNumber() + '개';
			document.querySelector('#sum_p_price').textContent = '합계금액: '
					+ this.totalPrice.formatNumber() + '원';
		},
/* 		//개별 수량 변경
		changePNum : function(pos) {
			var item = document.querySelector('input[name=p_num' + pos + ']');
			var p_num = parseInt(item.getAttribute('value'));
			var newval = event.target.classList.contains('up') ? p_num + 1
					: event.target.classList.contains('down') ? p_num - 1
							: event.target.value;

			if (parseInt(newval) < 1 || parseInt(newval) > 99) {
				return false;
			}

			item.setAttribute('value', newval);
			item.value = newval;

			var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
					.getAttribute('value');
			item.parentElement.parentElement.nextElementSibling.textContent = (newval * price)
					.formatNumber()
					+ "원";
			//AJAX 업데이트 전송

			//전송 처리 결과가 성공이면    
			this.reCalc();
			this.updateUI();
		},
		checkItem : function() {
			this.reCalc();
			this.updateUI();
		},
		delItem : function() {
			event.target.parentElement.parentElement.parentElement.remove();
			this.reCalc();
			this.updateUI();
		}
	} */
/* 
	// 숫자 3자리 콤마찍기
	Number.prototype.formatNumber = function() {
		if (this == 0)
			return 0;
		let regex = /(^[+-]?\d+)(\d{3})/;
		let nstr = (this + '');
		while (regex.test(nstr))
			nstr = nstr.replace(regex, '$1' + ',' + '$2');
		return nstr;
	}; */
</script>
</html>