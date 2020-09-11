package com.teamb.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.ChatMsgDTO;
import com.teamb.model.ChatRoomDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.service.ChatMapper;

/*
이	   름 : ChatController
개  발   자 : 이여진
설	   명 : 채팅 컨트롤러
*/

@Controller
public class ChatController {
	
	@Autowired
	private ChatMapper chatMapper;
	
	List<ChatRoomDTO> roomList = new ArrayList<ChatRoomDTO>();
	
	@RequestMapping("/room")
	public ModelAndView room(HttpSession session, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();

		Comm_MemberDTO login = (Comm_MemberDTO) session.getAttribute("comm_login");
		int msgSender = login.getComm_memberNum();
		String Sname = login.getComm_nickname();

		
		String msgReceiver = req.getParameter("comm_memberNum");
		String Rname = req.getParameter("comm_nickname");
		
		ChatRoomDTO croom  = new ChatRoomDTO();
	    croom.setMsgReceiver(Integer.parseInt(msgReceiver));
	    croom.setMsgSender(msgSender);
	    croom.setRoomName(Sname+" 님과 "+Rname+" 의 대화");
	    String RProfile = chatMapper.getProfile(Integer.parseInt(msgReceiver));
		if(chatMapper.isRoom(croom) == null ) {
			chatMapper.createRoom(croom);
			roomList.addAll(chatMapper.getChatList(msgSender));
		}else{
			roomList.addAll(chatMapper.getChatList(msgSender));

		}

		List<ChatMsgDTO> msgList = chatMapper.getMessageList(chatMapper.getRoomId(croom));
		req.setAttribute("msgList",msgList);
		req.setAttribute("chatroom_id",chatMapper.getRoomId(croom));
		req.setAttribute("msgSender",croom.getMsgSender());
		req.setAttribute("roomName",croom.getRoomName());
		req.setAttribute("msgReceiver", croom.getMsgReceiver());
		req.setAttribute("RProfile",RProfile);
		session.setAttribute("croom",croom);
		session.setAttribute("roomList",roomList);
		
		mv.setViewName("comm/chatView");
		return mv;
	}
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comm/chatView");
		return mv;
	}
	
	@RequestMapping("/roomList")
	public ModelAndView roomList(HttpSession session, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();
		Comm_MemberDTO login = (Comm_MemberDTO) session.getAttribute("comm_login");
		int msgSender = login.getComm_memberNum();
		roomList.clear();
		roomList.addAll(chatMapper.getChatList(msgSender));
		
		HashSet<ChatRoomDTO> temp = new HashSet<ChatRoomDTO>(roomList);
		List<ChatRoomDTO> rooms = new ArrayList<ChatRoomDTO>(temp);
		
		req.setAttribute("roomList",rooms);
		session.setAttribute("msgSender",msgSender);
		mv.setViewName("comm/chatRoom");
		
		return mv;
	}
	
	@RequestMapping("/moveChating")
	public ModelAndView chating(HttpServletRequest req, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int chatroom_id = Integer.parseInt(req.getParameter("chatroom_id"));
		int msgSender = (int)session.getAttribute("msgSender");
		List<ChatMsgDTO> msgList = chatMapper.getMessageList(chatroom_id);
		List<ChatRoomDTO> new_list = roomList.stream().filter(o->o.getChatroom_id()==chatroom_id).collect(Collectors.toList());
		ChatRoomDTO croom = chatMapper.getRoomList(chatroom_id);
		
		String RProfile;
		int msgReceiver = 0;
		if(msgSender == croom.getMsgSender()){
			msgReceiver = croom.getMsgReceiver();
			RProfile = chatMapper.getProfile(msgReceiver);
		}else{
			msgReceiver = croom.getMsgSender();
			RProfile = chatMapper.getProfile(msgReceiver);
		}
		
		if(new_list != null && new_list.size() > 0) {
			
			req.setAttribute("msgList",msgList);
			req.setAttribute("chatroom_id",chatroom_id);
			req.setAttribute("msgSender",msgSender);
			req.setAttribute("roomName",croom.getRoomName());
			req.setAttribute("msgReceiver", msgReceiver);
			req.setAttribute("RProfile",RProfile);
			mv.setViewName("comm/chatView");
		}else {
			mv.setViewName("comm/chatRoom");
		}
		return mv;
	}
}