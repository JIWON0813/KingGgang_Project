<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>관리자</title>
</head>
<body>
<div align="center">
		<table width="800" height="700">
			<tr  width="20%" height="35" bgcolor="black">
		 		<td colspan="7"> 
			</tr>
			<tr>
			</tr>
			<tr>
			</tr>
			<tr bgcolor=#E7E5E5>
				<th align="center" width="10%" height="10%">번호</th>
				<th align="center" width="10%" height="10%">이름</th>
				<th align="center" width="10%" height="10%">성별</th>
				<th align="center" width="10%" height="10%">아이디</th>
				<th align="center" width="20%" height="10%">이메일</th>
				<th align="center" width="10%" height="10%">생일</th>
				<th align="center" width="20%" height="10%">전화번호</th>
			</tr>
		<c:if test="${empty memberList}">
			<tr>
				<td colspan="7">등록된 회원이 없습니다.</td>
			</tr>	
		</c:if>
		<c:forEach var="dto" items="${memberList}">			
			<tr>
				<td>${dto.memberNum}</td>
				<td>${dto.name}</td>
				<td>${dto.gender}</td>
				<td>${dto.id}</td>
				<td>${dto.email}</td>
				<td>${dto.AllBirth_}</td>
				<td>${dto.AllHp}</td>
			</tr>	
		</c:forEach>	
			<tr width="20%" height="35" bgcolor=#E7E5E5>
		 		<td colspan="7"> 
			</tr>
			<tr>
				<a href="B4_boardAdmin.do"><img src="${pageContext.request.contextPath}/resources/img/lefts.PNG" width=40 height=40></a>
			</tr>
			<tr width="20%" height="35" bgcolor="black">
		 		<td colspan="7"> 
			</tr>
		</table>
</div>
</body>
</html>