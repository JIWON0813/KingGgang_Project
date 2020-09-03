<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div align="center">
	<b>목 록</b>
	<table border="0" width="800">
		<tr bgcolor="pink">
			<td align="right"><a href="comm_newsfeed.do">뒤로가기</a>|<a href="comm_togetherWF.do">글쓰기</a></td>
		</tr>
	</table>
	<table width="800">
		<tr bgcolor="skyblue">
			<th>번호</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
		</tr> 
	<c:if test="${empty boardList}">		
		<tr>
			<td colspan="6">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${boardList}">		
		<tr>
			<td><c:out value="${dto.num}"/></td>
			<td>
				<a href="board_content.do?num=${dto.num}">
					${dto.subject}
				</a>
		<c:if test="${dto.readcount>10}">
				<img src="img/hot.gif">
		</c:if>		
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.readcount}</td>
		</tr>		
	</c:forEach>	
	</table>
</div>	