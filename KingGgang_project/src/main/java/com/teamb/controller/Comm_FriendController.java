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
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.Comm_FriendMapper;
import com.teamb.service.Comm_MemberMapper;
import com.teamb.service.MemberMapper;

@Controller
public class Comm_FriendController {

	@Autowired
	private Comm_FriendMapper friendMapper;
	
	@Autowired
	private Comm_MemberMapper memberMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping("/comm_friend_insert.do")
	public String insertFriend(HttpServletRequest req, HttpSession session, 
							Comm_FriendDTO dto, Comm_MemberDTO mdto) {

		int comm_memberNum=(Integer)session.getAttribute("comm_memberNum");
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
	
	
	@RequestMapping(value = "/comm_friendAll.do")
	public String listFriend(HttpServletRequest req, Comm_FriendDTO dto, HttpSession session) {

		int comm_memberNum=(Integer)session.getAttribute("comm_memberNum");
		List<Comm_FriendDTO> list = friendMapper.listFriend(comm_memberNum);
		for(Comm_FriendDTO dto2: list){
			int m=dto2.getComm_memberNum();
			Comm_MemberDTO mdto=memberMapper.comm_getMember(m);
			dto2.setF_name(mdto.getComm_name());
		}
		req.setAttribute("friendList", list);
		//session.getAttribute("name");
		

		return "comm/friend/friendAll";
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
	public String content(HttpServletRequest req, HttpSession session,@RequestParam int friendNum) {
		int comm_memberNum=(Integer)session.getAttribute("comm_memberNum");
		Comm_FriendDTO dto = friendMapper.getFriend(friendNum);
		
		session.setAttribute("getFriend", dto);

		return "comm/friend/friendcontent";
	}
	
	
}
