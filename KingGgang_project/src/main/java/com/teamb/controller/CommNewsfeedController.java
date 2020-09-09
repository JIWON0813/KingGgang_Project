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

	@RequestMapping("/commhome.comm")
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
			else if(look.equals("member")){
				List<CommboardDTO> list = boardMapper.allListBoard(look);
				req.setAttribute("boardList", list);
			}else if(look.equals("alone")){
				List<CommboardDTO> list = boardMapper.allListBoard(look);
				req.setAttribute("boardList", list);
			}
		}
			return "comm/index";	
		
	}

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
	
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/getMoreContents_ajax.do") public void
	 * getMoreContents(CommboardDTO dto,HttpServletRequest req,
	 * HttpServletResponse res) throws ParseException, IOException { String
	 * viewCount = req.getParameter("viewCount"); String startCount =
	 * req.getParameter("startCount");
	 * 
	 * JSONArray resultList = newsfeedMapper.allListBoard(startCount,viewCount);
	 * int resultCnt =
	 * 
	 * json.put("resultList",resultList); json.put("resultCnt",resultCnt);
	 * 
	 * res.setContentType("application/json; charset=utf-8");
	 * res.getWriter().write(json.toString());
	 * 
	 * 
	 * }
	 */

	// 지은이
	
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
