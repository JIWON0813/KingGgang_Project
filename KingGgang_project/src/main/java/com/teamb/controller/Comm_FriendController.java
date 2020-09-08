package com.teamb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.Comm_FriendDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.Comm_FriendMapper;
import com.teamb.service.Comm_MemberMapper;
import com.teamb.service.MemberMapper;


/*
이      름 : Comm_MemberController
개  발   자 : 황지은
성      명 : 커뮤니티 친구 컨트롤러
*/
@Controller
public class Comm_FriendController {

   @Autowired
   private Comm_FriendMapper friendMapper;
   
   @Autowired
   private Comm_MemberMapper memberMapper;

   @Resource(name = "upLoadPath")
   private String upLoadPath;

	@RequestMapping("/comm_friend_insert.do")
	public String insertFriend(HttpServletRequest req, HttpSession session, 
							Comm_FriendDTO dto,Comm_MemberDTO mdto) {
		
		//Comm_MemberDTO login = (Comm_MemberDTO) session.getAttribute("comm_login");
		int login_comm_memberNum = (int) session.getAttribute("login_comm_memberNum");
		//select * from ( list) where id = m_id
		int comm_memberNum=dto.getComm_memberNum();
		String msg = null, url = null;
		
		if(login_comm_memberNum==comm_memberNum){
			msg="본인 자신은 친구 추가가 되지 않습니다.";
			url = "comm_memberList.do";
		}
		else{
			int res1= friendMapper.check_insertFriend(login_comm_memberNum,comm_memberNum);
			if(res1 == 0){
				int res = friendMapper.insertFriend(dto);
				if (res > 0) {
					msg = "친구 추가 성공. 친구목록 페이지로 이동";
					url = "comm_friendAll.do";
				} else {
					msg = "친구 추가 실패. 메인으로 이동";
					url = "commhome.comm";
				}
			}
			else{
				msg="이미 등록된 친구입니다.";
				url="comm_friendAll.do";
			}
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	
	@RequestMapping(value = "/comm_friendAll.do")
	public String listFriend(HttpServletRequest req, Comm_FriendDTO dto, 
				HttpSession session) {
		 Comm_MemberDTO login = (Comm_MemberDTO) session.getAttribute("comm_login");
		 
	      int comm_memberNum = login.getComm_memberNum();
		
		int login_comm_memberNum=(Integer)session.getAttribute("login_comm_memberNum");
		List<Comm_FriendDTO> list = friendMapper.listFriend(login_comm_memberNum);
		for(Comm_FriendDTO dto2: list){
			int m=dto2.getComm_memberNum();
			Comm_MemberDTO mdto=memberMapper.comm_getMember(m);
			dto2.setF_comm_profilename(mdto.getComm_profilename());
			dto2.setF_comm_profilesize(dto2.getF_comm_profilesize());
			dto2.setF_name(mdto.getComm_name());
		}
		session.setAttribute("friendList", list);
 

      return "comm/friend/friendAll";
   }

   
   
   @RequestMapping(value = "/comm_deleteFriend.do")
   public String deleteFriend(HttpServletRequest req,@RequestParam int friendNum) {
      int res = friendMapper.deleteFriend(friendNum);
      String msg = null, url = null;
      if (res > 0) {
         msg = "친구삭제 성공. 친구목록페이지로 이동";
         url = "comm_friendAll.do";
      }
      
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }
   
   @RequestMapping(value = "/comm_friendContent.do")
   public String content(HttpServletRequest req, HttpSession session,@RequestParam int friendNum) {
      int comm_memberNum=(Integer)session.getAttribute("comm_memberNum");
      Comm_FriendDTO dto = friendMapper.getFriend(friendNum);
      
      session.setAttribute("getFriend", dto);

      return "comm/friend/friendcontent";
   }
   
   
}