package com.teamb.service;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Comm_FriendDTO;

@Service
public class Comm_FriendMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<Comm_FriendDTO> listFriend(int login_comm_memberNum) {
		return sqlSession.selectList("comm_listFriend",login_comm_memberNum);
	}
	
	public int insertFriend(Comm_FriendDTO dto) {
		int res = sqlSession.insert("comm_insertFriend", dto);
		
		return res;
	}
	
	public int check_insertFriend(int login_comm_memberNum,int comm_memberNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("login_comm_memberNum", login_comm_memberNum);
		map.put("comm_memberNum", comm_memberNum);
		int res = sqlSession.selectOne("check_comm_insertFriend", map);
		return res;
	}
	public Comm_FriendDTO getFriend(int friendNum) {
		Comm_FriendDTO dto = sqlSession.selectOne("comm_getFriend", friendNum);
		return dto;
	}
	
	public int deleteFriend(int friendNum) {
		int res = sqlSession.insert("comm_deleteFriend", friendNum);
		return res;
	}

}
