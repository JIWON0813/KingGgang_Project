<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : warnList.jsp
	개  발   자 : 최 인 아
	설	   명 : 경고목록페이지
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">신고목록</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding">
<div align="center">
<form name="f" onsubmit="return check()">
	<table width="800">
		<tr bgcolor="orange" align="center">
			<th><font color=brown>번호</font></th>
			<th><font color=brown>게시물번호</font></th>
			<th><font color=brown>신고자</font></th>
			<th><font color=brown>삭제</font></th>
		</tr> 
	<c:if test="${empty warnList}">		
		<tr>
			<td colspan="6">
				! 등록된 신고 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${warnList}">		
		<tr align="center">
		
		
			<td><c:out value="${dto.warnNum}"/></td>
			<td>
				<a href="comm_otherContent.do?boardNum=${dto.boardNum}">${dto.boardNum}</a>
			</td>
		
			<td>${dto.wname}</td>
			<td><input type="button" value="삭제" onclick="window.location='warn_deletePro.do?warnNum=${dto.warnNum}&boardNum=${dto.boardNum}'"></td>
		</tr>		
	</c:forEach>	
	</table>
	</form>
	<br><br> <a href="main.admin">관리자 목록으로 가기</a>
</div>	
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
