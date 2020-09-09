<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="section layout_padding">
<div align="center">
<form name="f" onsubmit="return check()">
	<b>신 고 목 록</b>
	<table width="800">
		<td align="right"><a href="commadmin.comm">뒤로가기</a></td>
	</table>
	<table width="800">
		<tr bgcolor="orange" align="center">
			<th><font color=brown>번호</font></th>
			<th><font color=brown>게시물번호</font></th>
			<th><font color=brown>작성자</font></th>
			<th><font color=brown>게시글삭제</font></th>
		</tr> 
	<c:if test="${empty warnList}">		
		<tr>
			<td colspan="6">
				! 등록된 신고 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${warnList}">		
		<tr align="center">
			<td><c:out value="${dto.warnNum}"/></td>
			<td>
				<a href="comm_content.do?boardNum=${dto.boardNum}">${dto.boardNum}</a>
			</td>
			<td>${comm_nickname}</td>
			<td><input type="button" value="글삭제" onclick="window.location='warn_deletePro.do?warnNum=${dto.warnNum}&boardNum=${dto.boardNum}'"></td>
		</tr>		
	</c:forEach>	
	</table>
	</form>
</div>	
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>