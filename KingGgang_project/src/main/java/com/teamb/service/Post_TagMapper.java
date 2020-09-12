package com.teamb.service;
/* 
이	   름 : Post_TagMapper
개  발   자 : 이 여 진
설	   명 : 해시태그 와 사용자 포스트 관련 서비스
*/
import java.util.Hashtable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.HashTagDTO;
import com.teamb.model.Post_TagDTO;

@Service
public class Post_TagMapper {
	   
	@Autowired
	private SqlSession sqlSession;
	   
	public Post_TagDTO insertPostTag(int boardNum,int tagId) {
		java.util.Map<String,Object> map = new Hashtable<String, Object>();
		map.put("boardNum",boardNum);
		map.put("tagId",tagId);
		
	    return sqlSession.selectOne("insertPostTag",map);    
	}
	
	public List<Post_TagDTO> getPostTagId(int boardNum) {
		 return sqlSession.selectList("getPostTagId",boardNum);  
	}
	public List<Post_TagDTO> getTagSearch(int tagId) {
		 return sqlSession.selectList("getTagSearch",tagId);  
	}

	public void deletePostTag(int boardNum) {   
		sqlSession.selectOne("deletePostTag",boardNum);    
	}
}
