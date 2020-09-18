package com.teamb.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommTogetherDTO;

@Service
public class CommTogetherMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public CommTogetherDTO getTogether(int togetherNum) {
		return sqlSession.selectOne("getTogether",togetherNum);    
	}
	
	public List<CommTogetherDTO> listTogether(Integer startRow, Integer endRow) {
		java.util.Map<String, Integer> map = new java.util.Hashtable<>();
		map.put("startRow" , startRow);
		map.put("endRow", endRow);
		List<CommTogetherDTO> list = sqlSession.selectList("listTogether", map);
		return list;
	}
	
	public int getCountTogether() {
		return sqlSession.selectOne("getCountTogether");
	}
	
	public List<CommTogetherDTO> allListTogether() {
		return sqlSession.selectList("allListTogether");
	}
	
	public int writeTogether(CommTogetherDTO dto) {
		return sqlSession.insert("writeTogether",dto);
	}
	
	public int updateTogether(CommTogetherDTO dto) {
		int res = sqlSession.update("updateTogether",dto);
		return res;
	}
	
	public int deleteTogether(int togetherNum) {	
		int res = sqlSession.insert("deleteTogether",togetherNum);
		return res;
	}
	
	 public void plustReadcount(int togetherNum) {
	      sqlSession.update("plustReadcount", togetherNum);
	      return;
	 }

	public int deleteAllTogether(int comm_memberNum) {
		int res = sqlSession.insert("all_deleteTogether",comm_memberNum);
		return res;
	}
}