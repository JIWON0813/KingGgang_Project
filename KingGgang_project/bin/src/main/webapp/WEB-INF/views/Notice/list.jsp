<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div align="center">
	<table width="800">
		<tr align="left">
			<th>공지사항</th>
		</tr>
	</table>
	<table width="800" border="1">
		<tr bgcolor="green">
			<th width="10%"></th>
			<th width="60%">제목</th>
			<th width="10%">작성일</th>
			<th width="10%">조회수</th>
		</tr> 
	<c:if test="${empty listNotice}">		
		<tr>
			<td colspan="5">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${listNotice}">		
		<tr>
			<td>
				<c:out value="${startNum}"/>
			</td>
			<c:set var="startNum" value="${startNum-1}" />
			<td>
				<a href="content.notice?no=${dto.no}">
					${dto.subject}
				</a>
		<c:if test="${dto.readcount>10}">
				<img src="resources/img/hot.gif">
		</c:if>		
			</td>
			<td>${dto.reg_date}</td>
			<td>${dto.readcount}</td>
		</tr>		
	</c:forEach>	
	</table>
		<c:if test="${count>0}">
			<c:if test="${startPage > pageBlock}">
				[<a href="list.notice?pageNum=${startPage-1}">이전</a>]		
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="list.notice?pageNum=${i}">${i}</a>]
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				[<a href="list.notice?pageNum=${endPage+1}">다음</a>]
			</c:if>
		</c:if>
<c:if test="${not empty a_id}">
	<table width="800">
		<tr align="center">
			<td align="right">
				<button onclick="location='write.notice'">글쓰기</button>
			</td>
		</tr>
	</table>
	<br><br><br><br><br><br><br><br>
	<a href="main.member">임시회원</a>
</c:if>
</div>	














