package com.teamb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamb.model.Admin2DTO;
import com.teamb.service.AdminMapper2;

@Controller
public class AdminController2 
{
	@Autowired
	private AdminMapper2 adminmapper;
	
	/*@RequestMapping(value = "/insert.admin", method = RequestMethod.GET)
	public String Insert()
	{
		return "login2/InsertAdmin";
	}*/
	
	@RequestMapping(value = "/insert.admin", method = RequestMethod.POST)
	public String InsertPro(HttpServletRequest req, @ModelAttribute Admin2DTO dto)
	{
		
		int res = adminmapper.InsertAdmin(dto);
		
		String msg = null;
		String url = "main.member";

		if (res > 0)
		{
			msg = "성공";
		}
		else
		{
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "login/message";
	}
	
	/*@RequestMapping(value = "/login.admin", method = RequestMethod.GET)
	public String Login()
	{
		return "login2/login";
	}*/
	
	@RequestMapping(value = "/login.admin", method = RequestMethod.POST)
	public String LoginPro(HttpServletRequest req, @ModelAttribute Admin2DTO dto)
	{
		System.out.print("id = " + dto.getA_id());
		System.out.println(", passwd = " + dto.getA_passwd());
		
		String msg = null, url = null;
		
		if(adminmapper.IDcheck(dto.getA_id(), dto.getA_passwd()))
		{
			msg = "성공";
			url = "Q_list.board";
			
			HttpSession session = req.getSession();
			session.setAttribute("a_id", dto.getA_id());
			session.setAttribute("a_passwd", dto.getA_passwd());
		}
		else
		{
			msg = "실패";
			url = "login2/login";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
			
		return "login/message";
	}
	
	@RequestMapping(value = "logout.admin")
	public String logout(HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		session.removeAttribute("a_id");
		session.removeAttribute("a_passwd");
		
		System.out.println("로그아웃");
		System.out.print("id = " + session.getAttribute("a_id"));
		System.out.println(", passwd = " + session.getAttribute("a_passwd"));
		
		return "login/main";
	}
	
	@RequestMapping(value = "logincheck.admin")
	public String logincheck(HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		
		System.out.println("관리자 로그인 정보");
		System.out.print("id = " + session.getAttribute("a_id"));
		System.out.println(", passwd = " + session.getAttribute("a_passwd"));
		
		return "login/main";
	}
}