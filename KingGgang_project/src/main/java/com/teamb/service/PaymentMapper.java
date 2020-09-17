package com.teamb.service;

import java.util.Hashtable;
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
	
	public int deletePayment(int no) {
		int res =  sqlSession.delete("deletePayment",no);
		return res;
	}
	
	public int getPayno(int m_no) {
		int no = sqlSession.selectOne("getPayno",m_no);
		return no;
	}
	
	public List<PaymentDTO> getPaymentlist(PaymentDTO pdto){
		return sqlSession.selectList("getPayment",pdto);
	}
	
	public PaymentDTO getPaymentNo(int no) {
		return sqlSession.selectOne("getPaymentNo",no);
	}
	
	public List<PaymentDTO> getAllPaymentlist(int valid){
		return sqlSession.selectList("getAllPayment",valid);
	}
	
	public PaylistDTO getmyPaylist(PaymentDTO ptdto) {
		return sqlSession.selectOne("getMyPaylist",ptdto);
	}
	
	public PaylistDTO getadPaylist(PaymentDTO ptdto) {
		
		return sqlSession.selectOne("getAdPaylist",ptdto);
	}
	
	public int getpayCount(){
		int count = sqlSession.selectOne("getpayCount");
			return count;
	}
	
	public MemberDTO getpayMember(int memberNum){
		return sqlSession.selectOne("getpayMember",memberNum);
	}

	public List<PaymentDTO> getAdminList() {
		return sqlSession.selectList("adminList");
	}
	
}	
	
	