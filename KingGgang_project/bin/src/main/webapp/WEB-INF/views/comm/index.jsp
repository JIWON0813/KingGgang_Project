<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="index_top.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
	
<!DOCTYPE HTML>
			<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h2>BigBabyBook에 오신걸 환영합니다.</h2>
							<p>
							<c:if test="${isLogin }">
							<a href="logout.do" class="button primary">로그아웃</a>
							</c:if>
							<c:if test="${!isLogin }">
							<a href="login.do" class="button primary">로그인 하기</a>
							</c:if>				 	
							</p>
						</header>
						<span class="image"><img src="${pageContext.request.contextPath}/resources/images/bg2.gif" alt="" /></span>
					</div>
					<a href="newsfeed.do" id="one" class="goto-next scrolly"></a>
				</section>

<%@ include file="index_bottom.jsp"%>
		