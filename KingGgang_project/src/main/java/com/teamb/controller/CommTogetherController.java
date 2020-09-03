package com.teamb.controller;

/*이	   름 : CommTogetherController.java
개  발   자 : 최 인 아
설	   명 : 투게더Controller*/

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamb.model.CommTogetherDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.service.CommReplyMapper;
import com.teamb.service.CommTogetherMapper;

@Controller
public class CommTogetherController {
	
	@Autowired
	private CommTogetherMapper togetherMapper;
 
	@RequestMapping("/comm_togetherList.do")
	public String togetherList(HttpServletRequest req) {
		return "comm/board/comm_togetherList";
	}
	
	@RequestMapping("/comm_togetherWF.do")
	public String togetherWF(HttpServletRequest req) {
		return "comm/board/comm_togetherWF";
	}
	
	@RequestMapping(value = "/comm_togetherWP.do", method = RequestMethod.POST)
	public String togetherWP(HttpServletRequest req, CommTogetherDTO dto, BindingResult result) {
		
		if (result.hasErrors()) {
			dto.setTogetherNum(0);
		}
		
		HttpSession session = req.getSession();
		int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
		dto.setComm_memberNum(comm_memberNum);
		
		int res = togetherMapper.writeTogether(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "글 등록되었습니다.";
			url = "comm_togetherList.do";
		} else {
			msg = "글 등록에 실패하였습니다.";
			url = "comm_togetherWF.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
}
