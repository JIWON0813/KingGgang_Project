<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : B4_content.jsp
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../index_top.jsp" %>
<section id="four" class="wrapper style1 special fade-up">
<div class="container">
	<table width="300" class="wrapper style1 special fade-up">
	<!-- <tr align="right">
		<th><img src="warn.png"></th>
	</tr> -->
	<c:if test="${getBoard.file_size != 0}">
		<tr align="center">
			 <td align="center" colspan="3">
			 	<img src="http://localhost:8080/img/${getBoard.file_name}" width="400" height="400">
			 </td>
		</tr>
	</c:if>
	
		<tr height="80">
			<td>${getBoard.content}</td>
		</tr>
	
		<tr height="30">
			<th>태그</th>
			<td align="center" width="30%">${getBoard.tag}</td>
			<th><img src="heart.png"></th>
		</tr>
		<tr height="30">
			<th>장소</th>
			<td align="center" width="30%">${getBoard.loc}</td>

			<th><img src="bookmark.png"></th>
		</tr>

		<tr>
			<td align="center" colspan="3">
				<input type="button" value="글수정"
				onclick="window.location='update.do?boardNum=${getBoard.boardNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='deletePro.do?boardNum=${getBoard.boardNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='B4_myPage.do'">
			</td>
		</tr>
	</table>
</div>
</section>
<%@ include file="../index_bottom.jsp"%>