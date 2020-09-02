// 지은
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.Comm_MemberMapper;
import com.teamb.service.LoginMapper;


@Controller
public class Comm_MemberController {
	@Autowired
	private Comm_MemberMapper memberMapper;
	
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@RequestMapping(value="/comm_login.do")
	public String comm_login(HttpSession session){
		int memberNum = (Integer)session.getAttribute("memberNum");
		//int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
		return "comm/login/comm_login";
	}
	
	/*@RequestMapping(value="/comm_logout.do")
	public String comm_logout( HttpServletRequest req,HttpSession session){
		int memberNum = (Integer)session.getAttribute("memberNum");
		session.invalidate();
		String msg = "로그아웃 되었습니다.";
		String url = "commhome.comm";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}*/
	
	@RequestMapping(value = "/comm_loginOk.do")
	public String comm_loginOk(Comm_MemberDTO dto, HttpServletRequest req,HttpSession session) {
		Comm_MemberDTO login = memberMapper.comm_loginOk(dto);
		String msg = null, url = null;
		if (login == null) {
			session.setAttribute("comm_login", null);
			msg = "등록정보가 없습니다. 가입 페이지로 이동합니다.";
			url = "comm_member_input.do";
		} else {
			session.setAttribute("comm_login", login);
			msg = "로그인 하였습니다";
			url = "commhome.comm";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}	
	
	@RequestMapping("/comm_member_input.do")
	public String comminsertMemberForm(HttpServletRequest req,HttpSession session){
		int memberNum = (Integer)session.getAttribute("memberNum");
		
		String msg = null, url = null;
		
		return "comm/member/comm_insertMember";
	}
	
	@RequestMapping("/comm_member_input_ok.do")
	public String comminsertMember(HttpServletRequest req, HttpSession session,
											Comm_MemberDTO dto,BindingResult result){
		
		int memberNum = (Integer)session.getAttribute("memberNum");
	       
		
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
			
			dto.setComm_profilename(comm_profilename);
			dto.setComm_profilesize(comm_profilesize);
			dto.setMemberNum(memberNum);
		
		    
		
		    int res = memberMapper.comm_insertMember(dto);
		  //  session.setAttribute("num", ); 
		    // 가입하면서 dto에 저장된 memberNum값 저장!!!! 해서 'input.do'실행시 값 가져오기 해아 중복 가입이 안됨.
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
		//session.setAttribute("list_comm_memberNum", list.get(index)));
		req.setAttribute("upLoadPath", upLoadPath);
		
		return "comm/member/comm_memberList";
	}
	
	
	@RequestMapping(value="/comm_member_edit.do")
	public ModelAndView commMemberEdit(HttpServletRequest req,HttpSession session,
											@RequestParam int comm_memberNum){
		Comm_MemberDTO dto = memberMapper.comm_getMember(comm_memberNum);
		//session.getAttribute("comm_memberNum");
		ModelAndView mav = new ModelAndView
				("comm/member/comm_member_edit", "getMember", dto);
		
		//req.setAttribute("comm_getMember", memberMapper.comm_getMember(comm_memberNum));
		
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
			url="comm_memberList.do";
		}else{
			msg="회원삭제실패!";
			url="comm_memberList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";	
	}
}