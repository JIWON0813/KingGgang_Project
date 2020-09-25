package com.teamb.controller;


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
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.MemberDTO;
import com.teamb.model.QuestionDTO;
import com.teamb.service.QuestionMapper;
/*
이	   름 : QuestionController
개   발   자 : 박 준 언
설	   명 : 문의게시판 컨트롤러 
*/
@Controller
public class QuestionController 
{
	@Autowired
	private QuestionMapper questMapper;
	
	@RequestMapping(value = "/Q_list.board")
	public String Q_list(HttpServletRequest req,HttpSession session) throws Exception {	
				
		String pageNum = req.getParameter("pageNum");
		if (pageNum==null)
		{
			pageNum = "1";
		}
		
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int	count = questMapper.getCount();	
		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize); 
		List<QuestionDTO> list = questMapper.listQuest(startRow, endRow);
		req.setAttribute("listBoard", list);
		req.setAttribute("startNum", startNum);
		if (count>0)
		{
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if (endPage>pageCount) 
			{
				endPage = pageCount;
			}
			
			req.setAttribute("count", count);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
		}	
		
		return "board/Q_board/list";
	}
	
	@RequestMapping("/searchQ.board")
	public String searcQ(HttpServletRequest req){
		String mode = req.getParameter("mode");
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		int count = questMapper.getSCount(search, searchString);
		List<QuestionDTO> list = questMapper.searchQuest(search, searchString);
		req.setAttribute("startNum", count);
		req.setAttribute("mode", mode);
		req.setAttribute("listBoard",list);

		return "board/Q_board/list";
	}
	
	@RequestMapping(value = "/Q_write.board", method = RequestMethod.GET)
	public String write()
	{
		
		return "board/Q_board/writeForm";
	}


	@RequestMapping(value = "/Q_write.board", method = RequestMethod.POST)
	public String writePro(HttpServletRequest req, @ModelAttribute QuestionDTO dto, BindingResult result)
	{
		HttpSession session = req.getSession();
		if (result.hasErrors())
		{
			dto.setNum(0);
			dto.setRe_group(0);
			dto.setRe_step(0);
			dto.setRe_level(0);
		}
		
		dto.setIp(req.getRemoteAddr());
		int res = questMapper.insertQuest(dto);
	
		String msg = null, url = "Q_list.board";
		if (res>0)
		{
			msg = "게시글이 등록되었습니다.";
			url = "Q_list.board";
		}
		else 
		{
			msg = "게시글 등록 실패 관리자에게 문의하세요.";
			url = "Q_list.write";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
	}
	
	@RequestMapping(value = "/Q_content.board")
	public String content(HttpServletRequest req, @RequestParam int num){
		questMapper.Q_plusReadcount(num);
		QuestionDTO dto = questMapper.getQuest(num);
		req.setAttribute("Quest", dto);
		return "board/Q_board/content";
	}

	@RequestMapping("/Q_passck.board")
	public String contentpass(HttpServletRequest req, @RequestParam int num){
		req.setAttribute("num", num);
		return "board/Q_board/passck";
	}
	@RequestMapping(value = "/Q_contentpassok.board")
	public String contentpassok(HttpServletRequest req, @RequestParam int num){
		
		questMapper.Q_plusReadcount(num);
		QuestionDTO dto = questMapper.getQuest(num);
		boolean passck = questMapper.checkPw(dto.getPasswd(), req.getParameter("passwd"));
		String msg=null,url=null;
		if(passck){
			req.setAttribute("Quest", dto);
			return "board/Q_board/content";
		}else{
			msg="비밀번호를 확인해주세요";
			url="Q_passck.board?type=1&num="+num;
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value = "/Q_deletepassok.board")
	public String deletePro(HttpServletRequest req,HttpSession session, @RequestParam int num)
	{
		QuestionDTO dto = questMapper.getQuest(num);
		String msg=null,url=null;
		if(session.getAttribute("mbId")==null||!session.getAttribute("mbId").toString().equals("admin")){
			boolean passck = questMapper.checkPw(dto.getPasswd(), req.getParameter("passwd"));
			if(passck){
				int res = questMapper.deleteQuest(num);
				if(res>0){
					msg = "게시글이 삭제되었습니다.";
					url = "Q_list.board";
				}else{
				msg = "게시글 삭제 실패 관리자에게 문의하세요.";
				url = "Q_list.board";
				}
			}else{
				msg = "비밀번호를 확인해주세요";
				url = "Q_passck.board?type=3&num="+num;
			}
		}else if(session.getAttribute("mbId").toString().trim().equals("admin")){
			int res = questMapper.deleteQuest(num);
			if(res>0){
				msg = "게시글이 삭제되었습니다.";
				url = "Q_list.board";
			}else{
			msg = "게시글 삭제 실패";
			url = "Q_list.board";
			}
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping(value = "/Q_updatepassok.board")
	public String update(HttpServletRequest req,HttpSession session,@RequestParam int num)
	{
		QuestionDTO dto = questMapper.getQuest(num);
		String msg=null,url=null;
		if(session.getAttribute("mbId")==null||!session.getAttribute("mbId").toString().equals("admin")){
			boolean passck = questMapper.checkPw(dto.getPasswd(), req.getParameter("passwd"));
			if(passck){
				req.setAttribute("Quest", dto);
				return "board/Q_board/updateForm";
			}else{
				msg = "비밀번호를 확인해주세요";
				url = "Q_passck.board?type=2&num="+num;
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			}
		}else if(session.getAttribute("mbId").toString().trim().equals("admin")){
			req.setAttribute("Quest", dto);
		}
		return "board/Q_board/updateForm";
	}


	@RequestMapping(value = "/Q_updatepro.board")
	public String updatePro(HttpServletRequest req, @ModelAttribute QuestionDTO dto)
	{
		String msg = null, url = "Q_list.board";
		int res = questMapper.updateQuest(dto);	
		if (res>0)
		{
			msg = "게시글이 수정되었습니다.";
		}
		else 
		{
			msg = "게시글 수정 실패";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
			
		return "message";
	}

}
