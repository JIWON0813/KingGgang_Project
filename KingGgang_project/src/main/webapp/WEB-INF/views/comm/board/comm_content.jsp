<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : B4_content.jsp
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../index_top.jsp" %>
<section id="four" class="wrapper style1 special fade-up">
<div class="container">
	<table width="300" class="wrapper style1 special fade-up">
	<!-- <tr align="right">
		<th><img src="warn.png"></th>
	</tr> -->
	<c:if test="${getBoard.file_size != 0}">
		<tr align="center">
			 <td align="center" colspan="3">
			 	<img src="http://localhost:8080/img/${getBoard.file_name}" width="400" height="400">
			 </td>
		</tr>
	</c:if>
	
		<tr height="80">
			<td>${getBoard.content}</td>
		</tr>
	
		<tr height="30">
			<th>태그</th>
			<td align="center" width="30%">${getBoard.tag}</td>
			<th align="right" width="10"><img src="${pageContext.request.contextPath}/resources/img/heart.png" width="50" height="50"></th>
		</tr>
		<tr height="30">
			<th>장소</th>
			<td align="center" width="30%">${getBoard.loc}</td>
			<th align="right" width="10"><img src="${pageContext.request.contextPath}/resources/img/bookmark.png" width="30" height="30"></th>
		</tr>

		<tr>
			<td align="center" colspan="3">
				<input type="button" value="글수정"
				onclick="window.location='comm_updateForm.do?boardNum=${getBoard.boardNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='comm_deletePro.do?boardNum=${getBoard.boardNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='comm_myPage.do'">
			</td>
		</tr>
	</table>
</div>
<br>
<br>
<form name="replyForm" action="comm_writeReply.do" method="post">
  <input type="hidden" id="boardNum" name="boardNum" value="${read.boardNum}" />
 <%--  <input type="hidden" id="page" name="page" value="${scri.page}"> 
  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">  --%>

  <div>
    <label for="rwriter">댓글 작성자</label><input type="text" id="rwriter" name="rwriter" />
    <br/>
    <label for="rcontent">댓글 내용</label><input type="text" id="rcontent" name="rcontent" />
  </div>
  <div>
 	<input type="submit" value="작성">
  </div>
</form>

<!-- 댓글 -->
<div id="reply">
  <ol class="replyList">
    <c:forEach items="${replyList}" var="replyList">
      <li>
        <p>
		        작성자 : ${replyList.rwriter}<br/>
		        작성 날짜 : ${replyList.rregdate}
        </p>
        <p>${replyList.rcontent}</p>
      </li>
    </c:forEach>   
  </ol>
</div>


</section>
<%@ include file="../index_bottom.jsp"%>