package com.teamb.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
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
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.CommReplyMapper;
import com.teamb.service.CommboardMapper;


/*�뜝�럩逾�	   占쎈뎨�뜝占� : CommMyBoardController
�뤆�룊�삕  �뛾�룊�삕   �뜝�럩�겱 : 嶺뚣끏�삕 �뜝�럩逾� �뜝�럥�닡,�뜝�럩逾� �뜝�럥�뿰 嶺뚯쉻�삕
�뜝�럡�맟	   嶺뚮쪋�삕 : 占쎈슔�걞�뜝�뜫�걞占쎈퉵�뜝�럥諭� 嶺뚮씭�쐠占쎈턄�뇦猿딆뒩占쎈뻣�뜝�럥�냷 占쎈슓維귨옙諭쒎슖�뼯�걞占쎌몠
*/

@Controller
public class CommMyBoardController {
	
	@Autowired
	private CommboardMapper boardMapper;
	
	@Autowired
	private CommReplyMapper replyMapper;
 
	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/comm_writeForm.do", method = RequestMethod.GET)
	public String writeForm(HttpServletRequest req) {
		return "comm/board/comm_writeForm";
	}

	@RequestMapping(value = "/comm_writePro.do", method = RequestMethod.POST)
	public String writePro(HttpServletRequest req, @ModelAttribute CommboardDTO dto, BindingResult result) {

		if (result.hasErrors()) {
			dto.setBoardNum(0);
			dto.setRe_step(0);
			dto.setRe_level(0);
			dto.setRe_group(0);
		}

		HttpSession session = req.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
		Comm_MemberDTO commmember = (Comm_MemberDTO)session.getAttribute("commmember");

		String file_name = "";
		int file_size = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("file_name");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(target);
			} catch (IOException e) {
			}
			file_name = file.getOriginalFilename();
			file_size = (int) file.getSize();
		}
		dto.setComm_memberNum(comm_memberNum);
		dto.setFile_name(file_name);
		dto.setFile_size(file_size);
	/*	req.setAttribute("profile_name", member.getProfile_name());
		req.setAttribute("name", member.getName());*/

		int res = boardMapper.writeBoard(dto);

		String msg = null, url = null;
		if (res > 0) {
			msg = "글 등록되었습니다";
			url = "comm_myPage.do";
		} else {
			msg = "글 등록에 실패하였습니다.";
			url = "comm_writeForm.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/comm_myPage.do")
	   public String myPage(HttpServletRequest req, HttpSession session) {

	      MemberDTO member = (MemberDTO) session.getAttribute("login");
	      
	      Comm_MemberDTO commmember = (Comm_MemberDTO)session.getAttribute("commmember");
	      int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
	      
	      List<CommboardDTO> list = boardMapper.listBoard(comm_memberNum);

	      req.setAttribute("boardList", list);
	      /*req.setAttribute("comm_nickname", commmember.getComm_nickname());*/
	      /*req.setAttribute("profile_name",member.getProfile_name());
	      System.out.println(member.getProfile_name());
	      req.setAttribute("name",member.getName());*/
	      return "comm/board/comm_myPage";
	   }
	
	@RequestMapping(value = "/comm_content.do", method = RequestMethod.GET)
	public String content(HttpServletRequest req, @RequestParam int boardNum) {

		CommboardDTO dto = boardMapper.getBoard(boardNum);
		req.setAttribute("getBoard", dto);
		
		List<CommReplyDTO> list = replyMapper.listReply(boardNum);
		
		req.setAttribute("replyList", list);

		HttpSession session = req.getSession();
		String mbId = (String) session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null)
			isLogin = true;
		req.setAttribute("isLogin", isLogin);

		return "comm/board/comm_content";
	}
	
	@RequestMapping(value = "/comm_writeReply.do", method = RequestMethod.POST)
	public String writeReply(CommReplyDTO dto, HttpServletRequest req, @RequestParam int boardNum) {
		replyMapper.writeReply(dto);
		req.setAttribute("boardNum", dto.getBoardNum());
		return "redirect:/"; //질문할꺼임.
	}

	@RequestMapping("/comm_bookMark.do")
	public String bookmark(HttpServletRequest req) {
		return "comm/board/comm_bookMark";
	}

	@RequestMapping(value = "/comm_updateForm.do", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam int boardNum) {
		CommboardDTO dto = boardMapper.getBoard(boardNum);
		ModelAndView mav = new ModelAndView("comm/board/comm_updateForm", "getBoard", dto);
		return mav;
	}

	@RequestMapping(value = "/comm_updatePro.do", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest req, HttpSession session, @ModelAttribute CommboardDTO dto, @RequestParam int boardNum) {
		
		int res = boardMapper.updateBoard(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "글이 수정되었습니다!!";
			url = "comm_myPage.do";
		}else{
			msg = "글 수정에 실패하였습니다!!";
			url = "comm_updateForm.do";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);

		return "message";
	}

	@RequestMapping(value = "/comm_deletePro.do")
	public ModelAndView deletePro(@RequestParam int boardNum) {
		int res = boardMapper.deleteBoard(boardNum);
		String msg = null, url = null;
		if (res > 0) {
			msg = "글이 삭제되었습니다.";
			url = "comm_myPage.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	@RequestMapping(value = "/reply_updateForm.do", method = RequestMethod.GET)
	public String updatereplyForm(CommReplyDTO dto, HttpServletRequest req, @RequestParam int replyNum) {
		replyMapper.updateReply(dto);
		req.setAttribute("replyNum", dto.getReplyNum());
		return "redirect:comm/board/comm_Mypage";
	}
	
	@RequestMapping(value = "/reply_updatePro.do", method = RequestMethod.POST)
	public String updatereplyPro(CommReplyDTO dto, HttpServletRequest req, @RequestParam int replyNum) {
		replyMapper.updateReply(dto);
		req.setAttribute("replyNum", dto.getReplyNum());
		return "redirect:comm/board/comm_Mypage";
	}
	
	@RequestMapping(value = "/reply_deletePro.do")
	public ModelAndView deletereplyPro(@RequestParam int replyNum) {
		int res = replyMapper.deleteReply(replyNum);
		System.out.println(replyNum);
		String msg = null, url = null;
		if (res > 0) { 
			msg = "�뙎湲��씠 �궘�젣 �릺�뿀�뒿�땲�떎.";
			url = "comm_content.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
}