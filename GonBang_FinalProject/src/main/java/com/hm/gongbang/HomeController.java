package com.hm.gongbang;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	 // home();
	@GetMapping("/")
	public String home() {
		logger.info("home()");
		
		return "home";
	} // home end
	
	@GetMapping("w_writerHome")
	public String w_WriterHome() {
		logger.info("w_writerHome()");
		
		return "w_writerHome";
	}
	
	@GetMapping("handmadeItd")
	public String handmadeItd() {
		logger.info("handmadeItd()");
		
		return "handmadeItd";
	}
	
	
	@GetMapping("productSale")
	public String productSale() {
		logger.info("productSale()");
		
		return "productSale";
	}
	
	@GetMapping("w_writerReview")
	public String w_writerReview() {
		logger.info("w_writerReview()");
		
		return "w_writerReview";
	}
	
	@GetMapping("w_wrtierQuestion")
	public String w_wrtierQuestion() {
		logger.info("w_wrtierQuestion()");
		
		return "w_wrtierQuestion";
	}

}
