package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommBookmarkDTO;
import com.teamb.model.WishlistDTO;

@Service
public class CommBookMarkMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertmark(CommBookmarkDTO dto) {
		int res = sqlSession.insert("insertmark", dto);
		return res;
	}
	
	public List<CommBookmarkDTO> listMark(int comm_memberNum) {
		return sqlSession.selectList("listMark",comm_memberNum);
	}
	
	public CommBookmarkDTO markPro(CommBookmarkDTO cmdto) {
		return sqlSession.selectOne("markPro",cmdto);
	}
	
	public int deleteMark(CommBookmarkDTO dto) {
		int res = sqlSession.delete("deleteMark",dto);
		return res;
	}
	
	public int deleteAllBookmark(int boardnum) {
		int res = sqlSession.delete("all_deleteBookmark",boardnum);
		  return res;
	}
}
