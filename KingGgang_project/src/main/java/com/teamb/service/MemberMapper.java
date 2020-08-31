package com.teamb.service;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;
 
/*
�씠	   由� : MemberMapper class
媛�  諛�   �옄 : 諛� 以� �뼵
�꽕	   紐� : 硫ㅻ쾭 留ㅽ띁  
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
	
	public boolean checkPasswd(String id, String passwd) {
		MemberDTO dto = getMember(id);
		if(dto.getPasswd().equals(passwd)) {
			return true;
		}
		return false;
	}
	
	public int updateMember(MemberDTO dto) {
		boolean isPass = checkPasswd(dto.getId(),dto.getPasswd());
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
	
	public int deleteMember(String id,String passwd) {
		int res = sqlSession.delete("deleteMember",id);
		return res;
	}
	
	public int getMemberNum(String id){
		return sqlSession.selectOne("getMemberNum",id);
	}
	
	public MemberDTO getMember(int memberNum) {
		MemberDTO dto = sqlSession.selectOne("getMember", memberNum);
		return dto;
	}
	
	public int comm_updateMember(MemberDTO dto) {
		int res = sqlSession.update("comm_updateMember", dto);
		return res;
	}

}


