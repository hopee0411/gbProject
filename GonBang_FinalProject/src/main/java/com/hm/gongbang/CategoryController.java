package com.hm.gongbang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.dto.ProductDto;
import com.hm.gongbang.service.CateGroryService;

import lombok.extern.java.Log;

@Controller 
@Log
  public class CategoryController {
	
	private ModelAndView mv;
	
	@Autowired
	private CateGroryService cServ;
	
//	@Autowired 
	//private ProductDto pDto;
	
	
	@GetMapping("optionchoseFrm")
	public ModelAndView optionchoseFrm(ProductDto pd) {
		
		log.info("optionchoseFrm()");
		mv = new ModelAndView();
		System.out.println(pd + "================@@@@@@@@@@@@=================");
		mv = cServ.optionchose(pd);
		
		//mv.setViewName("category");
		
		return mv;
		
	} // optionchoseFrm end  

	
  } // class end






