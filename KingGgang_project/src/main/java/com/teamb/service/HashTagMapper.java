package com.teamb.service;
/* 
이	   름 : HashTagMapper
개  발   자 : 이 여 진
설	   명 : 해시태그 관련 서비스
*/

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.HashTagDTO;

@Service
public class HashTagMapper {
	   
	@Autowired
	private SqlSession sqlSession;

	public HashTagDTO isHashTag(String isHashTag) {
	      return sqlSession.selectOne("isHashTag",isHashTag);
	}
	   
	public HashTagDTO insertTag(String isHashTag) {
	      return sqlSession.selectOne("insertTag",isHashTag);    
	}
	
	public HashTagDTO getTagName(int tagId) {
	      return sqlSession.selectOne("getTagName",tagId);   
	}
	
public List<HashTagDTO> getSearchTagList(String word){
		return sqlSession.selectList("getSearchTagList",word); 
	}
	
}
