<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<html>
	<head>
		<title>BigBabyBook</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
	</head>
	
	

	<body class="is-preload landing">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1 id="logo"><a href="index.do">BigBabyBook</a></h1>
					<nav id="nav">
						<ul>
							<li><a href="newsfeed.do">News Feed</a></li>
							<li><a href="B4_writeForm.do">Write</a></li>
							<li>
								<a href="#">Mypage</a>
								<ul>
									<li><a href="B4_myPage.do">Mypage</a></li>
									<li><a href="B4_bookMark.do">BookMark</a></li>
									<li>
									<a href="member_edit.do?memberNum=${memberNum}">Settings</a>
									</li>
									
								</ul>
							</li>
							<li><a href="memberAll.do">Friends</a></li>
							<c:if test="${isLogin}">
							<li><a href="logout.do" class="button primary">로그아웃</a></li>
							</c:if>
							<c:if test="${!isLogin}">
							<li><a href="login.do" class="button primary">로그인 하기</a></li>
							</c:if>				 
						</ul>
					</nav>
				</header>
	<br><br><br>
