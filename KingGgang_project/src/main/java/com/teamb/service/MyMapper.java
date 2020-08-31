package com.teamb.service;

import org.apache.ibatis.session.SqlSession;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;


/*
�씠	   由� : MyMapper.java
媛�  諛�   �옄 : �썝�꽭�샇
�꽕	   紐� : 留덉씠�럹�씠吏� 	Mapper
*/
@Service
public class MyMapper {
	
	@Autowired	
	private SqlSession sqlSession;
	
	public int deleteMember(String id,String password) {
		boolean ckPw = checkPasswd(id,password);
			if(ckPw) {
				int res = sqlSession.delete("deleteMem",id);
				return res;
			}
			return -1;
	}
	
	public boolean checkPasswd(String id, String passwd) {
		MemberDTO dto = getMember(id);
		if(dto.getPasswd().equals(passwd)) {
			return true;
		}
		return false;
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO dto = sqlSession.selectOne("getMem",id);
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		boolean isPass = checkPasswd(dto.getId(),dto.getPasswd());
		if(isPass) {
			int res = sqlSession.update("updateMem", dto);
			return res;
		}
		return -1;
	}
	
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	

