<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- 
   이      름 : comm_bookMark.jsp
   개  발   자 : 최 인 아
   설      명 : 북마크페이지
 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
      <div class="container">
         <div class="row">
            <div class="col-md-12 white_fonts">
               <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-3">
                     <div class="full">
                        <h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">BookMark</h3>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
</footer>
<div class="section layout_padding" align="center">
      <div class="row">
         <c:if test="${empty bookmarkList}">
            <h2>등록된 페이지가 없습니다.</h2>
         </c:if>
         <c:forEach var="dto" items="${bookmarkList}">
         <div class="col-md-3 col-sm-6 col-xs-12">
               <a href="comm_otherContent.do?boardNum=${dto.boardNum}">      
                  <img src="http://192.168.0.184:8080/img/${dto.cm_file_name}" width="180" height="180">
               </a>
         </div>
         </c:forEach>
      </div>
</div>

<%@ include file="/WEB-INF/views/bottom.jsp"%>