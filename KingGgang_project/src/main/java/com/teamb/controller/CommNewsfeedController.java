package com.teamb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamb.model.CommboardDTO;
import com.teamb.service.CommboardMapper;


/*��	   �� : CommNewsfeedController
��  ��   �� : 
��	   �� : Ŀ�´�Ʈ �����ǵ� ��Ʈ�ѷ�*/


@Controller
public class CommNewsfeedController {

	@Autowired
	private CommboardMapper boardMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping("/commhome.comm")
	public String index(HttpServletRequest req, HttpSession session) {
		return "comm/index";
	}

	

	@RequestMapping("/comm_newsfeed.do")
	public String newsFeed(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mbId = (String) session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null)
			isLogin = true;
		req.setAttribute("isLogin", isLogin);

		String msg = null, url = null;
		if (mbId == null) {
			msg = "�α����� ���ּ���.";
			url = "login.log";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		List<CommboardDTO> list = boardMapper.allListBoard();
		req.setAttribute("boardList", list);
		return "newsfeed";
	}
}