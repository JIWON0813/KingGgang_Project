package com.teamb.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
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
import com.teamb.model.RoomDTO;
import com.teamb.model.RoomDateDTO;
import com.teamb.service.HotelMapper;

/*
      이	   름 : HotelController class
	개  발   자 : 김 지 원
	설	   명 : 숙소 컨트롤러  
 */
@Controller
public class HotelController {

	@Autowired
	private HotelMapper hotelmapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

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
	public String hotelDetail(HttpServletRequest req, @RequestParam int no){
		HotelDTO dto = hotelmapper.getHotel(no);
		List<RoomDTO> list = hotelmapper.roomList(no);
		req.setAttribute("dto", dto);
		req.setAttribute("roomList", list);
		return "hotel/hotelDetail";
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
	
	@RequestMapping(value="/show_regiroom.hotel")
	public String showRegiroom(@RequestParam String startdate , @RequestParam String enddate){
		boolean check = hotelmapper.checkRoomdate(startdate , enddate);
		return "message";
	}
	
	@RequestMapping(value="/room_book.hotel")
	public String BookRoom(HttpServletRequest req ,@RequestParam int id){
		
		RoomDTO dto = hotelmapper.getRoom(id);
		req.setAttribute("roomdto", dto);
		return "hotel/room_book";
	}
	
	@RequestMapping(value="/insertRoom.hotel")
	public String insertRoom(HttpServletRequest req, @ModelAttribute RoomDTO dto, BindingResult result){
		String filename = "";
		int filesize = 0;
		String checkin = req.getParameter("startcheckin") + " ~ " + req.getParameter("endcheckin");
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
