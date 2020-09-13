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
		
		System.out.println(map); // {name=kim, age=30} 출력 }
		
		int m_no = Integer.parseInt(map.get("m_no").toString());
		int type = Integer.parseInt(map.get("type").toString());
		
		int f_no = Integer.parseInt(map.get("f_no").toString());
		System.out.println(m_no);
		WishlistDTO dto = new WishlistDTO();
		dto.setF_no(f_no);
		dto.setM_no(m_no);
		dto.setType(type);
		
		/*List<WishlistDTO> noCheck = wishlistmapper.getNolist(dto);
		boolean check1 =true;
		
		for(WishlistDTO check : noCheck) {
			System.out.println(check.getF_no());
			if(check.getF_no()!=f_no) {
				continue;
			}else if(check.getF_no()==f_no) {
				check1 = false;
			}
		}
		
		System.out.println(check1);
		
		if(check1) {
			int res = wishlistmapper.insertWish(dto);
			map.put("wstatus", 1);
		} else {
			int res = wishlistmapper.deleteWish(dto);
			map.put("wstatus", 2);
		}
		*/
		return map;
	}

	



	
}

	
	

