package com.teamb.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.MemberDTO;
import com.teamb.service.MemberMapper;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberMapper memberMapper;
	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping("/main.mem")
	public String mainMember() {
		return "admin/member/memberMain";
	}

	@RequestMapping("/memberList.mem")
	public String memberList(HttpServletRequest req, MemberDTO dto) {
		List<MemberDTO> list = memberMapper.listMember();
		req.setAttribute("memberList", list);
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
		// memberMapper.adminDeleteCoupon(id);
		int res = memberMapper.deleteMember(memberNum);
		String msg = null, url = null;
		if (res > 0) {
			if (dto.getProfile_name() == null) {
				url = "memberList.mem";
				msg = "delete successed";
			} else {
				String filename = dto.getProfile_name();
				File file = new File(upLoadPath, filename);
				if (file.delete()) {
					url = "memberList.mem";
					msg = "delete successed";
				} else {
					url = "memberList.mem";
					msg = "delete successed but image is remained";
				}
			}
		} else {
			url = "memberList.mem";
			msg = "delete failed";
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

		int res = memberMapper.insertMember(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "회원가입 완료.";
			url = "home.do";
		}else{
			msg = "회원가입 실패.";
			url = "home.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}	
}