<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : B4_myPage.jsp
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지
 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="section layout_padding">
<div align="left">
<table>
   <tr>
	  	 <td width="120" height="120">
		      <img src="http://localhost:8080/img/${comm_profilename}" width="180" height="180">
		 </td>
		 <td>
	    	&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="comm_friendAll.do?comm_memberNum=${comm_memberNum}">친구</a>
	   </td>
	</tr>
	<tr>
		 <td>
		      <h2>[   ${comm_nickname}   ]님</h2>
	   	 </td>
	</tr> 
	   
</table>
</div>
<div>
    <hr color="pink">
	   <c:if test="${empty boardList}">
	      <h2>등록된 게시물이 없습니다.</h2>
	   </c:if>   
	   <c:forEach var="dto" items="${boardList}">
	   		<a href="comm_content.do?boardNum=${dto.boardNum}">
	        	<img src="http://localhost:8080/img/${dto.file_name}" width="300" height="300">
	        </a>
	   </c:forEach>          
</div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>