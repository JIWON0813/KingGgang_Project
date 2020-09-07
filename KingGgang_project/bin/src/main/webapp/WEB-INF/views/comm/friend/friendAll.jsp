<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="wrap wd668" align="center">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">친구목록</h2>
		<table border="1" width="800">
		<tr bgcolor="skyblue">
			<th>이름</th>
			<th>comm_memberNum</th>
			<th>friendNum</th>		
		</tr>
		<c:if test="${empty friendList}">
			<tr>
					<td colspan="6">등록된 친구가 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${friendList }">
			<tr>
				<%-- <img src="http://localhost:8080/img/${profile_name}" width="50" height="50"> --%>
				<td>${dto.f_name }</td>
				<td>${dto.comm_memberNum }</td>
				<td>${dto.friendNum }</td>
				<td><a href="comm_friendContent.do?comm_memberNum=${dto.comm_memberNum}">상세보기</a></td> 
				<td><a href="comm_deleteFriend.do?friendNum=${dto.friendNum}">친구삭제</a></td> 
			</tr>
		</c:forEach>	
		</table>
	</div>
	</div>
	</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>













