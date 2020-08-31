<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JEJU TOP</title>
</head>
<body>
	<div align="center">
		<table width="100%" height="800" border="1">
			<tr height="10%">
				<td align="center">
				<a href="home.home">메인페이지</a>|
				<a href="main.hotel">호텔관리자모드로 가기</a>|
				<a href="main.admin">관리자모드로 가기</a>|
				<a href="commhome.comm">커뮤니티 가기</a>|
				<a href="insertMember.mem">회원가입</a>|
				<c:if test="${isLogin == null }">
				<a href="login.log">로그인</a>
				</c:if>
				<c:if test="${isLogin != null }"> 
				${login.name }님<a href="logout.log">로그아웃</a>
				</c:if>
				</td>
			</tr>
			<tr height="80%">
			<td>