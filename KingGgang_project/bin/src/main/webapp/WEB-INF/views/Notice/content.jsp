<%@ include file="../top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<table class="table table-bordered">
		<tr height="30">
			<th width="20%">No</th>
			<td align="center" width="30%">${notice.no}</td>
			<th width="20%">조회수</th>
			<td align="center" width="30%">${notice.readcount}</td>
		</tr>
		<tr height="30">
			<th width="20%">작성일</th>
			<td colspan="3" align="center" width="30%">${notice.regdate}</td>
		</tr>
		<tr height="30">
			<th width="20%">글제목</th>
			<td align="center" colspan="3">
				${notice.subject}
			</td>
		</tr>
		<tr height="80">
			<th width="20%">글내용</th>
			<td colspan="3" >
				${notice.content}
			</td>
		</tr> 
		<tr>
			<td colspan="4" align="right">
			<c:if test="${mbId=='admin'}">
				<input type="button" value="글수정"
				onclick="window.location='update.notice?no=${notice.no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='delete.notice?no=${notice.no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
				<input type="button" value="글목록" onclick="window.location='list.notice'">
			</td>
		</tr>
	</table>
</div>
<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp"%>














