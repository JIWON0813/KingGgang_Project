package com.teamb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.CommTogetherDTO;
import com.teamb.model.CommWarnDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.CommWarnMapper;
import com.teamb.service.Comm_MemberMapper;
import com.teamb.service.CommboardMapper;


@Controller
public class CommWarnController {
	
	@Autowired
	private CommWarnMapper warnMapper;
	
	@Autowired
	private CommboardMapper boardMapper;
	
	@Autowired
	private Comm_MemberMapper memberMapper;
	
	@Resource(name = "upLoadPath")
	private String upLoadPath;
	
	@RequestMapping("/comm_warnPro.do")
	public String warnPro(HttpServletRequest req, HttpSession session,
			CommWarnDTO dto, Comm_MemberDTO mdto, @RequestParam int boardNum) {
		
		CommboardDTO bdto = boardMapper.getBoard(boardNum);
		req.setAttribute("getBoard", bdto);
		
		int comm_memberNum = mdto.getComm_memberNum();
		
		int res = warnMapper.warnPro(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "신고등록되었습니다.";
			url = "comm_warnList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/comm_warnList.do")
	public String warnList(HttpServletRequest req, HttpSession session) {
		
		CommboardDTO bdto = (CommboardDTO) session.getAttribute("boardNum");
		
		int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
		List<CommWarnDTO> list = warnMapper.listWarn(comm_memberNum);
		for(CommWarnDTO wdto: list) {
			int w=wdto.getComm_memberNum();
			Comm_MemberDTO mdto=memberMapper.comm_getMember(w);
			wdto.setW_comm_nickname(wdto.getW_comm_nickname());
		}
		session.setAttribute("warnList", list);
		return "comm/warnList";
	}
	
	/*@RequestMapping(value = "/warn_deletePro.do")
	public String deletewarnPro(HttpServletRequest req, @RequestParam int warnNum) {
		warnMapper.deleteWarn(warnNum);
		req.setAttribute("warnNum", warnNum);
		
		return "comm/warnList";
	}*/
	

	@RequestMapping(value = "/warn_deletePro.do")
	public ModelAndView deletewarnPro(@RequestParam int warnNum) {
		int res = warnMapper.deleteWarn(warnNum);
		String msg = null, url = null;
		if (res > 0) {
			msg = "게시글이 삭제되었습니다.";
			url = "comm_warnList.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
}
