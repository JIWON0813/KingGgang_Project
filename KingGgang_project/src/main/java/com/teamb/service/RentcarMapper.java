package com.teamb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.InsuDTO;
import com.teamb.model.RentcarDTO;
import com.teamb.model.Rentcar_ResDTO;




@Service
public class RentcarMapper {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	//렌트카_어드민 페이지
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
	//렌트카_회원 페이지
	public List<RentcarDTO> findRentcar(String str,Object obj){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("str",str);
		map.put("obj",obj);
		return sqlSession.selectList("findRentcar",map);
	}
	
	//렌트카(보험) 어드민 페이지
	
	public int insertInsu(InsuDTO dto){
		return sqlSession.insert("insertInsu",dto);
	}
	
	public List<InsuDTO> listInsu(){
		return sqlSession.selectList("listInsu");
	}
	
	public int deleteInsu(int insu_id){
		return sqlSession.delete("deleteInsu",insu_id);
	}
	
	public int updateInsu(InsuDTO dto){
		return sqlSession.update("updateInsu",dto);
	}
	
	public InsuDTO getInsu(int insu_id){
		return sqlSession.selectOne("getInsu",insu_id);
	}
	
	//렌트카_회원 페이지
	
	public int insertRentcarReservation(Rentcar_ResDTO dto){
		return sqlSession.insert("insertRentcar_Res",dto);
	}
	
	public int updateRentcarReservation(int r_id){
		return sqlSession.insert("updateRentcar_Reservation",r_id);
	}
	
	public List<RentcarDTO> listNotReservationRentcar(){
		return sqlSession.selectList("listNotReservationRentcar");
	}
	
	public List<Rentcar_ResDTO> findReturnday(int r_id){
		return sqlSession.selectList("findReturnday",r_id);
	}
	
}

