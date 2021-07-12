package com.hm.gongbang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.Saving_PointDto;
import com.hm.gongbang.dto.W_InfoDto;
import com.hm.gongbang.service.MyService;
import lombok.extern.java.Log;
 

@Log
@Controller
public class MyController {
	
	@Autowired
	private MyService myservice;
	
	
	// 회원 개인정보 수정하기
		@PostMapping("m_InfoFix")
		public String m_InfoFix(MemberDto member, RedirectAttributes rttr) {
			System.out.println("확인~~~~~~~~~~" + member);
			log.info("m_InfoFix()");

			String view = myservice.m_InfoFix(member, rttr);

			return view;

		}

}//class end

