package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Comm_FriendDTO;

@Service
public class Comm_FriendMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<Comm_FriendDTO> listFriend(int memberNum) {
		return sqlSession.selectList("listFriend",memberNum);
	}
	
	public int insertFriend(Comm_FriendDTO dto) {
		int res = sqlSession.insert("insertFriend", dto);
		
		return res;
	}
	
	public Comm_FriendDTO getFriend(int friendNum) {
		Comm_FriendDTO dto = sqlSession.selectOne("getFriend", friendNum);
		return dto;
	}
	
	public int deleteFriend(int friendNum) {
		int res = sqlSession.insert("deleteFriend", friendNum);
		return res;
	}

}
