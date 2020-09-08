package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommboardDTO;
@Service
public class CommboardMapper {
	   
	@Autowired
	private SqlSession sqlSession;

	public CommboardDTO getBoard(int boardNum) {
	      return sqlSession.selectOne("getBoard",boardNum);    
	}
	   
	public int insertBoard(CommboardDTO dto) {
		  int res = sqlSession.insert("insertBoard", dto);
		  return res;
	}
		   
	public int writeBoard(CommboardDTO dto) {
		  return sqlSession.insert("writeBoard",dto);
	}

	public int deleteBoard(int boardNum) {   
		  int res = sqlSession.insert("deleteBoard",boardNum);
		  return res;
	}

	public int updateBoard(CommboardDTO dto) {
		int res = sqlSession.update("updateBoard", dto);
		return res;
	}

	public List<CommboardDTO> listBoard(int comm_memberNum) {
		   return sqlSession.selectList("listBoard",comm_memberNum);
	}
		  
	public List<CommboardDTO> allListBoard() {
		   return sqlSession.selectList("allListBoard");
	}
	  

	}