package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.RentcarDTO;




@Service
public class RentcarMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<RentcarDTO> listRentcar(){
		return sqlSession.selectList("listRentcar");
	}
	
	public int insertRentcar(RentcarDTO dto){
		int res = sqlSession.insert("insertRentcar",dto);
		return res;
	}
	
	public RentcarDTO getRentcar(int num){
		RentcarDTO dto = sqlSession.selectOne("getRentcar",num);
		return dto;
	}
	
	public int updateRentcar(RentcarDTO dto){
		int res = sqlSession.update("updateRentcar",dto);
		return res;
	}
	
	public int deleteRentcar(int num){
		int res = sqlSession.delete("deleteRentcar",num);
		return res;
	}
	
	
}
