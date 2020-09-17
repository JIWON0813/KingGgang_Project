package com.teamb.service;

import java.util.HashMap;
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
	
	public List<Comm_FriendDTO> other_listFriend(int comm_memberNum) {
		return sqlSession.selectList("other_comm_listFriend",comm_memberNum);
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
	public Comm_FriendDTO getFriend(int comm_memberNum) {
		Comm_FriendDTO dto = sqlSession.selectOne("comm_getFriend", comm_memberNum);
		return dto;
	}
	
	public int deleteFriend(int friendNum) {
		int res = sqlSession.insert("comm_deleteFriend", friendNum);
		return res;
	}

	public int deleteAllFriend(int comm_memberNum) {
		int res = sqlSession.insert("all_comm_deleteFriend", comm_memberNum);
		return res;
	}

	public Integer getfriendCount(int login_comm_memberNum,int comm_memberNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("login_comm_memberNum", login_comm_memberNum);
		map.put("comm_memberNum", comm_memberNum);
		int res = sqlSession.selectOne("getfriendCount",map);
		return res;
	}

}
