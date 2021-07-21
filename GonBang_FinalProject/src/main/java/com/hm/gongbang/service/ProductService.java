package com.hm.gongbang.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.dao.ProductDao;
import com.hm.gongbang.dto.OpptionDto;
import com.hm.gongbang.dto.ProductDto;

// 요한

@Service
public class ProductService {
	
	private ModelAndView mv;
	
	@Autowired
	private ProductDao pDao;
	
	public ModelAndView productinfo(String cate) {	
		mv = new ModelAndView();
		ArrayList<ProductDto> pList = pDao.productinfo(cate);
		int vNum = pList.get(0).getP_views() + 1;
		pList.get(0).setP_views(vNum);
		pDao.pview(pList.get(0));		
		mv.setViewName("productContents");
		mv.addObject("pList",pList);
		System.out.println(pList.get(0));
		
		ArrayList<OpptionDto> opList = pDao.opptioninfo(cate);
		mv.addObject("opList", opList);
		System.out.println(opList.get(0));
		
		return mv;
	} // 제품 상세 끝

} // class end
