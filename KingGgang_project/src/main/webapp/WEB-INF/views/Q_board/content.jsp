<%@ include file="../top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
 <script>
 	function deleq(num){
		var dele = confirm("글을 삭제하시겠습니까?")	
		if(dele){
			window.location.href="Q_delete.board?num="+num;
		}else{
			window.location.href="Q_list.board";
		}
	}
	
 </script>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<table class="table table-bordered">
		<tr height="30">
			<th width="20%">글번호</th>
			<td align="center" width="30%">${Quest.num}</td>
			<th width="20%">조회수</th>
			<td align="center" width="30%">${Quest.readcount}</td>
		</tr>
		<tr height="30">
			<th width="20%">작성자</th>
			<td align="center" width="30%">${Quest.m_id}</td>
			<th width="20%">작성일</th>
			<td align="center" width="30%">${Quest.regdate}</td>
		</tr>
		<tr height="30">
			<th width="20%">글제목</th>
			<td align="center" colspan="3">
				${Quest.subject}
			</td>
		</tr>
		<tr height="80">
			<th width="20%">글내용</th>
			<td colspan="3" >
				${Quest.content}
			</td>
		</tr>
		<tr>
			<td align="right" colspan="4" align="right">
		<!-- 사용자 -->
		<c:if test="${Quest.m_id==mbId}">
				<input type="button" value="글수정"
				onclick="window.location='Q_update.board?num=${Quest.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="javascript:deleq('${Quest.num}')">
				&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		<!-- 관리자 -->
		<c:if test="${mbId == 'admin'}">
				<input type="button" value="답글쓰기"
				onclick="window.location='Q_write.board?num=${Quest.num}&re_group=${Quest.re_group}&re_step=${Quest.re_step}&re_level=${Quest.re_level}'">
		</c:if>
				<input type="button" value="글목록" onclick="window.location='Q_list.board'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp" %>











