package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommTogetherDTO;
import com.teamb.model.CommWarnDTO;

@Service
public class CommWarnMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int warnPro(CommWarnDTO dto) {
		int res = sqlSession.insert("warnPro", dto);
		return res;
	}
	
	public List<CommWarnDTO> listWarn(int comm_memberNum) {
		return sqlSession.selectList("listWarn",comm_memberNum);
	}
	
	public int deleteWarn(int warnNum) {	
		int res = sqlSession.insert("deleteWarn",warnNum);
		return res;
	}

}
