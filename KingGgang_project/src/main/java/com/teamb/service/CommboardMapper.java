package com.teamb.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.Comm_NoticeDTO;
import com.teamb.model.CommboardDTO;
@Service
public class CommboardMapper {
	   
	@Autowired
	private SqlSession sqlSession;

	public CommboardDTO getBoard(int boardNum) {
	      return sqlSession.selectOne("getBoard",boardNum);    
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
	
	/*public int deleteAllBoard(int comm_memberNum,int boardNum) {   
		  int res = sqlSession.insert("deleteBoard", boardNum);
		  return res;
	}*/

	public int updateBoard(CommboardDTO dto) {
		int res = sqlSession.update("updateBoard", dto);
		return res;
	}

	public List<CommboardDTO> listBoard(int comm_memberNum) {
		   return sqlSession.selectList("listBoard",comm_memberNum);
	}
		  
	public List<CommboardDTO> allListBoard() {
		   return sqlSession.selectList("allListBoard");
	}
	
	public void plusReadcount(int boardNum) {
	      sqlSession.update("plusReadcount", boardNum);
	      return;
	}
	
	/*public CommboardDTO read(int boardNum) {
	    CommboardDTO dto = sqlSession.selectOne("read", boardNum);
	    return dto;
	}
	
	public void likecnt_up(int boardNum) {
		 return sqlSession.delete("likecnt_up", boardNum);
		
	}
	
	public void likecnt_down(int boardNum) {
		// TODO Auto-generated method stub
		
	}*/
	   /*public void likeCount(int bNum,int mNum) {
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
*/
	   public int getCount() {
	      // TODO Auto-generated method stub
	      return 0;
	   }

	public int comm_insertNotice(Comm_NoticeDTO dto) {
		 int res = sqlSession.insert("comm_insertNotice", dto);
		  return res;
	}

	public List<Comm_NoticeDTO> comm_noticeAllList() {
		  return sqlSession.selectList("comm_noticeAllList");
	}
	public List<Comm_NoticeDTO> comm_noticeMemberList(String comm_mode) {
		  return sqlSession.selectList("comm_noticeMemberList",comm_mode);
	}
	/*public List<Comm_NoticeDTO> comm_noticeAloneList() {
		  return sqlSession.selectList("comm_noticeAloneList");
	}*/

	public int comm_deleteNotice(int comm_noticeNum) {
		int res = sqlSession.insert("comm_deleteNotice",comm_noticeNum);
		  return res;
	}

	public Comm_NoticeDTO comm_getNotice(int comm_noticeNum) {
		 return sqlSession.selectOne("comm_getNotice",comm_noticeNum);    
	}
	public int comm_updateNotice(Comm_NoticeDTO dto) {
		int res = sqlSession.update("comm_updateNotice", dto);
		return res;
	}

	}