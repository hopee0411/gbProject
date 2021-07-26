<!-- 머릿글 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//게시글 작성 성공(저장) 메시지 출력(alert)
	var chk = "${msg}";
	if(chk != ""){
		alert(chk);
	}
	var chId = "${id}";
	if(chId !=""){
		$(".suc").css("display", "block");
		$(".bef").css("display", "none");
	}
	
});
</script>
<body id="page-top">
	<!-- Navigation-->
	<div class="header">
		<div class="header_top">
			<nav
				class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
				id="mainNav">
				<div class="container">
					<a class="navbar-brand" href="./">HAND MADE</a>

					<button
						class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
						type="button" data-bs-toggle="collapse"
						data-bs-target="#navbarResponsive"
						aria-controls="navbarResponsive" aria-expanded="false"
						aria-label="Toggle navigation">
						Menu <i class="fas fa-bars"></i>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ms-auto" id="header_ul">
							<li><input type="text" placeholder="검색">
								<img alt="검색버튼" src="resources/images/serch.png"
								class="py-3 selectImg" onclick="#"></li>
							<!-- href="#portfolio"로 하면 페이지 내에서 이동함(카테고리로 이동함) -->
							<li class="nav-item mx-0 mx-lg-1 suc"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="./logoutProc">로그아웃</a></li>
							<li class="nav-item mx-0 mx-lg-1 bef"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="./loginFrm">로그인</a></li>
							<li class="nav-item mx-0 mx-lg-1 suc"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="./myPageFrm">내정보</a></li>
							<li class="nav-item mx-0 mx-lg-1 suc"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="./m_sBasketFrm">장바구니</a></li>
								
							<li class="nav-item mx-0 mx-lg-1 dropdownTop">
								<a class="nav-link py-3 px-0 px-lg-3 rounded" id="s_cneter">고객센터</a>
								<ul  class="dropdown-centent" id="s_cneter_ul">
									<li>
										<a href="./noticeHomeFrm">
											"공지사항"
										</a>
									</li>
									<li>
										<a href="./faqHomeFrm">
											"FAQ"
										</a>
									</li>
									<li>
										<a href="">
											"자유게시판"
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded"
								href="./w_writerHomeFrm">작가홈</a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" class="bef"

								href="./w_writerHomeFrm?whf_gbnum=${gbNM.whf_gbnum}">작가홈</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="header_footer navbar-collapse tf_menu">
			<ul>
				<li><a href="./category"><h5>액세서리</h5></a></li>
				<li><a href="./category"><h5>리빙</h5></a></li>
				<li><a href="./category"><h5>식품/디저트</h5></a></li>
				<li><a href="./category"><h5>꽃</h5></a></li>
				<li><a href="./category"><h5>문구/팬시</h5></a></li>
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
		function myFunction() {
			if( $("#s_cneter_ul").css("display") == "none") { //안보이는 상태면
				$("#s_cneter_ul").css("display", "block"); //보이게 함
				console.log("myFunction - block"); //콘솔 출력
				
				$(document).ready(function(){
					  $('#dropdown a#s_cneter').click(function(){
					    $(this).find('ul').toggle();
					  });
					});
			}
			else if ($("#s_cneter_ul").css("display") == "block") { //보이는 상태면
				$("#s_cneter_ul").css("display", "none"); //안보이게 함 
		}
	</script>