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

/*
이	   름 : LoginController class
개  발   자 : 박 준 언
설	   명 : 로그인 컨트롤러  
*/

@Controller
public class LoginController {

	@Autowired
	private LoginMapper loginMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/login.log")
	public String login(HttpServletRequest req) {
		return "login/login";
	}

	@RequestMapping(value = "/loginOk.log")
	public String loginOk(MemberDTO dto, HttpServletRequest req,HttpServletResponse resp) {
		HttpSession session = req.getSession();
		MemberDTO login = loginMapper.login(dto);
		String msg = null, url = null;
		if (login == null) {
			session.setAttribute("login", null);
			msg = "로그인 실패하였습니다. 아이디와 비밀번호를 확인해 주세요.";
			url = "login.log";
		} else {
			if (login.getFilename() == null) {
				login.setFilename("default.jpg");
			}
			session.setAttribute("login", login);
			session.setAttribute("upLoadPath", upLoadPath);
			msg = "로그인 하였습니다";
			url = "main.mem";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/logout.log")
	public String logout(HttpServletRequest req, HttpSession session) {
		loginMapper.logout(session);
		String msg = "로그아웃 되었습니다.";
		String url = "main.mem";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
}
