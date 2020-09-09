package com.teamb.controller;

/*�씠	   由� : CommTogetherController.java
媛�  諛�   �옄 : 理� �씤 �븘
�꽕	   紐� : �닾寃뚮뜑Controller*/

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.CommReplyDTO;
import com.teamb.model.CommTogetherDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.service.CommReplyMapper;
import com.teamb.service.CommTogetherMapper;

@Controller
public class CommTogetherController {
	
	@Autowired
	private CommTogetherMapper togetherMapper;
 
	@RequestMapping(value = "/comm_togetherWF.do", method = RequestMethod.GET)
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
			msg = "湲� �벑濡앸릺�뿀�뒿�땲�떎.";
			url = "comm_togetherList.do";
		} else {
			msg = "湲� �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎.";
			url = "comm_togetherWF.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	//여진
		@RequestMapping("/comm_mainTogetherList")
		public String mainTogetherList(HttpServletRequest req, HttpSession session) {
			List<CommTogetherDTO> list = new ArrayList<>();
		
			if(session.getAttribute("comm_memberNum") == null){

			}else{
				int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
				list = togetherMapper.listTogether(comm_memberNum);
				req.setAttribute("togetherList", list);
			}
			  
			  
			return "comm/board/comm_mainTogetherList";
		}
		
	@RequestMapping("/comm_togetherList.do")
	public String togetherList(HttpServletRequest req, HttpSession session) {
		
	    int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
	    List<CommTogetherDTO> list = togetherMapper.listTogether(comm_memberNum);
	    req.setAttribute("togetherList", list);
	      
		return "comm/board/comm_togetherList";
	}
	
	@RequestMapping(value = "/comm_tcontent.do", method = RequestMethod.GET)
	public String tcontent(HttpServletRequest req, @RequestParam int togetherNum) {
		
		togetherMapper.plustReadcount(togetherNum);
		CommTogetherDTO dto = togetherMapper.getTogether(togetherNum);
		req.setAttribute("getTogether",dto);
		
		return "comm/board/comm_tcontent";
	}
	
	@RequestMapping(value = "/comm_tupdateForm.do", method = RequestMethod.GET)
	public ModelAndView tupdateForm(@RequestParam int togetherNum) {
		CommTogetherDTO dto = togetherMapper.getTogether(togetherNum);
		ModelAndView mav = new ModelAndView("comm/board/comm_tupdateForm", "getTogether", dto);
		return mav;
	}

	@RequestMapping(value = "/comm_tupdatePro.do", method = RequestMethod.POST)
	public String tupdatePro(HttpServletRequest req, HttpSession session, @ModelAttribute CommTogetherDTO dto, 
			@RequestParam int togetherNum) {
		
		int res = togetherMapper.updateTogether(dto);
		String msg = null, url = null;

		if (res > 0) {
			msg = "湲��씠 �닔�젙�릺�뿀�뒿�땲�떎!!";
			url = "comm_tcontent.do";
		}else{
			msg = "湲� �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎!!";
			url = "comm_tupdateForm.do";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);

		return "message";
	}
	
	@RequestMapping(value = "/comm_tdeletePro.do")
	public ModelAndView tdeletePro(@RequestParam int togetherNum) {
		int res = togetherMapper.deleteTogether(togetherNum);
		String msg = null, url = null;

		if (res > 0) {
			msg = "湲��씠 �궘�젣�릺�뿀�뒿�땲�떎.";
			url = "comm_togetherList.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
}