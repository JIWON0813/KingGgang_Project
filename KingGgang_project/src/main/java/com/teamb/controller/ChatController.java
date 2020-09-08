/*package com.teamb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.ChatRoomDTO;


이	   름 : ChatController
개  발   자 : 이여진
설	   명 : 채팅 컨트롤러


@Controller
public class ChatController {
	
	List<ChatRoomDTO> roomList = new ArrayList<ChatRoomDTO>();
	static int roomNumber = 0;
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comm/chat");
		return mv;
	}
	
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comm/chatRoom");
		return mv;
	}
	
	*//**
	 * 방 생성하기
	 * @param params
	 * @return
	 *//*
	@RequestMapping("/createRoom")
	public @ResponseBody List<ChatRoomDTO> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			ChatRoomDTO room = new ChatRoomDTO();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	*//**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 *//*
	@RequestMapping("/getRoom")
	public @ResponseBody List<ChatRoomDTO> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	*//**
	 * 채팅방
	 * @return
	 *//*
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		
		List<ChatRoomDTO> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("comm/chat");
		}else {
			mv.setViewName("comm/chatroom");
		}
		return mv;
	}
}*/