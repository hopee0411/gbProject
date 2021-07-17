package com.webandapp.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webandapp.board.dao.BoardDao;
import com.webandapp.board.dao.MemberDao;
import com.webandapp.board.dto.BfileDto;
import com.webandapp.board.dto.BoardDto;
import com.webandapp.board.dto.ReplyDto;
import com.webandapp.board.util.Paging;

import lombok.extern.java.Log;

@Service
@Log
public class BoardService {
	//Dao 객체 변수
	@Autowired
	private BoardDao bDao;
	
	//게시글 작성 시 사용자의 point 증가 처리
	@Autowired
	private MemberDao mDao;
	
	private ModelAndView mv;
	
	//point 변경 후 세션의 회원 정보를 변경하기 위해 필요.  
	@Autowired
	private HttpSession session;

	public ModelAndView getBoardList(Integer pageNum) {
		mv = new ModelAndView();
		
		//pageNum을 int로 만들지 않고 Integer로 만든 이유?
		//로그인 직 후에는 페이지 번호에 대한 정보가 없기 때문이며,
		//즉, 페이지 번호 정보가 null로 처리되도록 객체로 받은 것이다.
		int num = (pageNum == null) ? 1 : pageNum;
		//list url을 통해 pageNum이 전달되지 않으면 1페이지로, 
		//전달된 페이지 번호가 있으면 그 페이지 번호를 사용.
		
		//게시글 목록 가져오기 - 여러개 처리 가능해야함(리스트)
		//dao가 실질적으로 가져옴
		//페이지 번호를 가져옴
		List<BoardDto> bList = bDao.getList(num);
		
		//게시글 목록을 model에 추가(jsp로 앞의 문자열에 작성한 이름으로 전달됨) ----
		mv.addObject("bList", bList);
		
		//페이징 처리(나중에...)
		String page = getPaging(num);
		//paging 보드리스트에서 꺼낼때 사용
		mv.addObject("paging", page);
		
		//세션에 페이지 번호 저장
		//글작성 화면에서 목록으로 돌아갈 때 보던 페이지가 다시 나오도록 하기 위해 
		//보고 있던 페이지의 번호를 저장.
		session.setAttribute("pageNum", num);
		
		//jsp 페이지 이름 지정(jsp파일과 이름이 같아야함)
		mv.setViewName("boardList");
				
		return mv;
	}

	private String getPaging(int num) {
		String pageHtml = null;
		
		//전체 글 개수는 dB가 알고 있어서 물어봄
		int maxNum = bDao.getBoardCnt();
		//한페이지당 보여줄 글 수(페이지 당 글 목록)
		int listCnt = 10;
		//페이지에서 보이는 페이지 번호의 개수
		int pageCnt = 2;
		//게시글 목록 페이지의 url
		String listName = "list";
		
		Paging paging = new Paging(maxNum, num, listCnt, pageCnt, listName);
		
		pageHtml = paging.makePaging();
		
		return pageHtml;
	}

	//파일 처리
	@Transactional
	public String boardInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		//multi에서 데이터 추출(텍스트 파트)
		//writeFrm.jsp의 name부분을 ("")안에 넣음
		//getParameter("xxx"); <- 'xxx'는 jsp의 input 태그의 name 속성에
		//작성한 단어(키워드)와 같은(대소문자까지) 단어를 입력한다!
		String id = multi.getParameter("bid"); //아이디
		String title = multi.getParameter("btitle"); //제목
		String content = multi.getParameter("bcontents"); //내용
		String check = multi.getParameter("fileCheck");  //업로드 할 파일 체크
		
		//textarea는 실제 입력 데이터 앞뒤로 공백이 발생하는 경우가 많음.
		//trim() : 앞뒤 공백 제거
		content = content.trim();
		
		//게시물 데이터를 dto에 담아서 dao로 db insert 처리.
		BoardDto board = new BoardDto();
		board.setBid(id);
		board.setBtitle(title);
		board.setBcontents(content);
		
		//insert작업
		try {
			//try안에서 예외사항이 발생되서 넘어가면 트랜잭션이 발동되서 자동으로 rollback이 됨
			//insert작업도 같이 취소됨.(파일저장에 실패했으면 게시물도 저장하면 안된다.)
			
			//1. 게시글을 DB에 저장
			bDao.boardInsert(board);
					
			//2. 업로드 파일이 있다면, 업로드 처리
			//주의. 저장한 게시글의 글번호(insert가되야 알수 있음)를 사용.
			if(check.equals("1")) {
				//파일 업로드로 처리할 일이 많으니
				//메소드로 빼서 처리
				//업로드용 메소드
				//multi : 파일이 multi에 다 들어가 있음
				//getBnum : 게시글 번호
				fileUp(multi, board.getBnum());
			}
			
			//3. 회원의 포인트 증가 처리(세션의 데이터도 변경)
			//과제... 게시글 하나 입력당 몇점씩 증가
			
			view = "redirect:list"; //목록의 첫페이지로
			msg = "글 작성 성공";
			
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:writeFrm";
			msg = "글 작성 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}

	private void fileUp(MultipartHttpServletRequest multi, 
			int bnum) throws Exception { 
		//throws : 호출한 메소드로 예외처리 넘김.
		//(fileUp메소드 안에서는 예외처리 안함. fileUp을 호출한 메소드가 예외처리하라고 넘김)
		
		//파라미터 구성
		// - multi에 업로드한 파일이 담겨 있음. 
		// - 해당 게시글 번호로 파일 정보를 저장.
		String realPath = null;
		
		//파일이 저장되는 실제 경로 구하기(둘 중 하나만 선택하여 사용하세요. / 값은 같음)
		//1.세션에서 꺼내기
		realPath = session.getServletContext().getRealPath("/");
		//log.info(realPath); //실행을 위해 try의 1번 주석처리
		
		//2.multi에서 꺼내기
		//realPath = multi.getSession().getServletContext().getRealPath("/");
		//log.info(realPath);
		
		//파일이 저장될 경로 지정(실제 경로 + 지정 경로)
		//이런 파일들은 다 resources폴더에 저장됨
		//upload - 원하는 이름으로 지정
		realPath += "resources/upload/";
		log.info(realPath);
		
		//지정경로가 없을 경우 자동으로 생성하도록 코드를 작성한다.
		File folder = new File(realPath);
		
		//폴더가 존재하는지 확인해서 없으면 폴더생성, 있으면 넘어가기.
		//isDirectory() : 폴더(Directory) 인지 묻는것
		//파일이거나 이 이름에 해당되지 않으면 false - 폴더가 아니면 생성
		//이름이 있으면서 폴더면 만들지 X - true
		if(folder.isDirectory() == false) {
			//해당 폴더가 없을 경우 upload라는 이름으로 폴더 생성
			folder.mkdir();
		}
		
		//실제 파일 업로드(폴더에 저장) 처리 및 파일 정보를 DB에 저장하기 위해 
		//  Map을 사용하여 3개의 파라미터를 하나로 묶는
		Map<String, String> fmap = new HashMap<>();
		
		//file 태그가 여러개일 경우 각 file 태그의 name을 가져옴.
		//이름만 꺼내옴
		Iterator<String> files = multi.getFileNames();
		
		//hasNext(판별) : 다음이 있냐(true) 없냐(false)
		//next(획득) : 값을 가져오는것
		while (files.hasNext()) {
			String fn = files.next();
			
			//한 file 태그에 여러개의 파일을 선택한 것에 대한 처리
			//'files'영역에 저장한 파일 목록 가져오기(한개에 대한)
			List<MultipartFile> fList = multi.getFiles(fn);
			
			
			for(int i = 0; i < fList.size(); i++) {
				//MultipartFile 클래스 : Spring에서 업로드한 파일을 저장하는 객체
				MultipartFile mf = fList.get(i);
				//getOriginalFilename : 원래 파일  이름 구함(on)_
				String on = mf.getOriginalFilename();
				log.info(fn + "태그의 파일명 : " + on);
				
				//변경한 파일 이름은 시간값(밀리초)로 한다.
				//(시간은 같은 값이 나오지 않기 때문)
				//파일 이름 = 파일명 + . + 확장자(파일마다 달라서 파일에서 잘라서 가져옴)
				//파일명 부분만 시간값으로 변경
				//1. 확장자만 구하기
				//sn : 시스템 이름
				//System.currentTimeMillis() : 파일 명 (1231353213)
				//substring : 파일에서 자르기
				//lastIndexOf : 원래 파일에서 점 위치 찾아서 확장자 잘라서 사용
				String sn = System.currentTimeMillis()
						+ "."
						+ on.substring(on.lastIndexOf(".") + 1);
				//test.txt -> 1231353213.txt
				
				//mapper로 전달할 데이터 묶음 생성
				//fmap에 게시글번호(bnum), 원래파일이름(on), 바꾼이름(sn)을 넣는다.
				//1.map에 게시글번호 저장(int -> String)
				//String.valueOf(숫자변수); : 숫자 -> 문자열로 변환
				fmap.put("bnum", String.valueOf(bnum));
				//2.map에 원래 파일이름 저장
				fmap.put("oriName", on);
				//3.map에 바꾼 파일이름 저장
				fmap.put("sysName", sn);
				//BoardDao에 전달할 파라미터 묶음 완성.
				
				//해당(지정) 폴더에 파일 저장
				//ff : 최종 파일
				//업로드 까지의 경로 + 파일 이름
				File ff = new File(realPath + sn);
				mf.transferTo(ff);  
				//예외사항 발생 가능 
				// - 예외사항 처리 해야함(try-catch를 사용하면 이후의 DB 저장 처리가 안좋아짐)
				
				//DB에 파일 정보 저장
				bDao.fileInsert(fmap);
			}
		}
	}

	public ModelAndView getContents(Integer bnum) {
		log.info("getContents()");
		
		mv = new ModelAndView();
		
		//조회수 1씩 업테이트(증가) - 해보기
		
		//가져올 내용
		//1.글내용 가져오기
		//bnum을 넘겨서 가져옴
		BoardDto board = bDao.getContents(bnum);
		
		//2.파일목록 가져오기
		//게시글넘버로 조회함
		List<BfileDto> bfList = bDao.getBfList(bnum);
		
		//3.댓글목록 가져오기
		List<ReplyDto> rList = bDao.getReList(bnum);
		
		//가져온 데이터를 모델(mv)에 담기
		mv.addObject("board", board);
		mv.addObject("bfList", bfList);
		mv.addObject("rList", rList);
		
		//뷰(보여질 페이지) 이름 지정
		mv.setViewName("boardContents");
		
		return mv;
	}

	public void fileDownload(BfileDto bfile, HttpServletResponse res) {
		//실제 파일 저장 경로(폴더 upload) 파일을 가져오기.
		String realPath = session.getServletContext().getRealPath("/");
		realPath +="resources/upload/";
		log.info(realPath);
		//원래 이름 -> 다운로드
		String oriName = bfile.getBf_oriname();
		
		//다운로드할 파일 경로 + 파일명
		realPath += bfile.getBf_sysname();
		
		//서버의 폴더에서 파일을 가져오는 경로 생성
		InputStream is = null;
		//사용자 컵퓨터에 파일을 보내는 경로 생성
		OutputStream os = null;
		try {
			//파일명 인코딩(한글일 경우 깨짐 방지)
			String dFileName = URLEncoder.encode(oriName, "UTF-8");
			
			//파일 객체를 메모리에 생성
			File file = new File(realPath);
			is = new FileInputStream(file);
			
			//응답(response) 객체에 데이터 담기
			//http에서 전송되는 데이터는 헤더와 바디로 구성
			//받을 때 취할 조치에 대한 설정(헤더) - contentType 설정
			//받을 때 8개 씩 끊어서 받아라
			//octet-stream : 보내 파일(1바이트씩 보냄)
			res.setContentType("application/octet-stream");
			res.setHeader("content-Disposition", 
					"attachment; filename=\"" + dFileName + "\"");
			//완성 코드 : "attachment; filename="파일이름.확장자"
			
			//보내는 통로 생성
			os = res.getOutputStream();
			
			//파일 전송 부분(byte 단위로 전송)
			byte[] buffer = new byte[1024]; //1키로바이트
			int length;
			//읽어올게 없어질때까지 read가 가져옴 > 가져올게 없어지면 -1이 되고 종료됨 > 다 가져오면 통로쪽으로 부움
			while((length = is.read(buffer)) != -1) {
				os.write(buffer, 0, length);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				//통로에 남아있는 데이터 강제로 전부 전송 처리
				os.flush();
				os.close();
				is.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
	}//fileDownload() end

	@Transactional
	public Map<String, List<ReplyDto>> replyInsert(ReplyDto reply) {
		Map<String, List<ReplyDto>> rmap = null;
		
		try {
			//댓글 삽입(insert)
			bDao.replyInsert(reply);
			
			//댓글 목록 다시 검색(select)
			List<ReplyDto> rList = bDao.getReList(reply.getR_bnum());
			
			rmap = new HashMap<String, List<ReplyDto>>();
			rmap.put("rList", rList);
			
		} catch (Exception e) {
			//e.printStackTrace();
			rmap = null;
		}
		
		return rmap;
	}
}		








//map에 게시글 번호 저장(int -> String)
//"" + bnum == String.valueOf(bnum)
//게시글 번호는 숫자, map 저장 데이터는 문자열
//fmap.put("bnum", String.valueOf(bnum));

//html의 file input 태그는 다중 파일선택을 기본으로 함.
//하나의 파일을 업로드해도 멀티로 전달될 때는 List로 전달함.
//
















