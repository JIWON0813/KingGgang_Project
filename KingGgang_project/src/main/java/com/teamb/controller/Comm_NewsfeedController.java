/*package com.teamb.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamb.model.B4_boardDTO;
import com.teamb.service.B4_boardMapper;

@Controller
public class Comm_NewsfeedController {
	private static final Logger logger = LoggerFactory.getLogger(Comm_NewsfeedController.class);
	

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

	
	//������
	
	@RequestMapping("/newsfeed.do")
	public String newsFeed(HttpServletRequest req){
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
		
			String msg = null, url = null;
			if(mbId == null){
				msg="�α��� �� �̿� �����մϴ�.";
				url="login.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		
			List<B4_boardDTO> list = boardMapper.allListBoard();
			req.setAttribute("boardList",list);
			
			return "newsfeed";
		
	}
}	
	*/