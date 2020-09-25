package com.teamb.controller;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamb.model.HotelDTO;
import com.teamb.model.MemberDTO;
import com.teamb.model.RoomDTO;
import com.teamb.model.RoomDateDTO;
import com.teamb.model.WishlistDTO;
import com.teamb.service.HotelMapper;
import com.teamb.service.MemberMapper;
import com.teamb.service.PaymentMapper;
import com.teamb.service.WishlistMapper;

/*
      이	   름 : HotelController class
	개  발   자 : 김 지 원
	설	   명 : 숙소 컨트롤러  
 */
@Controller
public class HotelController {

	@Autowired
	private HotelMapper hotelmapper;
	
	@Autowired
	private WishlistMapper wishlistmapper;
	
	//결제 원세호
	
	@Autowired
	private PaymentMapper paymentmapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	
	//호텔 목록(사용자)
	@RequestMapping(value = "/main.hotel")
	public String hotelMain(HttpServletRequest req) {
		String pageNum = req.getParameter("pageNum");
		if (pageNum==null){
			pageNum = "1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count =0;
		String cate = req.getParameter("cate");
		String search = req.getParameter("search");
		List<HotelDTO> list = hotelmapper.hotelMainlist(startRow, endRow);
		if(cate == null || cate.equals("all")){
			cate = "all";			
		}
		else{
			list = hotelmapper.hotelCateList(startRow, endRow, cate);
		}
		
		if(search != null && !search.trim().equals(""))
			count = hotelmapper.getCountSearch(search);
		else if(!cate.equals("all"))
			count = hotelmapper.getCountCate(cate);
		else
			count = hotelmapper.getCount();
		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize); 		
		req.setAttribute("boardList", list);
		req.setAttribute("startNum", startNum);
		
		
		if (count>0){
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 10;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			req.setAttribute("count", count);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
		}
		
		
		
		if(search != null && !search.trim().equals("")){
			cate = "all";
			list = hotelmapper.hotelSearchList(startRow, endRow, search);
		}
		req.setAttribute("cate", cate);
		req.setAttribute("hotelList", list);
		return "hotel/hotelMain";
	}

	
	//관리자버전 호텔 목록(호텔 등록,수정,삭제)
	@RequestMapping(value = "/hotelList.hotel")
	public String hotelList(HttpServletRequest req) {
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum==null){
			pageNum = "1";
		}
		String search = req.getParameter("search");
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count =0;
		if(search != null && !search.trim().equals(""))
			count = hotelmapper.getCountSearch(search);
		else
			count = hotelmapper.getCount();
		if (endRow>count) endRow = count;
		int startNum = count - ((currentPage-1) * pageSize); 
		List<HotelDTO> list = hotelmapper.hotelMainlist(startRow, endRow);
		req.setAttribute("boardList", list);
		req.setAttribute("startNum", startNum);
		if (count>0){
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 10;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			req.setAttribute("count", count);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
		}	
		if(search != null && !search.trim().equals("")){
			list = hotelmapper.hotelSearchList(startRow, endRow, search);
		}
		req.setAttribute("hotelList", list);
		return "hotel/hotelList";
	}
	
	
	@RequestMapping(value="/hotelContent.hotel")
	public String showHotelContent(HttpServletRequest req , @RequestParam int no){
		HotelDTO dto = hotelmapper.getHotel(no);
		List<RoomDTO> list = hotelmapper.roomList(no);
		req.setAttribute("dto", dto);
		req.setAttribute("roomList", list);
		return "hotel/hotelContent";
	}
	
	@RequestMapping(value = "/hotelDetail.hotel")
	public String hotelDetail(HttpServletRequest req, @RequestParam int no,HttpSession session){
		hotelmapper.increasecount(no);
		HotelDTO dto = hotelmapper.getHotel(no);	
		List<RoomDTO> list = hotelmapper.roomList(no);
		
		//원세호 관심리스트 
				int check1 =1;
				if(session.getAttribute("memberNum")==null) {
					check1 = 3;
					
				}else{
					int m_no = (int) session.getAttribute("memberNum");
					int type =1;
					WishlistDTO wdto = new WishlistDTO();
					wdto.setM_no(m_no);
					wdto.setF_no(no);
					wdto.setType(type);
						
					List<WishlistDTO> wlist = wishlistmapper.getNolist(wdto);
					
					for(WishlistDTO checkdto : wlist) {
						
					if(checkdto == null) {
						check1 = 1;
					} else {
						if(checkdto.getF_no()!=no) {
							continue;
						}else if(checkdto.getF_no()==no) {
							check1 = 2;
						}
					}
				}
				}
		req.setAttribute("check1", check1);
		req.setAttribute("dto", dto);
		req.setAttribute("roomList", list);
		return "hotel/hotelDetail";
	}

	@RequestMapping(value = "insertHotelForm.hotel")
	public String insertHotelForm(){
		return "hotel/insertHotelForm";
	}
	
	@RequestMapping(value = "/insertHotel.hotel")
	public String insertHotel(HttpServletRequest req, @ModelAttribute HotelDTO dto, BindingResult result) {
		String filename = "";
		int filesize = 0;
		String checkin = req.getParameter("startcheckin") + " ~ " + req.getParameter("endcheckin");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(target);
			} catch (Exception e) {
			}
			filename = file.getOriginalFilename();
			filesize = (int) file.getSize();
		}
		dto.setCheckin(checkin);
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		int res = hotelmapper.insertHotel(dto);
		String msg = null, url = "hotelList.hotel";
		if (res > 0)
			msg = "숙소가 등록되었습니다";
		else
			msg = "error : 숙소 등록을 실패했습니다";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping(value = "/deleteHotel.hotel")
	public String deleteHotel(HttpServletRequest req, @RequestParam int no) {
		String msg = null, url = "hotelList.hotel";
		int res = hotelmapper.deleteHotel(no);
		if (res > 0)
			msg = "숙소가 삭제되었습니다";
		else
			msg = "error : 숙소 삭제를 실패했습니다";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping(value = "/updateHotel.hotel", method = RequestMethod.GET)
	public String updateHotel(HttpServletRequest req, @RequestParam int no) {
		HotelDTO dto = hotelmapper.getHotel(no);
		req.setAttribute("dto", dto);
		return "hotel/updateHotelForm";
	}

	@RequestMapping(value = "/updateHotel.hotel", method = RequestMethod.POST)
	public String updateHotel(HttpServletRequest req, @ModelAttribute HotelDTO dto, BindingResult result) {
		String filename = "";
		int filesize = 0;
		String checkin = req.getParameter("startcheckin") + " ~ " + req.getParameter("endcheckin");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("filename");

			File target = new File(upLoadPath, file.getOriginalFilename());
			if (file.getSize() > 0) {
				try {
					file.transferTo(target);
				} catch (Exception e) {
				}
				filename = file.getOriginalFilename();
				filesize = (int) file.getSize();
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			else {
			HotelDTO temp = hotelmapper.getHotel(dto.getNo());
			dto.setFilename(temp.getFilename());
			dto.setFilesize(temp.getFilesize());
		}
		dto.setCheckin(checkin);
		int res = hotelmapper.updateHotel(dto);
		String msg = null, url = "hotelList.hotel";
		if (res > 0)
			msg = "숙소가 수정되었습니다";
		else
			msg = "error : 숙소 수정을 실패했습니다";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	
	@RequestMapping(value="/payment.hotel")
	public String payment(HttpServletRequest req,HttpSession session, @RequestParam int id, @RequestParam int price){		
		//결제 원세호 
		int memberNum = (int) session.getAttribute("memberNum");

		MemberDTO mrdto =  paymentmapper.getpayMember(memberNum);
		req.setAttribute("mrdto", mrdto);
		req.setAttribute("id", id);
		req.setAttribute("type", 1);
		req.setAttribute("totalPrice", price);
		req.setAttribute("m_no", memberNum);
		return "payment/connectPayApi";
	}
	
	@RequestMapping(value="/room_book.hotel")
	public String BookRoom(HttpServletRequest req ,@RequestParam int id){
		RoomDTO dto = hotelmapper.getRoom(id);
		req.setAttribute("roomdto", dto);
		return "hotel/room_book";		
	}
	
	@RequestMapping(value="/show_regiroom.hotel")
	public String showRegiroom(HttpServletRequest req, HttpServletResponse response, @RequestParam int id, @RequestParam String startdate , @RequestParam String enddate) throws IOException, ParseException{
		boolean check = hotelmapper.checkRoomdate(startdate , enddate, id);
		RoomDTO roomdto = hotelmapper.getRoom(id);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		req.setAttribute("roomdto", roomdto);
		if(!check){
			String msg = "이미 예약되어있는 날짜입니다 다른 날짜를 선택해 주세요";		
			out.println("<script>alert('"+msg+"')");
			out.println("location.href='room_book.hotel?id="+id+"'</script>");
			out.close();
		}	     
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
		    Date sDate = dateFormat.parse(startdate.replaceAll("-", ""));
		    Date eDate = dateFormat.parse(enddate.replaceAll("-", ""));
		    Calendar startcal = Calendar.getInstance() ;
		    startcal.setTime(sDate);	     
		    int startDayNum = startcal.get(Calendar.DAY_OF_WEEK);
		    
		    Calendar endcal = Calendar.getInstance() ;
		    endcal.setTime(eDate);	     
		    int endDayNum = endcal.get(Calendar.DAY_OF_WEEK);

		    int totalprice = 0;
		    while(startDayNum != endDayNum){
		    	if(startDayNum == 5 || startDayNum == 6){
		    		totalprice += roomdto.getEndprice();
		    	}
		    	else{
		    		totalprice += roomdto.getDayprice();
		    	}
		    	startDayNum++;
		    	if(startDayNum == 8){
		    		startDayNum = 1;
		    	}
		    }
		    HttpSession session = req.getSession();
		    String m_id = (String) session.getAttribute("mbId");
		    if(m_id == null){
		    	String msg = "로그인을해주세요";	
				out.println("<script>alert('"+msg+"')");
				out.println("location.href='room_book.hotel?id="+id+"'</script>");
				out.close();
		    }
		RoomDateDTO dto = new RoomDateDTO(startdate,enddate,totalprice,m_id,roomdto.getId(),0);

		int rdid = 0;
		int res = hotelmapper.insertRoomDate(dto);
		if(res == 0){
			String msg = "예약 실패했습니다. 관리자에게 문의해주십시오";
			out.println("<script>alert('"+msg+"')");
			out.println("location.href='room_book.hotel?id="+id+"'</script>");
			out.close();			
		}
		else if(res == 2){
			String msg = "이미 예약된 방입니다. 다른 방을 예약해 주세요.";
			out.println("<script>alert('"+msg+"')");
			out.println("location.href='main.hotel?'</script>");
			out.close();
		}
		else if(res == 1){
			rdid = hotelmapper.getrecentdate();
		}
		dto.setId(rdid);
		req.setAttribute("dto", dto);
		req.setAttribute("totalprice", totalprice);
		return "hotel/room_paypage";
	}
	
	@RequestMapping(value="/insertRoom.hotel")
	public String insertRoom(HttpServletRequest req, @ModelAttribute RoomDTO dto, BindingResult result){
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("file");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(target);
			} catch (Exception e) {
			}
			filename = file.getOriginalFilename();
			filesize = (int) file.getSize();
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		int res = hotelmapper.insertRoom(dto);
		String msg = null, url = "hotelContent.hotel?no="+dto.getH_id();
		if (res > 0)
			msg = "숙소가 등록되었습니다";
		else
			msg = "error : 숙소 등록을 실패했습니다";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value = "/deleteRoom.hotel")
	public String deleteRoom(HttpServletRequest req, @RequestParam int id) {
		RoomDTO roomdto = hotelmapper.getRoom(id);
		String msg = null, url = "hotelContent.hotel?no="+ roomdto.getH_id();
		int res = hotelmapper.deleteRoom(id);
		if (res > 0)
			msg = "방이 삭제되었습니다";
		else
			msg = "error : 방 삭제를 실패했습니다";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value = "/updateRoom.hotel", method = RequestMethod.GET)
	public String updateRoom(HttpServletRequest req, @RequestParam int id) {
		RoomDTO dto = hotelmapper.getRoom(id);
		req.setAttribute("dto", dto);
		return "hotel/updateRoomForm";
	}

	@RequestMapping(value = "/updateRoom.hotel", method = RequestMethod.POST)
	public String updateRoom(HttpServletRequest req, @ModelAttribute RoomDTO dto, BindingResult result) {
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("file");

			File target = new File(upLoadPath, file.getOriginalFilename());
			if (file.getSize() > 0) {
				try {
					file.transferTo(target);
				} catch (Exception e) {
				}
				filename = file.getOriginalFilename();
				filesize = (int) file.getSize();
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			else {
			RoomDTO temp = hotelmapper.getRoom(dto.getId());
			dto.setFilename(temp.getFilename());
			dto.setFilesize(temp.getFilesize());
			}
		int res = hotelmapper.updateRoom(dto);
		String msg = null, url = "hotelContent.hotel?no="+dto.getH_id();
		if (res > 0)
			msg = "방이 수정되었습니다";
		else
			msg = "error : 방 수정을 실패했습니다";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}


}