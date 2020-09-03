package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommboardDTO;
@Service
public class CommboardMapper {
	
	@Autowired
	private SqlSession sqlSession;

	public CommboardDTO getBoard(int boardNum) {
		return sqlSession.selectOne("getBoard",boardNum);    
	}
	

	public void plusReadcount(int num) {
		sqlSession.update("plusReadcount", num);
		sqlSession.commit();
		return;
	}

	public void likeCount(int bNum,int mNum) {
		java.util.Map<String,Integer> map = new java.util.Hashtable<String,Integer>();
		map.put("bNum", bNum);
		map.put("mNum", mNum);
		if(isLike(bNum,mNum)){
			sqlSession.update("plusLikecount",bNum);
			sqlSession.update("plusIsLikecount",map);
		}else{
			sqlSession.update("minusLikecount",bNum);
			sqlSession.update("plusIsLikecount",map);
		}
		sqlSession.commit();
	}
	
	public boolean isLike(int bNum, int mNum){
		java.util.Map<String,Integer> map = new java.util.Hashtable<String,Integer>();
		map.put("bNum", bNum);
		map.put("mNum", mNum);
		int res=sqlSession.selectOne("isLike", map);
		if(res%2==0)return true;
		else return false;
	}


	public void warnCount(int bNum, int mNum) {
		
	}
	
	public boolean isWarn(int bNum, int mNum){
		return true;
	}

	public int insertBoard(CommboardDTO dto) {
		int res = sqlSession.insert("insertBoard", dto);
		return res;
	}
	
	public int writeBoard(CommboardDTO dto) {
		return sqlSession.insert("writeBoard",dto);
	}

	public int deleteBoard(int boardNum) {	

		int res = sqlSession.insert("deleteBoard",boardNum);
		return res;
	}

	public int updateBoard(CommboardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<CommboardDTO> listBoard(String id) {
		return sqlSession.selectList("listBoard",id);
	}
	
	public List<CommboardDTO> allListBoard() {
		return sqlSession.selectList("allListBoard");

	}

	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}