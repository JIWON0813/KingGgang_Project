<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

	<table width="100%">
		<tr bgcolor="orange">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>이메일</th>
			<th>작성일</th>
			<th>조회</th>
		</tr> 
	<c:if test="${empty togetherList}">		
		<tr>
			<td colspan="6" style="color: #FFFFFF;">
				글 목록이 없거나, 로그인 후 이용 가능합니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${togetherList}" begin="0" end="4">		
		<tr align="center">
			<td><c:out value="${dto.togetherNum}"/></td>
			<td>
				<c:if test="${dto.treadcount>10}">
					<img src="${pageContext.request.contextPath}/resources/img/crown.PNG" width="30" height="30">
				</c:if>	
					<a href="comm_tcontent.do?togetherNum=${dto.togetherNum}">
						${dto.ttitle}
					</a>
			</td>
			<td>${comm_nickname}</td>
			<td>${dto.temail}</td>
			<td><fmt:formatDate value="${dto.tregdate}" pattern="yyyy-MM-dd"/></td>
			<td>${dto.treadcount}</td>
		</tr>		
	</c:forEach>	
	</table>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

	<table width="100%">
		<tr bgcolor="orange">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>이메일</th>
			<th>작성일</th>
			<th>조회</th>
		</tr> 
	<c:if test="${empty togetherList}">		
		<tr>
			<td colspan="6" style="color: #FFFFFF;">
				글 목록이 없거나, 로그인 후 이용 가능합니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${togetherList}" begin="0" end="4">		
		<tr align="center">
			<td><font color="white"><c:out value="${dto.togetherNum}" /></font></td>
			<td>
				<c:if test="${dto.treadcount>10}">
					<img src="${pageContext.request.contextPath}/resources/img/crown.PNG" width="30" height="30">
				</c:if>	
				<font color="white">${dto.ttitle}</font>
			</td>
			<td><font color="white">${dto.tname}</font></td>
			<td><font color="white">${dto.temail}</font></td>
			<td><font color="white"><fmt:formatDate value="${dto.tregdate}" pattern="yyyy-MM-dd"/></font></td>
			<td><font color="white">${dto.treadcount}</font></td>
		</tr>		
	</c:forEach>	
	</table>
>>>>>>> branch 'ina2' of https://github.com/JIWON0813/KingGgang_Project.git
