package com.teamb.controller;
/*
이	   름 : HashTagController
개  발   자 : 이 여 진
설	   명 : 해시태그 컨트롤러
*/

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.CommBookmarkDTO;
import com.teamb.model.CommReplyDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.model.HashTagDTO;
import com.teamb.model.MemberDTO;
import com.teamb.model.Post_TagDTO;
import com.teamb.service.CommBookMarkMapper;
import com.teamb.service.CommReplyMapper;
import com.teamb.service.Comm_MemberMapper;
import com.teamb.service.CommboardMapper;
import com.teamb.service.HashTagMapper;
import com.teamb.service.Post_TagMapper;

@Controller
public class HashTagController {
	
	@Autowired
	private CommboardMapper boardMapper;
	
	@Autowired
	private Post_TagMapper post_tagMapper;
	
	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping("/searchTag")
    public String searchTag(HttpServletRequest req, HttpSession session) {
		
		if (session.getAttribute("login_comm_memberNum") == null) {
            String msg = "돌하르방 로그인 후 이용가능합니다.";
            String url = "comm_login.do";
            req.setAttribute("msg", msg);
            req.setAttribute("url", url);
            return "message";
         }
		
		
		
		int tagId = Integer.parseInt(req.getParameter("tagId"));
		String tag = req.getParameter("tagName");
		List<CommboardDTO> hashtagList = new ArrayList<CommboardDTO>();
		
		List<Post_TagDTO> postList = post_tagMapper.getTagSearch(tagId);
		for(int i=0;i<postList.size();i++){
			Post_TagDTO dto = postList.get(i);
			CommboardDTO board = boardMapper.getBoard(dto.getBoardNum());
			hashtagList.add(board);
		}
		
		req.setAttribute("hashtagList",hashtagList);
		req.setAttribute("tag",tag);
       return "comm/board/hashSearchForm";
    }

}