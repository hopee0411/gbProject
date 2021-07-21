<!-- 제품상세 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 상세 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="resources/js/jq.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="resources/css/productContents.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
img {
	border: 1px solid;
}
.imgsamll:hover,#likeimg:hover,#chicklikeimg:hover,#productimg:hover,.infopoto:hover{
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}
.button:hover{


	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}
 
.heart{
	border: none!important;
}

.wbtn {
	background-color: pink;
	color: black;
	border: 1px solid black;
}

.wbtn:hover {
	background-color: gray;
}

#selectbasic {
	width: 450px;
	margin-top: 25px;
	margin-bottom: 25px;
}

#singlebutton {
	width: 200px;
	float: left;
}

.col-md-4 {
	width: 500px;
}
.col{
	width: 230px;
	height: 550px;
	margin-right: 50px;
}
#likeimg{
	border: none!important;
}
#chicklikeimg{
	border: none!important;
}
.imgbig:!hover{
	border: none!important;
}

</style>




<!-- 사진 슬라이드 작업 -->
<script type="text/javascript">
$(function(){
	
	$(".sliderimg").bxSlider({
		auto: true,
		slideWidth:400,
	});	
	var mql = window.matchMedia("screen and (max-width: 568px)");
	mql.addListener(function(e){
		if(!e.matches){
			slider.reloadSlider();
		}
	});
});

</script>



</head>
<header>
	<jsp:include page="header.jsp" />
</header>




</head>
<body>
	<!-- Page Content-->
	<c:forEach var="pitme" items="${pList}">
	<!-- 전제 시작 -->
	<div class="all">
		<!-- 탑 라인 정보 시작 -->
		<div class="topallin">
			
			<!-- 제품 사진 출력 시작 -->
			<div class="imagesall">
				
				<section>
					<div class="sliderimg"> 
						<div class="imagesfirst">
							<img class="imgbig" src="resources/images/img13.jpg"
								alt="..."  />
						</div>
						<div class="imagesfirst">
							<img class="imgbig" src="resources/images/img11.jpg"
								alt="..." />
						</div>
					</div>
				</section>


				<div class="imagessecond" style="width: 550px;">
					<img class="imgsamll" src="resources/images/img12.jpg" alt="..."
						style="wmargin-top: 20px;" />
				</div>
			</div>
			<!-- 제품 사진 출력 끝 -->

			<!-- 제품 정보 시작 -->
			<div class="text">
				<h2>${pitme.p_productname}</h2>
				
				<br>
				<button type="button" class="wbtn btn-primary btn-sm">
					굿크리에이터</button>
				<button type="button" class="wbtn btn-primary btn-sm"
					style="margin-left: 40px;">작가홈</button>
				<span class="badge">${pitme.p_views} 명 조회</span>
				<span class="badge"style="margin-right: 20px; width: 250px;">${pitme.p_stamptotal} 명이 좋아합니다</span>

				<!-- 적립금 정보 출력 시작 -->
				<table class="wtable">
					<tr>
						<th style="border: 1px solid;">남은 수량</th>
						<th style="border: 1px solid;">${pitme.p_count}개<h6></h6></th>
					</tr>
					<tr>
						<th style="border: 1px solid;">적립금</th>
						<th style="border: 1px solid;"><h6>${pitme.p_point}P</h6></th>
					</tr>
					<tr>
						<th style="border: 1px solid;">기본 배송료</th>
						<th style="border: 1px solid;"><h6>${pitme.p_deliveryfee}원</h6></th>
					</tr>
				</table>
				<!-- 적립금 정보 출력 끝 -->

				<!-- 옵션 시작 -->
				<c:forEach var="opitem" items="${opList}">
				 <div class="form-group">
					<div class="col-md-4">
						<select id="selectbasic" name="selectbasic" class="form-control">
							<option value="0">옵션 선택</option>
								
								
								<!-- 스위치 문과 같음 -->
								
									<div sid="onclickop" name="onclickop">
										<option value="1">
											${opitem.o_optionname}
											${opitem.o_optionprice} 원
											${opitem.o_optionstock} 개
										</option>
								
									</div>
		
						</select>	
					</div>
					
					
						<div class="optionall" 
							  style="float: left;
							  height: 100px; width: 450px; text-align: left; ">
							<h4 style="margin-top: 10px;">
								옵션명 : &nbsp; &nbsp; ${opitem.o_optionname} 
								
								 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
								  &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;
								<button type="button" onclick="fnCalCount('p',this);"
									style="border-radius: 50%; background-color: white;
										border: none; font-size: 30px;"  >+</button>
									${opitem.o_optionstock}
								<button type="button" onclick="fnCalCount('m', this);"
									style="border-radius: 50%; background-color: white;
										border: none; font-size: 30px;">-</button>
							</h4>
							<h4>

							
								옵션 가격 :	  
								  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
								
								   ${opitem.o_optionprice}  원
								
							</h4>
						</div>
						
					</div> 
					</c:forEach>
		
		
				
				<!-- 옵션 끝 -->

				<!-- 총 금액 출력 시작 -->
				<c:forEach var="opitem" items="${opList}">
				<div class="payallinfo">
					<div class="allpaytext">
						<h3>총 금액:</h3>
					</div>
					<div class="allpay">
						<h3>${pitme.p_price}원</h3>
						<%-- <h3>${pitme.p_price}+${opitem.o_optionprice}원</h3> --%>
					</div>
				</div>
				</c:forEach>
				<!-- 총 금액 출력 끝 -->

				<!-- 결제/장바구니 버튼 시작 -->
				<div class="col-md-4">
					<form  method="post"  action="./kakaopay1">
					<button id="apibtn1" name="apibtn1"
						class="btn btn-primary"
						style="margin-top: 25px; margin-right: 30px;">결제하기</button></form>
						<div id="apibtn">kakaopay</div>
						
					<button id="singlebutton" name="singlebutton"
						class="btn btn-primary" style="margin-top: 25px;">장바구니</button>
				</div>
				<!-- 결제/장바구니 버튼 끝 -->

			</div>
			<!-- 제품 정보 끝 -->

		</div>
		<!-- 탑 라인 정보 끝 -->
		
		<hr style="width: 80%; margin: auto; margin-bottom: 50px;"  >

		<!-- 중간라인  정보 출력 시작 -->
		<div class=" middleallin">

			<!--  -->
			<div class="infotop">
				<div class="minfo" style="margin-right: 25px; margin-left: 20px;">
					<h2 style="text-align: center; margin-top: 12%; text-decoration: none;"><a href="#p1" style=" text-decoration: none;">상세 정보</a></h2>
				</div>

				<div class="pinfo" style="margin-right: 25px;">
					<h2 style="text-align: center; margin-top: 12%;"><a href="#p2" style=" text-decoration: none;">구매 및 배송 정보</a></h2>
				</div>

				<div class="rinfo">
					<h2 style="text-align: center; margin-top: 12%; text-decoration: none;"><a href="#p3"style=" text-decoration: none;">구매 후기</a></h2>
				</div>

			</div>
			<!--  -->

			<!-- 상세 내용 출력 시작 -->
			<div class="infomiddle">
				<div class="infopoto">
					<img src="resources/images/img13.jpg"
						style="width: 500px; height: 500px;" class="poroinfo" />
				</div>
				<div class="infopototext">
					<p id="p1">${pitme.p_seolmyeong}</p>
				</div>
			</div>
			<!-- 상세 내용 출력 끝 -->
			
			<hr style="width: 100%; margin-bottom: 50px; ">
			
			<!-- 구매/후기 시작  -->
			<div class="riewinfo">
				<h3 id="p3" style="text-align: center; margin-right: 300px;">구매/후기</h3>
				<div class="form-group">
					<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
				</div>
				<div class="riewbtn">
					<button type="button" class="btn btn-success">등록</button>
				</div>

			</div>

			<!-- <div class="payimgall">
				<img class="payimg" src=resources/images/ice-cream.png
					style="width: 300px; height: 300px;" />
			</div> -->
				
				<hr style="width: 100%; ">
			
				<h3 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">판매 중인 다른 제품</h3>
				<!-- 한 개의 제품 이미지&정보 출력-->
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				
					<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo" style="border: none!important;">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />

								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> <img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>
						<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />

								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> <img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>
				
						<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />

								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> <img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>
						<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />

								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> <img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->
						</div>
					</div>
			</div>
			<!-- ddddddddddddd -->
				<hr style="width: 100%;  margin-top: 50px;">
				<h3 style="text-align: center; margin-top: 50px;">연관된 제품</h3>
				<!-- 한 개의 제품 이미지&정보 출력-->
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />

								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> 
										<img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>
						<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />

								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> <img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>
						<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />
								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> <img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>
						<div class="col mb-5" id="scroll">
						<div class="card h-100">
							<!-- 제품 사진 -->
							<div class="productimginfo">
								<img id="productimg" class="card-img-top"
									src="resources/images/img13.jpg" alt="..." />

								<!-- 하트 사진 -->
								<div class="heartimg">
									<img id="likeimg" class="images" alt="..."
										src="resources/images/heart.png "
										onmouseover="this.src='resources/images/pinkheart.png'"
										onmouseout="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;"> <img
										id="chicklikeimg" class="images" alt="..."
										src="resources/images/pinkheart.png "
										onmouseout="this.src='resources/images/pinkheart.png'"
										onmouseover="this.src='resources/images/heart.png'"
										style="width: 30px; height: 30px; position: block;">
								</div>
								<!-- 하트 사진 끝 -->
							</div>
							<!-- 제품 사진 끝 -->
							<!-- 제품 정보 -->
							<div class="card-body p-4">
								<div class="text-center">
									<h6 style="text-align: left;">공방이름: ${item.wh_gbname}</h6>
									<h5 style="text-align: left;">제품이름: ${item.p_productname}</h5>
									<h4 style="text-align: left;">가격: ${item.p_price}원</h4>
								</div>
							</div>
							<!-- 제품 정보 끝 -->

							<!--  공방 상세보기 버튼 처리 -->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="./productContents" style="text-align: center;"> 자세히
										보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>		
			</div>
		</div>
		<!-- 구매/후기 끝 -->
		<!-- 중간라인 정보 출력 끝 -->
	</div>
	</c:forEach>
	<!-- 전제 끝 -->

	<!--	
			<div class="col-lg-5">
				<h1 class="font-weight-light">제품 이름</h1>
				<p>This is a template that is great for small businesses. It
					doesn't have too much fancy flare to it, but it makes a great use
					of the standard Bootstrap core components. Feel free to use this
					template for any project you want!</p>
				<a class="btn btn-primary" href="#!">Call to Action!</a>
			</div>
		</div>
		Call to Action
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">This call to action card is a great
					place to showcase some important information or display a clever
					tagline!</p>
			</div>
		</div>
		Content Row
		<div class="row gx-4 gx-lg-5">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Rem magni quas ex numquam, maxime minus quam
							molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="#!">More Info</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Two</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt
							pariatur voluptatem sunt quam eaque, vel, non in id dolore
							voluptates quos eligendi labore.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="#!">More Info</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Card Three</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Rem magni quas ex numquam, maxime minus quam
							molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="#!">More Info</a>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
<!-- <script type="text/javascript">
// 옵션 선택 시 옵션 정보 보여주기(작업 중)
	$(document).ready(function() {
		$(".optionall").hide();// 숨기기

		$("#optionclock").click(function() {
			$(".optionall").show();
		
		});
	});
</script> -->


</html>




































































































































































































































































