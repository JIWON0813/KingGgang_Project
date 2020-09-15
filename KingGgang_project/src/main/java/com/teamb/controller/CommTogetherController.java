package com.teamb.controller;

/* 씠      由  : CommTogetherController.java
媛   諛     옄 : 理   씤  븘
 꽕      紐  :  닾寃뚮뜑Controller*/

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.CommTogetherDTO;
import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.NoticeDTO;
import com.teamb.service.CommTogetherMapper;
import com.teamb.service.Comm_MemberMapper;

@Controller
public class CommTogetherController {
   
   @Autowired
   private CommTogetherMapper togetherMapper;
   
   @Autowired
   private Comm_MemberMapper comm_memberMapper;
   
   //인아
   @RequestMapping(value = "/comm_togetherWF.do", method = RequestMethod.GET)
   public String togetherWF(HttpServletRequest req) {
      return "comm/board/comm_togetherWF";
   }
   
   @RequestMapping(value = "/comm_togetherWP.do", method = RequestMethod.POST)
   public String togetherWP(HttpServletRequest req, CommTogetherDTO dto, BindingResult result) {
      
      if (result.hasErrors()) {
         dto.setTogetherNum(0);
      }
      
      HttpSession session = req.getSession();
      int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
      dto.setComm_memberNum(comm_memberNum);
      String tname = (String)session.getAttribute("comm_nickname");
      dto.setTname(tname);
      
      int res = togetherMapper.writeTogether(dto);
      String msg = null, url = null;

      if (res > 0) {
         msg = "게시글 작성 성공";
         url = "comm_togetherList.do";
      } else {
         msg = "게시글 작성 실패";
         url = "comm_togetherWF.do";
      }
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      req.getAttribute("comm_nickname");
      return "message";
   }
   
   @RequestMapping("/comm_togetherList.do")
   public String togetherList(HttpServletRequest req, HttpSession session, Comm_MemberDTO dto) {
      /*String pageNum = req.getParameter("pageNum");
      if (pageNum==null){
         pageNum = "1";
      }
      int pageSize = 5;
      int currentPage = Integer.parseInt(pageNum);
      int startRow = currentPage * pageSize - (pageSize-1);
      int endRow = currentPage * pageSize;
      int count = togetherMapper.getCountTogether();
      if (endRow>count) endRow = count;      
      List<CommTogetherDTO> list = togetherMapper.listTogether(startRow, endRow);
      req.setAttribute("togetherList", list);
      int startNum = count - ((currentPage-1) * pageSize); 
      if (count>0){
         int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
         int pageBlock = 3;
         int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
         int endPage = startPage + pageBlock - 1;
         if (endPage>pageCount) endPage = pageCount;
         req.setAttribute("count", count);
         req.setAttribute("startNum", startNum);
         req.setAttribute("pageCount", pageCount);
         req.setAttribute("pageBlock", pageBlock);
         req.setAttribute("startPage", startPage);
         req.setAttribute("endPage", endPage);
      }*/
      
       int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
       List<CommTogetherDTO> tlist = togetherMapper.allListTogether();
       req.setAttribute("togetherList", tlist);
       
      return "comm/board/comm_togetherList";
   }
   
   @RequestMapping(value = "/comm_tcontent.do", method = RequestMethod.GET)
   public String tcontent(HttpServletRequest req, @RequestParam int togetherNum) {
      
      togetherMapper.plustReadcount(togetherNum);
      CommTogetherDTO dto = togetherMapper.getTogether(togetherNum);
      req.setAttribute("getTogether",dto);
      
      return "comm/board/comm_tcontent";
   }
   
   @RequestMapping(value = "/comm_tupdateForm.do", method = RequestMethod.GET)
   public ModelAndView tupdateForm(@RequestParam int togetherNum) {
      CommTogetherDTO dto = togetherMapper.getTogether(togetherNum);
      ModelAndView mav = new ModelAndView("comm/board/comm_tupdateForm", "getTogether", dto);
      return mav;
   }

   @RequestMapping(value = "/comm_tupdatePro.do", method = RequestMethod.POST)
   public String tupdatePro(HttpServletRequest req, HttpSession session, @ModelAttribute CommTogetherDTO dto, 
         @RequestParam int togetherNum) {
      
      int res = togetherMapper.updateTogether(dto);
      String msg = null, url = null;

      if (res > 0) {
         msg = "湲  씠  닔 젙 릺 뿀 뒿 땲 떎!!";
         url = "comm_tcontent.do";
      }else{
         msg = "湲   닔 젙 뿉  떎 뙣 븯   뒿 땲 떎!!";
         url = "comm_tupdateForm.do";
      }
      
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);

      return "message";
   }
   
   @RequestMapping(value = "/comm_tdeletePro.do")
   public ModelAndView tdeletePro(@RequestParam int togetherNum) {
      int res = togetherMapper.deleteTogether(togetherNum);
      String msg = null, url = null;

      if (res > 0) {
         msg = "湲  씠  궘 젣 릺 뿀 뒿 땲 떎.";
         url = "comm_togetherList.do";
      }
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.addObject("url", url);
      mav.setViewName("message");
      return mav;
   }
   
   //여진
   @RequestMapping("/comm_mainTogetherList")
   public String mainTogetherList(HttpServletRequest req, HttpSession session) {
      List<CommTogetherDTO> list = new ArrayList<>();
         
      if(session.getAttribute("comm_memberNum") == null){

      }else{
         int comm_memberNum = (Integer)session.getAttribute("comm_memberNum");
         list = togetherMapper.allListTogether();
         req.setAttribute("togetherList", list);
      } 
         return "comm/board/comm_mainTogetherList";
   }
}