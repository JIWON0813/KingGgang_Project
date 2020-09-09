package com.teamb.service;

import java.util.List;

/*
 이	   름 : newsfeedMapper.java
개  발   자 : 이 여 진
설	   명 : 커뮤니티 뉴스피드 관련 서비스
*/


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Comm_MemberDTO;
@Service
public class CommNewsFeedMapper {
	   
	@Autowired
	private SqlSession sqlSession;
	
	public List<Comm_MemberDTO> getSearchComm_Member(String word){
		
		return sqlSession.selectList("getSearchComm_Member",word); 
	}
	
}