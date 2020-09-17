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
import com.teamb.service.Comm_MemberMapper;

/*
이	   름 : ChatController
개  발   자 : 이여진
설	   명 : 채팅 컨트롤러
*/

@Controller
public class ChatController {
	
	@Autowired
	private ChatMapper chatMapper;
	
	@Autowired
	private Comm_MemberMapper memberMapper;
	
	
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
	    croom.setSname(Sname);
	    croom.setRname(Rname);
	    String RProfile = chatMapper.getProfile(Integer.parseInt(msgReceiver));
	    
	    roomList.clear();
		if(chatMapper.isRoom(croom) == null ) {
			chatMapper.createRoom(croom);
			roomList.addAll(chatMapper.getChatList(msgSender));
		}else{
			if(!Sname.equals(chatMapper.isRoom(croom).getSname())){
				chatMapper.updateSname(Sname, msgSender);
				chatMapper.updateRname(Sname, msgSender);
				System.out.println("닉네임 변경 완료");
			}
			roomList.addAll(chatMapper.getChatList(msgSender));

		}

		List<ChatMsgDTO> msgList = chatMapper.getMessageList(chatMapper.getRoomId(croom));
		req.setAttribute("msgList",msgList);
		req.setAttribute("chatroom_id",chatMapper.getRoomId(croom));
		req.setAttribute("msgSender",croom.getMsgSender());
		req.setAttribute("msgReceiver", croom.getMsgReceiver());
		
		req.setAttribute("Sname",croom.getSname());
		req.setAttribute("Rname",croom.getRname());
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
		Comm_MemberDTO dto = memberMapper.comm_getMember(msgSender);
		String Sname = dto.getComm_nickname();
		chatMapper.updateSname(Sname, msgSender);
		chatMapper.updateRname(Sname, msgSender);
		
		roomList.clear();
		roomList.addAll(chatMapper.getChatList(msgSender));
		
		req.setAttribute("roomList",roomList);
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
			req.setAttribute("msgReceiver", msgReceiver);
			req.setAttribute("RProfile",RProfile);
			mv.setViewName("comm/chatView");
		}else {
			mv.setViewName("comm/chatRoom");
		}
		return mv;
	}

}