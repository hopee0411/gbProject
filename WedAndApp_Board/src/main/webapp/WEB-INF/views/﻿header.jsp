<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="top-bar">
		<div class="content">
			<img alt="로고" src="resources/images/r-logo.jpg" class="top-left logo" onclick="gohome();">
			<h2 class="top-left">Web Board</h2>
			<nav class="top-right">
				<ul>
					<li class="suc" id="mname">테스트님</li>
					<li class="suc"><a href="./logout">Logout</a></li>
					<li class="bef"><a href="./loginFrm">Login</a></li>
					<li class="bef"><a href="./joinFrm">Join</a></li>
				</ul>
			</nav>
		</div>
	</div>
	
	<script>
	//로고 클릭 시 호출됨
	function gohome(){
		var id = "${mb.m_id}";
		
		if(id == "") {
			location.href = "./"; //로그인 전에는 home.jsp로...
		}
		else if(id != ""){
			location.href = "./list"; //로그인 후에는 게시판 첫페이지로...
		}
	}
	</script>