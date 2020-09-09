package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;

@Service
public class MemberMapper {

	@Autowired
	private SqlSession sqlSession;
	
	

	public List<MemberDTO> listMember() {
		return sqlSession.selectList("listMember");
	}
	
	public int insertMember(MemberDTO dto) {
		int res = sqlSession.insert("insertMember", dto);
		
		return res;
	}
	
	public MemberDTO getMember(int memberNum) {
		MemberDTO dto = sqlSession.selectOne("getMember", memberNum);
		return dto;
	}
	
	public MemberDTO getMemberid(String id){
		MemberDTO dto = sqlSession.selectOne("getMemberid",id);
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		int res = sqlSession.update("updateMember", dto);
		return res;
	}
	
	public int deleteMember(int memberNum) {
		int res = sqlSession.insert("deleteMember", memberNum);
		return res;
	}
	

}