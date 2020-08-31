package com.teamb.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamb.model.MemberDTO;
import com.teamb.service.LoginMapper;
import com.teamb.service.MemberMapper;

/*
�씠	   由� : LoginController class
媛�  諛�   �옄 : 諛� 以� �뼵
�꽕	   紐� : 濡쒓렇�씤 而⑦듃濡ㅻ윭  
*/

@Controller
public class LoginController {

	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private MemberMapper memberMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/login.log")
	public String login(HttpServletRequest req) {
		return "login/login";
	}

	@RequestMapping(value = "/loginOk.log")
	public String loginOk(MemberDTO dto, HttpServletRequest req,HttpSession session) {
		dto.setId(req.getParameter("id"));
	    dto.setPasswd(req.getParameter("passwd"));
	      
	      int res = loginMapper.loginOk(dto);      
	      String msg = null, url = null;
	      switch(res){
	      case MemberDTO.OK:
	         session = req.getSession();
	         session.setAttribute("mbId", dto.getId());
	         
	         int memberNum = memberMapper.getMemberNum(dto.getId());
	            session.setAttribute("memberNum",memberNum);
	            session.setAttribute("member",memberMapper.getMember(memberNum));
	            session.setAttribute("memberName", memberMapper.getMember(memberNum).getName());
	            session.setAttribute("memberEmail", memberMapper.getMember(memberNum).getEmail());

	            if(dto.getId().equals("admin")) {
	            msg = "관리자만 이용 가능";
	            url = "main.mem";
	            }
	            else{
	            msg = "회원가입 성공. 메인으로 이동";
	            url = "main.mem";
	            }
	            
	            break;
	      
	      case MemberDTO.NOT_ID :
	         msg = "ID오류";
	         url = "main.mem";
	         break;
	      case MemberDTO.NOT_PW :
	         msg = "비밀번호 오류 ";
	         url = "main.mem";
	         break;
	      case MemberDTO.ERROR :
	         msg = "DB실패!!";
	         url = "main.mem";
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";
	   }

	@RequestMapping("/logout.log")
	public String logout(HttpServletRequest req, HttpSession session) {
		session = req.getSession();
		session.invalidate();
		
		String msg = "로그아웃되었습니다.";
		String url = "main.mem";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
}
