/*package com.teamb.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamb.model.B4_friendDTO;
import com.teamb.model.B4_memberDTO;
import com.teamb.service.B4_friendMapper;

@Controller
public class Comm_FriendController {
	private static final Logger logger = LoggerFactory.getLogger(Comm_FriendController.class);

	@Autowired
	private B4_friendMapper friendMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@RequestMapping(value ={"/"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
		
	}
	
	   @RequestMapping("/index.do")
	   public String index(HttpServletRequest req,HttpSession session) {
	      return "index";
	   }

	
	@RequestMapping(value = "/friendAll.do")
	public String listFriend(HttpServletRequest req,B4_friendDTO dto,HttpSession session){
		
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
			
		String msg = null, url = null;
			if(mbId == null){
				msg="�α��� �� �̿� �����մϴ�.";
				url="login.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		
		
		B4_memberDTO member = (B4_memberDTO)session.getAttribute("member");
		int memberNum = (Integer)session.getAttribute("memberNum");
		
		List<B4_friendDTO> list = friendMapper.listFriend(memberNum);
		req.setAttribute("friendList", list);
		req.setAttribute("profile_name",member.getProfile_name());
		req.setAttribute("name",member.getName());
		
		return "friend/friendAll";
	}
	
	@RequestMapping("/insertFriend.do")
	public String insertFriend(HttpServletRequest req, HttpSession session,
										B4_friendDTO dto,BindingResult result){
		
		B4_memberDTO member = (B4_memberDTO)session.getAttribute("member");
		session.getAttribute("f_profile_name");
		session.getAttribute("f_name");
		
		session.setAttribute("memberNum", member.getMemberNum());
		session.setAttribute("friendNum", dto.getFriendNum());
		session.setAttribute("f_name", dto.getF_name());
		
		if (result.hasErrors()){
			dto.setFriendNum(0);
		}

		
		int res = friendMapper.insertFriend(dto);
	
		String msg = null, url = null;
		if(res>0){
			msg="ģ���߰�����! ģ����� �������� �̵��մϴ�.";
			url="friendAll.do";
		}else{
			msg="ģ���߰�����! �������� �̵��մϴ�.";
			url="index.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
}	
	
	
	*/