package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.B4_friendDTO;

@Service
public class B4_friendMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<B4_friendDTO> listFriend(int memberNum) {
		return sqlSession.selectList("listFriend",memberNum);
	}
	
	public int insertFriend(B4_friendDTO dto) {
		int res = sqlSession.insert("insertFriend", dto);
		
		return res;
	}
	
	public B4_friendDTO getFriend(int friendNum) {
		B4_friendDTO dto = sqlSession.selectOne("getFriend", friendNum);
		return dto;
	}
	
	public int deleteFriend(int friendNum) {
		int res = sqlSession.insert("deleteFriend", friendNum);
		return res;
	}

}
