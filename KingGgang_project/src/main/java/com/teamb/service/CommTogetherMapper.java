package com.teamb.service;

	/*이	   름 : CommTogetherMapper.java
	개  발   자 : 최 인 아
	설	   명 : 투게더Mapper*/

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
	
	public List<CommTogetherDTO> listTogether(int comm_memberNum) {
		return sqlSession.selectList("listTogether",comm_memberNum);
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
}
