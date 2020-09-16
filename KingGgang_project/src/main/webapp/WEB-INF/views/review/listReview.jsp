<%@ include file="../top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<script>
 function cont(num){
	 var con = document.getElementById("content"+num);
	 if(con.style.display == 'none'){
		 con.style.display = '';
	 }else{
		 con.style.display = 'none';
	 }
 } 
 function deleRe(num){
		var dele = confirm("리뷰를 삭제하시겠습니까?")	
		if(dele){
			window.location.href="deleteReview.re?num="+num
		}else{
			window.location.href="memberList.mem"
		}
}
</script>
<div class="section layout_padding"></div>
<div class="container" align="center">
	<h3 align="center">후기게시판</h3>
	<br>
	<table class="table table-striped">
		<thead>
		<tr>
			<th width="3%">no</th>
			<th>이미지</th>
			<th width="50%">제목</th>
			<th width="20%">작성일</th>
			<th width="10%">ID</th>
		</tr> 
		</thead>
		<tbody>
		<tr>
		</tr>
	<c:if test="${empty listReview}">		
		<tr>
			<td colspan="5">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${listReview}">		
		<tr>
			<td>
				<c:out value="${startNum}"/>
			</td>
			<c:set var="startNum" value="${startNum-1}" />
			<td>
				<img src="http://localhost:8080/img/${dto.filename}" width="150" height="150">
			</td>
			<td>	
				<b>${dto.subject }</b><br>
				<c:if test="${dto.type==1 }">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>▶호텔◀</b><br>
				</c:if>
				<c:if test="${dto.type==2 }">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>▶렌트카◀</b><br>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.name }</b><br>				
				<br>
				<a href="javascript:cont('${dto.num }')">리뷰 보기 </a>		
			</td>
			<td>${dto.regdate }</td>
			<td>
			${dto.m_id}
			<br>
			<c:if test="${mbId == dto.m_id || mbId == 'admin'}">
			<a href="javascript:deleRe('${dto.num }')">삭제</a>/
			<a href="updateReview.re?num=${dto.num }">수정</a>
			</c:if>
			</td>
		</tr>		
		<tr id="content${dto.num}" style="display:none;" align="center" height="150">
			<td colspan="2" bgcolor="white"></td>
			<td align="left">${dto.content }</td>
			<td></td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	<hr>
	<c:if test="${mbId=='admin'}">
				<!-- <a class="btn btn-default pull-right" href="insertReview.re">글쓰기</a> -->
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













