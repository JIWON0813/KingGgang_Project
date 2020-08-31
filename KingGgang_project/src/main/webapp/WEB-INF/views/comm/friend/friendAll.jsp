<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="wrap wd668" align="center">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">친구목록</h2>
		<table border="1" width="800">
		<tr bgcolor="skyblue">
			<th>이름</th>
			<th>이메일</th>
			<th>memberNum</th>
			<th>friendNum</th>		
		</tr>
		<c:if test="${empty friendList}">
			<tr>
					<td colspan="5">등록된 친구가 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${friendList }">
			<tr>
				<%-- <img src="http://localhost:8080/img/${profile_name}" width="50" height="50"> --%>
				<td>${name}</td>
				<td>${email }</td>
				<td>${dto.memberNum }</td>
				<td>${dto.friendNum }</td>
				<td><a href="comm_friendContent.do?friendNum=${dto.friendNum}">상세보기</a></td> 
				<td><a href="comm_deleteFriend.do?friendNum=${dto.friendNum}">친구삭제</a></td> 
			</tr>
		</c:forEach>	
		</table>
	</div>
	</div>
	</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="four" class="wrapper style1 special fade-up">
					<div class="container">
						<header class="major">
							<h2>친구목록</h2>
						</header>
						<div class="box alt">
							<div class="row gtr-uniform">
							<c:if test="${empty friendList}">
							<h2>등록된 친구가 없습니다.</h2>>
							</c:if>
							<c:forEach var="dto" items="${friendList}">		
								<section class="col-4 col-6-medium col-12-xsmall">
									<img src="http://localhost:8080/img/${dto.profile_name}" width="50" height="50">
									<h3>${dto.name}</h3>
									<p>${dto.allHp}</p>
									<p><a href="member_delete.do?memberNum=${memberNum }" >삭제</a></p>
									<p>${dto.allBirth}</p>
									<p>${dto.id}</p>
									<p>${dto.passwd}</p>
									<p>${dto.email}</p>	
								</section>
								</c:forEach>
							</div>
						</div>
 --%>













