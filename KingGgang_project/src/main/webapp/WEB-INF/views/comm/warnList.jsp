<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div align="center">
	<b>신 고 목 록</b>
	<table width="800">
		<tr bgcolor="pink">
			<td align="right"><a href="commadmin.comm">뒤로가기</a></td>
		</tr>
	</table>
	<table width="800">
		<tr bgcolor="skyblue">
			<th>번호</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>게시글삭제</th>
		</tr> 
	<c:if test="${empty togetherList}">		
		<tr>
			<td colspan="6">
				등록된 신고 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${togetherList}">		
		<tr>
			<td><c:out value="${dto.togetherNum}"/></td>
			<td>
				<a href="comm_tcontent.do?togetherNum=${dto.togetherNum}">
					${dto.ttitle}
				</a>
			</td>
			<td>${dto.tname}</td>
			<td>${dto.temail}</td>
			<td>${dto.tregdate}</td>
		</tr>		
	</c:forEach>	
	</table>
</div>	