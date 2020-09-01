<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : B4_myPage.jsp
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지
 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../index_top.jsp"%>

<section id="four" class="wrapper style1 special fade-up">
<div align="center">
<table>
   <tr>
	  	 <td width="120" height="120">
		      <img src="http://localhost:8080/img/${filename}" width="180" height="180">
		       <h3>${name}</h3>
	   	</td>
	   <td>
		   <a href="memberAll.do">친구</a>
		   	&nbsp;&nbsp;
	  		방문자수${getBoard.readCount}
	  		&nbsp;&nbsp;
	   </td>
   </tr>
</table>
   <div class="box alt">
   <div class="row gtr-uniform">
	   <c:if test="${empty boardList}">
	      <h2>등록된 게시물이 없습니다.</h2>
	   </c:if>   
	   <c:forEach var="dto" items="${boardList}">
	         <section class="col-4 col-6-medium col-12-xsmall">
	            <a href="comm_content.do?boardNum=${dto.boardNum}">
	               <img src="http://localhost:8080/img/${dto.file_name}" width="300" height="300">
	            </a>
	         </section>
	   </c:forEach>   
   </div>
   </div>         
</div>
</section>
<%@ include file="../index_bottom.jsp"%>