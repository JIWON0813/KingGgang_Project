<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
    input{
      border:1px solid orange;
      background-color:rgba(0,0,0,0);
      color:orange;
      padding:5px;
      
      border-radius:5px;
   }
   #input_group input:hover{
      color:white;
      background-color:orange;
   }

</style>
<footer class="footer-box">
      <div class="container">
         <div class="row">
            <div class="col-md-12 white_fonts">
               <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-3">
                     <div class="full">
                        <h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="90" height="90">댓글삭제</h3>
                        
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
</footer>
<br>
<br>
<br>
<br>
<div class="section layout_padding">
<div align="center">
<form name="f" action="reply_deletePro.do" method="post">
   <input type="hidden" name="replyNum" value="${param.replyNum }"/>
   <input type="hidden" name="boardNum" value="${param.boardNum }"/>
   <table>
      <tr align="center">
         <th>* 댓글 작성 시 적은 비밀번호를 입력해 주세요.</th>
      </tr>
      <tr>
         <td align="center"> 비밀번호 : 
            <input type="password" name="rpasswd">
         </td>
         <td id="input_group"> 
               <input type="submit" value="댓글 삭제">
               <input type="button" value="취소" onclick="history.back()">
            </td>
      </tr>
   </table>
</form>
</div>
</div>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/bottom.jsp"%>