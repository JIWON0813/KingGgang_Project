<%@ include file="../boardtop.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function search(){
		if(f.searchString.value==""){
			alert("검색어를 입력하세요")
			f.searchString.focus();
			return;
		}
		var blank = /^\s+|\s+$/g;
		if(f.searchString.value.replace( blank, '' ) == "" ){
		    alert("검색어를 입력하세요");
		    return;
		}
		document.f.submit();
	}
	
</script>
<div class="container" align="center">
	<h3 align="center">Q&A</h3>
	<br>
	<table class="table table-hover table-sm">
	<thead>
		<tr bgcolor="#ff880e">
			<th width="10%">no</th>
			<th width="60%">제목</th>
			<th width="10%">작성자</th>
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
			<img src="http://localhost:8080/img/level.gif" width="${dto.re_level*10}">
			<b>RE:</b>
		</c:if>	
		<c:if test="${dto.closed==2 }">
			<c:if test="${mbId == 'admin' }">
				<a href="Q_content.board?num=${dto.num }">
			</c:if>
			<c:if test="${mbId != 'admin' }">
				<a href="Q_passck.board?num=${dto.num }&type=1">
			</c:if>
					비밀글 입니다<img src="http://localhost:8080/img/lock.png" width="10" height="10">
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
	<hr>
		<form name="f" action="searchQ.board" method="post">
		<input type="hidden" name="mode" value="find"/>
		<select name="search">
			<option value="subject">제목</option>
			<option value="name">작성자</option>
		</select>
		<input type="text" name="searchString">
		<a href="javascript:search()">
		<input type="button" value="찾기" class="btn btn-outline-primary btn-sm">
		</a>
		<input type="hidden" value="${startNum }" name="startNum">
		</form>
		<div align="center">
		<c:if test="${count>0}">
			<c:if test="${startPage > pageBlock}">
				<a href="Q_list.board?pageNum=${startPage-1}">&nbsp;이전&nbsp;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="Q_list.board?pageNum=${i}">&nbsp;${i}&nbsp;</a>
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				<a href="Q_list.board?pageNum=${endPage+1}">&nbsp;다음&nbsp;</a>
			</c:if>
		</c:if>
		</div>
	<a class="btn btn-default pull-right" href="Q_list.board">전체목록</a>
	<a class="btn btn-default pull-right" href="Q_write.board">문의하기</a>
</div>	
<div class="section layout_padding"></div>
<%@ include file="../boardbottom.jsp" %>