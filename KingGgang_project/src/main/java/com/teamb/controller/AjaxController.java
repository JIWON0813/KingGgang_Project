package com.teamb.controller;

import java.io.IOException;




import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.HotelDTO;
import com.teamb.model.Jamong;
import com.teamb.model.RentcarDTO;

import com.teamb.model.WishlistDTO;
import com.teamb.service.WishlistMapper;

/*
이	   름 : WishController.java


개  발   자 : 원세호
설	   명 : 관심리스트 컨트롤러
*/

 


//rroll2 
/**
 * Handles requests for the application home page.
 */

@Controller
public class AjaxController {
	
	@Autowired
	private WishlistMapper wishlistmapper;
	
	@RequestMapping("/tested.pay")
	public String testedLike() {
		return "NewFile";
	}
	
	@ResponseBody 
	@RequestMapping(value = "/test", method = RequestMethod.POST) 
	public HashMap<String, Object> init(@RequestBody HashMap<String, Object> map) {
		map.put("phone", 0000);
		System.out.println(map); // {name=kim, age=30} 출력 }
		
		return map;
	}

	



	
}

	
	

