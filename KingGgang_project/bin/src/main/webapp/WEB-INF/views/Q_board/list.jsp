<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div align="center">
	<table width="800">
		<tr align="left">
			<th>문의게시판</th>
		</tr>
	</table>
	<table width="800" border="1">
		<tr bgcolor="green">
			<th width="10%"></th>
			<th width="60%">제목</th>
			<th width="10%">작성일</th>
			<th width="10%">조회</th>
			<th width="10%">IP</th>
		</tr> 
	<c:if test="${empty listBoard}">		
		<tr>
			<td colspan="5">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${listBoard}">		
		<tr>
			<td>
				<c:out value="${startNum}"/>
			</td>
			<c:set var="startNum" value="${startNum-1}" />
			<td>
		<c:if test="${dto.re_level > 0}">
			<img src="resources/img/level.gif" width="${dto.re_level*10}">
			<img src="resources/img/re.gif">
		</c:if>	
				<a href="Q_content.board?num=${dto.num}">
					${dto.subject}
				</a>
		<c:if test="${dto.readcount>10}">
				<img src="resources/img/hot.gif">
		</c:if>		
			</td>
			<td>${dto.reg_date} </td>
			<td>${dto.readcount}</td>
			<td>${dto.ip}</td>
		</tr>		
	</c:forEach>	
	</table>
		<c:if test="${count>0}">
			<c:if test="${startPage > pageBlock}">
				[<a href="Q_list.board?pageNum=${startPage-1}">이전</a>]		
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="Q_list.board?pageNum=${i}">${i}</a>]
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				[<a href="Q_list.board?pageNum=${endPage+1}">다음</a>]
			</c:if>
		</c:if>
	<table width="800">
		<tr align="center">
			<td align="right">
				<button onclick="location='Q_write.board'">문의하기</button>
			</td>
		</tr>
	</table>
	
</div>	
