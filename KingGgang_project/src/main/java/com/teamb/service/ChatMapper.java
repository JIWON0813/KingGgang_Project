package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.ChatMsgDTO;
import com.teamb.model.ChatRoomDTO;

/*
이	   름 : ChatMapper.java
개  발   자 : 이여진
설	   명 : 채팅관련 서비스
*/

@Service
public class ChatMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public int createRoom(ChatRoomDTO dto) throws Exception {
		int res = sqlSession.insert("createRoom" ,dto);
		return res;
	}

	public ChatRoomDTO isRoom(ChatRoomDTO dto) throws Exception {
		 ChatRoomDTO room = null;
		room = sqlSession.selectOne("isRoom",dto);
		return room;
	}

	public String getProfile(int comm_memberNum) throws Exception {
		return sqlSession.selectOne("getProfile", comm_memberNum);
	}

	public ChatRoomDTO getRoomList(int chatroom_id) throws Exception {
		return sqlSession.selectOne("getRoomList",chatroom_id);
	}
	
	public List<ChatRoomDTO> getChatList(int msgSender) throws Exception {
		 List<ChatRoomDTO> room = null;
		room = sqlSession.selectList("getChatList",msgSender);
		
		return room;
	}
	
	public int getRoomId(ChatRoomDTO dto) throws Exception {
		return sqlSession.selectOne("getRoomId",dto);
	}
	
	
	//메세지
	
	public void insertMessage(ChatMsgDTO msg) throws Exception {
		sqlSession.insert("insertMessage", msg);
	}

	public List<ChatMsgDTO> getMessageList(int chatroom_id) throws Exception {
		return sqlSession.selectList("getMessageList",chatroom_id);
	}



	/*public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		session.update(namespace+".updateReadTime" , map);
	}
*/


/*	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		
		
		return session.selectOne(namespace+".getUnReadCount" , map);
	}
*/

/*
	public int getAllCount(String str) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("comm_memberNum", str);
		if(sqlSession.selectOne("getAllCount" ,map) ==null) {
			return 0;
		}else {
			
			return sqlSession.selectOne("getAllCount" ,map);
		}
		
	}*/
	/*	public int getPartner(ChatRoomDTO dto) throws Exception {
	List<ChatMsgDTO> mvo = sqlSession.selectList("getPartner",dto);
	return mvo.get(0).getComm_memberNum();
}
*/
	/*public String getName(String str) throws Exception {
		return sqlSession.selectOne("getName", str);
	}*/

}
