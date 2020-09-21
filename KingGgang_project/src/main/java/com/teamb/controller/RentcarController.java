package com.teamb.controller;

import java.io.File;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter; 
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamb.model.InsuDTO;
import com.teamb.model.MemberDTO;
import com.teamb.model.RentcarDTO;
import com.teamb.model.Rentcar_ResDTO;
import com.teamb.service.MemberMapper;
import com.teamb.service.PaymentMapper;
import com.teamb.service.RentcarMapper;

/*
이      름 : RentcarController class
개  발   자 : 정 우 철
설      명 : 렌트카 페이지 컨트롤러  
*/

@Controller
public class RentcarController {
   
   @Autowired
   private RentcarMapper rentcarMapper;
   
   @Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PaymentMapper paymentMapper;
   
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
      for(int i=0;i<list.size();i++){
    	  List<Rentcar_ResDTO> rentcarRes = rentcarMapper.listRentcarReservationTime(list.get(i).getId());
    	  if(rentcarRes.size()==0){
    		  rentcarMapper.updateRentcarReservation2(list.get(i).getId());
    		  list.get(i).setReservation(0);
    	  }
      }
      req.setAttribute("rentcarList",list);
      return "rentcar/listRentcar_Admin";
   }
   
   @RequestMapping(value = "contentRentcar.admin")
   public String contentRentcar(HttpServletRequest req){
      int r_id = Integer.parseInt(req.getParameter("id"));
      RentcarDTO rentcar = rentcarMapper.getRentcar(r_id);
      List<Rentcar_ResDTO> rentcarRes = rentcarMapper.listRentcarReservationTime(r_id);
      req.setAttribute("rentcar",rentcar);
      req.setAttribute("rentcarRes",rentcarRes);
      
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
	
	@RequestMapping(value="firstPage.rentcar")
	public String rentcarFirstPage(HttpServletRequest req,HttpSession session){
		String member_id = (String) session.getAttribute("mbId");
		if(member_id == null){
			String msg = "로그인 후 이용 해 주세요!";
			String url = "home.do";
			req.setAttribute("msg",msg);
			req.setAttribute("url",url);
			return "message";
		}
		return "rentcar/firstPage";
	}
	
	@RequestMapping(value = "main.rentcar")
	public String rentcarMain(HttpServletRequest req,HttpSession session){
		String mode = req.getParameter("mode");
		String receiptday = req.getParameter("receiptday") + req.getParameter("pickuptime");
		String returnday = req.getParameter("returnday") + req.getParameter("pickuptime");
		String dpreceiptday = req.getParameter("receiptday");
		String dpreturnday = req.getParameter("returnday");
		String dppickuptime = req.getParameter("pickuptime");
		if (mode == null){
		session.setAttribute("dpreceiptday",dpreceiptday);
		session.setAttribute("dpreturnday",dpreturnday);
		session.setAttribute("dppickuptime",dppickuptime);
		List<RentcarDTO> list = rentcarMapper.listCanReservationRentcar(receiptday, returnday);
		req.setAttribute("rentcar",list);
		}else if(mode.equals("lowPrice")){
			receiptday = (String)session.getAttribute("dpreceiptday") + session.getAttribute("dppickuptime");
			returnday = (String)session.getAttribute("dpreturnday") + session.getAttribute("dppickuptime");
			List<RentcarDTO> list = rentcarMapper.listLowPriceRentcar(receiptday,returnday);
			req.setAttribute("rentcar",list);
		}else if(mode.equals("type") || mode.equals("fuel")){
			receiptday = (String)session.getAttribute("dpreceiptday") + session.getAttribute("dppickuptime");
			returnday = (String)session.getAttribute("dpreturnday") + session.getAttribute("dppickuptime");
			Object obj = req.getParameter("obj");
			List<RentcarDTO> list = rentcarMapper.findRentcar(mode,obj,receiptday,returnday);
			req.setAttribute("rentcar",list);
		}else if(mode.equals("date")){
			dpreceiptday = req.getParameter("receiptday");
			dpreturnday = req.getParameter("returnday");
			dppickuptime = req.getParameter("pickuptime");
			
			session.removeAttribute("dpreceiptday");
			session.removeAttribute("dpreturnday");
			session.removeAttribute("dppickuptime");
			
			session.setAttribute("dpreceiptday",dpreceiptday);
			session.setAttribute("dpreturnday",dpreturnday);
			session.setAttribute("dppickuptime",dppickuptime);

			List<RentcarDTO> list = rentcarMapper.listCanReservationRentcar(receiptday, returnday);
			req.setAttribute("rentcar",list);
		}else if(mode.equals("all")){
			receiptday = (String)session.getAttribute("dpreceiptday") + session.getAttribute("dppickuptime");
			returnday = (String)session.getAttribute("dpreturnday") + session.getAttribute("dppickuptime");
			List<RentcarDTO> list = rentcarMapper.listCanReservationRentcar(receiptday, returnday);
			req.setAttribute("rentcar",list);
		}
		
		
		
		return "rentcar/rentcarMain";
	}
	
	@RequestMapping(value = "content.rentcar")
	public String rentcarContent(HttpServletRequest req,HttpSession session){
		int num = Integer.parseInt(req.getParameter("id"));
		RentcarDTO dto = rentcarMapper.getRentcar(num);
		req.setAttribute("rentcar",dto);
		req.setAttribute("upLoadPath",upLoadPath);
		
		return "rentcar/contentRentcar";
	}
	
	@RequestMapping(value = "reservation.rentcar")
	public String rentcarReservation(HttpServletRequest req,HttpSession session){
		int r_id = Integer.parseInt(req.getParameter("id"));
		RentcarDTO rdto = rentcarMapper.getRentcar(r_id);
		List<InsuDTO> insulist = rentcarMapper.listInsu();
		req.setAttribute("rentcar",rdto);
		req.setAttribute("insu",insulist);
		req.setAttribute("m_id", session.getAttribute("mbId"));

		return "rentcar/reservation";
	}
	
	@RequestMapping(value = "reservation_Ok.rentcar")
	public String rentcarReservationOk(HttpServletRequest req,Rentcar_ResDTO dto,HttpSession session){
		 RentcarDTO rentcarDTO = rentcarMapper.getRentcar(dto.getR_id());
		 InsuDTO insuDTO = rentcarMapper.getInsu(dto.getInsu_id());
		 
		 LocalDate d1 = LocalDate.parse(dto.getReceiptday(), DateTimeFormatter.ISO_LOCAL_DATE);
		 LocalDate d2 = LocalDate.parse(dto.getReturnday(), DateTimeFormatter.ISO_LOCAL_DATE);
		 Duration diff = Duration.between(d1.atStartOfDay(), d2.atStartOfDay());
		 int diffDays = (int)diff.toDays();
		 dto.setPrice(diffDays*(rentcarDTO.getPrice()+insuDTO.getPrice()));
		 
		String receiptday = dto.getReceiptday() + dto.getPickuptime(); 
		String returnday = dto.getReturnday() + dto.getPickuptime();
		dto.setReceiptday(receiptday);
		dto.setReturnday(returnday);

		
	

		
		List<Rentcar_ResDTO> resCheck = rentcarMapper.checkAlreadyReservation(dto);
		//결제 원세호
		String member_id =  req.getParameter("member_id");

		String msg = null;
		String url = null;

		if(resCheck.size()==0){
		int res = rentcarMapper.insertRentcarReservation(dto);

		if(res>0){
			rentcarMapper.updateRentcarReservation(dto.getR_id());
			int res_id = rentcarMapper.getRes_id(member_id);

			int memberNum = (int) session.getAttribute("memberNum");

			MemberDTO mrdto =  paymentMapper.getpayMember(memberNum);
			
			
			req.setAttribute("mrdto", mrdto);
			req.setAttribute("res_id",res_id);
			req.setAttribute("totalPrice", dto.getPrice());
			req.setAttribute("type", 2);
			req.setAttribute("m_no", memberNum);
			return "payment/connectPayApi";

		}else{
			msg = "예약 실패! 예약시간을 다시 조회해 주세요!";
			url = "windowClose.rentcar";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
		}else{
			msg = "예약 실패! 예약시간을 다시 조회해 주세요!(이미 예약됨)";
			url = "home.do";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);

		return "message";		

	}
	@RequestMapping(value = "windowClose.rentcar")
	public String windowClose(){
		return "rentcar/windowClose";
	}
}