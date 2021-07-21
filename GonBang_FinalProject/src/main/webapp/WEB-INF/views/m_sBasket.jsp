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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resource/js/jquery.serializeObject.js"></script>

<link href="resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/m_sBasket.css" />

</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="all">
	<center>
	
	<table id="mytable">
		<thead>
			<tr>
				<th style="width: 100px;"><h4>선택</h4><input allSelect-checkbox type="checkbox"  id="chk_list" name="chk_list" value="전체선택"><span class="allSelect-text">전체선택</span></th>
				<th style="width: 150px;"><h4>이미지</h4></th>
				<th style="width: 500px;"><h4>상품명</h4></th>
				<th><h4>가격</h4></th>
				<th><h4>수량</h4></th>
				<th><h4>합계</h4></th>
				<th><h4>삭제</h4></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bitem" items="${basketlist}">
				<c:if test="${empty basketlist}">
					<h3>장바구니에 담긴 상품이 없습니다.</h3>
				</c:if>
				<c:if test="${!empty basketlist}">
				
				<tr>
					<input type="hidden" id="basketnum" value="${bitem.sb_basketnum}">
					<td><input type="checkbox" class="checkB" id="chk" name="chk"></td>
					<td><img src="resources/images/flowers.png" class="imgs"></td>
					<td class="optionName">${bitem.sb_optionname}</td>
					<td >
						<%-- <input type="hidden" name="p_price" id="p_price1" class="p_price"
							value="${bitem.sb_optionprice}"> --%>${bitem.sb_optionprice} 원
					</td>
					<td id="totalNum">
						<%-- <input type="text" name="p_num1" id="p_num1" size="2"
							maxlength="4" class="p_nums" value="${bitem.sb_count}"
							onkeyup="javascript:basket.changePNum(1);"> --%>${bitem.sb_count} 개
					</td>
					<td class="totalP" id="totalP">${bitem.sb_totalprice} 원</td>
					<td>
						<%-- <a class="deleteBtn" href="./basketRowDelete/deleteNum?sb_basketnum="${bitem.sb_basketnum}" onclick="deleteL(this)">삭제</a> --%>
						<button class="deleteBtn" id="btn_delete" onclick="deleteL(this)">삭제</button>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="dddd">
		<button class="deleteBtn" onclick="reeeeee()">선택상품 삭제</button> 
		<button class="deleteBtn" id="delAllItem" > <!-- onclick="javascript:basket.delAllItem();" -->장바구니 비우기</button> 
	</div>
	
	<div class="tf">
		<button class="sumCount" id="sum_p_num" onclick="pSum()">상품수 보기</button>
		<button class="sumCount" id="sum_p_price" onclick="calSum()">합계 보기</button>
	</div>
	
	<button class="deleteBtn order">선택한 상품 주문</button>
	
</center></div><br><br><br><br>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
<script type="text/javascript">
function calSum() {
	  //합계구하기
	  var sum = 0;
	  
	  $('#mytable #totalP').each(function() {
		 sum += parseInt(this.innerText); 
	  });
	  //input일 경우 innerHTML대신 value로 넣기
	  document.getElementById('sum_p_price').innerHTML = ("합계 : " + sum);
	  
}
</script>
<script type="text/javascript">
function pSum() {
	  //상품 수
	  var sum = 0;
	  
	  //수량
	  var numP = $("#totalNum").val();
	  
	  $('#mytable #chk').each(function() {
		 sum += 1; 
	  });
	  
	  //input일 경우 innerHTML대신 value로 넣기
	  document.getElementById('sum_p_num').innerHTML = ("상품수 : " + sum + "전체 수량 : " + num);
}
</script>


<script type="text/javascript">
//삭제 버튼
function deleteL(obj){
	var tr = $(obj).parent().parent();
	tr.remove();
}
	
/* 
$(document).on('click', '#btn_delete', function() {
	const basketnum = $("#basketnum").val();
	
	if(confirm("정말 삭제하시겠습니까 ?")) {
		var tr = $(obj).parent().parent();
		tr.remove();
		
		$.ajax({
			url : "basketRowDelete",
			type : "POST",
			cache: false,
			data : {
				basketnum : $()
			},
			success : function(res){
				alert('삭제 완료');
				location.href='./m_sBasketFrm';
			}
		})
	}
});
*/

/* $(document).on("click", ".btn_delete", function() {
	console.log("delete : ");
	
	var $ele = $(this).parent().parent();
	var deleNum =$(#basketnum).val();
	
	if(confirm("정말 삭제하시겠습니까 ?")) {
		console.log("1");
		$.ajax({
			url:"basketRowDelete",
			type: "POST",
			cache: false, 
			data: deleNum,
			success: function(result) {
				var tr = $(obj).parent().parent();
				tr.remove();
				
				console.log("success : " + tr);
				
				$("#mytable").html(result);
			},
			error: function(error){
				console.log(error);
			}
		});
	}
}); */


/* function deleteL(obj) {
	console.log("delete : " + obj);
	
	if(confirm("정말 삭제하시겠습니까 ?")) {
		console.log("1");
		$.ajax({
			url:"basketRowDelete",
			type: "POST",
			/* cache: false, */
			/*data: obj,
			success: function(result) {
				var tr = $(obj).parent().parent();
				tr.remove();
				
				console.log("success : " + tr);
				
				$("#mytable").html(result);
			},
			error: function(error){
				console.log(error);
			}
		});
	}
}  */

</script>


<script type="text/javascript">
function reeeeee(){
	//선택행 삭제	
 	/*var $obj = $("input[type=checkbox][name='chk']");
	var checkCount = $obj.size();
	console.log(obj);
	console.log(checkCount); 
	
	for (var i=0; i<obj(); i++){
		if($obj.eq(i).is(":checked")){
			$obj.eq(i).parent().parent().remove();
		}
	}
	 
	document.querySelectorAll("input[name='chk']:checked").function (item) {

        item.parentElement.parentElement.parentElement.remove();

    };  */
}

</script>

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