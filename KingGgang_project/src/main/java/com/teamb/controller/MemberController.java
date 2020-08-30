package com.teamb.controller;

import java.io.File;

import java.io.IOException;

import java.util.List;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.MemberDTO;
import com.teamb.service.MemberMapper;

/*
�씠	   由� : MemberController class 
媛�  諛�   �옄 : 諛� 以� �뼵
�꽕	   紐� : �쉶�썝愿�由ы럹�씠吏� 而⑦듃濡ㅻ윭  
*/

@Controller
public class MemberController {
		
	@Autowired
	private MemberMapper memberMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	
	
	
	@RequestMapping(value = "/main.mem")
	public String main(){
		return "admin/member/memberMain";
	}
	
	@RequestMapping(value = "/insertMember.mem")
	public String insertMember(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		List<MemberDTO> list = memberMapper.memberList();
		req.setAttribute("memberList", list);
		req.setAttribute("mode", mode);
		return "admin/member/insertMember";
	}
	
	@RequestMapping(value = "/insert.mem")
	public String insertMemberPro(HttpServletRequest req, @ModelAttribute MemberDTO dto,BindingResult result) throws Exception, IOException{
		UUID uuid = UUID.randomUUID();
		String filename="";
		int filesize=0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath,uuid+"_"+file.getOriginalFilename());
		if(file.getSize()>0){
			try{
				file.transferTo(target);
				filesize = (int)file.getSize();
				filename = uuid+"_"+file.getOriginalFilename();
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		int res = memberMapper.adminInsertMember(dto);
		String msg=null,url=null;
		if(res>0){
			msg = "회원가입완료";
			url = "memberList.mem";
		}else{
			msg = "회원가입실패";
			url = "insertMember.mem";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value = "/checkId.mem")
	public String checkId(HttpServletRequest req,MemberDTO dto){
		int res = memberMapper.checkId(dto);
		req.setAttribute("check", res);
		return "redirect:insertMember";
	}
	
	@RequestMapping(value = "/memberList.mem")
	public String memberList(HttpServletRequest req){
		List<MemberDTO> list = memberMapper.memberList();
		req.setAttribute("memberList", list);
		return "admin/member/memberList";
	}
	@RequestMapping("/memberContent.mem")
	public String content(HttpServletRequest req,String id){
		MemberDTO getMember = memberMapper.getMember(id);
		req.setAttribute("getMember", getMember);
		req.setAttribute("upLoadPath", upLoadPath);
		return "admin/member/memberContent";
	}
	
	@RequestMapping("/deletePro.mem")
	public String deletePro(HttpServletRequest req) throws Exception{		
		String id = req.getParameter("id");
		MemberDTO dto = memberMapper.getMember(id);
		memberMapper.adminDeleteCoupon(id);
		int res = memberMapper.adminDeleteMember(id);
		String msg = null, url=null;
			if (res>0) {
					if(dto.getFilename()==null){
						url = "memberList.mem";
						msg = "delete successed";
					}else{
					String filename = dto.getFilename();
					File file = new File(upLoadPath,filename);
					if(file.delete()) {
						url = "memberList.mem";
						msg = "delete successed";
						}else {
						url = "memberList.mem";
						msg = "delete successed but image is remained";
		     		}
				}
		}else{
			url = "memberList.mem";
			msg = "delete failed";
		}
		
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		return "message";
	}
	
	@RequestMapping(value = "/updateForm.mem")
	public ModelAndView updateMem(@RequestParam String id) {
		MemberDTO dto =  memberMapper.getMember(id);
		
		ModelAndView mav = new ModelAndView("admin/member/updateForm");
		mav.addObject("getMember", dto);
		mav.addObject("upLoadPath", upLoadPath);
		return mav;
	}
	
	@RequestMapping(value = "/updatePro.mem")
	public String updatePro(HttpServletRequest req,MemberDTO dto,BindingResult result) {
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
	
	int res = memberMapper.adminUpdateMember(dto);
	String msg = null, url=null;
	if (res>0) {
		url = "memberList.mem";
		msg = "update successed";
	}else {
		url = "memberList.mem";
		msg = "update failed";
	}
	req.setAttribute("url", url); 
	req.setAttribute("msg", msg);
	return "message";
	

}
}

