package com.teamb.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.ChatMsgDTO;
import com.teamb.model.ChatRoomDTO;

@Service
public class ChatMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public void createRoom(ChatRoomDTO dto) throws Exception {
		sqlSession.insert("createRoom" ,dto);
	}



	public ChatRoomDTO isRoom(ChatRoomDTO dto) throws Exception {
		ChatRoomDTO room = null;
		room = sqlSession.selectOne("isRoom",dto);
		return room;
	}

	public void insertMessage(ChatMsgDTO msg) throws Exception {
		sqlSession.insert("insertMessage", msg);
	}

/*	public int getPartner(ChatRoomDTO dto) throws Exception {
		List<ChatMsgDTO> mvo = sqlSession.selectList("getPartner",dto);
		return mvo.get(0).getComm_memberNum();
	}
*/


	public String getProfile(int comm_memberNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getProfile", comm_memberNum);
	}



	public String getName(String str) throws Exception {
		return sqlSession.selectOne("getName", str);
	}

	public List<ChatMsgDTO> getMessageList(String str) throws Exception {
			return sqlSession.selectList("getMessageList" , str);
		
	}


	public List<ChatRoomDTO> getRoomList(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getRoomList",str);
	}


/*	public ChatMsgDTO getRecentMessage(String str) throws Exception {
		return sqlSession.selectOne("getRecentMessage", str);
	}
*/

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


	public int getAllCount(String str) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("comm_memberNum", str);
		if(sqlSession.selectOne("getAllCount" ,map) ==null) {
			return 0;
		}else {
			
			return sqlSession.selectOne("getAllCount" ,map);
		}
		
	}

}
