package com.teamb.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamb.model.Comm_FriendDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.Comm_FriendMapper;

@Controller
public class Comm_FriendController {

	@Autowired
	private Comm_FriendMapper friendMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/friendAll.do")
	public String listFriend(HttpServletRequest req, Comm_FriendDTO dto, HttpSession session) {

	/*	session = req.getSession();
		String mbId = (String) session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null)
			isLogin = true;
		req.setAttribute("isLogin", isLogin);

		String msg = null, url = null;
		if (mbId == null) {
			msg = "占싸깍옙占쏙옙 占쏙옙 占싱울옙 占쏙옙占쏙옙占쌌니댐옙.";
			url = "login.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}*/

		//MemberDTO member = (MemberDTO)session.getAttribute("login");
		//int memberNum = (Integer) session.getAttribute("memberNum");

		//List<Comm_FriendDTO> list = friendMapper.listFriend(memberNum);
		//req.setAttribute("friendList", list);
		//req.setAttribute("profile_name", member.getProfile_name());
		//req.setAttribute("name", member.getName());

		return "friend/friendAll";
	}

	@RequestMapping("/insertFriend.do")
	public String insertFriend(HttpServletRequest req, HttpSession session, Comm_FriendDTO dto, BindingResult result) {

		MemberDTO member = (MemberDTO)session.getAttribute("login");
		session.getAttribute("f_profile_name");
		session.getAttribute("f_name");

		//session.setAttribute("memberNum", member.getMemberNum());
		session.setAttribute("friendNum", dto.getFriendNum());
		session.setAttribute("f_name", dto.getF_name());

		if (result.hasErrors()) {
			dto.setFriendNum(0);
		}

		int res = friendMapper.insertFriend(dto);

		String msg = null, url = null;
		if (res > 0) {
			msg = "친占쏙옙占쌩곤옙占쏙옙占쏙옙! 친占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙占쌌니댐옙.";
			url = "friendAll.do";
		} else {
			msg = "친占쏙옙占쌩곤옙占쏙옙占쏙옙! 占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙占쌌니댐옙.";
			url = "index.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
}
