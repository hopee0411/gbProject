package com.hm.gongbang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.hm.gongbang.dto.WriterDto;
import com.hm.gongbang.dao.W_InfoDao;
import com.hm.gongbang.dto.WriterDto;


@Service
public class W_InfoService {

	@Autowired
	private W_InfoDao wDao;

	public String w_AtPrivateInfoFix(WriterDto writer, RedirectAttributes rttr) {
		String view = null;
		String msg = null;		
		String PHONENUM = null;		
		String EMAIL = null;
		int COMPANYNUM = 0;
		String GENDER = null;
		String BIRTH = null;
		int ACCOUNT = 0;
		int NUMFAIL = 0;
		int SELECTION = 0;
		
		//비밀번호 암호화
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String encPwd = pwdEncoder.encode(writer.getW_PWD());
		//비밀번호 덮어쓰기
		writer.setW_PWD(encPwd);
		writer.setW_PHONENUM(PHONENUM);		
		writer.setW_EMAIL(EMAIL);
		writer.setW_COMPANYNUM(COMPANYNUM);
		writer.setW_GENDER(GENDER);
		writer.setW_BIRTH(BIRTH);
		writer.setW_ACCOUNT(ACCOUNT);
		writer.setW_NUMFAIL(NUMFAIL);
		writer.setW_SELECTION(SELECTION);
		
		//수정처리
		try {
			wDao.w_AtPrivateInfoFix(writer);
			view = "redirect:w_writerHomeFrm";
			msg = "정보 수정 성공";
		} catch (Exception e) {
			//e.printStackTrace();
			view = "redirect:w_writerManageFrm";
			msg = "비밀번호 틀림";
		} 
		rttr.addFlashAttribute("msg", msg);
		return view;		

	}

}
