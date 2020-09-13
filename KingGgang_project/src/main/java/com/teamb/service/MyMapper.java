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
	
	public int deleteMember(int memberNum) {
		int res = sqlSession.delete("deleteMember",memberNum);
		return res;
	}
	
	public int checkPassword(String id, String passwd) {
		String dbPass = sqlSession.selectOne("checkPw", id);
		if (dbPass != null) { 
			if (dbPass.trim().equals(passwd)) {
				return MemberDTO.OK;
			} else {
				return MemberDTO.NOT_PW;
			}
		} else {
			return MemberDTO.NOT_ID;
		}
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO dto = sqlSession.selectOne("getMemberid",id);
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
			int res = sqlSession.update("updateMem", dto);
			return res;
	}
	
	
	
}	