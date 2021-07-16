package com.hm.gongbang.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dao.Writer_HomeDao;
import com.hm.gongbang.dto.GbIntroduceDto;
import com.hm.gongbang.dto.writer_homefileDto;

import lombok.extern.java.Log;

@Service
@Log
public class W_HomeService {

	//작가홈 출력 Dao
	@Autowired
	private Writer_HomeDao whDao;
	
	private ModelAndView mv;
	
	//정보저장 세션
	@Autowired
	private HttpSession session;
	
	//홈 사이드 정보
	public ModelAndView getWHSideInfo(Integer whf_gbnum) {
		log.info("getWHSideInfo()");
		
		mv = new ModelAndView();
		
		//가져올거
		//1. 공방 이름 / 메모
		writer_homefileDto gbNM = whDao.getgbNM(whf_gbnum); 
		log.info("getWHSideInfo() + gbNM");
		
		//가져온 데이터 mv에 담기
		mv.addObject("gbNM", gbNM);

		//보여질 페이지 지정
		mv.setViewName("w_writerHome");
		
		return mv;
	}
	
	//공방 소개 사이드,
	//공방 정보
	public ModelAndView gbInfo(Integer whf_gbnum) {
		log.info("gbInfo()");

		mv = new ModelAndView();

		//사이드 메뉴 가져올거
		//1. 공방 이름 / 메모 / 프로필사진 
		writer_homefileDto gbNM = whDao.getgbNM(whf_gbnum); 
		log.info("gbInfo() + gbNM");


		//2. 홈에 보여질 공방 소개 정보 출력
		GbIntroduceDto gbi = whDao.getGBI(whf_gbnum);

		//사이드 메뉴 데이터 mv에 담기
		mv.addObject("gbNM", gbNM);
		//공방 소개 정보 담기
		mv.addObject("gbi", gbi);

		//뷰(보여질 페이지) 이름 지정
		mv.setViewName("handmadeItd");

		return mv;
	}

	//공방 소개 등록/수정 사이드+정보
	public ModelAndView getHMIUInfo(Integer gbi_gbnum) {
		log.info("getHMIUInfo()-공방 소개 등록/수정 사이드 정보1 : " + gbi_gbnum);
		
		mv = new ModelAndView();
		//결과 저장할 dto 객체 선언

		//1. 공방 이름 / 메모 / 프로필사진 
		writer_homefileDto gbNM = whDao.getgbNM(gbi_gbnum); 
		log.info("gbInfo() + gbNM");
		
		//2. 홈에 보여질 공방 소개 정보 출력
		GbIntroduceDto gbi = whDao.getGBI(gbi_gbnum);

		//사이드 메뉴 데이터 mv에 담기
		mv.addObject("gbNM", gbNM);
		log.info("getHMIUInfo() + gbNM");
		
		//공방 소개 정보 담기
		mv.addObject("gbi", gbi);
		log.info("getHMIUInfo() + gbi");
		
		//뷰(보여질 페이지) 이름 지정
		mv.setViewName("handmadeItdInUp");
		
		return mv;
	}

	//판매작품 사이드 정보
	public ModelAndView getPSSideInfo(Integer wh_gbnum) {
		log.info("getHMIUSideInfo()");
		
		mv = new ModelAndView();
		
		//가져올거
		//1. 공방 이름 / 메모
		writer_homefileDto gbNM = whDao.getgbNM(wh_gbnum); 
		log.info("getHMIUSideInfo() + gbNM");
		
		//가져온 데이터 mv에 담기
		mv.addObject("gbNM", gbNM);

		//보여질 페이지 지정
		mv.setViewName("productSale");
		
		return mv;
	}
	
	

	//구매후기 사이드 정보
	public ModelAndView getWRSideInfo(Integer wh_gbnum) {
		log.info("getHMIUSideInfo()");
		
		mv = new ModelAndView();
		
		//가져올거
		//1. 공방 이름 / 메모
		writer_homefileDto gbNM = whDao.getgbNM(wh_gbnum); 
		log.info("getHMIUSideInfo() + gbNM");
		
		//가져온 데이터 mv에 담기
		mv.addObject("gbNM", gbNM);

		//보여질 페이지 지정
		mv.setViewName("w_writerReview");
		
		return mv;
	}
	
	//공방 소개 사이드 정보
	public ModelAndView getHMISideInfo(Integer whf_gbnum) {
		
		//가져올거
		//1. 공방 이름 / 메모
		writer_homefileDto gbNM = whDao.getgbNM(whf_gbnum); 
		log.info("getHMISideInfo() + gbNM");
		
		//가져온 데이터 mv에 담기
		mv.addObject("gbNM", gbNM);

		//보여질 페이지 지정
		mv.setViewName("handmadeItd");
		
		return mv;
	}

	//공방 정보 수정 버튼 클릭 시
	public String handmadeItdInUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr,
			Integer gbnum) {
		log.info("handmadeItdInUpProc()");
		
		String view = null;
		String msg = null;
		
		//multi에서 데이터 추출(텍스트 파트)
		//String gbnum = multi.getParameter("wgbnum"); //공방 번호
		String title = multi.getParameter("wtitle"); //제목
		String content = multi.getParameter("wcontents"); //내용
		String check = multi.getParameter("fileCheck");  //업로드 할 파일 체크

		//trim() : 앞뒤 공백 제거
		content = content.trim();
		
		//게시물 데이터를 dto에 담아서 dao로 db insert 처리.
		GbIntroduceDto gbiDto = new GbIntroduceDto();
		//gbiDto.setGbi_gbnum(gbnum); //공방 번호
		gbiDto.setGbi_title(title); //제목
		gbiDto.setGbi_contents(content); //내용
		
		try {
			whDao.handmadeItdInUpdate(gbiDto, gbnum);
			
			if(check.equals("1")) {
				fileUp(multi, gbiDto.getGbi_gbnum());
			}
			view = "redirect:/";
			msg = "수정 성공";
		} catch (Exception e) {
			//e.printStackTrace();
			view = "redirect:handmadeItdInUpProc";
			msg = "수정 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);

		return view;
	}
	
	private void fileUp(MultipartHttpServletRequest multi, int gbnum) throws Exception {
		String realPath = null;

		//파일이 저장되는 실제 경로 구하기
		//1.세션에서 꺼내기
		realPath = session.getServletContext().getRealPath("/");
		
		//파일이 저장될 경로 지정(실제 경로 + 지정 경로)
		//upload - 원하는 이름으로 지정
		realPath += "resources/upload/";
		log.info(realPath);
		
		//지정경로가 없을 경우 자동으로 생성하도록 코드를 작성한다.
		File folder = new File(realPath);
		
		//폴더가 존재하는지 확인해서 없으면 폴더생성, 있으면 넘어가기.
		if(folder.isDirectory() == false) {
			//해당 폴더가 없을 경우 upload라는 이름으로 폴더 생성
			folder.mkdir();
		}
		
		//실제 파일 업로드(폴더에 저장) 처리 및 파일 정보를 DB에 저장하기 위해 
		Map<String, String> fmap = new HashMap<>();
		
		//file 태그가 여러개일 경우 각 file 태그의 name을 가져옴.
		Iterator<String> files = multi.getFileNames();//hasNext(판별) : 다음이 있냐(true) 없냐(false)
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
				//1.map에 게시글번호 저장(int -> String)
				fmap.put("gbnum", String.valueOf(gbnum));
				//2.map에 원래 파일이름 저장
				fmap.put("orgfil", on);
				//3.map에 바꾼 파일이름 저장
				fmap.put("savefil", sn);
				
				//해당(지정) 폴더에 파일 저장
				File ff = new File(realPath + sn);
				mf.transferTo(ff);  
				
				//DB에 파일 정보 저장
				whDao.fileInsert(fmap);
			}
		}
	}

	//판매작품 -> 작품 등록/수정 화면 사이드 출력
	public ModelAndView piuSideInfo(Integer wh_gbnum) {
		log.info("piuSideInfo()");
		
		mv = new ModelAndView();
		
		//가져올거
		//1. 공방 이름 / 메모
		writer_homefileDto gbNM = whDao.getgbNM(wh_gbnum); 
		log.info("piuSideInfo() + gbNM");
		
		//가져온 데이터 mv에 담기
		mv.addObject("gbNM", gbNM);

		//보여질 페이지 지정
		mv.setViewName("productInUp");
		
		return mv;
	}
}



















