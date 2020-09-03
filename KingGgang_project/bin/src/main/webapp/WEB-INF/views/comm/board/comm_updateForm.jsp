<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : B4_updateForm.jsp
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../index_top.jsp" %>
<section id="four" class="wrapper style1 special fade-up">
<div class="container">
	<header class="major">
		<h2>게시물 수정</h2>
	</header>
	<form name="f" action="comm_updatePro.do" method="post" onsubmit="return check()">
	<input type="hidden" name="boardNum" value="${getBoard.boardNum}">
	<table width="300" class="wrapper style1 special fade-up">
	<!-- <tr>
			<th><img src="warn.png"></th>
		</tr> -->
		<tr align="center">
			 <td align="center" colspan="3">
			 	<input type="file" name="file_name">
			 	<%-- <img src="${pageContext.request.contextPath}/resources/img/${getBoard.file_name}" width="30" height="30"> --%>
			 	<img src="http://localhost:8080/img/${getBoard.file_name}" width="300" height="300">
				<input type="hidden" name="file_size" value="${getBoard.file_size}">
			 	<%-- <img src="http://localhost:8080/img/${getBoard.file_name}" width="400" height="400"> --%>
			 </td>
		</tr>
		
		<tr height="80" colspan="3">
			<td>
				<textarea name="content" cols="100" rows="5">${getBoard.content}</textarea>
			</td>
		</tr>
	
		<tr height="30">
			<th width="150">태그하기</th>
			<td><input type="text" name="tag" value="${getBoard.tag}"></td>
		</tr>
		<tr height="30">
			<th width="150">위치표시하기</th>
			<td><input type="text" name="loc" value="${getBoard.loc}"></td>
		</tr>
		
		<tr>
			<td align="center" colspan="3">
				<input type="submit" value="글수정">
				<%-- onclick="window.location='update.do?boardNum=${getBoard.boardNum}'" --%>
				<input type="button" value="글목록" onclick="window.location='comm_myPage.do'">
			</td>
		</tr>
	</table>
	</form>
</div>
</section>
<%@ include file="../index_bottom.jsp"%>