<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/styles.css" rel="stylesheet"/>
<link href="resources/css/w_writerHomeSide.css" rel="stylesheet"/>
<link href="resources/css/productInUp.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(msg){
	/* 
	var identy = "${mb.m_name}";
	$("#mname").html(identy + "님");
	$(".suc").css("display", "block");
	$(".bef").css("display", "none"); 
	*/
	
	//컨트롤러에서 전달하는 메시지 출력.
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
});
</script>
</head>
<body>
<header>
	<jsp:include page="header.jsp"/>
</header>

<aside>
	<jsp:include page="w_writerHomeSide.jsp" />
</aside>


<section class="whsection">
	<div class="w_boxs">
		<h2>판매 작품 등록/수정</h2>
		<hr>
		<form name="form" method="post" action="./productSaleFrm?wh_gbnum=${gbNM.whf_gbnum}">
			<div class="w_box1">
				<!-- 목록 출력  -->
				<label for="product">등록한 제품 수정</label> 
				<select id="product" name="product">
					<option value='' selected>-- 선택 --</option>
					<c:forEach items="${product.list}" var="product">
						<option value="${product.val}"
							${product.val == product2.val ? 'selected="selected"' : '' }>${product.name}</option>
					</c:forEach>
				</select>
				<div>
					제품 이름 &nbsp;<input class="newPName pa" type="text" name="pName"
						id="pName" <%-- value="${#}" --%> placeholder="제품 이름" required><br>
					메인 사진 &nbsp;<input class="potosize pa" type="file"
						name="mainPotos" id="mainPotos" multiple><br>
						<div class="mainPotos"></div>
					전체 수량 &nbsp;<input type="text" name="pNum" placeholder="숫자(ex.10)"
						id="pNum" required>개<br> 상세 정보 &nbsp;
					<textarea rows="" cols="20" placeholder="내용을 적어주세요."
						class="w-input pa" name="pContents" required></textarea><br> 
					상세 사진 &nbsp;<input class="psize" type="file"
						name="pPotos" id="pPotos" multiple><br>
				</div>
				카테고리 &nbsp; <select id="category" name="category">
					<option value='' selected>-- 선택 --</option>
					<option value="액세서리" id="accessory">액세서리</option>
					<option value="리빙" id="living">리빙</option>
					<option value="식품/디저트" id="food">식품/디저트</option>
					<option value="꽃" id="flower">꽃</option>
					<option value="문구/팬시" id="Fancy">문구/팬시</option>
				</select><br> 
					<span class="optionMemu">작품 옵션 &nbsp; </span> 
					<input class="newProduct " type="button" onclick="addInput()" value="추가" id="addInputs">
					<input class="newProduct inOption option_suc" type="button" onclick="addInItems()" value="추가" id="addItmes"> 
					<input class="newProduct delOption option_suc" type="button" onclick="deleteInItem()" value="삭제" id="deleteItme"> <br>
					<table class="optionTable" id="optionItems">
						<tr class="option_suc" id="options">
							<th> 옵션 이름 / 수량</th>
						</tr>
						<tr class="option_suc" id="options">
							<td><input type="text" placeholder="옵션 이름"></td>
							<td><input type="text" style="width: 100px;" placeholder="숫자(ex.10)">개</td>
						</tr>
					</table><br>

					배송료 <input type="text" placeholder="숫자(ex.10)" required>원<br> 
					가격 <input type="text" placeholder="숫자(ex.10)" required>개<br>
					<div class="chooseList">추천<br>
						<input type="checkbox" name="choose" value="10대" id="age1"><label for="age1">10대</label>
						<input type="checkbox" name="choose" value="20대" id="age2"><label for="age2">20대</label>
						<input type="checkbox" name="choose" value="30대" id="age3"><label for="age3">30대</label>
						<input type="checkbox" name="choose" value="40~50대" id="age45"><label for="age45">40~50대</label>
						<input type="checkbox" name="choose" value="60대 이상" id="age6"><label for="age6">60대 이상</label>
						<input type="checkbox" name="choose" value="영유아" id="age0"><label for="age0">영유아</label>
						<input type="checkbox" name="choose" value="커플" id="couple"><label for="couple">커플</label>
						<input type="checkbox" name="choose" value="남자" id="m"><label for="m">남자</label>
						<input type="checkbox" name="choose" value="여자" id="w"><label for="w">여자</label>
					</div>
			</div>
				<input type="reset" value="새로 등록" class="hi_hiuf" style="right: 24%;">
				<!-- <a class="hi_hiuf" href="./productSaleFrm?wh_gbnum=${gbNM.whf_gbnum}" onclick="cancle()" style="right: 150px;">취소</a> -->
				<input type="reset" value="취소" class="hi_hiuf" onclick="cancle()" style="right: 21%;">
				<input type="submit" value="저장" class="hi_hiuf">
				
		</form>
		<button onclick="oneTest()">Test</button>
		<p id="demo"></p>
		<br>
	</div>
</section>

<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>

<script type="text/javascript">
function oneTest() {
	var x = document.getElementById("form");
	//var x = document.forms[0];
	
	//form에 해당하는 값을 배열형식으로 가져오기
	var text="";
	var i;
	for(i = 0; i < x.length; i++) {
		//x안의 value값을 뽑아내서 text에 저장
		text += x.elements[i].value + "<br>";
	}
	document.getElementById("#demo").innerHTML = text;
}

</script>

<!-- <script type="text/javascript">
//저장버튼 클릭

</script> -->

<script type="text/javascript">
//취소버튼 클릭
function cancle(url) {
	
	//a태그로 할 경우 - 취소 눌러도 지정 url로 넘어갔음...
	/* var answer = confirm("정말 취소하시겠습니까?");
	
	if(answer == true) {
		location = url;
	}
	else { //취소
		return false;
	} */
	
	//input태그로 한거
	if(confirm("정말 취소하시겠습니까?") == true) {
		//document.cancle.submit();
	     //history.go(-1);//첫번째 방법 
	     location = "./productSaleFrm?wh_gbnum=${gbNM.whf_gbnum}";  
	     
	}
	else { //취소
		return false;
	} 
}
</script>


<script type="text/javascript">
 //옵션 추가 버튼 클릭 시 
function addInput() {
	if( $("#options").css("display") == "none") { //테이블이 안보이는 상태면
		$("#options").css("display", "block"); //보이게 함
		console.log("option_suc - block"); //콘솔 출력
		
		const btnElement = document.getElementById('addInputs'); //id를 통해 출력버튼의 값들 저장
		btnElement.value = "숨기기"; //저장한 값들 중 value값 변경
		$("#optionItems").css("display", "block");  //테이블 보이게 함
		$("#addItmes").css("display", "block");  //테이블 보이게 함
		$("#deleteItme").css("display", "block");  //테이블 보이게 함
	}
	else if ($("#options").css("display") == "block") { //테이블 보이는 상태면
		$("#options").css("display", "none"); //안보이게 함
		const btnElement = document.getElementById('addInputs');//id를 통해 출력버튼의 값들 저장
		btnElement.value = "추가"; //저장한 값들 중 value값 변경
		console.log("option_suc - none");
		//추가로 한 옵션도 안보이게 함
		$("#optionItems").css("display", "none"); //테이블 숨김
	}
}
</script>

<script type="text/javascript">
 //행 추가 버튼 클릭 시
function addInItems() {
	//Javascript로 추가
	//텍스트 or input으로 추가
	//table Element 찾음
	const table = document.getElementById('optionItems');
	
	//새 행 추가
	const newRow = table.insertRow(table.rows.length);
	
	//새 행에 cell 추가
	const newCell1 = newRow.insertCell(0);
	const newCell2 = newRow.insertCell(1);
	
	/*
	//텍스트로 추가
	newCell1.innerText = '1';
	newCell2.innerText = '2';
	
	
	//Cell에 input으로 추가
	newCell1.innerHTML = "<td><input type='text' placeholder='옵션 이름'></td>";
	newCell2.innerHTML = "<td><input type='text' style='width: 100px;' placeholder='숫자(10)'>개</td>";
	*/
	
	//Jquery로 추가
	//$("#테이블id").append(html코드);
	$("#optionItems").append(
			"<tr class='optionsss'>" +
			" <td><input type='text' placeholder='옵션 이름'></td>"
			+ "<td><input type='text' style='width: 100px;' placeholder='숫자(10)'>개</td>"
			+ "</tr>"
		);

	
}
</script> 

<script type="text/javascript">
//삭제 버튼 클릭
function deleteInItem() {
	
	//Javascript로 삭제
	//table element 찾기
	const table = document.getElementById('optionItems');
	
	if(table.rows.length < 3) return; //2번째 이후에 추가된것부터 삭제
	table.deleteRow(table.rows.length-1); //맨 아래 행 삭제
	//상단부터 삭제 : table.deleteRow(0)
	
	/*
	//Jquery로 삭제
	if($("#optionItems tr").length<3) return;
	//$("#optionItems tr:last").remove();
	*/
}
</script>


<!-- <script type="text/javascript">
//취소버튼 클릭
function cancel() {
	console.log("cancel"); //콘솔 출력
	if (window.confirm('취소하시겠습니까?'))
	{
		$("#inForm")[0].reset();
	 	document.form.submit();
	    // They clicked Yes
	}
	else
	{
	    // They clicked no
		return false;
	}
}
</script> -->
<!--
<script type="text/javascript">
//목록 출력
 
 $(function(){
	$('#newProduct').click(function(p) {
		$('#product').val('');
	});
}); 

//목록중 하나 클릭시 해당되는 정보 출력
function getproduct(form){
	//목록의 이름 저장
	var indata = ${product.val}.val;
	
	//data라는 이름으로 indata를 보냄
	var objdata = {"data":indata};
	
	//ajax사용
	$.ajax({
		url:"",
		type:"get"
		data: objdata,
		success: function(result) {
			$("#").html(result);
		},
		error: function() {
			console.log(error);
		}
	});
}

//새로 등록 버튼 클릭 시 초기화
function newPInfo(newProduct) {
	
}*/
</script> 
<script type="text/javascript">
//메인 이미지 출력
function readMultipleImage(input) {
	
	const multipleContainer = document.getelementById("mainPotos");
}


</script>

<script type="text/javascript">
//메인 이미지 다중 등록
function name() {
	var sel_file = [];
	
	$(document).ready(function() {
		$("#potos").on("change", handleImgsFilesSelect);
	});
	
	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지만 가능합니다.");
				return;
			}
			
			sel_file.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = "<img src=\"" + e.target.result + "\" />";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
}
</script>
 -->

</html>