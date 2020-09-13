package com.teamb.controller;

import java.io.File;


import java.io.IOException;
import java.text.DateFormat;




import java.util.Date;
import java.util.Locale;
import java.util.UUID;

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
	public String deletePro(HttpServletRequest req,HttpSession session,@RequestParam String passwd) {
		String id = (String)session.getAttribute("mbId");
		MemberDTO dto = myMapper.getMember(id);
		int res = myMapper.checkPassword(id,passwd);
		String msg=null,url=null;
		switch(res){
		case MemberDTO.OK:
			int re = myMapper.deleteMember(dto.getMemberNum());
				if(re>0){
					msg="탈퇴 성공!!";
					url="home.do";
				}else{
					msg="탈퇴 실패!! 관리자에게 문의하세요";
					url="home.do";
				}
		break;
		case MemberDTO.NOT_ID:
			msg="ID를 확인해주세요";
			url="delete.my";
		break;
		case MemberDTO.NOT_PW:
			msg="비밀번호를 확인해주세요";
			url="delete.my";
		break;
		case MemberDTO.ERROR:
			msg="에러!! 관리자에게 문의하세요";
			url="delete.my";
		break;
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
	public String updateMem(HttpServletRequest req,HttpSession session,@RequestParam String passwd) {
		String id = (String)session.getAttribute("mbId");
		MemberDTO dto = myMapper.getMember(id);
		int res = myMapper.checkPassword(id, passwd);
		String msg=null,url=null;
		switch(res){
		case MemberDTO.OK:
			req.setAttribute("getMember", dto);
			return "my/updateForm";
		case MemberDTO.NOT_PW:
			msg = "비밀번호를 확인해주세요";
			url = "update.my";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		break;
		case MemberDTO.ERROR:
			msg = "에러!! 관리자에게 문의하세요";
			url = "update.my";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}
		return "message";
	}
	
	@RequestMapping(value = "/updatePro.my")
	public String updatePro(HttpServletRequest req,MemberDTO dto,BindingResult result,HttpSession session) {
		UUID uuid = UUID.randomUUID();
		String filename2 =  req.getParameter("filename2");
		int filesize2 =  Integer.parseInt(req.getParameter("filesize2"));
		
		String filename="";
		int filesize =0;
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath,uuid+file.getOriginalFilename());
		File filedelete = new File(upLoadPath,filename2);
		if(file.getSize()>0) {
			try {
			file.transferTo(target);
			filedelete.delete();
		}catch(IOException e) {}
		filename = uuid+file.getOriginalFilename();
		filesize = (int)file.getSize();
		
	}else {
	filename=filename2;
	filesize=filesize2;
	}
		dto.setProfile_name(filename);
		dto.setProfile_size(filesize);
	
		int res = myMapper.updateMember(dto);
		String msg = null, url=null;
	if (res>0) {
		
		url = "main.my";
		msg = "회원 수정 성공!!";
	}else {
		url = "main.my";
		msg = "회원 수정 실패!!";
	}
	req.setAttribute("url", url);
	req.setAttribute("msg", msg);
	return "message";
	}
	
}