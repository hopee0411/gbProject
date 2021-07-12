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
		<div class="MyPageName">
			<h2>주문/배송 내역</h2>
		</div>
	</div>
	<div class="MyPageMain">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable" id="tabs-107511" style="">
						<ul class="nav nav-tabs" style="margin-top: 40px;">
							<li class="nav-item" style="margin-left: -50px;"><a
								class="nav-link active show" href="#tab1"><h4
										style="padding-right: 50px; padding-left: 50px;">주문/배송조회</h4></a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-48688">


								<div class="bxSearch" >
									<table class="table" >
										<thead >
											<tr>
												<th>
													<form name="search" method="get">
														<fieldset>
															<label for="" >기간별 조회</label>
															<button type="button" id="term1" class="btnM btnWhite06"
																onclick="orderDateSet_sel('1|month',this)">1개월</button>
															<button type="button" id="term3" class="btnM btnWhite06"
																onclick="orderDateSet_sel('3|month',this)">3개월</button>
															<button type="button" id="term6" class="btnM btnWhite06"
																onclick="orderDateSet_sel('6|month',this)">6개월</button>
															<button type="button" id="term12" class="btnM btnWhite06"
																onclick="orderDateSet_sel('12|month',this)">12개월</button>

															<div class="inputItem mgl30">
																<label for="">일자별 조회</label> <input type="text"
																	id="sdate" name="sdate" title="조회 시작일 입력" value=""
																	class="calendar">
															</div>
															<span class="bar">~</span>
															<div class="inputItem">
																<input type="text" id="edate" name="edate"
																	title="조회 마지막일 입력" value="" class="calendar">
															</div>
															<button class="btnM btnGray01">조회</button>
														</fieldset>
													</form>
								</div>


								</th>
								</tr>
								</thead>
								</table>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>