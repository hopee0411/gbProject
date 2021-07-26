package com.hm.gongbang;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/jq")

public class Jquery {

	
	

	@RequestMapping("/jq.cls")
	public ModelAndView main(ModelAndView mv, HttpSession s, RedirectView rv) {
		mv.setViewName("jq/test");
		return mv;
	}

	@RequestMapping("/pay.cls")
	public ModelAndView serve(ModelAndView mv, HttpSession s, RedirectView rv) {
		mv.setViewName("jq/serve");
		return mv;
	}
	@RequestMapping("/kakaopay.cls")
	@ResponseBody
	public String kakaopay() {
		try {
			URL ad = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection join = (HttpURLConnection) ad.openConnection();
			join.setRequestMethod("POST");
			join.setRequestProperty("Authorization", "KakaoAK 1e64f337e1a950c6371193f2f0160380");
			join.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			join.setDoOutput(true);
			String para = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=engitem&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://developers.kakao.com/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
			OutputStream a = join.getOutputStream();
			DataOutputStream da = new DataOutputStream(a);
			da.writeBytes(para);

			da.close();

			int rs = join.getResponseCode();

			InputStream b;
			if (rs == 200) {
				b= join.getInputStream();
			} else {
				b = join.getErrorStream();
			}
			InputStreamReader ri = new InputStreamReader(b);
			BufferedReader	ch = new BufferedReader(ri);
			return ch.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		/* return "(\"result\":\"NO\"}"; */
		return "(\'result\':\'NO\')"; 
	}
}
