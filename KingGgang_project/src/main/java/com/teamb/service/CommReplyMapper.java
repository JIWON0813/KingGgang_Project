package com.teamb.service;

	/*��	   �� : CommReplyMapper.java
	��  ��   �� : �� �� ��
	��	   �� : ���� ������*/

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
	
	 public boolean isPassword(int replyNum, String rpasswd) {
	      CommReplyDTO dto = getReply(replyNum);
	   if(dto.getRpasswd().equals(rpasswd)) {
	      return true;
	   }
	   return false;
	}
	 
	public int deleteReply(int replyNum, String rpasswd) {	
		boolean isPass = isPassword(replyNum, rpasswd);
		if(isPass) {
			int res = sqlSession.delete("deleteReply", replyNum);
			return res;
		}
		return -1;
	}
}