<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ include file="/WEB-INF/views/top.jsp"%>
	<%-- <%@ include file="index_top.jsp" %>  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<html>
	<head>
		<title>낑깡</title>
		<meta charset="utf-8" />
	</head>

	<body>
		<div>
			<!-- Header -->
				<header id="header">
					<h1 id="logo"><a href="home.do">낑깡</a></h1>
					<nav id="nav">
						<ul>
							<li><a href="comm_newsfeed.do">News Feed</a></li>
							<li><a href="comm_writeForm.do">Write</a></li>
							<li>
								<a href="#">Mypage</a>
								<ul>
									<li><a href="comm_myPage.do">Mypage</a></li>
									<li><a href="comm_bookMark.do">BookMark</a></li>
									<li>
									<a href="comm_member_edit.do?memberNum=${memberNum}">Settings</a>
									</li>
									
								</ul>
							</li>
							<li><a href="comm_friendAll.do">Friends 목록</a></li>
							<li><a href="comm_insertFriend.do?memberNum=${memberNum }">Friends 추가</a></li>
							<li>
							<!--  -->
								<c:if test="${isLoginComm}">
							<li><a href="#">회원입니다(회원탈퇴)</a></li>
							</c:if>
							<c:if test="${!isLoginComm}">
							<li><a href="comm_member_input.do?memberNum=${memberNum }">가입하기</a></li>
							</c:if>
							<!--  -->
							
							<c:if test="${isLogin == null }">
								<%-- <a href="comm_member_input.do?memberNum=${memberNum }">가입하기</a> --%>
								<a href="comm_member_input.do?memberNum=${memberNum }">가입하기</a>
								<a href="comm_memberList.do">목록</a>
								<a href="comm_member_edit.do?comm_memberNum=${comm_memberNum }">수정</a></td> 
							</c:if>
							<c:if test="${isLogin != null }">
								<a>가입한 상태</a>
							</c:if>
							</li>
						
						
						</ul>
					</nav>
				</header>

