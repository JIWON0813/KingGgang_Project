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

import com.teamb.model.RentcarDTO;
import com.teamb.service.RentcarMapper;

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
		int num = Integer.parseInt(req.getParameter("r_id"));
		RentcarDTO dto = rentcarMapper.getRentcar(num);
		req.setAttribute("rentcar",dto);
		req.setAttribute("upLoadPath",upLoadPath);
		return "rentcar/contentRentcar_Admin";
	}
	
	@RequestMapping(value = "updateRentcar.admin")
	public String updateRentcar(HttpServletRequest req){
		int num = Integer.parseInt(req.getParameter("r_id"));
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
			url = "updateRentcar.admin?r_id="+dto.getR_id();
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}
	
	@RequestMapping(value = "deleteRentcar.admin")
	public String deleteRentcar(HttpServletRequest req){
		int num = Integer.parseInt(req.getParameter("r_id"));
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
	
//////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "main.rentcar")
	public String rentcarMain(){
		return "rentcar/rentcarMain";
	}
	
}
