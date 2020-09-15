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
				<a class="btn btn-default pull-right" href="Q_update.board?num=${Quest.num }">수정하기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="btn btn-default pull-right" href="javascript:deleq('${Quest.num }')">삭제하기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		<!-- 관리자 -->
		<c:if test="${mbId == 'admin'}">
				<a class="btn btn-default pull-right" href="Q_write.board?num=${Quest.num}&re_group=${Quest.re_group}&re_step=${Quest.re_step}&re_level=${Quest.re_level}">
				답변하기
				</a>
		</c:if>
				<a class="btn btn-default pull-right" href="Q_list.board">목록가기</a>
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp" %>











