package com.teamb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamb.model.ReviewDTO;
import com.teamb.service.ReviewMapper;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/listReview.re")
	public String list(HttpServletRequest req){
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum==null)
		{
			pageNum = "1";
		}
		
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = reviewMapper.getCount();
		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize);
		List<ReviewDTO> list = reviewMapper.listReview(startRow, endRow); 
		req.setAttribute("listReview", list);
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
		
		return "board/review/listReview";
	}
	
	@RequestMapping("/insertReview.re")
	public String insertReview(HttpServletRequest req,@RequestParam int type,@RequestParam String name,@RequestParam String filename){
		
		req.setAttribute("type", type);
		req.setAttribute("r_name", name);
		req.setAttribute("filename", filename);
		return "board/review/insertReview";
	}
	
	@RequestMapping("/insertReviewPro.re")
	public String insertReviewPro(HttpServletRequest req,HttpSession session,@ModelAttribute ReviewDTO dto){
		String m_id = (String)session.getAttribute("mbId");
		dto.setM_id(m_id);
		int res = reviewMapper.insertReview(dto);
		String msg=null,url=null;
		if(res>0){
			msg="게시글이 등록되었습니다.";
			url="listReview.re";
		}else{
			msg="게시글 등록 실패";
			url="payment.my";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
	}
	
	@RequestMapping("/deleteReview.re")
	public String deleteReview(HttpServletRequest req,@RequestParam int num){
		int res = reviewMapper.deleteReview(num);
		String msg=null,url=null;
		if(res>0){
			msg="게시글이 삭제되었습니다.";
			url="listReview.re";
		}else{
			msg="게시글 삭제 실패";
			url="listReview.re";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/updateReview.re")
	public String updateReview(HttpServletRequest req,@RequestParam int num){
		ReviewDTO dto = reviewMapper.getReview(num);
		req.setAttribute("getReview", dto);
		return "board/review/updateReview";
	}
	 
	@RequestMapping("/updateReviewPro.re")
	public String updateReviewPro(HttpServletRequest req,@ModelAttribute ReviewDTO dto){
		int res = reviewMapper.updateReview(dto);
		String msg=null,url=null;
		if(res>0){
			msg="게시글이 수정되었습니다.";
			url="listReview.re";
		}else{
			msg="게시글 수정 실패";
			url="listReview.re";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
}