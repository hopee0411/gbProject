package com.hm.gongbang;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.Mw_viewDto;
import com.hm.gongbang.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
public class MemberController {

	@Autowired
	private MemberService mServ;

	private ModelAndView mv;

	@Autowired
	private JavaMailSender mailSender;
	
	//로그인
	@PostMapping("loginProc")
	public ModelAndView loginProc(Mw_viewDto mwDto, RedirectAttributes rttr) {
		log.info("loginProc()");
		mv = new ModelAndView();
		mv = mServ.loginProc(mwDto, rttr);
		return mv;
	}// loginProc() end
	
	//로그아웃
	@GetMapping("logoutProc")
	public ModelAndView logoutProc(RedirectAttributes rttr) {
		log.info("logoutProc()");
		mv = new ModelAndView();
		mv = mServ.logoutProc(rttr);

		return mv;
	}// logoutProc() end
	
	//아이디 중복 확인
	@GetMapping(value = "idCheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(String id) {
		log.info("id : " + id);
		String res = mServ.idCheck(id);
		return res;
	}// idCheck() end

	// 메일인증번호
	@GetMapping(value = "mailCheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);
		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호" + checkNum);
		// 이메일 보내기
		String setFrom = "hopee0411@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일입니다.";
		String content = "저희 공방 홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 입력하여 주세요.";

		try { 
			MimeMessage message = mailSender.createMimeMessage(); 
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom); 
			helper.setTo(toMail); 
			helper.setSubject(title);
			helper.setText(content,true); 
			mailSender.send(message);
			
		} catch (Exception e){ 
			e.printStackTrace();
		}
		String num = "" + checkNum;
		
		return num;
	}// mailCheckGET() end
	
	//일반 회원 가입
	@PostMapping("memberJoinProc")
	public ModelAndView memberJoinProc(MemberDto member, RedirectAttributes rttr) {
		log.info("컨트롤러 memberJoinProc()");
		mv = new ModelAndView();
		System.out.println("데이터확인" + member);
		mv = mServ.memberJoinProc(member, rttr);
		return mv;
	}//memberJoinProc() end
	
	@GetMapping("w")
	public String w(){
		
		String view = "w_writerHome"; 
	return  view;
	}
	
}// class end
