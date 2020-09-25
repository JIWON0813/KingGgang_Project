package com.teamb.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommWarnDTO;

@Service
public class CommWarnMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int warnPro(CommWarnDTO dto) {
		return sqlSession.insert("warnPro", dto);
	}
	
	public List<CommWarnDTO> listWarn() {
		return sqlSession.selectList("listWarn");
	}
	
	public int deleteWarn(int warnNum) {	
		int res = sqlSession.insert("deleteWarn",warnNum);
		return res;
	}

	public int deleteAllWarn(int memberNum) {
		//Map<String,Integer> map = new HashMap<String,Integer>();
		//map.put("comm_memberNum", comm_memberNum);
		//map.put("boardNum", boardNum);
		int res = sqlSession.insert("all_deleteWarn",memberNum);
		return res;
	}

}

