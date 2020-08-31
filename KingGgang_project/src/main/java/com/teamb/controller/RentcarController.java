package com.teamb.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamb.model.InsuDTO;
import com.teamb.model.RentcarDTO;
import com.teamb.model.Rentcar_ResDTO;
import com.teamb.service.RentcarMapper;

/*
이	   름 : RentcarController class
개  발   자 : 정 우 철
설	   명 : 렌트카 페이지 컨트롤러  
*/

@Controller
public class RentcarController {
	
	@Autowired
	private RentcarMapper rentcarMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	////////////////////////////////CRUD//////////////////////////////////
		
	@RequestMapping(value = "insertRentcar.admin")
	public String insertRentcarForm(){
		return "rentcar/insertRentcarForm";
	}
	
	@RequestMapping(value ="insertRentcar_Ok.admin")
	public String insertRentcarOk(HttpServletRequest req,RentcarDTO dto,BindingResult br){
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath,file.getOriginalFilename());
		if (file.getSize() > 0){
			try{
				file.transferTo(target);
				}catch(IOException e){
					
				}
			filename = file.getOriginalFilename();
			filesize = (int)file.getSize();
			}
				
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
		String renttel = dto.getRenthp1()+dto.getRenthp2()+dto.getRenthp3(); 
		dto.setRenttel(renttel);
		int res = rentcarMapper.insertRentcar(dto);
	
		String msg = null;
		String url = null;
		if(res>0){
			msg = "렌트카 등록 성공! 렌트카 리스트로 이동합니다.";
			url = "listRentcar.admin";
		}else{
			msg = "렌트카 등록 실패~ 렌트카 등록 페이지로 이동합니다.";
			url = "insertRentcar.admin";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}

	@RequestMapping(value = "listRentcar.admin")
	public String listRentcar(HttpServletRequest req){
		List<RentcarDTO> list = rentcarMapper.listRentcar();
		req.setAttribute("rentcarList",list);
		return "rentcar/listRentcar_Admin";
	}
	
	@RequestMapping(value = "contentRentcar.admin")
	public String contentRentcar(HttpServletRequest req){
		int num = Integer.parseInt(req.getParameter("id"));
		RentcarDTO dto = rentcarMapper.getRentcar(num);
		req.setAttribute("rentcar",dto);
		req.setAttribute("upLoadPath",upLoadPath);
		
		if(dto.getReservation()==1){
		List<Rentcar_ResDTO> dto2 = rentcarMapper.findReturnday(num);
		String returnday = dto2.get(0).getReturnday();
		req.setAttribute("returnday",returnday);
		}
		
		return "rentcar/contentRentcar_Admin";
	}
	
	@RequestMapping(value = "updateRentcar.admin")
	public String updateRentcar(HttpServletRequest req){
		int num = Integer.parseInt(req.getParameter("id"));
		RentcarDTO dto = rentcarMapper.getRentcar(num);
		req.setAttribute("rentcar",dto);
		return "rentcar/updateRentcarForm";
	}
	
	@RequestMapping(value = "updateRentcar_Ok.admin")
	public String updateRentcarOk(HttpServletRequest req,RentcarDTO dto,BindingResult br){
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		
		String ogFilename = mr.getParameter("ogFilename");
		int ogFilesize = Integer.parseInt(mr.getParameter("ogFilesize"));
		
		MultipartFile file = mr.getFile("filename");
		String filename = file.getOriginalFilename();
		
		if(!filename.equals(ogFilename)){
		File target = new File(upLoadPath,file.getOriginalFilename());
		File deleteFile = new File(upLoadPath,ogFilename);
		if (file.getSize() > 0 || file.getOriginalFilename()==null){
			try{
				file.transferTo(target);
				deleteFile.delete();
				}catch(IOException e){}
			dto.setFilename(file.getOriginalFilename());
			dto.setFilesize((int)file.getSize());
			}else{
				dto.setFilename(ogFilename);
				dto.setFilesize(ogFilesize);
			}
			
		}
		
		String renttel = dto.getRenthp1() + dto.getRenthp2() + dto.getRenthp3();
		dto.setRenttel(renttel);
		
		int res = rentcarMapper.updateRentcar(dto);
		String msg = null;
		String url = null;
		if(res>0){
			msg = "렌트카 수정 성공! 렌트카 리스트로 이동합니다.";
			url = "listRentcar.admin";
		}else{
			msg = "렌트카 수정 실패~ 렌트카 수정 페이지로 이동합니다.";
			url = "updateRentcar.admin?id="+dto.getId();
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}
	
	@RequestMapping(value = "deleteRentcar.admin")
	public String deleteRentcar(HttpServletRequest req){
		int num = Integer.parseInt(req.getParameter("id"));
		RentcarDTO dto = rentcarMapper.getRentcar(num);

		String filename = dto.getFilename();
		File file = new File(upLoadPath,filename);
		int res = rentcarMapper.deleteRentcar(num);
		file.delete();
		String msg = null;
		String url = null;
		if(res>0){	
			msg = "렌트카 삭제 성공! 렌트카 리스트로 이동합니다.";
			url = "listRentcar.admin";
		}else{
			msg = "렌트카 삭제 실패~ 렌트카 리스트로 이동합니다.";
			url = "listRentcar.admin";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}
//////////////////////////보험/////////////////////////////////	
	@RequestMapping(value = "insertInsu.admin")
	public String insertInsu(){
		return "rentcar/insertInsuForm";
	}
	
	@RequestMapping(value = "listInsu.admin")
	public String listInsu(HttpServletRequest req){
		List<InsuDTO> list = rentcarMapper.listInsu();
		req.setAttribute("insuList",list);
		return "rentcar/listInsu_admin";
	}
	
	@RequestMapping(value = "insertInsu_Ok.admin")
	public String insertInsuOk(HttpServletRequest req,InsuDTO dto){
		int res = rentcarMapper.insertInsu(dto);
		
		String msg = null;
		String url = null;
		
		if(res>0){	
			msg = "등록 성공! 보험 목록으로 이동합니다.";
			url = "listInsu.admin";
		}else{
			msg = "등록 실패! 보험 목록으로 이동합니다.";
			url = "listInsu.admin";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}
	
	@RequestMapping(value = "deleteInsu.admin")
	public String deleteInsu(HttpServletRequest req){
		int id = Integer.parseInt(req.getParameter("id"));
		int res = rentcarMapper.deleteInsu(id);
		
		String msg = null;
		String url = null;
		if(res>0){	
			msg = "보험 삭제 성공! 보험 목록으로 이동합니다.";
			url = "listInsu.admin";
		}else{
			msg = "보험 삭제 실패! 보험 목록으로 이동합니다.";
			url = "listInsu.admin";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}
	
	@RequestMapping(value = "updateInsu.admin")
	public String updateInsu(HttpServletRequest req){
		int id = Integer.parseInt(req.getParameter("id"));
		InsuDTO dto = rentcarMapper.getInsu(id);
		req.setAttribute("insu",dto);
		return "rentcar/updateInsuForm";
	}
	
	@RequestMapping(value = "updateInsu_Ok.admin")
	public String updateInsuOk(HttpServletRequest req,InsuDTO dto){
		int res = rentcarMapper.updateInsu(dto);
		
		String msg = null;
		String url = null;
		if(res>0){	
			msg = "보험 수정 성공! 보험 목록 페이지로 이동합니다.";
			url = "listInsu.admin";
		}else{
			msg = "보험 수정 실패! 보험 수정 페이지로 이동합니다.";
			url = "updateInsu.admin?insu_id="+dto.getId();
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
		
	}
	
//////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "main.rentcar")
	public String rentcarMain(HttpServletRequest req){
		String mode = req.getParameter("mode");
		if (mode == null){
		List<RentcarDTO> list = rentcarMapper.listRentcar();
		req.setAttribute("rentcar",list);
		}else if(mode.equals("lowPrice")){
			List<RentcarDTO> list = rentcarMapper.listLowPriceRentcar();
			req.setAttribute("rentcar",list);
		}else if(mode.equals("type") || mode.equals("fuel")){
			Object obj = req.getParameter("obj");
			List<RentcarDTO> list = rentcarMapper.findRentcar(mode,obj);
			req.setAttribute("rentcar",list);
		}else if(mode.equals("date")){
			String receiptday = req.getParameter("receiptday");
			String returnday = req.getParameter("returnday");
			List<RentcarDTO> list = rentcarMapper.listCanReservationRentcar(receiptday, returnday);
			req.setAttribute("rentcar",list);
		}
		return "rentcar/rentcarMain";
	}
	
	@RequestMapping(value = "content.rentcar")
	public String rentcarContent(HttpServletRequest req){
		int num = Integer.parseInt(req.getParameter("id"));
		RentcarDTO dto = rentcarMapper.getRentcar(num);
		req.setAttribute("rentcar",dto);
		req.setAttribute("upLoadPath",upLoadPath);
		return "rentcar/contentRentcar";
	}
	
	@RequestMapping(value = "reservation.rentcar")
	public String rentcarReservation(HttpServletRequest req){
		int r_id = Integer.parseInt(req.getParameter("id"));
		RentcarDTO rdto = rentcarMapper.getRentcar(r_id);
		List<InsuDTO> insulist = rentcarMapper.listInsu();
		req.setAttribute("rentcar",rdto);
		req.setAttribute("insu",insulist);
		return "rentcar/reservation";
	}
	
	@RequestMapping(value = "reservation_Ok.rentcar")
	public String rentcarReservationOk(HttpServletRequest req,Rentcar_ResDTO dto){
		
		
		int res = rentcarMapper.insertRentcarReservation(dto);
		String msg = null;
		String url = null;
		if(res>0){
			rentcarMapper.updateRentcarReservation(dto.getR_id());
			msg = "예약 성공! 메인 페이지로 이동합니다.";
			url = "main.rentcar";
		}else{
			msg = "예약 실패! 차량 상세 페이지로 이동합니다.";
			url = "content.rentcar?id="+dto.getR_id();
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
			
	}
	
	
}
