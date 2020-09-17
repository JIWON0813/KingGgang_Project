<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3>회원목록</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding">
<div align="center">
	<table border="1" width="800">
		<tr bgcolor="orange" align="center">
			<th>회원번호</th>
			<th>프로필사진</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>생년월일</th>
			<th>자기소개</th>
			<th>삭제</th>
		</tr> 
	<c:if test="${empty comm_memberList}">	
		<tr align="center">
			<td colspan="6">
				가입된 회원이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${comm_memberList }">
		<tr align="center">
			<td><c:out value="${dto.comm_memberNum}"/></td>
			<td><c:if test="${dto.comm_profilename  == null}">
					<img src="${pageContext.request.contextPath}/resources/img/basic.jpg" width="50" height="50">
				</c:if>
				<c:if test="${dto.comm_profilename  != null}">
			 		<img src="http://localhost:8080/img/${dto.comm_profilename}" width="50" height="50">
				</c:if>
			</td>
			<td>${dto.comm_name}</td>
			<td>${dto.comm_nickname}</td>
			<td>${dto.comm_birth }</td>
			<td>${dto.comm_intro }</td>
			<td><a href="comm_member_delete.do?comm_memberNum=${dto.comm_memberNum }">삭제</a></td>
		</tr>		
	</c:forEach>
	</table>
</div>	
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>