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

import com.teamb.model.MemberDTO;
import com.teamb.service.MemberMapper;


@Controller
public class Comm_MemberController {
	@Autowired
	private MemberMapper memberMapper;
	
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	

	/*@RequestMapping(value = "/memberAll.do")
	public String listMember(HttpServletRequest req,MemberDTO dto){
		
		List<MemberDTO> list = memberMapper.memberList();
		
		req.setAttribute("memberList", list);
		req.setAttribute("upLoadPath", upLoadPath);
		String mode = req.getParameter("mode");
		
		return "memberAll";
	}*/
	
	/*@RequestMapping(value = "/member_search.do")
	public String searchMemberForm(HttpServletRequest req){
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "login/search";
	}
	
	@RequestMapping(value = "/member_search_ok.do")
//	public ModelAndView searchMember_id(HttpServletRequest req){ 
		public String searchMember_id(HttpServletRequest req){ 
		String mode = req.getParameter("mode");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		System.out.println(mode);
		String msg = null, url = null;
		if(mode.equals("search_id")){
			if(memberMapper.searchMember_id(name, email) != null){
				msg = "占쏙옙占싱듸옙占� "+ memberMapper.searchMember_id(name, email) +" 占쌉니댐옙.";
			}
			else{
				msg="占쏙옙溝占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙.";
			}
			url="login.do";
		}else if(mode.equals("pw")){
			String id = req.getParameter("id");
			if(memberMapper.searchMember_pw(name, email, id) != null){	
				msg = "占쏙옙橘占싫ｏ옙占� "+ memberMapper.searchMember_pw(name, email, id) +" 占쌉니댐옙.";
			}
			else{
				msg="占쏙옙溝占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙.";
			}
			url="login.do";
		}else{
			msg ="占쏙옙溝占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙.";
			url="login.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
		
		}*/
	
	@RequestMapping(value="/comm_member_edit.do", method=RequestMethod.GET)
	public ModelAndView memberEdit(HttpServletRequest req,@RequestParam int memberNum){
		MemberDTO dto = memberMapper.getMember(memberNum);
		ModelAndView mav = new ModelAndView
				("comm/comm_member_edit", "getMember", dto);
		
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
		req.setAttribute("getMember", memberMapper.getMember(memberNum));
		
		return mav;
	}
	
	
		
	@RequestMapping(value = "/comm_member_edit_ok.do", method = RequestMethod.POST)
	public String memberEditOk(HttpServletRequest req, HttpSession session, @ModelAttribute MemberDTO dto,
			BindingResult result) {
		
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
}