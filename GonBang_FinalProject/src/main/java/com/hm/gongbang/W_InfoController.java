package com.hm.gongbang;

import java.io.Writer;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dao.W_InfoDao;
import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.W_InfoDto;
import com.hm.gongbang.dto.WriterDto;
import com.hm.gongbang.service.W_InfoService;

import lombok.extern.java.Log;


import com.hm.gongbang.dto.GbIntroduceDto;
import com.hm.gongbang.service.W_HomeService;

@Log
@Controller
public class W_InfoController {

	@Autowired
	private W_InfoService wInfoS;

	private ModelAndView mv;
	
	@Autowired
	private W_HomeService wServ;
	
	
	@Autowired
	HttpSession session;
	
	//홈 -> 공방 홈 / 공방 번호 받음 사이드 정보 출력
	@GetMapping("w_writerHomeFrm") 
	public ModelAndView w_WriterHomeSide(Integer whf_gbnum) { 
		mv = new ModelAndView();
		
		whf_gbnum = 3;
		log.info("홈 -> 공방 홈 - 공방번호 : " + whf_gbnum);
		
		//사이드 데이터 담고 이동할 페이지 
		mv = wServ.getWHSideInfo(whf_gbnum);
		log.info("w_writerHome() 공방 번호 : " + mv);

		return mv; 
	}
	
	//작가 홈 -> 공방 소개 사이드+정보 출력
	@GetMapping("handmadeItdFrm")
	public ModelAndView handmadeItd(Integer wh_gbnum) {
		log.info("홈 -> 공방 소개 - 공방번호 : " + wh_gbnum);
		
		mv = wServ.gbInfo(wh_gbnum);
		log.info("handmadeItd() - mv : " + mv);
		
		return mv;
	} 
	
	//공방 소개 -> 공방 소개 수정
	//공방 소개 사이드+정보 출력
		@GetMapping("handmadeItdInUpFrm")
		public ModelAndView handmadeItdInUp(Integer gbi_gbnum) {
			log.info("공방 소개 -> 공방 소개 수정 - 공방번호 : " + gbi_gbnum);
			//데이터 담고 이동할 페이지 
			mv = wServ.getHMIUInfo(gbi_gbnum);
			log.info("handmadeItdInUp() - mv : " + mv);
			
			return mv;
		}
	
	//작가 홈 -> 판매작품 사이드 출력 
	@GetMapping("productSaleFrm")
	public ModelAndView productSale(Integer wh_gbnum) {
		log.info("작가 홈 -> 판매작품 사이드 - 공방번호 : " + wh_gbnum);
		
		//데이터 담고 이동할 페이지 
		mv = wServ.getPSSideInfo(wh_gbnum);

		log.info("productSale() - mv : " + mv);
		
		return mv;
	}
	
	//작가 홈 -> 구매후기 사이드 출력
	@GetMapping("w_writerReviewFrm")
	public ModelAndView w_writerReview(Integer wh_gbnum) {
		log.info("홈 -> 구매후기 사이드 - 공방번호 : " + wh_gbnum);

		//데이터 담고 이동할 페이지 
		mv = wServ.getWRSideInfo(wh_gbnum);
		
		log.info("w_writerReview() - mv : " + mv);
		
		return mv;
	}
	
	//판매작품 -> 작품 등록/수정 화면 사이드 출력
	@GetMapping("productInUpFrm")
	public ModelAndView productInUpFrm(Integer wh_gbnum) {

		log.info("작가 홈 -> 판매작품 사이드 - 공방번호 : " + wh_gbnum);
		
		//데이터 담고 이동할 페이지 
		mv = wServ.piuSideInfo(wh_gbnum);

		log.info("productInUpFrm() - mv : " + mv);
		
		return mv;
	}
	
	//////////////////////////////////////////////////////
	
	//공방 소개 등록 에러남
	//완료 버튼 클릭시 수정된 정보 받고 메시지 전송
	@PostMapping("handmadeItdInUpProc")
	public String handmadeItdInUpProc(MultipartHttpServletRequest multi, RedirectAttributes rttr, Integer gbnum) {
		log.info("handmadeItdInUpProc");
		
		String view = wServ.handmadeItdInUpdate(multi, rttr, gbnum);
		
		return view;
	}
	
	// 작가 개인정보 수정하기
	@PostMapping("w_AtPrivateInfoFix")
	public String w_AtPrivateInfoFix(W_InfoDto writer, RedirectAttributes rttr) {
		System.out.println("확인~~~~~~~~~~" + writer);
		log.info("w_AtPrivateInfoFix()");

		String view = wInfoS.w_AtPrivateInfoFix(writer, rttr);

		return view;

	}

	//작가 회원 가입
	@PostMapping("writerJoinProc")
	public ModelAndView writerJoinProc(WriterDto writer, RedirectAttributes rttr) {
		log.info("컨트롤러 writerJoinProc()");
		mv = new ModelAndView();
		System.out.println("데이터확인" + writer);
		mv = wInfoS.writerJoinProc(writer, rttr);
		return mv;
	}//memberJoinProc() end

}//class end



/*
 * @GetMapping("info") public String w_AtPrivateInfo(HttpSession session, String
 * W_ID) {
 * 
 * 
 * //mv = wInfoS.w_AtPrivateInfo(session, W_ID);
 * 
 * // 세션 안에 id로 정보 찾아와 저장 String W_id = (String) session.getAttribute("W_ID");
 * log.info("info()");
 * 
 * 
 * return null;
 * 
 * // W_InfoDao wDao = wDao.a_AtPrivateInfo (Writer);
 * 
 * // 개인정보 출력 메소드
 * 
 * }
 */

