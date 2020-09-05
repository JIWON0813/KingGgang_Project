package com.teamb.service;

	/*이	   름 : CommReplyMapper.java
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지*/

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommReplyDTO;
import com.teamb.model.CommboardDTO;

@Service
public class CommReplyMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public CommReplyDTO getReply(int replyNum) {
		return sqlSession.selectOne("getReply",replyNum);    
	}
	
	public List<CommReplyDTO> listReply(int boardNum) {
		return sqlSession.selectList("listReply",boardNum);
	}
	
	public int writeReply(CommReplyDTO dto) {
		return sqlSession.insert("writeReply",dto);
	}
	
	public int updateReply(CommReplyDTO dto) {
		int res = sqlSession.update("updateReply",dto);
		return res;
	}
	
	public int deleteReply(int replyNum) {	
		int res = sqlSession.insert("deleteReply",replyNum);
		return res;
	}
}
