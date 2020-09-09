<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="section layout_padding">
<div align="center">
	<b><font size=7>낑</font><font size=3>깡</font><font size=7>같</font><font size=3>이</font><font size=7>따</font><font size=3>러갈래?</font></b>
	<table width="800">
		<tr>
			<td align="right"><a href="commhome.comm">뒤로가기</a>|<a href="comm_togetherWF.do">글쓰기</a></td>
		</tr>
	</table>
	<table width="800" id="eventTable">
		<tr bgcolor="orange" align="center">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>이메일</th>
			<th>작성일</th>
			<th>조회</th>
		</tr> 
	<c:if test="${empty togetherList}">		
		<tr>
			<td colspan="6">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${togetherList}">		
		<tr>
			<td><c:out value="${dto.togetherNum}"/></td>
			<td>
			<c:if test="${dto.treadcount>10}">
				<img src="${pageContext.request.contextPath}/resources/img/crown.PNG" width="30" height="30">
			</c:if>	
				<a href="comm_tcontent.do?togetherNum=${dto.togetherNum}">
					${dto.ttitle}
				</a>
			</td>
			<td>${dto.tname}</td>
			<td>${dto.temail}</td>
			<td>${dto.tregdate}</td>
			<td>${dto.treadcount}</td>
		</tr>		
	</c:forEach>	
	</table>
</div>	
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>