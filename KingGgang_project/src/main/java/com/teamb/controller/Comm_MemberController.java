// 지은
package com.teamb.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.Comm_MemberMapper;
import com.teamb.service.MemberMapper;


@Controller
public class Comm_MemberController {
	@Autowired
	private Comm_MemberMapper memberMapper;
	
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	
	@RequestMapping(value = "/Comm_loginOk.log")
	public String comm_loginOk(Comm_MemberDTO dto, HttpServletRequest req,HttpSession session, int comm_memberNum) {
	      int res = memberMapper.comm_loginOk(dto);      
	      String msg = null, url = null;
	      switch(res){
	      case Comm_MemberDTO.OK:
	         session = req.getSession();
	         session.setAttribute("commId", dto.getMemberNum());
	         
	         //int memberNum = memberMapper.getMemberNum(dto.getId());
	         
	        session.setAttribute("comm_member",memberMapper.comm_getMember(comm_memberNum));
	        
	        MemberDTO mdto = new MemberDTO();
	            if(mdto.getId().equals("admin")) {
	            msg = "관리자만 이용 가능";
	            url = "commhome.comm";
	            }
	            else{
	            msg = "가입 성공. 메인으로 이동";
	            url = "commhome.comm";
	            }
	            
	            break;
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";
	   }


	/*@RequestMapping(value = "/memberAll.do")
	public String listMember(HttpServletRequest req,MemberDTO dto){
		
		List<MemberDTO> list = memberMapper.memberList();
		
		req.setAttribute("memberList", list);
		req.setAttribute("upLoadPath", upLoadPath);
		String mode = req.getParameter("mode");
		
		return "memberAll";
	}*/
	
	
	@RequestMapping(value="/comm_member_edit.do", method=RequestMethod.GET)
	public ModelAndView commMemberEdit(HttpServletRequest req,@RequestParam int comm_memberNum){
		Comm_MemberDTO dto = memberMapper.comm_getMember(comm_memberNum);
		ModelAndView mav = new ModelAndView
				("comm/comm_member_edit", "getMember", dto);
		
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
		req.setAttribute("comm_getMember", memberMapper.comm_getMember(comm_memberNum));
		
		return mav;
	}
		
	@RequestMapping(value = "/comm_member_edit_ok.do", method = RequestMethod.POST)
	public String commMemberEditOk(HttpServletRequest req, HttpSession session, 
			@ModelAttribute Comm_MemberDTO dto, BindingResult result) {
		
		int res = memberMapper.comm_updateMember(dto);

		String msg = null, url = null;
		if (res > 0) {
			msg = "회원수정성공! 메인페이지로 이동합니다.";
			url = "commhome.comm";
		} else {
			msg = "회원수정실패! 메인페이지로 이동합니다.";
			url = "commhome.comm";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/comm_member_delete.do")
	public String memberDelete(HttpServletRequest req,@RequestParam int comm_memberNum){
		int res = memberMapper.comm_deleteMember(comm_memberNum);
		String msg = null, url = null;
		if(res>0){
			msg="회원삭제성공!";
			url="commhome.comm";
		}else{
			msg="회원삭제실패!";
			url="commhome.comm";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";	
	}
}