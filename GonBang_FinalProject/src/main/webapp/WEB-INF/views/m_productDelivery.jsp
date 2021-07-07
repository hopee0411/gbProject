<!-- 회원 작품 배송관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송</title>
<link href="resources/css/kjs.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="MyPageMainTop">
		<aside>
			<jsp:include page="myAside.jsp" />
		</aside>
		<div class="MyPageName"><h2>주문/배송 조회</h2></div>
	</div>
	<div class="MyPageMain">
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-107511">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active show" href="#tab1" data-toggle="tab">섹션 1</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab2" data-toggle="tab">섹션 2</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-48688">
						<p>
							나는 섹션 1에 있습니다.
						</p>
					</div>
					<div class="tab-pane" id="tab2">
						<p>
							안녕하세요, 저는 2 부입니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	</div>
</body>
</html>