package com.teamb.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.Comm_NoticeDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.service.CommNewsFeedMapper;
import com.teamb.service.CommboardMapper;

@Controller
public class CommNewsfeedController {

	@Autowired
	private CommboardMapper boardMapper;
	
	@Autowired
	private CommNewsFeedMapper newsfeedMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	// 지은
/*	@RequestMapping("/commhome.comm")
	public String index(HttpServletRequest req, HttpSession session, Comm_MemberDTO dto) {

		String mbId = (String) session.getAttribute("mbId");
		Comm_MemberDTO comm_login = (Comm_MemberDTO) session.getAttribute("comm_login");
		//List<CommboardDTO> list = boardMapper.allListBoard();
		//req.setAttribute("boardList", list);
		
		//지은
		String look=(String) session.getAttribute("look");
		System.out.println("if문 밖 look값:"+look);
		if(look==null){
			look="all";
			List<CommboardDTO> list = boardMapper.allListBoard(look);
			req.setAttribute("boardList", list);
		}else if(look!=null){
			System.out.println("look값:"+look);
			if(look.equals("all")){
				List<CommboardDTO> list = boardMapper.allListBoard(look);
				req.setAttribute("boardList", list);
			}
			if(look.equals("member")){
				List<CommboardDTO> list = boardMapper.allListBoard(look);
				req.setAttribute("boardList", list);
			}
			if(look.equals("alone")){
				List<CommboardDTO> list = boardMapper.allListBoard(look);
				req.setAttribute("boardList", list);
			}
			if(look.equals("all,member")){
				List<CommboardDTO> list = boardMapper.allListBoard(look);
				req.setAttribute("boardList", list);
			}
		}
			return "comm/index";	
		
	}
*/

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/commSearch", method = RequestMethod.POST)
	public Object init(@RequestBody HashMap<String, Object> map) {
		String word = (String) map.get("word");
		List<Comm_MemberDTO> list = newsfeedMapper.getSearchComm_Member(word);
		JSONArray jsonArray = new JSONArray();
		JSONObject json = null;
		for (int i = 0; i < list.size(); i++) {
			json = new JSONObject();
			Comm_MemberDTO dto = (Comm_MemberDTO) list.get(i);
			json.put("num", dto.getComm_memberNum());
			json.put("profile", dto.getComm_profilename());
			json.put("nick", dto.getComm_nickname());

			jsonArray.add(json);
		}
		return jsonArray;
	}
	
	//여진스
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/getMoreContents_ajax.do", method = RequestMethod.POST)
	public Object moerContent(@RequestBody HashMap<String, Object> map, HttpServletRequest req, HttpSession session){
		int pageSize = 4;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = 0;

		count = newsfeedMapper.getNewCount();
		if (endRow>count) endRow = count;
		
		int startNum = count - ((currentPage-1) * pageSize); 
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage>pageCount) endPage = pageCount;
		
		List<CommboardDTO> list = newsfeedMapper.newfeedList(startRow, endRow);
		//지은
/*		List<CommboardDTO> list = null;
		String look=(String) session.getAttribute("look");
		System.out.println("if문 밖 look값:"+look);
		if(look==null){
			look="all";
			list = newsfeedMapper.newfeedList(startRow, endRow, look);
		}else if(look!=null){
			System.out.println("look값:"+look);
			if(look.equals("all")){
				list = newsfeedMapper.newfeedList(startRow, endRow, look);
			}
			if(look.equals("member")){
				list = newsfeedMapper.newfeedList(startRow, endRow, look);
			}
			if(look.equals("alone")){
				list = newsfeedMapper.newfeedList(startRow, endRow, look);
			}
			if(look.equals("all,member")){
				list = newsfeedMapper.newfeedList(startRow, endRow, look);
			}
		}
*/
	  
		JSONArray jsonArray = new JSONArray();
		JSONObject json = null;
		for (int i = 0; i < list.size(); i++) {
			json = new JSONObject();
			CommboardDTO dto = (CommboardDTO) list.get(i);
			json.put("num", dto.getBoardNum());
			json.put("profile", dto.getFile_name());
			jsonArray.add(json);
			}
	  
		return jsonArray;
	  }
	  

	 //여진스
	@RequestMapping("/commhome.comm")
	public ModelAndView boardList(HttpServletRequest req,HttpSession session){
		int pageSize = 4;
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = 0;

		count = newsfeedMapper.getNewCount();
		if (endRow>count) endRow = count;
		
		List<CommboardDTO> newsfeed = null;

		newsfeed = newsfeedMapper.newfeedList(startRow, endRow);
		//지은
/*		ModelAndView mav = new ModelAndView();
		String look=(String) session.getAttribute("look");
		System.out.println("if문 밖 look값:"+look);
		if(look==null){
			look="all";
			newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
			mav.addObject("boardList", newsfeed);
		}else if(look!=null){
			System.out.println("look값:"+look);
			if(look.equals("all")){
				newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
				mav.addObject("boardList", newsfeed);
			}
			if(look.equals("member")){
				newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
				mav.addObject("boardList", newsfeed);
			}
			if(look.equals("alone")){
				newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
				mav.addObject("boardList", newsfeed);
			}
			if(look.equals("all,member")){
				newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
				mav.addObject("boardList", newsfeed);
			}
		}
*/
		
		
		
		
//		int startNum = count - ((currentPage-1) * pageSize); 
//		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
//		int pageBlock = 3;
//		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
//		int endPage = startPage + pageBlock - 1;
//		if (endPage>pageCount) endPage = pageCount;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
//		mav.addObject("startNum", startNum);
//		mav.addObject("pageCount", pageCount);
//		mav.addObject("pageBlock", pageBlock);
//		mav.addObject("startPage", startPage);
//		mav.addObject("endPage", endPage);
		mav.addObject("boardList", newsfeed);
		mav.setViewName("comm/index");
		return mav;
	}

	

	// 지은
	@RequestMapping("/commadmin.comm")
	public String admin(HttpServletRequest req) {
		return "comm/comm_admin";
	}
	
	@RequestMapping("/comm_noticewrite.do")
	public String comm_noticewriteForm(HttpSession session) {
		String comm_nnickname = (String) session.getAttribute("comm_nickname");
		return "comm/comm_notice";
	}

	@RequestMapping("/comm_noticewrite_ok.do")
	public String comm_noticewrite(HttpServletRequest req, HttpSession session, Comm_NoticeDTO dto) {
		// int memberNum = (Integer)session.getAttribute("memberNum");
		String comm_nnickname = (String) session.getAttribute("comm_nickname");
		// dto.setMemberNum(memberNum);
		dto.setComm_nnickname(comm_nnickname);
		int res = boardMapper.comm_insertNotice(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "공지글 등록성공";
			url = "comm_noticeList.do";
			// url="commhome.comm";
		} else {
			msg = "공지글 등록실패";
			url = "commhome.comm";
		}
		session.setAttribute("mode", dto.getComm_mode());
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/comm_noticeList.do")
	public String comm_noticeList(HttpServletRequest req, HttpSession session, Comm_NoticeDTO dto) {
		String comm_mode = (String) session.getAttribute("mode");
		List<Comm_NoticeDTO> list = boardMapper.comm_noticeAllList();
		req.setAttribute("noticeList", list);
		return "comm/noticeList";
	}

	@RequestMapping("/comm_noticeDelete.do")
	public String comm_deleteNotice(HttpServletRequest req, @RequestParam int comm_noticeNum) {
		int res = boardMapper.comm_deleteNotice(comm_noticeNum);
		String msg = null, url = null;
		if (res > 0) {
			msg = "공지사항 삭제 성공.";
			url = "commadmin.comm";
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping(value = "/comm_notice_edit.do")
	public ModelAndView commNoticeEdit(HttpServletRequest req, HttpSession session, @RequestParam int comm_noticeNum) {
		Comm_NoticeDTO dto = boardMapper.comm_getNotice(comm_noticeNum);
		ModelAndView mav = new ModelAndView("comm/comm_notice_edit", "comm_getNotice", dto);

		return mav;
	}

	@RequestMapping(value = "/comm_notice_edit_ok.do", method = RequestMethod.POST)
	public String commNoticeEditOk(HttpServletRequest req, HttpSession session, Comm_NoticeDTO dto,
			@RequestParam int comm_noticeNum) {

		int res = boardMapper.comm_updateNotice(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "회원수정성공! 메인페이지로 이동합니다.";
			url = "commhome.comm";
		} else {
			msg = "회원수정실패! 메인페이지로 이동합니다.";
			url = "commhome.comm";
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/comm_message.do")
	public String message(HttpServletRequest req) {
		String msg = "로그인 후 열람 가능합니다.";
		String url = "comm_noticeList.do";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

}
