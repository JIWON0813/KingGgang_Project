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

import com.teamb.model.QuestionDTO;
import com.teamb.service.QuestionMapper;
/*
이	   름 : QuestionController
개   발   자 : 최 희 상
설	   명 : 회원 문의게시판 컨트롤러 
*/
@Controller
public class QuestionController 
{
	@Autowired
	private QuestionMapper questMapper;
	
	@RequestMapping(value = "/Q_list.board")
	public String Q_list(HttpServletRequest req,HttpSession session)
	{	
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum==null)
		{
			pageNum = "1";
		}
		
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = questMapper.getCount();
		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize); 
		List<QuestionDTO> list = questMapper.listQuest(startRow, endRow);
		req.setAttribute("listBoard", list);
		req.setAttribute("startNum", startNum);
		
		if (count>0)
		{
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
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
		
		return "Q_board/list";
	}

	@RequestMapping(value = "/Q_write.board", method = RequestMethod.GET)
	public String write()
	{
		return "Q_board/writeForm";
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
			msg = "게시글을 등록하셨습니다. 메인화면으로 이동합니다.";
			url = "Q_list.board";
		}
		else 
		{
			msg = "게시글 등록 실패";
			url = "Q_list.write";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
	}


	@RequestMapping(value = "/Q_content.board")
	public String content(HttpServletRequest req, @RequestParam int num)
	{
		questMapper.Q_plusReadcount(num);
		QuestionDTO dto = questMapper.getQuest(num);
		req.setAttribute("Quest", dto);
		
		return "Q_board/content";
	}

	@RequestMapping(value = "/Q_delete.board")
	public String deletePro(HttpServletRequest req, @RequestParam int num)
	{
		int res = questMapper.deleteQuest(num);
		String msg=null,url=null;
		if(res>0){
			msg = "삭제완료";
			url = "Q_list.board";
		}else{
			msg = "삭제실패";
			url = "Q_list.board";
		}	
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
			
		return "message";
	}

	@RequestMapping(value = "/Q_update.board", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam int num)
	{
		QuestionDTO dto = questMapper.getQuest(num);
		
		return new ModelAndView("Q_board/updateForm", "Quest", dto);
	}


	@RequestMapping(value = "/Q_update.board", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest req, @ModelAttribute QuestionDTO dto)
	{
		String msg = null, url = "Q_list.board";
		

		int res = questMapper.updateQuest(dto);
			
		if (res>0)
		{
			msg = "게시글이 수정되었습니다. 메인화면으로 이동합니다.";
		}
		else 
		{
			msg = "해당 게시글은 수정할 수 없습니다. 관리자에게 문의해주세요.";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
			
		return "message";
	}

}
