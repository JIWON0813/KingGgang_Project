package com.teamb.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamb.model.MemberDTO;
import com.teamb.service.LoginMapper;
import com.teamb.service.MemberMapper;

/*	이	   름 : LoginController class
	개  발   자 : 박 준 언 , 황지은
	설	   명 : 로그인 컨트롤러  
*/

@Controller
public class LoginController {

	@Autowired
	private LoginMapper loginMapper;
	private MemberMapper memberMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping("/login.log")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/logout.log")
	public String logout(HttpServletRequest req, HttpSession session) {

		session.invalidate();
		String msg = "로그아웃 되었습니다.";
		String url = "home.do";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/loginOk.log")
	   public String loginOk(HttpServletRequest req,HttpSession session){
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		int res = loginMapper.loginOk(id,passwd);
	      String msg = null, url = null;
	      switch(res){
	      case MemberDTO.OK:	    
	    	  MemberDTO dto = loginMapper.getMemberid(id);
	    	  
	            //지은
	            int memberNum = loginMapper.getMemberNum(dto.getId());
	               session.setAttribute("memberNum",memberNum);
	               
	            //지은
	             String name = loginMapper.getMemberName(dto.getId());
	                session.setAttribute("name", name);
	             MemberDTO comm_birth = loginMapper.getMemberBirth(dto.getId());
	             	session.setAttribute("birth", comm_birth.getAllBirth());
	            
	             //프로필사진
	             String profile_name = loginMapper.getMemberProfile(dto.getId());
	             	session.setAttribute("profilename", profile_name);

	    	  session.setAttribute("mbId", dto.getId());
	    	  session.setAttribute("upLoadPath", upLoadPath);
	            if(dto.getId().equals("admin")) {
	            msg = "관리자로 로그인 하였습니다.";
	            url = "home.do";
	            }else{
	            msg = "로그인 하였습니다.";
	            url = "home.do";
	            }
	            
	            break;
	      
	      case MemberDTO.NOT_ID :
	         msg = "등록된 회원이 아닙니다.";
	         url = "login.log";
	         break;
	      case MemberDTO.NOT_PW :
	         msg = "비밀번호를 확인해 주세요.";
	         url = "login.log";
	         break;
	      case MemberDTO.ERROR :
	         msg = "에러";
	         url = "index.mem";
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";
	   }
	@RequestMapping(value = "/member_search.log")
	public String searchMemberForm(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "login/search";
	}

	@RequestMapping(value = "/member_search_ok.log")
	public String searchMember_id(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String msg = null, url = null;
		if (mode.equals("search_id")) {
			if (loginMapper.searchMember_id(name, email) != null) {
				msg = "회원님 아이디는 " + loginMapper.searchMember_id(name, email) + " 입니다.";
			} else {
				msg = "이름과 이메일을 확인해주세요.";
			}
			url = "login.log?id="+loginMapper.searchMember_id(name, email);
			req.setAttribute("id", loginMapper.searchMember_id(name, email));
		} else if (mode.equals("pw")) {
			String id = req.getParameter("id");
			if (loginMapper.searchMember_pw(name, email, id) != null) {
				msg = "회원님 비밀번호는 " + loginMapper.searchMember_pw(name, email, id) + " 입니다.";
			} else {
				msg = "이름과 이메일, 아이디를 확인해 주세요.";
			}
			url = "login.log";
		} else {
			msg = "잘못 입력 하였습니다..";
			url = "login.log";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);

		return "message";

	}
}
