<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="section layout_padding" align="center">
		<header>
			<h2><img src="${pageContext.request.contextPath}/resources/img/bookmark.png" width="23" height="23">&nbsp;&nbsp;BookMark</h2>
		</header>
		<br/>
		<br/>
		<br/>
		<div class="row">
			<c:if test="${empty bookmarkList}">
				<h2>등록된 페이지가 없습니다.</h2>
			</c:if>
			<c:forEach var="dto" items="${bookmarkList}">
			<div class="col-md-3 col-sm-6 col-xs-12">
					<a href="comm_otherContent.do?boardNum=${dto.boardNum}">		
						<img src="http://localhost:8080/img/${file_name}" width="180" height="180">
					</a>
					<h4>삭제</h4>
			</div>
			</c:forEach>
		</div>
</div>

<%@ include file="/WEB-INF/views/bottom.jsp"%>


