package com.teamb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.Comm_NoticeDTO;
import com.teamb.model.CommboardDTO;
import com.teamb.model.HashTagDTO;
import com.teamb.service.CommNewsFeedMapper;
import com.teamb.service.CommboardMapper;
import com.teamb.service.HashTagMapper;

@Controller
public class CommNewsfeedController {

   @Autowired
   private CommboardMapper boardMapper;
   
   @Autowired
   private CommNewsFeedMapper newsfeedMapper;

   @Autowired
   private HashTagMapper hashtagMapper;
   
   @Resource(name = "upLoadPath")
   private String upLoadPath;


   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping(value = "/commMemberSearch", method = RequestMethod.POST)
   public Object memberSearch(@RequestBody HashMap<String, Object> map) {
      String word = (String) map.get("word");
      List<Comm_MemberDTO> list = newsfeedMapper.getSearchComm_Member(word);
      JSONArray jsonArray = new JSONArray();
      JSONObject json = null;
      for (int i = 0; i < list.size(); i++) {
         json = new JSONObject();
         Comm_MemberDTO dto = (Comm_MemberDTO) list.get(i);
         json.put("num", dto.getComm_memberNum());
         json.put("profile", dto.getComm_profilename());
         json.put("nick", dto.getComm_nickname());

         jsonArray.add(json);

      }

      return jsonArray;
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping(value = "/commHashSearch", method = RequestMethod.POST)
   public Object hashSearch(@RequestBody HashMap<String, Object> map) {
      String word = (String) map.get("word");
      List<HashTagDTO> list = hashtagMapper.getSearchTagList(word);
      JSONArray jsonArray = new JSONArray();
      JSONObject json = null;
      for (int i = 0; i < list.size(); i++) {
         json = new JSONObject();
         HashTagDTO dto = (HashTagDTO) list.get(i);
         json.put("tagName",dto.getTagName());
         json.put("tagId", dto.getTagId());
         jsonArray.add(json);

      }

      return jsonArray;
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping(value = "/ajaxList.do", method = RequestMethod.POST)
   public Object moerContent(@RequestBody HashMap<String, Object> map, HttpServletRequest req,HttpSession session){
      
      int startRow = (int) map.get("startRow");
      int endRow = (int)map.get("endRow");
      int count = newsfeedMapper.getNewsCount();
      if (endRow>count) endRow = count;
      

      
      
      
     //---------------------------------------- 
    //지은
      List<CommboardDTO> list = null;
      String look=(String) session.getAttribute("look");
     if(look!=null){
         if(look.equals("전체공개")){
            list = newsfeedMapper.newfeedList(startRow, endRow, look);
         }
         else if(look.equals("회원공개")){
            list = newsfeedMapper.newfeedList(startRow, endRow, look);
         }
         else if(look.equals("비공개")){
            list = newsfeedMapper.newfeedList(startRow, endRow, look);
         }
      }
     else if(look==null){
          look="전체공개";
          list = newsfeedMapper.newfeedList(startRow, endRow, look);
     }

      JSONArray jsonArray = new JSONArray();
      JSONObject json = null;
      for (int i = 0; i < list.size(); i++) {
         json = new JSONObject();
         CommboardDTO dto = (CommboardDTO) list.get(i);
         json.put("num", dto.getBoardNum());
         json.put("file", dto.getFile_name());
         jsonArray.add(json);
         }
     
      return jsonArray;
     }
    
   @RequestMapping("/commhome.comm")
   public ModelAndView boardList(HttpServletRequest req,HttpSession session){
      int pageSize = 4;
      
      String pageNum = req.getParameter("pageNum");
      if (pageNum == null){
         pageNum = "1";
      }
      
      int currentPage = Integer.parseInt(pageNum);
      int startRow = currentPage * pageSize - (pageSize-1);
      int endRow = currentPage * pageSize;

      List<CommboardDTO> newsfeed = null;
      //newsfeed = newsfeedMapper.newfeedList(startRow, endRow);
      
    //지은
      ModelAndView mav = new ModelAndView();
      String look=(String) session.getAttribute("look");
      if(look!=null){
         if(look.equals("전체공개")){
            newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
            mav.addObject("boardList", newsfeed);
         }
         else if(look.equals("회원공개")){
            newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
            mav.addObject("boardList", newsfeed);
         }
         else if(look.equals("비공개")){
            newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
            mav.addObject("boardList", newsfeed);
         }
      }
      else if(look==null){
          look="전체공개";
          newsfeed = newsfeedMapper.newfeedList(startRow, endRow, look);
          mav.addObject("boardList", newsfeed);
       }

//      ModelAndView mav = new ModelAndView();
//      mav.addObject("boardList", newsfeed);

      mav.setViewName("comm/index");
      return mav;
   }
   
// 지은
   @RequestMapping("/commadmin.comm")
   public String admin(HttpServletRequest req) {
      return "comm/comm_admin";
   }
   
   @RequestMapping("/comm_noticewrite.do")
   public String comm_noticewriteForm(HttpSession session) {
      String comm_nnickname = (String) session.getAttribute("comm_nickname");
      return "comm/comm_notice";
   }

   @RequestMapping("/comm_noticewrite_ok.do")
   public String comm_noticewrite(HttpServletRequest req, HttpSession session, Comm_NoticeDTO dto) {
      // int memberNum = (Integer)session.getAttribute("memberNum");
      String comm_nnickname = (String) session.getAttribute("comm_nickname");
      // dto.setMemberNum(memberNum);
      dto.setComm_nnickname(comm_nnickname);
      int res = boardMapper.comm_insertNotice(dto);
      String msg = null, url = null;
      if (res > 0) {
         msg = "공지글 등록성공";
         url = "comm_noticeList.do";
         // url="commhome.comm";
      } else {
         msg = "공지글 등록실패";
         url = "commhome.comm";
      }
      session.setAttribute("mode", dto.getComm_mode());
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }

   @RequestMapping("/comm_noticeList.do")
   public String comm_noticeList(HttpServletRequest req, HttpSession session, Comm_NoticeDTO dto) {
      String comm_mode = (String) session.getAttribute("mode");
      List<Comm_NoticeDTO> list = boardMapper.comm_noticeAllList();
      req.setAttribute("noticeList", list);
      return "comm/noticeList";
   }

   @RequestMapping("/comm_noticeDelete.do")
   public String comm_deleteNotice(HttpServletRequest req, @RequestParam int comm_noticeNum) {
      int res = boardMapper.comm_deleteNotice(comm_noticeNum);
      String msg = null, url = null;
      if (res > 0) {
         msg = "공지사항 삭제 성공.";
         url = "commadmin.comm";
      }

      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }

   @RequestMapping(value = "/comm_notice_edit.do")
   public ModelAndView commNoticeEdit(HttpServletRequest req, HttpSession session, @RequestParam int comm_noticeNum) {
      Comm_NoticeDTO dto = boardMapper.comm_getNotice(comm_noticeNum);
      ModelAndView mav = new ModelAndView("comm/comm_notice_edit", "comm_getNotice", dto);

      return mav;
   }

   @RequestMapping(value = "/comm_notice_edit_ok.do", method = RequestMethod.POST)
   public String commNoticeEditOk(HttpServletRequest req, HttpSession session, Comm_NoticeDTO dto,
         @RequestParam int comm_noticeNum) {

      int res = boardMapper.comm_updateNotice(dto);
      String msg = null, url = null;
      if (res > 0) {
         msg = "회원수정성공! 메인페이지로 이동합니다.";
         url = "commhome.comm";
      } else {
         msg = "회원수정실패! 메인페이지로 이동합니다.";
         url = "commhome.comm";
      }

      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }

   @RequestMapping("/comm_message.do")
   public String message(HttpServletRequest req) {
      String msg = "로그인 후 열람 가능합니다.";
      String url = "comm_noticeList.do";

      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }
 
}