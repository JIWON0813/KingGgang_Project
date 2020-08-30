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

import com.teamb.model.CommboardDTO;
import com.teamb.model.MemberDTO;
import com.teamb.service.CommboardMapper;


/*이	   름 : CommMyBoardController
개  발   자 : 최 인 아,이 여 진
설	   명 : 커뮤니트 마이게시판 컨트롤러
*/

@Controller  
public class CommMyBoardController {
	@Autowired
	private CommboardMapper boardMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/comm_writeForm.do", method = RequestMethod.GET)
	public String writeForm(HttpServletRequest req) {
		/*HttpSession session = req.getSession();
		String mbId = (String) session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null)
			isLogin = true;
		req.setAttribute("isLogin", isLogin);

		String msg = null, url = null;
		if (mbId == null) {
			msg = "로그인을 해주세요.";
			url = "login.log";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}*/
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
		dto.setId(member.getId());
		dto.setFile_name(file_name);
		dto.setFile_size(file_size);
		
		/*req.setAttribute("profile_name", member.getProfile_name());
		req.setAttribute("name", member.getName());*/

		int res = boardMapper.writeBoard(dto);

		String msg = null, url = null;
		if (res > 0) {
			msg = "게시물이 등록되었습니다.";
			url = "comm_myPage.do";
		} else {
			msg = "게시물 등록이 실패하였습니다.";
			url = "comm_writeForm.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/comm_myPage.do")
	public String myPage(HttpServletRequest req, HttpSession session) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		String id = member.getId();
		List<CommboardDTO> list = boardMapper.listBoard(id);  

		req.setAttribute("boardList", list);
	/*	req.setAttribute("profile_name", member.getProfile_name());*/
		req.setAttribute("name", member.getName());

		return "comm/board/B4_myPage";
	}

	@RequestMapping(value = "/comm_content.do", method = RequestMethod.GET)
	public String content(HttpServletRequest req, @RequestParam int boardNum) {

		CommboardDTO dto = boardMapper.getBoard(boardNum);
		req.setAttribute("getBoard", dto);

		HttpSession session = req.getSession();
		String mbId = (String) session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null)
			isLogin = true;
		req.setAttribute("isLogin", isLogin);

		return "comm/board/B4_content";
	}

	@RequestMapping("/comm_bookMark.do")
	public String bookmark(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mbId = (String) session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null)
			isLogin = true;
		req.setAttribute("isLogin", isLogin);

		String msg = null, url = null;
		if (mbId == null) {
			msg = "�α��� �� �̿� �����մϴ�.";
			url = "login.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}

		return "comm/board/B4_bookMark";
	}

	@RequestMapping(value = "/comm_updateForm.do", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam int boardNum) {
		CommboardDTO dto = boardMapper.getBoard(boardNum);
		ModelAndView mav = new ModelAndView("updateForm", "getBoard", dto);
		return mav;
	}

	@RequestMapping(value = "/comm_updatePro.do", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest req, HttpSession session, @ModelAttribute CommboardDTO dto,
			BindingResult result) {
		if (result.hasErrors()) {
			dto.setBoardNum(0);
		}
		dto = (CommboardDTO) session.getAttribute("getBoard");
		int res = boardMapper.updateBoard(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "�Խñۼ�������!!";
			url = "comm/board/B4_myPage.do";
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);

		return "messsage";
	}

	@RequestMapping(value = "/comm_deletePro.do")
	public ModelAndView deletePro(@RequestParam int boardNum) {
		int res = boardMapper.deleteBoard(boardNum);
		String msg = null, url = null;
		if (res > 0) {
			msg = "����� ���� �����Ǿ����ϴ�.";
			url = "comm/board/B4_myPage.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
}