<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	<div class="section layout_padding">
	<div class="wrap wd668" align="center" >
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원목록</h2>
		<table border="1" width="800">
		<tr bgcolor="skyblue">
			<!-- <th>memberNum/Comm_memberNum</th> -->
			<th>이름</th>
			<th>닉네임</th>
			<th>생년월일</th>
			<th>프로필사진</th>
			<th>자기소개</th>
			<th>친구추가</th>
			<th>채팅하기</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty comm_memberList}">
			<tr>
					<td colspan="9">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${comm_memberList }">
			<tr>
				<%-- <td>${dto.memberNum} //// ${dto.comm_memberNum }</td> --%>
				<td>${dto.comm_name}</td>
				<td>${dto.comm_nickname}</td>
				<td>${dto.comm_birth }</td> 
				<%-- <td>${dto.comm_profilename }</td> --%>
				<c:if test="${dto.comm_profilename  == null}">
				<td><img src="${pageContext.request.contextPath}/resources/img/basic.jpg" width="200" height="200"></td>
				</c:if>
				<c:if test="${dto.comm_profilename  != null}">
				<td>
			 	<img src="http://localhost:8080/img/${dto.comm_profilename}" width="200" height="200">
			 	</td>
				</c:if>
				<td>${dto.comm_intro }</td>
				<td><a href="comm_friend_insert.do?login_comm_memberNum=${login_comm_memberNum }&comm_memberNum=${dto.comm_memberNum }">친구추가</a></td> 
				<td><a href=""
				onclick="window.open('room?comm_memberNum=${dto.comm_memberNum}&comm_nickname=${dto.comm_nickname}', '_blank', 'width=600 height=600')">채팅하기</a></td> 
				<td><a href="admin_comm_member_delete.do?comm_nickname=${dto.comm_nickname }">삭제</a></td> 
				<%-- <td><a href="comm_member_delete.do?comm_memberNum=${dto.comm_memberNum }">삭제</a></td>  --%>
			</tr>
		</c:forEach>
		</table>
	</div>
	</div>
	</div>
	</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>