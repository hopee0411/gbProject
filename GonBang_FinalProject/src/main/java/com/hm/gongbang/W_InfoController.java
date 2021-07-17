package com.hm.gongbang;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.GbIntroduceDto;
import com.hm.gongbang.service.W_HomeService;

import lombok.extern.java.Log;

@Log
@Controller
public class W_InfoController {

	@Autowired
	private W_HomeService wServ;
	
	private ModelAndView mv;
	
	@Autowired
	HttpSession session;
	
	//홈 -> 공방 홈 / 공방 번호 받음 사이드 정보 출력
	@GetMapping("w_writerHomeFrm") 
	public ModelAndView w_WriterHomeSide(Integer whf_gbnum) { 
		log.info("홈 -> 공방 홈 - 공방번호 : " + whf_gbnum);
		whf_gbnum = 3;
		
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
}
