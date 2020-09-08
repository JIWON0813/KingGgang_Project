package com.teamb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.service.CommNewsFeedMapper;
import com.teamb.service.Comm_MemberMapper;
import com.teamb.service.CommboardMapper;


/*
 �씠	   由� : CommNewsfeedController
媛�  諛�   �옄 : �씠�뿬吏�
�꽕	   紐� : 而ㅻ�ㅻ땲�떚 �돱�뒪�뵾�뱶 而⑦듃濡ㅻ윭
*/


@Controller
public class CommNewsfeedController {

	@Autowired
	private CommboardMapper boardMapper;
	private CommNewsFeedMapper newsfeedMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping("/commhome.comm")
	public String index(HttpServletRequest req, HttpSession session,Comm_MemberDTO dto) {
		
		String mbId = (String)session.getAttribute("mbId");
		Comm_MemberDTO comm_login = (Comm_MemberDTO)session.getAttribute("comm_login");
		List<CommboardDTO> list = boardMapper.allListBoard();
		req.setAttribute("boardList", list);		
		
		return "comm/index";
	}

	
	@RequestMapping("/commadmin.comm")
	public String admin(HttpServletRequest req){
		return "comm/comm_admin";
	}
	
	@RequestMapping("/commSearch")
	public String commSearch(HttpServletRequest req,Comm_MemberDTO dto){
		String word = req.getParameter("word");
		  ArrayList<Comm_MemberDTO> arrList  = new ArrayList<Comm_MemberDTO>();
				arrList.addAll(newsfeedMapper.getSearchComm_Member(word));
		return "arrList";
	}
	
	
	/*@ResponseBody 
	@RequestMapping(value = "/getMoreContents_ajax.do")
	 public void getMoreContents(CommboardDTO dto,HttpServletRequest req, HttpServletResponse res) throws ParseException, IOException {
		String viewCount = req.getParameter("viewCount");
		String startCount = req.getParameter("startCount");
			
		JSONArray resultList = newsfeedMapper.allListBoard(startCount,viewCount);
		int resultCnt = 
		 
		json.put("resultList",resultList);
		json.put("resultCnt",resultCnt);
		
		res.setContentType("application/json; charset=utf-8");
		res.getWriter().write(json.toString());
				
		
	 }      */
}
