package com.teamb.service;

import java.util.Hashtable;
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
import com.teamb.model.CommboardDTO;
@Service
public class CommNewsFeedMapper {
	   
	@Autowired
	private SqlSession sqlSession;
	
	public List<Comm_MemberDTO> getSearchComm_Member(String word){
		
		return sqlSession.selectList("getSearchComm_Member",word); 
	}
	
	public List<CommboardDTO> newfeedList(int startRow, int endRow) {
			java.util.Map<String,Integer> map = new Hashtable<String, Integer>();
			map.put("startRow",startRow);
			map.put("endRow",endRow);
		   return sqlSession.selectList("newfeedList",map);
	}
	
	public int getNewsCount() {
		int count = sqlSession.selectOne("getNewsCount");
		return count;
	}

	public List<CommboardDTO> newfeedList(int startRow, int endRow, String look) {
		java.util.Map<String,Object> map = new Hashtable<String, Object>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("look", look);
	   return sqlSession.selectList("look_newfeedList",map);
	}
	
	public List<CommboardDTO> alone_newfeedList(int startRow, int endRow, String look,int comm_memberNum) {
		java.util.Map<String,Object> map = new Hashtable<String, Object>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("look", look);
		map.put("comm_memberNum", comm_memberNum);
	   return sqlSession.selectList("alone_look_newfeedList",map);
	}
	
}