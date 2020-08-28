package com.teamb.service;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;
 
/*
이	   름 : MemberMapper class
개  발   자 : 박 준 언
설	   명 : 멤버 매퍼  
*/

@Service
public class MemberMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMember(MemberDTO dto){
		int res = sqlSession.insert("insertMember",dto);
		return res;
	}
	
	public List<MemberDTO> memberList(){
		List<MemberDTO> list = sqlSession.selectList("memberList");
		return list;
	}
	
	public MemberDTO getMember(String id){
		return sqlSession.selectOne("getMember",id);
	}
	
	public int adminDeleteMember(String id) {
		int res = sqlSession.delete("deleteMember",id);
		return res;
	}
	
	public int adminDeleteCoupon(String id){
		int res = sqlSession.delete("deleteCo",id);
		return res;
	}
	public int adminInsertMember(MemberDTO dto){
		int res = sqlSession.insert("adminInsertMember",dto);
		return res;
	}
	public int adminUpdateMember(MemberDTO dto){
		int res = sqlSession.update("adminUpdateMember",dto);
		return res;
	}
	
	public boolean checkPassword(String id, String password) {
		MemberDTO dto = getMember(id);
		if(dto.getPassword().equals(password)) {
			return true;
		}
		return false;
	}
	
	public int updateMember(MemberDTO dto) {
		boolean isPass = checkPassword(dto.getId(),dto.getPassword());
		if(isPass) {
			int res = sqlSession.update("updateMember", dto);
			return res;
		}
		return -1;
	}
	
	public int checkId(MemberDTO dto){
		int res = sqlSession.selectOne("checkId",dto);
		return res;
	}
	
	public int deleteMember(String id,String password) {
		int res = sqlSession.delete("deleteMember",id);
		return res;
	}

}


