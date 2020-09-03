package com.teamb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//check git2
/*
이	   름 : AdminController class
개  발   자 : 김 지 원
설	   명 : 관리자페이지 컨트롤러  
*/

@Controller
public class AdminController {
	
	@RequestMapping(value = "/main.admin")
	public String adminMain(){
		
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "insertHotel.admin")
	public String insertHotelForm(){
		return "hotel/insertHotelForm";
	}
}
