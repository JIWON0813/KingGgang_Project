/*package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommFriendDTO;

@Service
public class CommFriendMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<CommFriendDTO> listFriend(int memberNum) {
		return sqlSession.selectList("listFriend",memberNum);
	}
	
	public int insertFriend(CommFriendDTO dto) {
		int res = sqlSession.insert("insertFriend", dto);
		
		return res;
	}
	
	public CommFriendDTO getFriend(int friendNum) {
		CommFriendDTO dto = sqlSession.selectOne("getFriend", friendNum);
		return dto;
	}
	
	public int deleteFriend(int friendNum) {
		int res = sqlSession.insert("deleteFriend", friendNum);
		return res;
	}

}
*/