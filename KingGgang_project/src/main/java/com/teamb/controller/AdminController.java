package com.teamb.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//check git2
/*
이	   름 : AdminController class
개  발   자 : 김 지 원
설	   명 : 관리자페이지 컨트롤러  
*/

import com.teamb.model.HotelDTO;
import com.teamb.model.MemberDTO;
import com.teamb.model.PaymentDTO;
import com.teamb.model.PaymentListData;
import com.teamb.model.RentcarDTO;
import com.teamb.model.Rentcar_ResDTO;
import com.teamb.model.RoomDTO;
import com.teamb.service.HotelMapper;
import com.teamb.service.MemberMapper;
import com.teamb.service.PaymentMapper;
import com.teamb.service.RentcarMapper;

@Controller
public class AdminController {
	
	@Autowired
	private PaymentMapper paymemtMapper;
		
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private RentcarMapper rentcarMapper;
	
	@Autowired
	private HotelMapper hotelmapper;
	
	@RequestMapping(value = "/main.admin")
	public String adminMain(){
		
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "insertHotel.admin")
	public String insertHotelForm(){
		return "hotel/insertHotelForm";
	}
	
	@RequestMapping(value = "/payList.admin")
	public String payList(HttpServletRequest req){
		List<PaymentDTO> list = paymemtMapper.getAdminList();
		List<PaymentListData> plist = new ArrayList<PaymentListData>();
		Iterator<PaymentDTO> iter = list.iterator();
		while(iter.hasNext()){
			PaymentDTO pdto = iter.next();
			MemberDTO mdto = memberMapper.getMember(pdto.getM_no());
			//1일경우 호텔, 2일경우 렌트
			RoomDTO rdto= null;
			HotelDTO hdto= null;
			Rentcar_ResDTO resdto = null;
			RentcarDTO cardto= null;
			if(pdto.getType() == 1){
				rdto = hotelmapper.getRoom(pdto.getP_no());
				//RoomDateDTO roomdatedto = 
				hdto = hotelmapper.getHotel(rdto.getH_id());
			}
			else{
				resdto = rentcarMapper.getRentcarRes(pdto.getP_no());
				cardto = rentcarMapper.getRentcar(resdto.getR_id());
			}
			
			plist.add(new PaymentListData(pdto, mdto, rdto,hdto,resdto,cardto));
		}
		String pageNum = req.getParameter("pageNum");
		if (pageNum==null){
			pageNum = "1";
		}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = plist.size();
		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize); 		
		if (count>0){
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			req.setAttribute("count", count);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
		}
		List<PaymentListData> partlist = new ArrayList<>();
		for(int i = startRow-1 ; i < endRow ; i++){
			partlist.add(plist.get(i));
		}
		req.setAttribute("list", partlist);
		return "payment/adminPayList";
	}
}


