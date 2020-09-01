package com.teamb.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.Comm_FriendDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.Comm_FriendMapper;
import com.teamb.service.MemberMapper;

@Controller
public class Comm_FriendController {

	@Autowired
	private Comm_FriendMapper friendMapper;
	
	@Autowired
	private MemberMapper memberMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/comm_friendAll.do")
	public String listFriend(HttpServletRequest req, Comm_FriendDTO dto, HttpSession session) {

		MemberDTO member = (MemberDTO)session.getAttribute("member");
		//int memberNum = member.getMemberNum();
		int memberNum = (Integer) session.getAttribute("memberNum");

		List<Comm_FriendDTO> list = friendMapper.listFriend(memberNum);
		for(Comm_FriendDTO dto2: list){
			int m=dto2.getMemberNum();
			MemberDTO mdto=memberMapper.getMember(m);
			dto2.setF_email(mdto.getEmail());
			dto2.setF_name(mdto.getName());
		}
		req.setAttribute("friendList", list);
		//req.setAttribute("profile_name", member.getProfile_name());
		session.getAttribute("name");
		session.getAttribute("email");
		

		return "comm/friend/friendAll";
	}

	@RequestMapping("/comm_insertFriend.do")
	public String insertFriend(HttpServletRequest req, HttpSession session, Comm_FriendDTO dto, MemberDTO mdto, BindingResult result) {

		session = req.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String name = (String)session.getAttribute("memberName");
		String email = (String)session.getAttribute("memberEmail");
		int memberNum = (Integer) session.getAttribute("memberNum");

		//session.setAttribute("memberNum", dto.getMemberNum());
		dto.setMemberNum(memberNum);
		session.setAttribute("memberName", name);
		session.setAttribute("memberEmail", email);
		//session.setAttribute("name", memberMapper.getMember(memberNum).getName());
		//session.setAttribute("email", member.getEmail());
		//session.setAttribute("email", memberMapper.getMember(memberNum).getEmail());
		
		String msg = null, url = null;
		int res = friendMapper.insertFriend(dto);

		
		if (res > 0) {
			msg = "친구 추가 성공. 친구목록 페이지로 이동";
			url = "comm_friendAll.do";
		} else {
			msg = "친구 추가 실패. 메인으로 이동";
			url = "commhome.comm";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value = "/comm_deleteFriend.do")
	public String deleteFriend(HttpServletRequest req,@RequestParam int friendNum) {
		int res = friendMapper.deleteFriend(friendNum);
		String msg = null, url = null;
		if (res > 0) {
			msg = "친구삭제 성공. 친구목록페이지로 이동";
			url = "comm_friendAll.do";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value = "/comm_friendContent.do")
	public String content(HttpServletRequest req, @RequestParam int friendNum) {

		Comm_FriendDTO dto = friendMapper.getFriend(friendNum);
		req.setAttribute("getFriend", dto);

		return "comm/friend/friendcontent";
	}
	
	
}
