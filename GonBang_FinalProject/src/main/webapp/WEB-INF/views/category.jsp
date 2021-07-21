<!-- 카테고리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link href="resources/css/category.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />


</head>
<!-- 헤더 출력 -->
<header>
	<jsp:include page="header.jsp" />
</header>
<body>

	<!-- 옵션 창 출력 -->
	<form action="./optionchoseFrm" method="get" class="optionallinfo">
		<div class="optionall">
			<p>
			<h1>상세 검색</h1>
			</p>
			<div>	
			<div class="optioninfo">

				<!-- 연령/성별 시작 -->

				<div class="ageall">
					<div class="agenameinfo">
						<label class="agename" for="age">연령</label>
					</div>

					<div class="ageinfo" style="width: 200px;">

						<div class="form-checking" style="float: left;">
							<label class="toggle"> <input type="radio" name="toggle"
								checked> <span class="label-text">전체</span>
							</label>
						</div>
						<div class="form-check" style="float: left;">
							<label class="toggle"> <input type="radio" name="toggle">
								<span class="label-text">10대</span>
							</label>
						</div>
						<div class="form-check" style="float: left;">
							<label class="toggle"> <input type="radio" name="toggle">
								<span class="label-text">20대</span>
							</label>
						</div>
						<div class="form-check" style="float: left;">
							<label class="toggle"> <input type="radio" name="toggle">
								<span class="label-text">30대</span>
							</label>
						</div>
					</div>

					<div class="coupleinfo">
						<label class="couplename" for="couple">성별</label>
					</div>

					<div class="coupleinfo">
						<div class="form-checking" style="float: left;">
							<label class="toggle"> <input type="radio" name="toggle1"
								checked> <span class="label-text">전체</span>
							</label>
						</div>
						<div class="form-checking" style="float: left;">
							<label class="toggle"> <input type="radio" name="toggle1">
								<span class="label-text">남자</span>
							</label>
						</div>
						<div class="form-checking" style="float: left;">
							<label class="toggle"> <input type="radio" name="toggle1">
								<span class="label-text">여자</span>
							</label>
						</div>
					</div>

				</div>
			</div>

			<!-- 연령/성별 끝 -->

			<!-- 가격대 시작 -->
			<div class="payall">
				<label class="payname control-label" for="pay">가격대</label>
				<div class="payinfo">
					<input class="payseach" type="search" placeholder="가격"> ~ <input
						class="payseach" type="search" placeholder="가격">
				</div>
			</div>

			<!-- 가격대 끝 -->

			<!--  검색/초기화 버튼 시작  -->
			<div class="btnall">
				<div class="btninfo">
					<!-- <form action="./searchFrm"> -->
					<button id="seachbtn" name="seachbtn" class="btn btn-success">검색</button>
					<!-- </form> -->

					<a href="./category"><button id="removebtn"
							name="removebtn" class="btn btn-inverse"
							style="background-color: pink;" value="초기화">초기화</button></a>

				</div>
			</div>
			</div>

			<!-- 검색/초기화 버튼 끝 -->
		</div>
	</form>

	<!-- 옵션 창 끝 -->

	<!-- 카테고리 별 전체 제품 이미지&정보 출력 -->
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<!-- 한 개의 제품 이미지&정보 출력-->
				<c:forEach var="item" items="${cList}">
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
										href="./productContents?cate=${item.p_productnum}"
										style="text-align: center;"> 자세히보기</a>
								</div>
							</div>
							<!-- 공방 상세보기 버튼 끝 -->

						</div>
					</div>
				</c:forEach>
				<!-- 한 개의 제품 이미지&정보 출력 -->




				<!-- 

				===========================수정 중 임================================
				한 개의 제품 이미지&정보 출력
				<div class="col mb-5" id="scroll">
					<div class="card h-100">


						제품 사진
						<div class="productimginfo">
							<img id="productimg" class="card-img-top"
								src="resources/images/img13.jpg" alt="..." />


							하트 사진

							<img id="likeimg" class="images" alt="..."
								src="resources/images/heart.png "
								onmouseover="this.src='resources/images/pinkheart.png'"
								onmouseout="this.src='resources/images/heart.png'"
								style="width: 30px; height: 30px; position: block;">
							하트 사진 끝

						</div>
						제품 사진 끝


						제품 정보
						<div class="card-body p-4">
							<div class="text-center">
								<h6 style="text-align: left;">작가 이름</h6>
								<h5 style="text-align: left;">제품 이름</h5>
								<h4 style="text-align: left;">가격</h4>
							</div>
						</div>
						제품 정보 끝

						 공방 상세보기 버튼 처리
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="./productContents"
									style="text-align: center;"> 자세히 보기</a>
							</div>
						</div>
						공방 상세보기 버튼 끝

					</div>
				</div>
				한 개의 제품 이미지&정보 출력


				한 개의 제품 이미지&정보 출력
				<div class="col mb-5" id="scroll">
					<div class="card h-100">
						하트 사진
						<div class="heartimg">
							<img class="images" alt="..." src="resources/images/heart.png "
								style="width: 30px; height: 30px;">
						</div>
						하트 사진 끝

						제품 사진
						<img class="card-img-top" src="resources/images/ice-cream.png"
							alt="..." />
						제품 사진 끝

						제품 정보
						<div class="card-body p-4">
							<div class="text-center">
								<h6 style="text-align: left;">작가 이름</h6>
								<h5 style="text-align: left;">제품 이름</h5>
								<h4 style="text-align: left;">가격</h4>
							</div>
						</div>
						제품 정보 끝

						 공방 상세보기 버튼 처리
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="./productContents"
									style="text-align: center;"> 자세히 보기</a>
							</div>
						</div>
						공방 상세보기 버튼 끝

					</div>
				</div>
				한 개의 제품 이미지&정보 출력


				한 개의 제품 이미지&정보 출력
				<div class="col mb-5" id="scroll">
					<div class="card h-100">
						하트 사진
						<div class="heartimg">
							<img class="images" alt="..." src="resources/images/heart.png "
								style="width: 30px; height: 30px;">
						</div>
						하트 사진 끝

						제품 사진
						<img class="card-img-top" src="resources/images/ice-cream.png"
							alt="..." />
						제품 사진 끝

						제품 정보
						<div class="card-body p-4">
							<div class="text-center">
								<h6 style="text-align: left;">작가 이름</h6>
								<h5 style="text-align: left;">제품 이름</h5>
								<h4 style="text-align: left;">가격</h4>
							</div>
						</div>
						제품 정보 끝

						 공방 상세보기 버튼 처리
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="./productContents"
									style="text-align: center;"> 자세히 보기</a>
							</div>
						</div>
						공방 상세보기 버튼 끝

					</div>
				</div>
				한 개의 제품 이미지&정보 출력


				한 개의 제품 이미지&정보 출력
				<div class="col mb-5" id="scroll">
					<div class="card h-100">
						하트 사진
						<div class="heartimg">
							<img class="images" alt="..." src="resources/images/heart.png "
								style="width: 30px; height: 30px;">
						</div>
						하트 사진 끝

						제품 사진
						<img class="card-img-top" src="resources/images/ice-cream.png"
							alt="..." />
						제품 사진 끝

						제품 정보
						<div class="card-body p-4">
							<div class="text-center">
								<h6 style="text-align: left;">작가 이름</h6>
								<h5 style="text-align: left;">제품 이름</h5>
								<h4 style="text-align: left;">가격</h4>
							</div>
						</div>
						제품 정보 끝

						 공방 상세보기 버튼 처리
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="./productContents"
									style="text-align: center;"> 자세히 보기</a>
							</div>
						</div>
						공방 상세보기 버튼 끝

					</div>
				</div>
				한 개의 제품 이미지&정보 출력


				한 개의 제품 이미지&정보 출력
				<div class="col mb-5" id="scroll">
					<div class="card h-100">
						하트 사진
						<div class="heartimg">
							<img class="images" alt="..." src="resources/images/heart.png "
								style="width: 30px; height: 30px;">
						</div>
						하트 사진 끝

						제품 사진
						<img class="card-img-top" src="resources/images/ice-cream.png"
							alt="..." />
						제품 사진 끝

						제품 정보
						<div class="card-body p-4">
							<div class="text-center">
								<h6 style="text-align: left;">작가 이름</h6>
								<h5 style="text-align: left;">제품 이름</h5>
								<h4 style="text-align: left;">가격</h4>
							</div>
						</div>
						제품 정보 끝

						 공방 상세보기 버튼 처리
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="./productContents"
									style="text-align: center;"> 자세히 보기</a>
							</div>
						</div>
						공방 상세보기 버튼 끝

					</div>
				</div>
				한 개의 제품 이미지&정보 출력


				한 개의 제품 이미지&정보 출력
				<div class="col mb-5" id="scroll">
					<div class="card h-100">
						하트 사진
						<div class="heartimg">
							<img class="images" alt="..." src="resources/images/heart.png "
								style="width: 30px; height: 30px;">
						</div>
						하트 사진 끝

						제품 사진
						<img class="card-img-top" src="resources/images/ice-cream.png"
							alt="..." />
						제품 사진 끝

						제품 정보
						<div class="card-body p-4">
							<div class="text-center">
								<h6 style="text-align: left;">작가 이름</h6>
								<h5 style="text-align: left;">제품 이름</h5>
								<h4 style="text-align: left;">가격</h4>
							</div>
						</div>
						제품 정보 끝

						 공방 상세보기 버튼 처리
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="./productContents"
									style="text-align: center;"> 자세히 보기</a>
							</div>
						</div>
						공방 상세보기 버튼 끝

					</div>
				</div>
				한 개의 제품 이미지&정보 출력


				한 개의 제품 이미지&정보 출력
				<div class="col mb-5" id="scroll">
					<div class="card h-100">
						하트 사진
						<div class="heartimg">
							<img class="images" alt="..." src="resources/images/heart.png "
								style="width: 30px; height: 30px;">
						</div>
						하트 사진 끝

						제품 사진
						<img class="card-img-top" src="resources/images/ice-cream.png"
							alt="..." />
						제품 사진 끝

						제품 정보
						<div class="card-body p-4">
							<div class="text-center">
								<h6 style="text-align: left;">작가 이름</h6>
								<h5 style="text-align: left;">제품 이름</h5>
								<h4 style="text-align: left;">가격</h4>
							</div>
						</div>
						제품 정보 끝

						 공방 상세보기 버튼 처리
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="./productContents"
									style="text-align: center;"> 자세히 보기</a>
							</div>
						</div>
						공방 상세보기 버튼 끝

					</div>
				</div>
				한 개의 제품 이미지&정보 출력 -->

			</div>
		</div>
	</section>
	<!-- 카테고리 별 전체 제품 이미지&정보 출력 -->


	<!-- 푸터 출력 -->
	<jsp:include page="footer.jsp" />

</body>


<script type="text/javascript">
	/*----------------- 찜 버튼처리 작업 ---------------*/

	/*----------------- 찜 버튼처리 작업 끝---------------*/

	/*----------------- 무한 스크롤 작업 ---------------*/

	/*----------------- 무한 스크롤 작업 끝---------------*/

	
	/* 옵션 선텍시 해당 정보 출력 */

	
	
	</script>
</html>