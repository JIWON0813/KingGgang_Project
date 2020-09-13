<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div align="center">
		<table>
		<tr>
			<th>타입</th>
			<th>상품</th>
			
		</tr>
		<c:if test="${empty wlist}">
			<tr>
					<td colspan="2">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${wlist}">
			<tr>
				<td>${dto.type}</td>
				<td>${dto.f_no}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<div align="center">
		<table>
		<tr>
			<th>타입</th>
			<th>상품</th>
			
		</tr>
		<c:if test="${empty hlist}">
			<tr>
					<td colspan="2">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${hlist}">
			<tr>
				<td>${dto.name}</td>
				<td>${dto.category}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>