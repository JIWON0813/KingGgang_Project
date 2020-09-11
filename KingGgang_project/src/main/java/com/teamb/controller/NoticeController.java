package com.teamb.controller;

/*
이	   름 : NoticeController
개   발   자 : 최 희 상
설	   명 : 공지사항 컨트롤러 
*/

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.NoticeDTO;
import com.teamb.service.NoticeMapper;

@Controller
public class NoticeController
{
	String msg = null, url = null;
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@RequestMapping(value = "/list.notice")
	public String list(HttpServletRequest req)
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
		
		List<NoticeDTO> list = noticeMapper.listNotice(startRow, endRow);
		
		int count = noticeMapper.getCount();

		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize); 
		
		req.setAttribute("listNotice", list);
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
		
		return "Notice/list";
	}
	
	@RequestMapping(value = "/write.notice", method = RequestMethod.GET)
	public String write()
	{
		return "Notice/writeForm";
	}
	
	@RequestMapping(value = "/write.notice", method = RequestMethod.POST)
	public String writePro(HttpServletRequest req, @ModelAttribute NoticeDTO dto, BindingResult result)
	{
		int res = noticeMapper.insertNotice(dto);
	
		String msg = null, url = "list.notice";
		if (res>0)
		{
			msg = "등록 성공";
		}
		else 
		{
			msg = "등록 실패";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
	}
	
	@RequestMapping(value = "/content.notice")
	public String content(HttpServletRequest req,@RequestParam int no){	
		noticeMapper.N_plusReadcount(no);
		NoticeDTO dto = noticeMapper.getNotice(no);
		req.setAttribute("notice", dto);
		return "Notice/content";
	}
	
	@RequestMapping(value = "/delete.notice")
	public String delete(HttpServletRequest req, @RequestParam int no)
	{
		int res = noticeMapper.deleteNotice(no);
		url = "list.notice";
	
		if (res>0)
		{
			msg = "삭제 성공";
		}
		else 
		{
			msg = "삭제 실패";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
	}
	
	@RequestMapping(value = "/update.notice", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam int no)
	{
		NoticeDTO dto = noticeMapper.getNotice(no);
		return new ModelAndView("Notice/updateForm", "notice", dto);
	}
	
	@RequestMapping(value = "/update.notice", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest req, @ModelAttribute NoticeDTO dto)
	{
		url = "list.notice";
		
		int res = noticeMapper.updateNotice(dto);	
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