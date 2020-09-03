package com.teamb.function;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.teamb.model.ChatMsgDTO;
import com.teamb.model.ChatRoomDTO;
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
	private List<HashMap<String, Object>> rls = new ArrayList<>();

	@Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메세지 수신!!");
		System.out.println(message.getPayload());
		   /*ChatMsgDTO msg =  ChatMsgDTO.convertMessage(message.getPayload());
	      System.out.println("1 : " + msg.toString());
	      JSONObject obj = new JSONObject(message.getPayload());*/
		

		JSONObject obj = new JSONObject(message.getPayload());
		
		String rN = (String) obj.get("chatroom_id");
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String roomNumber = (String) rls.get(i).get("chatroom_id"); //세션리스트의 저장된 방번호를 가져와서
				if(roomNumber.equals(rN)) { //같은값의 방이 존재한다면
					temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
					break;
				}
			}
			
			//해당 방의 세션들만 찾아서 메시지를 발송해준다.
			for(String k : temp.keySet()) { 
				if(k.equals("chatroom_id")) { //다만 방번호일 경우에는 건너뛴다.
					continue;
				}
				
				WebSocketSession wss = (WebSocketSession) temp.get(k);
				if(wss != null) {
					try {
						wss.sendMessage(new TextMessage(obj.toString()));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	      	/*msg.setChatroom_id(setroom.getChatroom_id());
	      	chatMapper.insertMessage(msg);
	      	System.out.println("메세지 등록 성공!");
	      	*/

		      
	      

	   

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		//소켓 연결
		super.afterConnectionEstablished(session);
		users.put(session.getId(), session);
		connectedUsers.add(session);
		boolean flag = false;
		String url = session.getUri().toString();
		System.out.println(url);
		String chatroom_id = url.split("/?/?/?/?/?/?/?/")[7];
		System.out.println(chatroom_id);
		
		int idx = rls.size(); //방의 사이즈를 조사한다.
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String rN = (String) rls.get(i).get("chatroom_id");
				if(rN.equals(chatroom_id)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { //존재하는 방이라면 세션만 추가한다.
			HashMap<String, Object> map = rls.get(idx);
			map.put(session.getId(), session);
		}else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("chatroom_id", chatroom_id);
			map.put(session.getId(), session);
			rls.add(map);
		}
		
		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toString()));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결종료됨");
		//소켓 종료
		if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			for(int i=0; i<rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
		users.remove(session.getId());
		connectedUsers.remove(session);
	}
	
	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

	
	
	/*private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}*/
}

