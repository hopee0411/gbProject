package com.hm.gongbang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.Saving_PointDto;
import com.hm.gongbang.service.MyService;
import lombok.extern.java.Log;

@Controller
public class MyController {
	
	@Autowired
	private MyService myServ;
	
	private ModelAndView mv;
	
	@PostMapping("MyPageMain")
	public ModelAndView MyPageMain(Saving_PointDto spDto, RedirectAttributes rttr) {
		//Log.info("MyPageMain()");
		System.out.println(spDto.getClass());
		mv = new ModelAndView();
		mv = myServ.MyPageMain(spDto, rttr);
		return mv;
	}//MyPageMain() end
}//class end

