package com.teamb.controller;

import java.io.IOException;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.HotelDTO;
import com.teamb.model.RentcarDTO;

import com.teamb.model.WishlistDTO;
import com.teamb.service.WishlistMapper;

/*
이	   름 : WishController.java


개  발   자 : 원세호
설	   명 : 관심리스트 컨트롤러
*/

 


//rroll2 
/**
 * Handles requests for the application home page.
 */

@Controller
public class WishController {
	
	@Autowired
	private WishlistMapper wishlistmapper;
	
	@RequestMapping("/main.wish")
	public String mypageMain() {
		
		return "payment/wishins";
		
	}
	
	@RequestMapping("/insert.wish")
	public String myPayment(HttpServletRequest req,@ModelAttribute WishlistDTO dto) {
		
		int f_no = Integer.parseInt(req.getParameter("f_no"));
		List<WishlistDTO> noCheck = wishlistmapper.getNolist(dto);
		boolean check1 =true;
		
		for(WishlistDTO check : noCheck) {
			System.out.println(check.getF_no());
			if(check.getF_no()!=f_no) {
				continue;
			}else if(check.getF_no()==f_no) {
				check1 = false;
			}
		}
		
		System.out.println(check1);
		String msg=null,url=null;
		
		if(check1) {
		int res = wishlistmapper.insertWish(dto);
		if(res>0){
			msg = "관심상품 등록 성공!! ";
			url = "main.wish";
		}else{
			msg = "관심상품 등록 실패!!";
			url = "main.wish";
		}
	}else{
		msg ="이미 관심상품에 등록된 상품입니다. 상품리스트로 돌아갑니다.";
		url ="main.wish";
	}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
}
	@RequestMapping("/list.wish")
	public String wishList(HttpServletRequest req,HttpSession session,@ModelAttribute WishlistDTO dto)
	throws IOException{
		//session.getAttribute("id"); 로그인 세션에서 받음 
		//
		int m_no = 1;
		dto.setNo(m_no);
		//
		List<HotelDTO> hlist = new ArrayList<HotelDTO> ();
		List<RentcarDTO> rlist = new ArrayList<RentcarDTO> ();
		List<WishlistDTO> Wlist = wishlistmapper.getWishlist(m_no);
			for(WishlistDTO wdto : Wlist) {
			System.out.println(wdto.getType());
			if(wdto.getType()==1) {
				HotelDTO hdto =  wishlistmapper.getHotellist(wdto.getF_no());
				hlist.add(hdto);
			} else {
				RentcarDTO rdto = wishlistmapper.getRentlist(wdto.getF_no());
				rlist.add(rdto);
			}
		}
			for(HotelDTO hdto : hlist) {
				System.out.println(hdto.getCategory());
			}
			
			req.setAttribute("hlist", hlist);
			req.setAttribute("rlist", rlist);
			return "my/mypageWishlist";
	}
	
	@RequestMapping("/delete.wish")
	public String deleteWish(HttpServletRequest req,HttpSession session,@ModelAttribute WishlistDTO dto) {
		int f_no = Integer.parseInt(req.getParameter("f_no"));
		dto.setF_no(f_no);
		System.out.println(f_no);
		
		//session.getAttribute("id"); 로그인 세션에서 받음 
		
		//
		int m_no = 4;
		dto.setNo(m_no);
		//
		
		int res = wishlistmapper.deleteWish(dto);
		String msg=null,url=null;
		if(res>0){
			msg = "관심상품 삭제 성공!!,마이페이지로 이동합니다. ";
			url = "main.my";
		}else{
			msg = "관심상품 등록 실패!!,관심리스트로 이동합니다.";
			url = "list.wish";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
	}
	
}

	
	

