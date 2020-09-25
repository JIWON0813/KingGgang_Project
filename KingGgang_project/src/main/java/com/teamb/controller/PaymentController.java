package com.teamb.controller;

import java.io.IOException;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
			if(type == 2) {
				int res_id =  dto.getP_no();
				rentcarMapper.changePstSuc(res_id);
				req.setAttribute("status",1);
			}
			else{
				int id = dto.getP_no();
				hotelmapper.changevaild(id);
				req.setAttribute("status",0);
			}
			
			
			//결제내역
			int no = paymemtMapper.getPayno(m_no);
			
			PaymentDTO pdto = paymemtMapper.getPaymentNo(no);
			
			MemberDTO mdto = memberMapper.getMember(pdto.getM_no());
			//1일경우 호텔, 2일경우 렌트
			RoomDTO rdto= null;
			HotelDTO hdto= null;
			Rentcar_ResDTO resdto = null;
			RentcarDTO cardto= null;
			RoomDateDTO rddto = null;
			if(pdto.getType() == 1){
				rddto = hotelmapper.getRoomDate(pdto.getP_no());
				rdto = hotelmapper.getRoom(rddto.getRoom_id());
				hdto = hotelmapper.getHotel(rdto.getH_id());
			} 
			else{
				resdto = rentcarMapper.getRentcarRes(pdto.getP_no());
				cardto = rentcarMapper.getRentcar(resdto.getR_id());
			}
			PaymentListData pldto = new PaymentListData(pdto,mdto,rddto,rdto,hdto,resdto,cardto);
			
			req.setAttribute("status", status);
			req.setAttribute("pldto", pldto);
			req.setAttribute("buyer_name", buyer_name);
		
			return "payment/paycomplete";
			
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
	public String myPayment(HttpServletRequest req,HttpSession session) {
		
		
		int memberNum = (int)session.getAttribute("memberNum");
		
		List<PaymentDTO> list = paymemtMapper.getmyPaylist(memberNum);
		List<PaymentListData> plist = new ArrayList<PaymentListData>();
		List<PaymentListData> rlist = new ArrayList<PaymentListData>();
		Iterator<PaymentDTO> iter = list.iterator();
		while(iter.hasNext()){
			PaymentDTO pdto = iter.next();
			MemberDTO mdto = memberMapper.getMember(pdto.getM_no());
			//1일경우 호텔, 2일경우 렌트
			RoomDTO rdto= null;
			HotelDTO hdto= null;
			Rentcar_ResDTO resdto = null;
			RentcarDTO cardto= null;
			RoomDateDTO rddto = null;
			if(pdto.getType() == 1){			
				rddto = hotelmapper.getRoomDate(pdto.getP_no());
				rdto = hotelmapper.getRoom(rddto.getRoom_id());
				hdto = hotelmapper.getHotel(rdto.getH_id());
				plist.add(new PaymentListData(pdto, mdto, rddto, rdto,hdto,resdto,cardto));
			} 
			else{
				resdto = rentcarMapper.getRentcarRes(pdto.getP_no());
				cardto = rentcarMapper.getRentcar(resdto.getR_id());
				rlist.add(new PaymentListData(pdto, mdto, rddto, rdto,hdto,resdto,cardto));
			}
			
			
		}
		
		req.setAttribute("plist", plist);
		req.setAttribute("rlist", rlist);
		
			return "my/mypagePayment";
	}

	
}



	
	