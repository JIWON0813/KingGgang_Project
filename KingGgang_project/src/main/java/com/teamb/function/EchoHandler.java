package com.teamb.function;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.teamb.model.ChatMsgDTO;
import com.teamb.model.ChatRoomDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.service.ChatMapper;

/*
이	   름 : echoHandler.java
개  발   자 : 이여진
설	   명 : 채팅 핸들러
*/

@Component
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	private ChatMapper chatMapper;
/*HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
*/
	private List<WebSocketSession> connectedUsers;
	public EchoHandler() {
	      connectedUsers = new ArrayList<WebSocketSession>();
	   }	

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	

	@Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		  Map<String, Object> map = null;
	      ChatMsgDTO mdto =  ChatMsgDTO.convertMessage(message.getPayload());
	      System.out.println("1 : " + mdto.toString());

	      ChatRoomDTO roomdto  = new ChatRoomDTO();
	      roomdto.setComm_memberNum(mdto.getComm_memberNum());//유저


	    	  if(chatMapper.isRoom(roomdto) == null ) {
	    		  chatMapper.createRoom(roomdto);
	    		  System.out.println("d");
	    		  mdto.setChatroom_id(roomdto.getChatroom_id());
	    	  }
	      if(roomdto.getComm_memberNum()==(mdto.getMsgSender())) {
	    	  mdto.setMsgReceiver(roomdto.getComm_memberNum());
	      }
	    	  


	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         Comm_MemberDTO login = (Comm_MemberDTO) map.get("login");

	         //받는사람
	         if (login.getComm_memberNum()==(mdto.getMsgSender())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(mdto);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }


	      }
	   }

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		//소켓 연결
		super.afterConnectionEstablished(session);
		users.put(session.getId(), session);
		connectedUsers.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결종료됨");
		//소켓 종료
		super.afterConnectionClosed(session, status);
		connectedUsers.remove(session);
		users.remove(session.getId());
	}
	
	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}

