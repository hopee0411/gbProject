package com.hm.gongbang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class W_InfoController {

	//작가 개인정보 수정하기
	@PostMapping("w_AtPrivateInfoFix")
	public String w_AtPrivateInfoFix() {

		return "w_AtPrivateInfoFix";

	}
}
