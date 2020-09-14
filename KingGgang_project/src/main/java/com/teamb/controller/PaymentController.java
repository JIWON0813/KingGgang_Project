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
import com.teamb.model.RentcarDTO;

import com.teamb.model.WishlistDTO;
import com.teamb.model.PaylistDTO;
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

		
	@RequestMapping("/main.pay")
	public String payMain() {
		return "payment/payins";
	}
	
	@RequestMapping("/insert.pay")
	public String paymentInsert(HttpServletRequest req,@ModelAttribute PaymentDTO pdto,MemberDTO mdto) {
		//로그인 세션에서 가져오는아이디 값
		int m_no = Integer.parseInt(req.getParameter("m_no"));
		int type = Integer.parseInt(req.getParameter("type"));
		int totalPrice= Integer.parseInt(req.getParameter("price"));
		
		if(type == 2) {
			pdto.setP_no(Integer.parseInt(req.getParameter("res_id")));
		} else {
			pdto.setP_no(Integer.parseInt(req.getParameter("id")));
		}
		
		System.out.println(pdto.getP_no());
		int res =  paymemtMapper.insertPayment(pdto);
		String msg=null,url=null;
		if(res>0){
			int no = paymemtMapper.getPayno(pdto.getM_no());
			System.out.println(no);
			req.setAttribute("no", no);
			System.out.println(totalPrice);
			req.setAttribute("totalPrice", totalPrice);
			MemberDTO mrdto =  paymemtMapper.getpayMember(m_no);
			System.out.println(mrdto.getEmail());
			req.setAttribute("mrdto", mrdto);
			req.setAttribute("m_no", m_no);
			return "payment/payins2";
		} else {
			msg = "결제 실패!! 상품리스트로 돌아갑니다.";
			url = "main.pay";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
	}
	
	@RequestMapping("/complete.pay")
	public String payMained(HttpServletRequest req,@RequestParam int no,PaymentDTO dto ,RentcarDTO rdto) {
		//로그인 세션에서 가져오는 값
		
		System.out.println(no);
		//dto.setP_no(Integer.parseInt(req.getParameter("r_id")));
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		Date now = new Date();
		
		String paydate =  format1.format(now);
		System.out.println(paydate);
		dto.setNo(no);
		dto.setPaydate(paydate);
		//valid 결제전 0 결제후 1
		int valid = 1;
		dto.setValid(valid);
		
		int res = paymemtMapper.updatePayment(dto);
		String msg = null, url=null;
		if (res>0) {
			dto = paymemtMapper.getPaymentNo(no);
			int type =  dto.getType();
			System.out.println(type);
			if(type == 2) {
				int res_id =  dto.getP_no();
				System.out.println(res_id);
				rentcarMapper.changePstSuc(res_id);
			}
			url = "main.my";
			msg = "결제성공 마이페이지로 이동합니다.";
		}else {
			paymemtMapper.deletePayment(no);
			url = "main.my";
			msg = "결제실패 마이페이지로 이동합니다.";
		}
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
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
	public String myPayment(PaylistDTO tdto,PaymentDTO pdto,HttpServletRequest req) {
		//session.getAttribute("id"); 로그인 세션에서 받음
		//
		int m_no = 1;
		int valid = 1;//결제완료 = 1;
		//pdto.setM_id(m_id);
		//
		pdto.setM_no(m_no);
		pdto.setValid(valid);
		
		List<PaymentDTO> Plist = paymemtMapper.getPaymentlist(pdto);
		List<PaylistDTO> Phlist = new ArrayList<PaylistDTO>();
		List<PaylistDTO> Prlist = new ArrayList<PaylistDTO>();
		for(PaymentDTO ptdto : Plist) {
			if(ptdto.getType()==1) {//호텔결제내역 
				System.out.println(ptdto.getM_no());
				System.out.println(ptdto.getP_no());
				System.out.println(ptdto.getType());
				PaylistDTO phdto = paymemtMapper.getmyPaylist(ptdto);
				System.out.println(phdto.getH_name());
				Phlist.add(phdto);
			} else {
				System.out.println(ptdto.getM_no());
				System.out.println(ptdto.getP_no()); 
				System.out.println(ptdto.getType());
				PaylistDTO prdto = paymemtMapper.getmyPaylist(ptdto);
				//System.out.println(prdto.getR_company());
				Prlist.add(prdto);
			}
			
		}
		req.setAttribute("Phlist", Phlist);
		req.setAttribute("Prlist", Prlist);
		
		//paytestDTO dt = paymemtMapper.getPaytest(m_id);
		
		
		return "my/mypagePayment";
	}
	
	@RequestMapping("/adpayment.my")
	public String adPayment(PaylistDTO tdto,PaymentDTO pdto,HttpServletRequest req) {
		int valid =1;//결제완료 = 1;
		
		List<PaymentDTO> Plist = paymemtMapper.getAllPaymentlist(valid);
		List<PaylistDTO> Phlist = new ArrayList<PaylistDTO>();
		List<PaylistDTO> Prlist = new ArrayList<PaylistDTO>();
		for(PaymentDTO ptdto : Plist) {
			if(ptdto.getType()==1) {//호텔결제내역 
				System.out.println(ptdto.getM_no());
				System.out.println(ptdto.getP_no());
				System.out.println(ptdto.getType());
				PaylistDTO phdto = paymemtMapper.getadPaylist(ptdto);
				System.out.println(phdto.getH_name());
				Phlist.add(phdto);
			} else {//렌트카 결제내
				System.out.println(ptdto.getM_no()); 
				System.out.println(ptdto.getP_no());
				System.out.println(ptdto.getType());
				PaylistDTO prdto = paymemtMapper.getadPaylist(ptdto);
				
				Prlist.add(prdto);
			}
			
		}
		//전체 보기 타입1
		int type = 1;
		req.setAttribute("type", type);
		req.setAttribute("Phlist", Phlist);
		req.setAttribute("Prlist", Prlist);
		
		
		return "my/adminPayment";
	} 
	
	@RequestMapping("/adpayfind.my")//찾
	public String adpayfind(HttpServletRequest req,PaymentDTO pdto) {
		int memberNum = 1;
		String id = req.getParameter("id");
		MemberDTO mdto = memberMapper.getMember(memberNum);
		int m_no =  mdto.getMemberNum();
		pdto.setM_no(m_no);
		int valid = 1;
		pdto.setValid(valid);
		List<PaymentDTO> Plist = paymemtMapper.getPaymentlist(pdto);
		List<PaylistDTO> Phlist = new ArrayList<PaylistDTO>();
		List<PaylistDTO> Prlist = new ArrayList<PaylistDTO>();
		for(PaymentDTO ptdto : Plist) {
			if(ptdto.getType()==1) {//호텔결제내역 
				System.out.println(ptdto.getM_no());
				System.out.println(ptdto.getP_no());
				System.out.println(ptdto.getType());
				PaylistDTO phdto = paymemtMapper.getadPaylist(ptdto);
				System.out.println(phdto.getH_name());
				Phlist.add(phdto);
			} else {
				System.out.println(ptdto.getM_no()); 
				System.out.println(ptdto.getP_no());
				System.out.println(ptdto.getType());
				PaylistDTO prdto = paymemtMapper.getadPaylist(ptdto);
				System.out.println(prdto.getH_name());
				Prlist.add(prdto);
			}
			
		}
		//찾기 타입 2
		int type = 2;
		req.setAttribute("type", type);
		req.setAttribute("Phlist", Phlist);
		req.setAttribute("Prlist", Prlist);
		
		
		return "my/adminPayment";
		
	}

	
}



	
	

