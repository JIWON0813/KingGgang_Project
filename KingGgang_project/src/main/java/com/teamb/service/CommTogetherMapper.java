package com.teamb.service;

	/*��	   �� : CommTogetherMapper.java
	��  ��   �� : �� �� ��
	��	   �� : ���Դ�Mapper*/

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommTogetherDTO;

@Service
public class CommTogetherMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public CommTogetherDTO getTogether(int togetherNum) {
		return sqlSession.selectOne("getTogether",togetherNum);    
	}
	
	public List<CommTogetherDTO> listTogether(int comm_memberNum) {
		return sqlSession.selectList("listTogether",comm_memberNum);
	}
	
	public int writeTogether(CommTogetherDTO dto) {
		return sqlSession.insert("writeTogether",dto);
	}
	
	/*public int updateReply(CommTogetherDTO dto) {
		int res = sqlSession.update("updateReply",dto);
		return res;
	}
	
	public int deleteReply(int replyNum) {	
		int res = sqlSession.insert("deleteReply",replyNum);
		return res;
	}*/
}
