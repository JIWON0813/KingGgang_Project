package com.teamb.function;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.teamb.model.ChatMsgDTO;
import com.teamb.model.ChatRoomDTO;

/*
이	   름 : echoHandler.java
개  발   자 : 이여진
설	   명 : 채팅 핸들러
*/

@Component
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

/*HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
*/
	private List<WebSocketSession> connectedUsers;
	public EchoHandler() {
	      connectedUsers = new ArrayList<WebSocketSession>();
	   }	

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		System.out.println("메세지 수신");
		//메시지 발송
		System.out.println(message.getPayload());
		  Map<String, Object> map = null;

	      ChatMsgDTO msg = ChatMsgDTO.convertMessage(message.getPayload());

	      System.out.println("1 : " + msg.toString());


	      ChatRoomDTO room  = new ChatRoomDTO();
	      room.setComm_memberNum(msg.getComm_memberNum()); //유저
	}
	 /*   	  if(mapper.isRoom(ChatRoomDTO) == null ) {
	    		  System.out.println("호잇");
	    		  mapper.createRoom(ChatRoomDTO);
	    		  System.out.println("요잇");
	    		  croom = dao.isRoom(roomVO);

	    	  }else {
	    		  System.out.println("C");
	    		  croom = dao.isRoom(roomVO);
	    	  }
	      }else {

  		  croom = dao.isRoom(roomVO);
  	  }

	      messageVO.setCHATROOM_chatroom_id(croom.getChatroom_id());
	      if(croom.getUSER_user_id().equals(messageVO.getMessage_sender())) {

	    	  messageVO.setMessage_receiver(roomVO.getTUTOR_USER_user_id());
	      }else {
	    	  messageVO.setMessage_receiver(roomVO.getUSER_user_id());
	      }




	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         UserVO login = (UserVO) map.get("login");

	         //받는사람
	         if (login.getUser_id().equals(messageVO.getMessage_sender())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(messageVO);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }


	      }
	   }
*/
	
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

