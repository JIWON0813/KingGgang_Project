package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommReplyDTO;
@Service
public class CommReplyMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<CommReplyDTO> listReply(int boardNum) {
		return sqlSession.selectList("listReply",boardNum);
	}
	
	public int writeReply(CommReplyDTO dto) {
		return sqlSession.insert("writeReply",dto);
	}
}
