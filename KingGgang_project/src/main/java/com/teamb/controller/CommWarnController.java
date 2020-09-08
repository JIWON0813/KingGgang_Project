package com.teamb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamb.model.CommWarnDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.service.CommWarnMapper;


@Controller
public class CommWarnController {
	
	@Autowired
	private CommWarnMapper warnMapper;
	
	@Resource(name = "upLoadPath")
	private String upLoadPath;
	
	@RequestMapping(value = "/comm_warnPro.do", method = RequestMethod.POST)
	public String togetherWP(HttpServletRequest req, CommWarnDTO dto) {
		
		HttpSession session = req.getSession();
		int boardNum = (Integer)session.getAttribute("boardNum");
		dto.setBoardNum(boardNum);
		
		int res = warnMapper.warnPro(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "신고등록되었습니다.";
			url = "comm_newsfeed.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/comm_warnList.do")
	public String newsFeed(HttpServletRequest req) {
		return "comm/warnList";
	}
	
	

}
