package com.teamb.controller;

import java.io.File;


import java.io.IOException;
import java.text.DateFormat;




import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.MemberDTO;
import com.teamb.service.MemberMapper;
import com.teamb.service.MyMapper;

  

/*
이	   름 : MyController.java


개  발   자 : 원세호
설	   명 : 마이페이지 컨트롤러
*/



//rroll2
/**
 * Handles requests for the application home page.
 */
@Controller
public class MyController {
	
	@Autowired
	//private MemberMapper memberMapper;
	private MyMapper myMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	
	
	@RequestMapping("/main.my")
	public String mypageMain() {
		
		return "my/mypageMain";
		
	}
	
	@RequestMapping("/delete.my")
	public String deleteMem(HttpServletRequest req) {
		int del = 1;
		req.setAttribute("type", del);
		return "my/confirm";
	}
	
	@RequestMapping("/deletePro.my")
	public String deletePro(HttpServletRequest req,HttpSession session) {
		//로그인 세션이 없어서 테스트 불가 
		//String id = String.valueOf(session.getAttribute("id"));
		//String password = String.valueOf(session.getAttribute("password"));
		String id =  req.getParameter("id");
		String password = req.getParameter("password");
		
		MemberDTO dto = myMapper.getMember(id);
		String filename = dto.getFilename(); 
		File file = new File(upLoadPath,filename);
		
		int res = myMapper.deleteMember(id,password);
		String msg = null, url=null;
		if (res>0) {
			if(file.delete()) {
			url = "home.my";
			msg = "delete successed";
			}else {
				url = "home.my";
				msg = "delete successed but image is remained";
			}
		}else {
			url = "home.my";
			msg = "delete failed";
		}
		
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		return "message";
	}
	
	@RequestMapping("/update.my")
	public String updateForm(HttpServletRequest req) {
		int upd = 2;
		req.setAttribute("type", upd);
		return "my/confirm";
	}
	@RequestMapping(value = "/updateForm.my")
	public ModelAndView updateMem(@RequestParam String id) {
		MemberDTO dto =  myMapper.getMember(id);
		
		ModelAndView mav = new ModelAndView("my/updateForm");
		mav.addObject("getMember", dto);
		mav.addObject("upLoadPath", upLoadPath);
		return mav;
	}
	
	@RequestMapping(value = "/updatePro.my")
	public String updatePro(HttpServletRequest req,MemberDTO dto,BindingResult result) {
		//if(result.hasErrors()) {
		//	dto.setId(null);
		//}
		String id= req.getParameter("id");
		dto.setId(id);
		
		String filename2 =  req.getParameter("filename2");
		int filesize2 =  Integer.parseInt(req.getParameter("filesize2"));
		
		String filename="";
		int filesize =0;
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath,file.getOriginalFilename());
		File filedelete = new File(upLoadPath,filename2);
		if(file.getSize()>0) {
			try {
			file.transferTo(target);
			filedelete.delete();
		}catch(IOException e) {}
		filename = file.getOriginalFilename();
		filesize = (int)file.getSize();
		
	}else {
	filename=filename2;
	filesize=filesize2;
	}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
	
		int res = myMapper.updateMember(dto);
		String msg = null, url=null;
	if (res>0) {
		
		url = "home.my";
		msg = "update successed";
	}else {
		url = "home.my";
		msg = "update failed";
	}
	req.setAttribute("url", url);
	req.setAttribute("msg", msg);
	return "message";
	}
	
	@RequestMapping("/home.my")
	public String home() {
		
		return "home";
		
	}
	
	
	
}
