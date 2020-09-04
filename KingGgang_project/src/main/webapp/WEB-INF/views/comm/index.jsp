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
									
								</ul>
							</li>
							<li>
							<c:if test="${comm_login == null }">
								<a href="comm_login.do?memberNum=${memberNum }">로그인</a>
								<a href="comm_checkMember.do?memberNum=${memberNum }">가입하기</a>
								 
							</c:if>
							
							<c:if test="${comm_login != null }">
								<%-- <a href="comm_member_delete.do?comm_memberNum=${dto.comm_memberNum }">삭제</a> --%>
								<a href="comm_member_delete.do?comm_memberNum=${comm_memberNum }">회원탈퇴</a>
								<a href="comm_member_edit.do?comm_memberNum=${comm_memberNum }">수정</a>
								<a href="comm_memberList.do">목록</a>
								<li><a href="comm_friendAll.do?comm_memberNum=${comm_memberNum }">Friends 목록</a></li>
								
							</c:if>
							</li>
							<li><a href="commadmin.comm">관리자모드</a></li>
							
						</ul>
					</nav>
				</header>
				</div>
				</body>

