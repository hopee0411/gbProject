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
			URL 주소 = new URL("https:// kapi.kakao.com/v1/payment/ready");
			HttpURLConnection 서버연결 = (HttpURLConnection) 주소.openConnection();
			서버연결.setRequestMethod("POST");
			서버연결.setRequestProperty("Authorization", "KakaoAK 1e64f337e1a950c6371193f2f0160380");
			서버연결.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			서버연결.setDoOutput(true);
			String 파라미터 = "cid=TC0ONETIME&partner_order_id=partner_order_id&=partner_user_id=partner_user_id&item_name=engitem&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://developers.kakao.com/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
			OutputStream 주는애 = 서버연결.getOutputStream();
			DataOutputStream 데이타주는애 = new DataOutputStream(주는애);
			데이타주는애.writeBytes(파라미터);

			데이타주는애.close();

			int 결과 = 서버연결.getResponseCode();

			InputStream 받는애;
			if (결과 == 200) {
				받는애 = 서버연결.getInputStream();
			} else {
				받는애 = 서버연결.getErrorStream();
			}
			InputStreamReader 읽는애 = new InputStreamReader(받는애);
			BufferedReader 형변환하는애 = new BufferedReader(읽는애);
			return 형변환하는애.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "(\"result\":\"NO\"}"; 
	}
}
