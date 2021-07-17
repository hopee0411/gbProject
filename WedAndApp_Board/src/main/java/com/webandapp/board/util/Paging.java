package com.webandapp.board.util;

public class Paging {
	private int maxNum; //전체 글 개수 저장 변수
	private int pageNum; //현재 보이는 페이지 번호 저장 변수
	private int listCnt; //페이지 당 글 개수 저장 변수
	private int pageCnt; //보여질 페이지 번호 개수 저장 변수 
	private String listName; //목록 페이지 이름 저장 변수
	
	//생성자로 초기 데이터 입력
	public Paging(int maxNum, int pageNum, int listCnt, 
			int pageCnt, String listName) {
		this.maxNum = maxNum;
		this.pageNum = pageNum;
		this.listCnt = listCnt;
		this.pageCnt = pageCnt;
		this.listName = listName;
	}
	
	//페이징용 html 코드 만드는 메소드
	public String makePaging() {
		String page = null;
		
		//1. 전체 페이지 개수 구하기(페이지 당 10개 출력)
		// 전체 게시글이 9개라면 페이지 개수는? 1개
		// 전체 게시글이 11개라면 페이지 개수는? 2개
		//maxNum : 전체 글개수, listCnt : 한페이지당 나오는 글 개수
		int totalPage = ((maxNum % listCnt) > 0 )? 
						maxNum / listCnt + 1 :
						maxNum / listCnt;
		//maxNum을 listCnt로 나눈 너머지가 1~9라면
		//전체 totalPage는 maxNum을 listCnt로 나눈 몫 +1,
		//maxNum을 listCnt로 나눈 나머지가 0이라면
		//전체 totalPage는 maxNum을 listCnt로 나눈 몫.
		
		//2. 현재 페이지가 속해 있는 그룹 번호 구하기
		int curGroup = ((pageNum % pageCnt) > 0) ?
				pageNum/pageCnt + 1 :
				pageNum/pageCnt;
		
		//3. 현재 보이는 페이지 그룹의 시작 번호 구하기
		int start = (curGroup * pageCnt) - (pageCnt - 1);
		
		//4. 현재 보이는 페이지 그룹의 끝 번호 구하기
		int end = ((curGroup * pageCnt) >= totalPage) ? 
				totalPage : curGroup * pageCnt;
		
		StringBuffer sb = new StringBuffer();
		//StringBuffer는 문자열을 만들기 위해 메모리에 임시 공간을
		//생성하여 문자배열 데이터를 저장하고 최종 문자열로 완성하는
		//객체. -> 문자열 수정(추가/삭제 등)을 많이 하는 경우
		//StringBuffer를 사용하여 수정작업을 하고 완료 후 문자열로 
		//완성하는 방법을 활용하는 것이 좋다.
				
		//'이전' 버튼 처리
		if(start != 1) {
			sb.append("<a class='pno' href='" + listName +
					"?pageNum=" + (start -1) + "'>");
			sb.append("&nbsp;이전&nbsp;");
			sb.append("</a>");
		} //완성 : <a class='pno' href='list?pageName=2'>&nbsp;이전&nbsp;</a>
		 //현재 페이지가 1페이지라면 '이전'버튼은 생성하지 않는다.
		
		//이전 버튼과 다음 버튼 중간의 페이지 번호 처리
		for(int i = start; i <= end; i++) {
			//현재 페이지에는 링크를 걸지 않는다.
			if(pageNum != i) {
				sb.append("<a class='pno' href='" + listName +
							"?pageNum=" + i + "'>");
				sb.append("&nbsp;" + i + "&nbsp;</a>");
			} //완성 : <a class='pno' href='list?pageName=3'>&nbsp;3&nbsp;</a>
			else {
				//현재 페이지 번호에 대한 처리
				sb.append("<font class='pno' stulr='color:red;'>");
				sb.append("&nbsp;" + i + "&nbsp;</font>");
				
			} //완성 : <font class='pno' stulr='color:red;'>&nbsp;4&nbsp;</font>
		}
		
		//'다음' 버튼 처리
		if(end != totalPage) {
			sb.append("<a class='pno' href='" + listName +
					"?pageNum=" + (end + 1) + "'>");
			sb.append("&nbsp;다음&nbsp;");
			sb.append("</a>");
		} //완성 : <a class='pno' href='list?pageName=5'>&nbsp;다음&nbsp;</a>
		
		//StringBuffer의 내용을 문자열로 완성
		page = sb.toString();
		
		return page;
	}
} //class end