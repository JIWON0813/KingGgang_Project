package com.teamb.service;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.HotelDTO;
import com.teamb.model.RentcarDTO;
import com.teamb.model.WishlistDTO;
import com.teamb.model.PaylistDTO;
import com.teamb.model.MemberDTO;
import com.teamb.model.PaymentDTO;
/*
이	   름 : PaymentMapper.java
개  발   자 : 원세호
설	   명 : 결제시스템 	Mapper
*/
@Service
public class PaymentMapper {
	
	@Autowired	
	private SqlSession sqlSession;
	
	public int insertPayment(PaymentDTO dto) {
		int res  = sqlSession.insert("insertPayment",dto);
		return res;
	}
	
	public int updatePayment(PaymentDTO dto) {
		int res =  sqlSession.update("updatePayment",dto);
		return res;
	}
	
	public int getPayno(String m_id) {
		int no = sqlSession.selectOne("getPayno",m_id);
		return no;
	}
	
	public List<PaymentDTO> getPaymentlist(String m_id){
		return sqlSession.selectList("getPayment",m_id);
	}
	
	public PaylistDTO getPaylist(PaymentDTO ptdto) {
		return sqlSession.selectOne("getHPaylist",ptdto);
	}
	
	public List<PaylistDTO> getPaytest(String m_id) {
		return sqlSession.selectList("testRow",m_id);
	}
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	

