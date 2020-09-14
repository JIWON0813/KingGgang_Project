package com.teamb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Comm_NoticeDTO;
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
		 sqlSession.insert("writeBoard",dto);
		 int boardNum = dto.getBoardNum();
		 return boardNum;
	}

	public int deleteBoard(int boardNum) {   
		  int res = sqlSession.insert("deleteBoard",boardNum);
		  return res;
	}
	
	public int deleteAllBoard(int comm_memberNum) {
		int res = sqlSession.delete("all_deleteBoard",comm_memberNum);
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

	public int comm_insertNotice(Comm_NoticeDTO dto) {
		 int res = sqlSession.insert("comm_insertNotice", dto);
		  return res;
	}
	
	public int comm_deleteNotice(int comm_noticeNum) {
		int res = sqlSession.insert("comm_deleteNotice",comm_noticeNum);
		  return res;
	}

	public Comm_NoticeDTO comm_getNotice(int comm_noticeNum) {
		 return sqlSession.selectOne("comm_getNotice",comm_noticeNum);    
	}
	
	public int comm_updateNotice(Comm_NoticeDTO dto) {
		int res = sqlSession.update("comm_updateNotice", dto);
		return res;
	}

	public List<CommboardDTO> allListBoard(String look) {
		return sqlSession.selectList("look_allListBoard", look);
	}

	//지은
/*	public List<CommboardDTO> listBoard(int comm_memberNum, String look) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("comm_memberNum", comm_memberNum);
		map.put("look", look);
		   return sqlSession.selectList("look_listBoard",map);
	}
*/}
