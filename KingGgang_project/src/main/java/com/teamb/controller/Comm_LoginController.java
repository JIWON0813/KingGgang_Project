/*package com.teamb.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.B4_memberDTO;
import com.teamb.service.B4_memberMapper;

@Controller
public class Comm_LoginController {
	private static final Logger logger = LoggerFactory.getLogger(Comm_LoginController.class);
	
	@Autowired
	private B4_memberMapper memberMapper; 
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
	      String mbId = (String)session.getAttribute("mbId");
	      boolean isLogin = false;
	      int memberNum = (Integer)session.getAttribute("memberNum");
	      if(mbId != null){
	         isLogin = true;
	         session.setAttribute("memberNum", memberNum);
	      }
	      
	      session.setAttribute("isLogin", isLogin);
	      req.setAttribute("isLogin",isLogin);
	      req.setAttribute("memberNum",memberNum);
	      return "index";
	   }

	@RequestMapping(value = "/memberAll.do")
	public String listMember(HttpServletRequest req,B4_memberDTO dto){
		
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
		}
		
		List<B4_memberDTO> list = memberMapper.listMember();	
		
		req.setAttribute("memberList", list);
		req.setAttribute("upLoadPath", upLoadPath);
		String mode = req.getParameter("mode");
		
		return "memberAll";
	}
	
	@RequestMapping("/member_input.do")
	public String insertMemberForm(){
		return "login/member_input";
	}
	
	@RequestMapping("/member_input_ok.do")
	public String insertMember(HttpServletRequest req, B4_memberDTO dto,BindingResult result){
		
		HttpSession session = req.getSession();
		session.setAttribute("memberNum", dto.getMemberNum());

		
		if (result.hasErrors()){
			dto.setMemberNum(0);
		}
		
		String profile_name="";
		int profile_size=0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("profile_name");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if(file.getSize()>0){
			try {
				file.transferTo(target);
			} catch (IOException e) {}
			
			profile_name = file.getOriginalFilename();
			profile_size=(int)file.getSize();
			
			
			dto.setProfile_name(profile_name);
			dto.setProfile_size(profile_size);
		}
		
		int res = memberMapper.insertMember(dto);
		
		
		String msg = null, url = null;
		if(res>0){
			msg="ȸ�����Լ���! �α��� �������� �̵��մϴ�.";
			url="login.do";
		}else{
			msg="ȸ�����Խ���! �������� �̵��մϴ�.";
			url="login.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value = "/member_search.do")
	public String searchMemberForm(HttpServletRequest req){
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "login/search";
	}
	
	@RequestMapping(value = "/member_search_ok.do")
//	public ModelAndView searchMember_id(HttpServletRequest req){ 
		public String searchMember_id(HttpServletRequest req){ 
		String mode = req.getParameter("mode");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		System.out.println(mode);
		String msg = null, url = null;
		if(mode.equals("search_id")){
			if(memberMapper.searchMember_id(name, email) != null){
				msg = "���̵�� "+ memberMapper.searchMember_id(name, email) +" �Դϴ�.";
			}
			else{
				msg="��ϵ� ������ �����ϴ�.";
			}
			url="login.do";
		}else if(mode.equals("pw")){
			String id = req.getParameter("id");
			if(memberMapper.searchMember_pw(name, email, id) != null){	
				msg = "��й�ȣ�� "+ memberMapper.searchMember_pw(name, email, id) +" �Դϴ�.";
			}
			else{
				msg="��ϵ� ������ �����ϴ�.";
			}
			url="login.do";
		}else{
			msg ="��ϵ� ������ �����ϴ�.";
			url="login.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
		
		}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req, String isLogin) {

		HttpSession session = req.getSession();
		session.invalidate();
		
		return "login/logout";
	}
	
	@RequestMapping("/loginOk.do")
	   public String loginOk(HttpServletRequest req,HttpSession session,B4_memberDTO dto){
	      dto.setId(req.getParameter("id"));
	      dto.setPasswd(req.getParameter("passwd"));
	      
	      int res = memberMapper.loginOk(dto);      
	      String msg = null, url = null;
	      switch(res){
	      case B4_memberDTO.OK:
	         session = req.getSession();
	         session.setAttribute("mbId", dto.getId());
	         
	         int memberNum = memberMapper.getMemberNum(dto.getId());
	            session.setAttribute("memberNum",memberNum);
	            session.setAttribute("member",memberMapper.getMember(memberNum));

	            if(dto.getId().equals("admin")) {
	            msg = "������ ������ �Դϴ�..";
	            url = "memberAll.do";
	            }
	            else{
	            msg = "�α����� �Ǿ����ϴ�. �������� �̵��մϴ�.";
	            url = "index.do";
	            }
	            
	            break;
	      
	      case B4_memberDTO.NOT_ID :
	         msg = "���� ���̵� �Դϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!";
	         url = "login.do";
	         break;
	      case B4_memberDTO.NOT_PW :
	         msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!";
	         url = "login.do";
	         break;
	      case B4_memberDTO.ERROR :
	         msg = "DB���� ���� �߻�!! �����ڿ��� �����ϼ���!!";
	         url = "index.do";
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";
	   }
	
	@RequestMapping(value="/member_edit.do", method=RequestMethod.GET)
	public ModelAndView memberEdit(HttpServletRequest req,@RequestParam int memberNum){
		
		B4_memberDTO dto = memberMapper.getMember(memberNum);
		ModelAndView mav = new ModelAndView
				("member_edit", "getMember", dto);
		
		HttpSession session = req.getSession();
		String mbId = (String)session.getAttribute("mbId");
		boolean isLogin = false;
		if (mbId != null) isLogin = true;
		req.setAttribute("isLogin", isLogin);
		req.setAttribute("getMember", memberMapper.getMember(memberNum));
		
		return mav;
	}
		
	@RequestMapping(value="/member_edit_ok.do", method=RequestMethod.POST)
	public String memberEditOk(HttpServletRequest req,HttpSession session,@ModelAttribute B4_memberDTO dto, BindingResult result){
		if(result.hasErrors()){
			dto.setMemberNum(0);
		}
		dto = (B4_memberDTO)session.getAttribute("member");
		int memberNum = 70;
		dto = memberMapper.getMember(memberNum);
		System.out.println(dto.getMemberNum());
		int res = memberMapper.updateMember(dto);
		
		System.out.println(dto.getMemberNum());
		String msg = null, url = null;
		if(res>0){
			msg="ȸ����������! ����������� �̵��մϴ�.";
			url="memberAll.do";
		}else{
			msg="ȸ����������! ����������� �̵��մϴ�.";
			url="memberAll.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";	
	}
	
	@RequestMapping("/member_delete.do")
	public String memberDelete(HttpServletRequest req,@RequestParam int memberNum){
		int res = memberMapper.deleteMember(memberNum);
		String msg = null, url = null;
		if(res>0){
			msg="ȸ����������! ����������� �̵��մϴ�.";
			url="memberAll.do";
		}else{
			msg="ȸ����������! ����������� �̵��մϴ�.";
			url="memberAll.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";	
	}
}	*/