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
	
	public int deleteMember(String id,String password,int memberNum) {
		boolean ckPw = checkPassword(id,password,memberNum);
			if(ckPw) {
				int res = sqlSession.delete("deleteMember",memberNum);
				return res;
			}
			return -1;
	}
	
	public boolean checkPassword(String id, String password,int memberNum) {
		MemberDTO dto = getMember(memberNum);
		if(dto.getPasswd().equals(password)) {
			return true;
		}
		return false;
	}
	
	public MemberDTO getMemberNo(String id) {
		MemberDTO dto = sqlSession.selectOne("getMemberid",id);
		return dto;
	}
	
	public MemberDTO getMember(int memberNum) {
		MemberDTO dto = sqlSession.selectOne("getMember",memberNum);
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		boolean isPass = checkPassword(dto.getId(),dto.getPasswd(),dto.getMemberNum());
		if(isPass) {
			int res = sqlSession.update("updateMember", dto);
			return res;
		}
		return -1;
	}
	
	
	
}	