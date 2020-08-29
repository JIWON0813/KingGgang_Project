package com.teamb.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.B4_boardDTO;
import com.teamb.model.B4_memberDTO;
import com.teamb.service.B4_boardMapper;

@Controller
public class Comm_MyBoardController {
	private static final Logger logger = LoggerFactory.getLogger(Comm_MyBoardController.class);
	
	@Autowired
	private B4_boardMapper boardMapper;

	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@RequestMapping(value ={"/"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "index";
		
	}
	
	   @RequestMapping("/index.do")
	   public String index(HttpServletRequest req,HttpSession session) {
	      return "index";
	   }

	@RequestMapping(value = "/B4_writeForm.do", method = RequestMethod.GET)
	public String writeForm(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
		
		String msg = null, url = null;
		if(mbId == null){
			msg="로그인 후 이용 가능합니다.";
			url="login.do";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
		return "board/B4_writeForm";
	}
	
	
	@RequestMapping(value = "/writePro.do", method = RequestMethod.POST)
    public String writePro(HttpServletRequest req, 
          @ModelAttribute B4_boardDTO dto, BindingResult result) {
    
    if (result.hasErrors()){
          dto.setBoardNum(0);
          dto.setRe_step(0);
          dto.setRe_level(0);
          dto.setRe_group(0);
       }
       
       HttpSession session = req.getSession();
       int memberNum = (Integer)session.getAttribute("memberNum");
       B4_memberDTO member = (B4_memberDTO)session.getAttribute("member");
       
       String file_name = "";
       int file_size = 0;
       MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
       MultipartFile file =mr.getFile("file_name");
       File target = new File(upLoadPath, file.getOriginalFilename());
       if(file.getSize()>0) {
          try{
          file.transferTo(target);
          }catch(IOException e){}
          file_name = file.getOriginalFilename();
          file_size = (int)file.getSize();
       }
       dto.setFile_name(file_name);
       dto.setFile_size(file_size);
       dto.setMemberNum(memberNum);
       req.setAttribute("profile_name",member.getProfile_name());
      req.setAttribute("name",member.getName());
       
       int res = boardMapper.writeBoard(dto);
      
       String msg = null, url = null;
       if(res>0){
          msg="게시물이 등록되었습니다.";
          url="B4_myPage.do";
       }else{
          msg="게시물 등록이 실패하였습니다.";
          url="B4_writeForm.do";
       }
       req.setAttribute("msg", msg);
       req.setAttribute("url", url);
       return "message";
    }
	
	
	@RequestMapping("/B4_myPage.do")
	public String myPage(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
		
		String msg = null, url = null;
		if(mbId == null){
			msg="占싸깍옙占쏙옙 占쏙옙 占싱울옙 占쏙옙占쏙옙占쌌니댐옙.";
			url="login.do";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

		B4_memberDTO member = (B4_memberDTO)session.getAttribute("member");
		
		int memberNum = (Integer)session.getAttribute("memberNum");
		
		List<B4_boardDTO> list = boardMapper.listBoard(memberNum);
		
		req.setAttribute("boardList",list);
		req.setAttribute("profile_name",member.getProfile_name());
		//System.out.println(member.getProfile_name());
		req.setAttribute("name",member.getName());
		
		
		return "board/B4_myPage";
	}
	
	@RequestMapping(value = "/B4_content.do", method = RequestMethod.GET)
	public String content(HttpServletRequest req, @RequestParam int boardNum){
		
		B4_boardDTO dto = boardMapper.getBoard(boardNum);
		req.setAttribute("getBoard",dto);
		
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
		
		return "board/B4_content";
	}
			
		
	@RequestMapping("/B4_bookMark.do")
	public String bookmark(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
			
		String msg = null, url = null;
			if(mbId == null){
				msg="로그인 후 이용 가능합니다.";
				url="login.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
			
			return "board/B4_bookMark";
		}
		
	@RequestMapping(value="/B4_updateForm.do", method=RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam int boardNum){
		B4_boardDTO dto = boardMapper.getBoard(boardNum);
		ModelAndView mav = new ModelAndView("updateForm", "getBoard", dto);
		return mav;
	}  
	
	@RequestMapping(value="/updatePro.do", method=RequestMethod.POST)
	public String updatePro(HttpServletRequest req, HttpSession session, @ModelAttribute B4_boardDTO dto, BindingResult result){
		if(result.hasErrors()) {
			dto.setBoardNum(0);
		}
		dto = (B4_boardDTO)session.getAttribute("getBoard");
		int res = boardMapper.updateBoard(dto);
		String msg = null, url = null;
		if (res>0){
			msg = "게시글수정성공!!";
			url = "board/B4_myPage.do";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "messsage";
	}	
	
	@RequestMapping(value = "/deletePro.do")
	public ModelAndView deletePro(@RequestParam int boardNum) {
		int res = boardMapper.deleteBoard(boardNum);
		String msg = null, url = null;
		if (res>0){
			msg = "저장된 글이 삭제되었습니다.";
			url = "board/B4_myPage.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
}

