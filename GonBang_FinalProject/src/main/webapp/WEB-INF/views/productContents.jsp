<!-- 제품상세 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 상세 보기</title>
<link href="resources/css/productContents.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
img {
	border: 1px solid;
}

.wbtn {
	background-color: pink;
	color: black;
	border: 1px solid black;
}

.wbtn:hover {
	background-color: gray;
}
</style>
</head>
<header>
	<jsp:include page="header.jsp" />
</header>
</head>
<body>
	<!-- Page Content-->
	<div class="all">
		<div class="topallin">
			<!-- Heading Row-->
			<!-- <div class="row gx-4 gx-lg-5 align-items-center my-5 "> -->
			<div class="imagesall">
				<div class="imagesfirst">
					<img class="imgbig" src="resources/images/ice-cream.png" alt="..."
						style="width: 400px; height: 400px;" />
				</div>
				<div class="imagessecond">
					<img class="imgsamll" src="resources/images/flowers.png" alt="..."
						style="width: 45px; height: 45px; margin-top: 20px;" />
				</div>
			</div>
			<div class="text">
				<p>
				<h2>제품 이름</h2>
				</p>
				<br>
				<button type="button" class="wbtn btn-primary btn-sm">
						굿크리에이터</button>
				<button type="button" class="wbtn btn-primary btn-sm"
					style="margin-left: 40px;">작가홈</button>
				<span class="badge bg-primary">...명</span>

			</div>
		</div>
	</div>


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
</html>































