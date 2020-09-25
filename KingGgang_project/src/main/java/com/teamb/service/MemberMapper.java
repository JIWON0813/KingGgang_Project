package com.teamb.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;

@Service
public class MemberMapper {

	@Autowired
	private SqlSession sqlSession;
	
	

	public List<MemberDTO> listMembernum(int startRow, int endRow) {
		Map<String,Integer> map = new Hashtable<String,Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		return sqlSession.selectList("listMembernum",map);
	}
	
	public List<MemberDTO> listMember(){
		return sqlSession.selectList("listMember");
	}
	
	public List<MemberDTO> searchMember(String search,String searchString){
		java.util.Map<String,String> map = new java.util.Hashtable<>();
		if(search == null||searchString==null){
			search="";
			searchString="";
		}
		map.put("search", search);
		map.put("searchString", searchString);
		List<MemberDTO> find = sqlSession.selectList("adminSearchMember",map);		
		return find;
	}
	
	public int insertMember(MemberDTO dto) {
		int res = sqlSession.insert("insertMember", dto);
		
		return res;
	}
	
	public MemberDTO getMember(int memberNum) {
		MemberDTO dto = sqlSession.selectOne("getMember", memberNum);
		if(dto == null)
			return null;
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
	
	public MemberDTO getMemberId(String id){
		MemberDTO dto = sqlSession.selectOne("getMemberId",id);
		return dto;
	}
	
	public int getCount(){
		int count = sqlSession.selectOne("getMcount");
		return count;
	}

}