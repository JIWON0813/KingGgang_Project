<%@ include file="../top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<script>
 	function delen(no){
		var dele = confirm("글을 삭제하시겠습니까?")	
		if(dele){
			window.location.href="delete.notice?no="+no;
		}else{
			window.location.href="list.notice";
		}
	}
	
 </script>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<table class="table table-bordered">
		<tr height="30">
			<th width="20%" bgcolor="#ff880e">제목</th>
			<td colspan="3" align="left" width="80%">${notice.subject}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="#ff880e">작성자</th>
			<td colspan="3" align="left" width="80%">${notice.name}</td>
		</tr>
		<tr height="30">
			<th bgcolor="#ff880e">작성일</th>
			<td width="50%" align="center">${notice.regdate }</td>
			<th bgcolor="#ff880e">조회수</th>
			<td>${notice.readcount }</td>
		</tr>
		<tr height="350">
			<th width="20%" bgcolor="#ff880e">내용</th>
			<td colspan="3" align="left" width="80%">${notice.content}</td>
		</tr>
		</table> 
			<c:if test="${mbId=='admin'}">
				<a class="btn btn-default pull-right" href="update.notice?no=${notice.no }">수정하기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="btn btn-default pull-right" href="javascript:delen('${notice.no }')">삭제하기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
				<a class="btn btn-default pull-right" href="list.notice">목록보기</a>
</div>
<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp"%>
