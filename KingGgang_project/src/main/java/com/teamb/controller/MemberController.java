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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.MemberDTO;
import com.teamb.model.NoticeDTO;
import com.teamb.service.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping("/memberList.mem")
	public String memberList(HttpServletRequest req, MemberDTO dto) {
		String pageNum = req.getParameter("pageNum");
		if (pageNum==null)
		{
			pageNum = "1";
		}
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		
		List<MemberDTO> list = memberMapper.listMembernum(startRow, endRow);
		
		int count = memberMapper.getCount(); 

		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize); 
		
		req.setAttribute("memberList", list);
		req.setAttribute("startNum", startNum);
		
		if (count>0)
		{
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
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
		return "admin/member/memberList";
	}
	
	@RequestMapping("/memberSearch.mem")
	public String memberSearch(HttpServletRequest req){
		String mode = req.getParameter("mode");
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		List<MemberDTO> list = memberMapper.searchMember(search, searchString);
		req.setAttribute("mode", mode);
		req.setAttribute("memberList",list);
		return "admin/member/memberList";
	}

	@RequestMapping("/memberContent.mem")
	public String content(HttpServletRequest req, int memberNum) {
		MemberDTO getMember = memberMapper.getMember(memberNum);
		req.setAttribute("getMember", getMember);
		req.setAttribute("upLoadPath", upLoadPath);
		return "admin/member/memberContent";
	}

	@RequestMapping("/deletePro.mem")
	public String deletePro(HttpServletRequest req, int memberNum) throws Exception {

		MemberDTO dto = memberMapper.getMember(memberNum);
		int res = memberMapper.deleteMember(memberNum);
		String msg = null, url = null;
		if (res > 0) {
			if (dto.getProfile_name() == null) {
				url = "memberList.mem";
				msg = "삭제 완료";
			} else {
				String filename = dto.getProfile_name();
				File file = new File(upLoadPath, filename);
				if (file.delete()) {
					url = "memberList.mem";
					msg = "삭제 완료";
				} else {
					url = "memberList.mem";
					msg = "삭제 완료, 이미지 삭제 실패";
				}
			}
		} else {
			url = "memberList.mem";
			msg = "삭제 실패";
		}
		HttpSession session = req.getSession();
		if(session.getAttribute("mbId")==dto.getId()){
			session.invalidate();
		}
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		return "message";
	}

	@RequestMapping(value = "/updateForm.mem")
	public ModelAndView updateMem(@RequestParam int memberNum) {
		MemberDTO dto = memberMapper.getMember(memberNum);

		ModelAndView mav = new ModelAndView("admin/member/updateForm");
		mav.addObject("getMember", dto);
		mav.addObject("upLoadPath", upLoadPath);
		return mav;
	}

	 @RequestMapping(value = "/updatePro.mem")
	 public String updatePro(HttpServletRequest req,MemberDTO dto, BindingResult result) {
		UUID uuid = UUID.randomUUID();
		String filename2 = req.getParameter("filename2");
		int filesize2 = Integer.parseInt(req.getParameter("filesize2"));
		
		String profile_name = "";
		int profile_size = 0;

		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("profile_name");
		File target = new File(upLoadPath, uuid + file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(target);
				if (filename2 != null) {
					File filedelete = new File(upLoadPath, filename2);
					filedelete.delete();
				}
				profile_name = uuid+file.getOriginalFilename();
				profile_size = (int) file.getSize();
			} catch (IOException e) {		
			}
		} else {
			profile_name = filename2;
			profile_size = filesize2;
		}
		dto.setProfile_name(profile_name);
		dto.setProfile_size(profile_size);

		int res = memberMapper.updateMember(dto);
		String msg = null, url = null;
		if (res > 0) {
			url = "memberList.mem";
			msg = "회원 수정 성공";
		} else {
			url = "memberList.mem";
			msg = "회원 수정 실패";
		}
		req.setAttribute("url", url);
		req.setAttribute("msg", msg);
		return "message";

	}

	@RequestMapping("/insertMember.mem")
	public String insertMemberForm(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		List<MemberDTO> list = memberMapper.listMember();
		req.setAttribute("memberList", list);
		req.setAttribute("mode", mode);
		return "admin/member/insertMember";
	}

	@RequestMapping("/insertMemberPro.mem")
	public String insertMember(HttpServletRequest req, MemberDTO dto, BindingResult result) {
		UUID uuid = UUID.randomUUID();
		HttpSession session = req.getSession();
		session.setAttribute("memberNum", dto.getMemberNum());
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		dto.setEmail(email1+"@"+email2);
		if (result.hasErrors()) {
			dto.setMemberNum(0);
		}

		String profile_name = "";
		int profile_size = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("profile_name");
		File target = new File(upLoadPath, uuid + file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(target);
				profile_name = uuid + file.getOriginalFilename();
				profile_size = (int) file.getSize();
				dto.setProfile_name(profile_name);
				dto.setProfile_size(profile_size);
			} catch (IOException e) {
			}
		}
		String mbId = (String)session.getAttribute("mbId");
		if(mbId==null){
			mbId = "";
		}
		int res = memberMapper.insertMember(dto);
		String msg = null, url = null;
		if(!mbId.equals("admin")||mbId==""){
			if (res > 0) {
				msg = "회원가입 완료.";
				url = "login.log";
			}else{
				msg = "회원가입 실패.";
				url = "home.do";
			}
		}else if(mbId.equals("admin")){
			if (res > 0) {
				msg = "회원등록 완료.";
				url = "memberList.mem";
			}else{
				msg = "회원등록 실패.";
				url = "memberList.mem";
			}
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}	
}