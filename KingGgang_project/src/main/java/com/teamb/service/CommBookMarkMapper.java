package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommBookmarkDTO;

@Service
public class CommBookMarkMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int markPro(CommBookmarkDTO dto) {
		int res = sqlSession.insert("markPro", dto);
		return res;
	}
	
	public List<CommBookmarkDTO> listMark(int comm_memberNum) {
		return sqlSession.selectList("listMark",comm_memberNum);
	}
	
	/*public int deleteWarn(int warnNum) {	
		int res = sqlSession.insert("deleteWarn",warnNum);
		return res;
	}*/

}
