package com.teamb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamb.model.CouponDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.CouponMapper;

/*
이	   름 : CouponController class
개  발   자 : 박 준 언
설	   명 : 쿠폰관리페이지 컨트롤러  
*/

@Controller
public class CouponController {
	@Autowired
	private	CouponMapper couponMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@RequestMapping(value="/couponList.co")
	public String couponList(HttpServletRequest req){
		List<CouponDTO> list = couponMapper.couponList();
		req.setAttribute("couponList", list);
		return "admin/coupon/couponList";
	}
	
	@RequestMapping(value="/insertCoupon.co")
	public String insertCoupon(HttpServletRequest req){
		List<MemberDTO> list = couponMapper.memberList();
		req.setAttribute("memberli", list);
		return "admin/coupon/insertCoupon";
	}
	@RequestMapping(value="/insertCouponPro.co")
	public String insertCouponPro(HttpServletRequest req,CouponDTO dto){	
		int res = couponMapper.insertCoupon(dto);
		String msg=null,url=null;
		if(res>0){
			msg="쿠폰생성완료";
			url="couponList.co";
		}else{
			msg="쿠폰생성실패";
			url="insertCoupon.co";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
		/*boolean isCheck = couponMapper.checkId(dto.getM_id());
		int res = couponMapper.insertCoupon(dto);
		String msg=null,url=null;
		if(!isCheck){
			if(res>0){
				msg="쿠폰생성완료";
				url="couponList.co";
			}else{
				msg="쿠폰생성실패";
				url="insertCoupon.co";
			}
		}else{
			msg="ID가 존재하지 않습니다.";
			url="redirect:insertCoupon.co";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";*/
	}
	@RequestMapping(value="/deleteCoupon.co")
	public String deleteCoupon(HttpServletRequest req,int no){
		int res = couponMapper.deleteCoupon(no);
		String msg=null,url=null;
		if(res>0){
			msg="쿠폰삭제완료";
			url="couponList.co";
		}else{
			msg="쿠폰삭제실패";
			url="couponList.co";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping(value="/updateCoupon.co")
	public String updateCoupon(HttpServletRequest req,int no){
		List<MemberDTO> list = couponMapper.memberList();
		req.setAttribute("memberli", list);
		CouponDTO dto = couponMapper.getCoupon(no);
		req.setAttribute("getCoupon", dto);
		return "admin/coupon/updateCoupon";
	}
	@RequestMapping(value="/updateCouponPro.co")
	public String updateCouponPro(HttpServletRequest req,CouponDTO dto){
		int res = couponMapper.updateCoupon(dto);
		String msg=null,url=null;
		if(res>0){
			msg="쿠폰수정완료";
			url="couponList.co";
		}else{
			msg="쿠폰수정실패";
			url="couponList.co";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	
	}
}
