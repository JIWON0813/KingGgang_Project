<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : comm_content.jsp
	개  발   자 : 최 인 아
	설	   명 : content
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="section layout_padding">
<div align="center">
	<table width="400">
	<tr>
		<td align="right" colspan="4">
		<p onclick="confirm('신고하시겠습니까? 버튼을 눌러주세요')">신고
			<a href="comm_warnPro.do?boardNum=${getBoard.boardNum}&comm_memberNum=${comm_memberNum}"><img src="${pageContext.request.contextPath}/resources/img/warn.png" width="21" height="21"></a></p>
		</td>
	</tr>
	<tr>
		<td align="left" colspan="4">
		 	<a href="comm_myPage.do"><img src="http://localhost:8080/img/${comm_profilename}" width="50" height="50"></a>&nbsp;&nbsp;<a href="comm_myPage.do">[   ${comm_nickname}   ]</a>
		</td>
	</tr>
	<br>
	<br>
	<br>
	<c:if test="${getBoard.file_size != 0}">
		<tr align="center">
			 <td align="center" colspan="4">
			 	<img src="http://localhost:8080/img/${getBoard.file_name}" width="400" height="400">
			 </td>
		</tr>
	</c:if>
	
		<tr height="80">
			<td colspan="4">${getBoard.content}</td>
		</tr>
	
		<tr height="30">
			<th align="center">태그</th>
			<td width="30%">${getBoard.tag}</td>
			<th align="right" width="10">
					<img src="${pageContext.request.contextPath}/resources/img/heart.PNG" width="30" height="30">
			</th>
			<td width="10">
				<a href="comm_bookMarkPro.do?boardNum=${getBoard.boardNum}&comm_memberNum=${comm_memberNum}">
					<img src="${pageContext.request.contextPath}/resources/img/bookmark.png" width="30" height="30">
				</a>
			</td>
		</tr>

		<tr>
			<td align="center" colspan="4">
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
<hr color="pink">
<div align="center">
<form name="replyForm" action="comm_writeReplyPro.do" method="post">
  <input type="hidden" id="boardNum" name="boardNum" value="${param.boardNum}">
  <table width="400">
    <tr>
    	<th>댓글 작성자</th>
    	<td><input type="text" id="rwriter" name="rwriter"></td>
    </tr>
    
    <tr>
   		 <th>댓글 내용</th>
   		 <td><input type="text" id="rcontent" name="rcontent"></td>
   		 <td><input type="submit" value="작성"></td>
    </tr>
  </table>
</form>
</div>
<hr color="pink">
<br>

<!-- 댓글 -->
<div align="center">
<form name="f" action="reply_updatePro.do" method="post" onsubmit="return check()">
 <input type="hidden" id="replyNum" name="replyNum" value="${param.replyNum}"/>
  <ol>
   <c:if test="${empty replyList}">
	      <p>등록된 댓글이 없습니다.</p>
	</c:if>   
    <c:forEach items="${replyList}" var="replyList">
      <li>
        <p> 작성자 : ${replyList.rwriter}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${replyList.rregdate}</p>
        <p> : ${replyList.rcontent}</p>
        <input type="submit" value="댓수정">
      	<input type="button" value="댓삭제" onclick="window.location='reply_deletePro.do?replyNum=${replyList.replyNum}&boardNum=${getBoard.boardNum}'">
      </li>
    </c:forEach>   
  </ol>
 </form>		
</div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
