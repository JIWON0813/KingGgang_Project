package com.teamb.controller;

import java.io.IOException;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.teamb.model.HotelDTO;
import com.teamb.model.MemberDTO;
import com.teamb.model.PaymentDTO;
import com.teamb.model.PaymentListData;
import com.teamb.model.RentcarDTO;
import com.teamb.model.Rentcar_ResDTO;
import com.teamb.model.RoomDTO;
import com.teamb.model.RoomDateDTO;
import com.teamb.model.WishlistDTO;
import com.teamb.model.PaylistDTO;
import com.teamb.service.HotelMapper;
import com.teamb.service.MemberMapper;
import com.teamb.service.PaymentMapper;
import com.teamb.service.RentcarMapper;
import com.teamb.service.WishlistMapper;

/*
이	   름 : PaymentController.java
개  발   자 : 원세호
설	   명 : 결제시스템 컨트롤러
*/


@Controller
public class PaymentController {
	
	@Autowired
	private PaymentMapper paymemtMapper;
		
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private RentcarMapper rentcarMapper;
	
	@Autowired
	private HotelMapper hotelMapper;

	@Autowired
	private HotelMapper hotelmapper;

		
	@RequestMapping("/main.pay")
	public String payMain() {
		return "payment/payins";
	}
	

	
	@RequestMapping("/complete.pay")
	public String payMained(HttpServletRequest req,@ModelAttribute PaymentDTO dto) {
		//로그인 세션에서 가져오는 값
		String buyer_name = req.getParameter("buyer_name");
		int m_no = Integer.parseInt(req.getParameter("m_no"));
		
		dto.setM_no(m_no);
		dto.setType(Integer.parseInt(req.getParameter("type")));
		dto.setPrice(Integer.parseInt(req.getParameter("totalPrice")));
		
		if(dto.getType() == 1) {
			dto.setP_no(Integer.parseInt(req.getParameter("id")));
		} else {
			dto.setP_no(Integer.parseInt(req.getParameter("res_id")));
		}
		
		int status = 1;
		int res =  paymemtMapper.insertPayment(dto);
		String msg = null, url=null;
		if (res>0) {
			int type =  dto.getType();
			System.out.println(type);
			if(type == 2) {
				int res_id =  dto.getP_no();
				rentcarMapper.changePstSuc(res_id);
				req.setAttribute("status",1);
			}

			url = "main.my";
			msg = "결제성공 마이페이지로 이동합니다.";
		}else {
			url = "main.my";
			msg = "결제실패 마이페이지로 이동합니다.";
		}
		
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		return "message";
		
	}
	
	@RequestMapping("/rentcarFin.pay")
	public String rentcarFin(HttpServletRequest req) {
		String url = "main.my";
		String msg = "마이페이지로 이동합니다.";
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		req.setAttribute("status", 1);
		return "message";
	}
	
	@RequestMapping("/HotelFin.pay")
	public String HotelFin(HttpServletRequest req) {
		String url = "main.my";
		String msg = "마이페이지로 이동합니다.";
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		req.setAttribute("status", 0);
		return "message";
	}
	
	@RequestMapping("/delete.pay")
	public String payDelete(HttpServletRequest req,@RequestParam int no,PaymentDTO dto) {
		System.out.println(no);
		int res = paymemtMapper.deletePayment(no);
		String msg = null, url=null;
		if (res>0) {
			url = "main.my";
			msg = "결제실패 마이페이지로 이동합니다.";
		}else {
			url = "main.my";
			msg = "결제실패 마이페이지로 이동합니다.";
		}
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		return "message";
	}
	
	@RequestMapping("/payment.my")
	public String myPayment(PaylistDTO tdto,PaymentDTO pdto,HttpServletRequest req,HttpSession session) {
		
		
		int memberNum = (int)session.getAttribute("memberNum");
		pdto.setM_no(memberNum);
		
		
		List<PaymentDTO> Plist = paymemtMapper.getPaymentlist(pdto);
		List<PaylistDTO> Phlist = new ArrayList<PaylistDTO>();
		List<PaylistDTO> Prlist = new ArrayList<PaylistDTO>();
		for(PaymentDTO ptdto : Plist) {
			if(ptdto.getType()==1) {
				PaylistDTO phdto = paymemtMapper.getmyPaylist(ptdto);
				Phlist.add(phdto);
			} else {
				PaylistDTO prdto = paymemtMapper.getmyPaylist(ptdto);
				Prlist.add(prdto);
			}
		}
		req.setAttribute("Phlist", Phlist);
		req.setAttribute("Prlist", Prlist);
			return "my/mypagePayment";
	}

	
}



	
	