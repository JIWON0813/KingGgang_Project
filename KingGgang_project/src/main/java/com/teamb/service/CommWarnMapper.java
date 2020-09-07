package com.teamb.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommWarnDTO;

@Service
public class CommWarnMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int warnPro(CommWarnDTO dto) {
		int res = sqlSession.insert("warnPro", dto);
		return res;
	}

}
