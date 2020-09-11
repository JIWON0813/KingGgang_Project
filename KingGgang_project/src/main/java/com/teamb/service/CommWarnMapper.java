package com.teamb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<CommWarnDTO> listWarn(int comm_memberNum) {
		return sqlSession.selectList("listWarn",comm_memberNum);
	}
	
	public int deleteWarn(int warnNum) {	
		int res = sqlSession.insert("deleteWarn",warnNum);
		return res;
	}

	public int deleteAllWarn(int comm_memberNum) {
		//Map<String,Integer> map = new HashMap<String,Integer>();
		//map.put("comm_memberNum", comm_memberNum);
		//map.put("boardNum", boardNum);
		int res = sqlSession.insert("all_deleteWarn",comm_memberNum);
		return res;
	}

}

