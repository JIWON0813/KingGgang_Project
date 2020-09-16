<%@ include file="../top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<div class="section layout_padding"></div>
<div class="container" align="center">
	<h3 align="center">공지사항</h3>
	<br>
	<table class="table table-hover table-sm">
		<thead>
		<tr>
			<th width="10%">글번호</th>
			<th width="50%">제목</th>
			<th width="20%">작성일</th>
			<th width="10%">조회수</th>
		</tr> 
		</thead>
		<tbody>
	<c:if test="${empty listNotice}">		
		<tr>
			<td colspan="5">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${listNotice}">		
		<tr>
			<td>
				<c:out value="${startNum}"/>
			</td>
			<c:set var="startNum" value="${startNum-1}" />
			<td>
				<a href="content.notice?no=${dto.no}">
					${dto.subject}
				</a>
			</td>
			<td>${dto.regdate}</td>
			<td>${dto.readcount}</td>
		</tr>		
	</c:forEach>	
	</tbody>
	</table>
	<hr>
	<c:if test="${mbId=='admin'}">
				<a class="btn btn-default pull-right" href="write.notice">글쓰기</a>
	</c:if>
		<c:if test="${count>0}">
		<ul>
			<c:if test="${startPage > pageBlock}">
				<li><a href="list.notice?pageNum=${startPage-1}">이전</a></li>	
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="list.notice?pageNum=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				<li><a href="list.notice?pageNum=${endPage+1}">다음</a></li>
			</c:if>
		</ul>
		</c:if>
	</div>
	<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp" %>













