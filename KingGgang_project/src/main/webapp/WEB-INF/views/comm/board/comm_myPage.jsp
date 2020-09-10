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
			<a href="memberAll.do">친구</a>
	   </td>
	   
	</tr>
	<tr>
		 <td>
		      <h2>[   ${comm_nickname}   ]님</h2>
	   	 </td>
	</tr> 
	<tr>
	<c:if test="${loginNum == memberNum}">
	<td><a class="join_bt" href="#" onclick="window.open('roomList', '_blank', 'width=600 height=600')" style="display: inline-block; margin-left:30px;">채팅 목록</a></td>
	</c:if>
	<c:if test="${loginNum != memberNum}">
	<td><a class="join_bt" href="#"
				onclick="window.open('room?comm_memberNum=${memberNum}&comm_nickname=${comm_nickname}', '_blank', 'width=600 height=600')"
				style="display: inline-block; margin-left:30px;">메세지 보내기</a></td> 
	</c:if>
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