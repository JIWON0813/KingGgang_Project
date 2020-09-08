package com.teamb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SocketUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

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
		//보내는사람
		Comm_MemberDTO login = (Comm_MemberDTO) session.getAttribute("comm_login");
		int msgSender = login.getComm_memberNum();
		String Sname = login.getComm_nickname();
		//받는사람
		String msgReceiver = req.getParameter("comm_memberNum");
		String Rname = req.getParameter("comm_name");
		
		//채팅방 설정
		ChatRoomDTO croom  = new ChatRoomDTO();
	    croom.setMsgReceiver(Integer.parseInt(msgReceiver));
	    croom.setMsgSender(msgSender);
	    croom.setRoomName(Sname+" 님과 "+Rname+" 의 대화");
		
		if(chatMapper.isRoom(croom) == null ) {
			chatMapper.createRoom(croom);
			roomList.add(chatMapper.isRoom(croom));
		}else{
			roomList.add(chatMapper.isRoom(croom));

		}
		//증복제거
		HashSet<ChatRoomDTO> temp = new HashSet<ChatRoomDTO>(roomList);
		List<ChatRoomDTO> rooms = new ArrayList<ChatRoomDTO>(temp);
		
		session.setAttribute("roomList",rooms);
		req.setAttribute("roomList",rooms);
		mv.addObject("msgReceiver",msgReceiver);
		mv.addObject("msgSender",msgSender );
		mv.setViewName("comm/chatRoom");
		return mv;
	}
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comm/chatView3");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 * @throws Exception 
	 */
/*	@RequestMapping("/createRoom")
	public @ResponseBody List<ChatRoomDTO> createRoom(HttpServletRequest req) throws Exception{
		  String msgReceiver = req.getParameter("msgReceiver");
		  ChatRoomDTO croom  = new ChatRoomDTO();
	      croom.setComm_memberNum(Integer.parseInt(msgReceiver));
		
		if(chatMapper.isRoom(croom) == null ) {
   		 croom.setRoomName(msgReceiver);
   		 chatMapper.createRoom(croom);
   		 roomList.add(croom);
		}
		
		return roomList;
	}*/
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 * @throws Exception 
	 */
	/*@RequestMapping("/getRoom")
	public @ResponseBody List<ChatRoomDTO> getRoom(HttpServletRequest req) throws Exception{
		String msgSender = req.getParameter("msgSender");
		roomList.addAll(chatMapper.getRoomList(msgSender));
		return roomList;
	}*/
	
	/**
	 * 채팅방
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(HttpServletRequest req, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int chatroom_id = Integer.parseInt(req.getParameter("chatroom_id"));
		ChatRoomDTO list = chatMapper.getRoomList(chatroom_id);
		List<ChatMsgDTO> msgList = chatMapper.getMessageList(chatroom_id);
		
		List<ChatRoomDTO> new_list = roomList.stream().filter(o->o.getChatroom_id()==chatroom_id).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			
			req.setAttribute("msgList",msgList);
			req.setAttribute("msgSender",list.getMsgSender());
			req.setAttribute("chatroom_id",list.getChatroom_id());
			req.setAttribute("roomName",list.getRoomName());
			req.setAttribute("msgSender", list.getMsgSender());
			req.setAttribute("msgReceiver", list.getMsgReceiver());
			mv.setViewName("comm/chatView3");
		}else {
			mv.setViewName("comm/chatroom");
		}
		return mv;
	}
}