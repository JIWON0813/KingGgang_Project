package com.teamb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.teamb.model.InsuDTO;
import com.teamb.model.RentcarDTO;
import com.teamb.model.Rentcar_ResDTO;




@Service
public class RentcarMapper {
	
	/*
	이	   름 : RentcarMapper class
	개  발   자 : 정 우 철
	설	   명 : 렌트카 service class  
	*/
	
	@Autowired
	private SqlSession sqlSession;
	
	//렌트카_어드민 페이지
	public List<RentcarDTO> listRentcar(){
		return sqlSession.selectList("listRentcar");
	}
	
	public List<Rentcar_ResDTO> listRentcarReservation(){
		return sqlSession.selectList("listRentcarReservation");
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
	
	public List<Rentcar_ResDTO> listRentcarReservationTime(int r_id){
		return sqlSession.selectList("listRentcarReservationTime",r_id);
	}
	

	//렌트카_회원 페이지
	public List<RentcarDTO> findRentcar(String str,Object obj,String receiptday,String returnday){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("str",str);
		map.put("obj",obj);
		map.put("receiptday",receiptday);
		map.put("returnday",returnday);
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
	
	public List<RentcarDTO> listLowPriceRentcar(String receiptday,String returnday){
		Map<String,String> map = new HashMap<String,String>();
		map.put("receiptday",receiptday);
		map.put("returnday",returnday);
		return sqlSession.selectList("listLowPriceRentcar",map);
	}
	
	public List<RentcarDTO> listCanReservationRentcar(String receiptday,String returnday){
		Map<String,String> map = new HashMap<String,String>();
		map.put("receiptday",receiptday);
		map.put("returnday",returnday);
		List<RentcarDTO> canResCarList = sqlSession.selectList("listCanReservationRentcar",map);
		return canResCarList;
	}
	
	public Rentcar_ResDTO findReturnTimeReservation(){
		return sqlSession.selectOne("findReturnTimeReservation");
	}
	
	public int updatePstatus(int res_id){
		return sqlSession.update("updatePstatus",res_id);
	}
	

	public List<Rentcar_ResDTO> checkAlreadyReservation(Rentcar_ResDTO resDTO){
		return sqlSession.selectList("checkAlreadyReservation",resDTO);
	}
	
	public int changePstSuc(int res_id){
			return sqlSession.update("changePstSuc",res_id);
	}
	
	@Scheduled(fixedDelay=100000)
	public void renewalRentcarReservation(){
		try{
			List<Rentcar_ResDTO> resList = sqlSession.selectList("findUnPaidReservation");
			if(resList.size()>0){
				for(int i=0;i<resList.size();i++){
					int res_id = resList.get(i).getRes_id();
					if(updatePstatus(res_id)>0){
					System.out.println(res_id+"번 렌트카 예약 결제 실패(회원ID : "+resList.get(i).getMember_id()+")");
					}
				}
			}
		}catch(NullPointerException e){
			e.printStackTrace();
		}
	}


	//김지원
	public Rentcar_ResDTO getRentcarRes(int res_id){
		return sqlSession.selectOne("getRentcarRes", res_id);
	}
	
	//렌트카 결제 (for Pstatus update) 원세호
	
	public int getRes_id(String member_id){
		return sqlSession.selectOne("getRes_id",member_id);
	}
	
	public int updatePstSuc(int res_id){
			return sqlSession.update("updatePstSuc",res_id);
	}

	
}

