<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="wrap wd668" align="center">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원목록</h2>
		<table border="1" width="800">
		<tr bgcolor="skyblue">
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>권한</th>
			<th>포인트</th>
			<th>연락처</th>
			<th>상세</th>
		</tr>
		<c:if test="${empty memberList}">
			<tr>
					<td colspan="8">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${memberList }">
			<tr>
				<td>${dto.id }</td>
				<td>${dto.name}</td>
				<td>${dto.nickname}</td>
				<td>${dto.email }</td>
				<td>${dto.auth }</td>
				<td>${dto.point }</td>
				<td>${dto.hp }</td>
				<td><a href="memberContent.mem?id=${dto.id }">상세보기</a></td> 
			</tr>
		</c:forEach>
			<tr>
				<td colspan="8" align="center"><a href="insertMember.mem">회원등록</a></td>
			</tr>
		</table>
	</div>
	</div>
	</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>