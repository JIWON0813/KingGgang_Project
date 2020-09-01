package com.teamb.service;

import org.apache.ibatis.session.SqlSession;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;


/*
이	   름 : MyMapper.java
개  발   자 : 원세호
설	   명 : 마이페이지 	Mapper
*/
@Service
public class MyMapper {
	
	@Autowired	
	private SqlSession sqlSession;
	
	public int deleteMember(String id,String password) {
		boolean ckPw = checkPassword(id,password);
			if(ckPw) {
				int res = sqlSession.delete("deleteMem",id);
				return res;
			}
			return -1;
	}
	
	public boolean checkPassword(String id, String password) {
		MemberDTO dto = getMember(id);
		if(dto.getPasswd().equals(password)) {
			return true;
		}
		return false;
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO dto = sqlSession.selectOne("getMem",id);
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		boolean isPass = checkPassword(dto.getId(),dto.getPasswd());
		if(isPass) {
			int res = sqlSession.update("updateMem", dto);
			return res;
		}
		return -1;
	}
	
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	

