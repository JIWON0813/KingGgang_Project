package com.teamb.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.service.Comm_MemberMapper;

/*
이	   름 : Comm_MemberController
개  발   자 : 황지은
성	   명 : 커뮤니티 로그인/멤버 컨트롤러
*/
@Controller
public class Comm_MemberController {
	@Autowired
	private Comm_MemberMapper memberMapper;
	
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@RequestMapping(value="/comm_login.do")
	public String comm_login(HttpSession session){
		int memberNum = (Integer)session.getAttribute("memberNum");
	
		return "comm/login/comm_login";
	}
	
	
	@RequestMapping(value = "/comm_loginOk.do")
	public String comm_loginOk(Comm_MemberDTO dto, HttpServletRequest req,HttpSession session) {
		Comm_MemberDTO login = memberMapper.comm_loginOk(dto);
		String msg = null, url = null;
        	if (login == null) {
			session.setAttribute("comm_login", null);
			msg = "등록정보가 없습니다. 닉네임을 확인해주세요.";
			url = "commhome.comm";
		} else {
			
			//인아쓰
			//session = req.getSession();
			//session.setAttribute("memberNum", dto.getComm_nickname());
			
			int comm_memberNum = memberMapper.comm_getmemberNum(dto.getComm_nickname());
			session.setAttribute("comm_memberNum",comm_memberNum);
	        session.setAttribute("commmember",memberMapper.comm_getMember(comm_memberNum));
	        
	        //지은쓰
			session.setAttribute("comm_login", login);
			session.setAttribute("login_comm_memberNum", login.getComm_memberNum());
				String comm_nickname = memberMapper.comm_getMember(comm_memberNum).getComm_nickname();
	          	session.setAttribute("comm_nickname", comm_nickname);
			msg = "로그인 하였습니다";
			url = "commhome.comm";
        	}
	
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}	
	
	@RequestMapping("/comm_checkMember.do")
	   public String commcheckMember(HttpServletRequest req,HttpSession session){
	      int memberNum = (Integer)session.getAttribute("memberNum");
	      
	      boolean isMember=memberMapper.comm_checkMember(memberNum);
	      String msg = null, url = null;
	      if (isMember){
	         msg="이미 등록된 회원입니다. 로그인을 해주세요.";
	         url="comm_login.do";
	      }else {
	         session.setAttribute("memberNum", memberNum);
	         msg="회원가입 페이지로 이동합니다.";
	         url="comm_member_input.do";
	      }
	      
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";
	   }
	
	@RequestMapping("/comm_member_input.do")
	public String comminsertMemberForm(HttpServletRequest req,HttpSession session){
		int memberNum = (Integer)session.getAttribute("memberNum");
		String name = (String)session.getAttribute("name");
				
		return "comm/member/comm_insertMember";
	}
	
	@RequestMapping("/comm_member_input_ok.do")
	public String comminsertMember(HttpServletRequest req, HttpSession session,
											Comm_MemberDTO dto,BindingResult result){
		
		int memberNum = (Integer)session.getAttribute("memberNum");
		 String comm_name = (String)session.getAttribute("name");   
		
		if (result.hasErrors()){
			dto.setMemberNum(0);
		}
		
		String comm_profilename="";
		int comm_profilesize=0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("comm_profilename");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if(file.getSize()>0){
			try {
				file.transferTo(target);
			} catch (IOException e) {}
			
			comm_profilename = file.getOriginalFilename();
			comm_profilesize=(int)file.getSize();
		}
			dto.setMemberNum(memberNum);
			dto.setComm_name(comm_name);
			dto.setComm_profilename(comm_profilename);
			dto.setComm_profilesize(comm_profilesize);
			
		
		    
		
		    int res = memberMapper.comm_insertMember(dto);
		String msg = null, url = null;
		if(res>0){
			msg="가입성공";
			url="comm_memberList.do";
			//url="commhome.comm"; 
		}else{
			msg="가입실패";
			url="commhome.comm";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	// 목록은 관리자만 볼 수 있음.
	@RequestMapping(value = "/comm_memberList.do")
	public String commlistMember(HttpServletRequest req,HttpSession session,Comm_MemberDTO dto){
		
		List<Comm_MemberDTO> list = memberMapper.comm_memberList();
		
		session.setAttribute("comm_memberList", list);
		
		return "comm/member/comm_memberList";
	}
	
	
	@RequestMapping(value="/comm_member_edit.do")
	public ModelAndView commMemberEdit(HttpServletRequest req,HttpSession session,
											@RequestParam int comm_memberNum){
		Comm_MemberDTO dto = memberMapper.comm_getMember(comm_memberNum);
		ModelAndView mav = new ModelAndView
				("comm/member/comm_member_edit", "comm_getMember", dto);
		
		
		return mav;
	}
		
	@RequestMapping(value = "/comm_member_edit_ok.do", method = RequestMethod.POST)
	public String commMemberEditOk(HttpServletRequest req, HttpSession session,
									Comm_MemberDTO dto, @RequestParam int comm_memberNum) {
		
		/*String comm_profilename="";
		int comm_profilesize=0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("comm_profile_name");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if(file.getSize()>0){
			try {
				file.transferTo(target);
			} catch (IOException e) {}
			
			comm_profilename = file.getOriginalFilename();
			comm_profilesize=(int)file.getSize();
		}
			
			dto.setComm_profilename(comm_profilename);
			dto.setComm_profilesize(comm_profilesize);*/
		
		
		
		int res = memberMapper.comm_updateMember(dto);
		String msg = null, url = null;
		if (res>0) {
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
			Comm_MemberDTO login = memberMapper.comm_getMember(comm_memberNum);
		String msg = null, url = null;
		if(res>0){
				HttpSession session = req.getSession();
				session.setAttribute("comm_login", login);
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
	
	@RequestMapping("/admin_comm_member_delete.do")
	public String adminmemberDelete(HttpServletRequest req,@RequestParam String comm_nickname){
		int res = memberMapper.admin_comm_deleteMember(comm_nickname);
			//Comm_MemberDTO login = memberMapper.comm_getMember(memberNum);
		String msg = null, url = null;
		if(res>0){
			//	HttpSession session = req.getSession();
			//	session.setAttribute("comm_login", login);
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