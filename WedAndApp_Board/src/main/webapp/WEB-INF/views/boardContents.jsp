<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상세 보기</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//컨트롤러에서 전달하는 메시지 출력.
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
		//location.reload(true); //페이지 새로고침(사용X)
	}
	
	var identy = "${mb.m_name}";
	$("#mname").html(identy + "님");
	$(".suc").css("display", "block");
	$(".bef").css("display", "none");
	
});
</script>
</head>
<body>
<div class="wrap">
	<header>
	<jsp:include page="﻿header.jsp"/>
	</header>
	<section>
	<div class="content">
		<div class="write-form">
			<div class="user-info">
				<div class="user-info-sub">
					<p class="grade">등급 [${mb.g_name}]</p>
					<p class="point">POINT [${mb.m_point}]</p>
				</div>
			</div>
			<h2 class="login-header">상세 보기</h2>
			<!-- 게시글 상세 내용 출력(table) -->
			<table>
				<tr height="30">
					<td width="100" bgcolor="pink" align="center">NUM</td>
					<td colspan="5">${board.bnum}</td>
				</tr>
				<tr height="30">
					<td bgcolor="pink" align="center">WRITER</td>
					<td width="150">${board.mname}</td>
					<td bgcolor="pink" align="center">DATE</td>
					<td width="200">
						<fmt:formatDate value="${board.bdate}"
							pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td bgcolor="pink" align="center">VIEWS</td>
					<td width="100">${board.bviews}</td>
				</tr>
				<tr height="30">
					<td bgcolor="pink" align="center">TITLE</td>
					<td colspan="5">${board.btitle}</td>
				</tr>
				<tr height="200">
					<td bgcolor="pink" align="center">CONTENTS</td>	
					<td colspan="5" bgcolor="white">${board.bcontents}</td>				
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="5">
						<!-- 경우의 수 -->
						<!-- 1) 첨부파일이 없을 경우 -->
						<c:if test="${empty bfList}">
							첨부된 파일이 없습니다.
						</c:if>
						
						<!-- 2) 첨부파일이 있을 경우 -->
						<c:if test="${!empty bfList}">
						
							<!-- 첨부파일이 여러개인 경우를 기본으로 처리 -->
							<c:forEach var="file" items="${bfList}">
								<a href="./download?bf_sysname=${file.bf_sysname}&bf_oriname=${file.bf_oriname}">
									<span class="file-title">
										${file.bf_oriname}&nbsp;&nbsp;
									</span>
								</a>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<!-- 이미지 미리보기 -->
				<c:if test = "${!empty bfList}">
					<tr>
						<!-- 파일이 있을 때만 화면에 출력 -->
						<th>PREVIEW</th>
						<td colspan="5">
							<c:forEach var="f" items="${bfList}">
								<c:if test="${fn:contains(f.bf_sysname, '.jpg')}">
									<img src="resources/upload/${f.bf_sysname}"
										width="100">
								</c:if>	
								<c:if test="${fn:contains(f.bf_sysname, '.png')}">
									<img src="resources/upload/${f.bf_sysname}"
										width="100">
								</c:if>	
								<c:if test="${fn:contains(f.bf_sysname, '.gif')}">
									<img src="resources/upload/${f.bf_sysname}"
										width="100">
								</c:if>				
							</c:forEach>
						</td>	
					</tr>
				</c:if>
				<tr>
					<td colspan="6" align="center">
						<button class="btn-write" id="upbtn"
							onclick="location.href='./updateFrm?bnum=${board.bnum}'">U</button>
						<button class="btn-write" id="delbtn"
							onclick="location.href='./delete?bnum=${board.bnum}'">D</button>
						<button class="btn-sub" onclick="location.href='./list?pageNum=${pageNum}'">B</button>
					</td>
				</tr>
			</table>
			<!-- 댓글 작성 양식(form/table) -->
			<form id="rFrm">
				<textarea rows="3" class="write-input ta"
					name="r_contents" id="comment"
					placeholder="댓글을 적어주세요~"></textarea>
				<input type="button" value="댓글전송" 
					class="btn-write" onclick="replyInsert(${board.bnum})"
					style="width: 100%; margin-bottom: 30px;">
			</form>
			<!-- 댓글 목록 출력 부분(table) -->
			<!-- 댓글 목록의 제목 부분 -->
			<table style="width: 100%">
				<tr bgcolor="pink" align="center" height="30">
					<td width="20%">WRITER</td>
					<td width="50%">CONTENTS</td>
					<td width="30%">DATE</td>
				</tr>
			</table>
			<!-- 댓글 목록 -->
			<table id="rtable" style="width: 100%">
				<c:forEach var="r" items="${rList}">
					<tr>
						<td width="20%">${r.r_id}</td>
						<td width="50%">${r.r_contents}</td>
						<td width="30%">
							<fmt:formatDate value="${r.r_date}"
								pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
					</tr>
				</c:forEach> 
			</table>
		</div>
	</div>
	</section>
	<footer>
	<jsp:include page="footer.jsp"/>
	</footer>
</div>
</body>

<!-- resources/js/jquery.serializeObject.js : form의 데이터를 json 객체 형태로 변환하는 역할 -->
<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">
//댓글 전송 및 신규 댓글 포함 목록 출력(ajax)
function replyInsert(bnum) {
	console.log(bnum);
	
	//댓글 전송 form을 json 객체로 변환
	var replyFrm = $("#rFrm").serializeObject();
	replyFrm.r_bnum = bnum; //게시글 번호 추가
	replyFrm.r_id = "${mb.m_id}"; //작성자(로그인 한 사용자) 아이디 추가
	console.log(replyFrm);
	//controller에 ajax로 전송
	$.ajax({
		url: "replyIns", 
		type: "post",
		data: replyFrm,
		dataType: "json",
		success: function(result) {
			var rlist = "";
			var dlist = result.rList;
			
			//목록 처리라서 반복
			for(var i = 0; i < dlist.length; i++) {
				rlist += '<tr>'
					+ '<td width="20%">' + dlist[i].r_id + '</td>'
					+ '<td width="50%">' + dlist[i].r_contents + '</td>'
					+ '<td width="30%">' + dlist[i].r_date + '</td>'
					+ '</tr>';
			}
			
			$("#rtable").html(rlist);
		},
		error:function(error) {
			console.log(error);
			alert("댓글 입력 실패");
		}
	});
}
</script>
</html>