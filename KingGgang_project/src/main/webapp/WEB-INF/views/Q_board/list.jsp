<%@ include file="../top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<div class="section layout_padding"></div>
<div class="container" align="center">
	<h3 align="center">문의하기</h3>
	<br>
	<table class="table table-hover table-sm">
	<thead>
		<tr bgcolor="#ff880e">
			<th width="10%">no</th>
			<th width="60%">제목</th>
			<th width="10%">ID</th>
			<th width="10%">작성일</th>
			<th width="10%">조회</th>
		</tr> 
	</thead>
	<tbody>	 
	<c:if test="${empty listBoard}">		
		<tr>
			<td colspan="5">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${listBoard}">		
		<tr>
			<td>
				<c:out value="${startNum}"/>
			</td>
			<c:set var="startNum" value="${startNum-1}" />
			<td>
		<c:if test="${dto.re_level > 0}">
			<img src="resources/img/level.gif" width="${dto.re_level*10}">
			<b>RE:</b>
			<!-- <img src="resources/img/re.gif"> -->
		</c:if>	
		<c:if test="${dto.closed==2 }">
			<c:if test="${mbId == 'admin' }">
				<a href="Q_content.board?num=${dto.num }">
			</c:if>
			<c:if test="${mbId != 'admin' }">
				<a href="Q_passck.board?num=${dto.num }&type=1">
			</c:if>
					비밀글 입니다.
				</a>
		</c:if>
		<c:if test="${dto.closed==1 }">
				<a href="Q_content.board?num=${dto.num}">
					${dto.subject}
				</a>
		</c:if>
			</td>
			<td>${dto.name}</td>
			<td>${dto.regdate}</td>
			<td>${dto.readcount }</td>		
		</tr>		
	</c:forEach>	
	</tbody>
	</table>
	<a class="btn btn-default pull-right" href="Q_write.board">문의하기</a>
		<c:if test="${count>0}">
			<c:if test="${startPage > pageBlock}">
				[<a href="Q_list.board?pageNum=${startPage-1}">이전</a>]		
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="Q_list.board?pageNum=${i}">${i}</a>]
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				[<a href="Q_list.board?pageNum=${endPage+1}">다음</a>]
			</c:if>
		</c:if>
</div>	
<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp" %>