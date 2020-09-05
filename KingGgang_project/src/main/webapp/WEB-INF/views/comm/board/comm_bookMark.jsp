<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<section id="four" class="wrapper style1 special fade-up">
	<div class="container">
		<header class="major">
			<h2>BookMark</h2>
		</header>
	<div class="box alt">
		<div class="row gtr-uniform">
			<c:if test="${empty boardList}">
				<h2>등록된 페이지가 없습니다.</h2>
			</c:if>
			<c:forEach var="dto" items="${boardList}">		
				<section class="col-4 col-6-medium col-12-xsmall">
					<img src="http://localhost:8080/img/${dto.file_name}" width="50" height="50">
				</section>
			</c:forEach>
		</div>
	</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/bottom.jsp"%>