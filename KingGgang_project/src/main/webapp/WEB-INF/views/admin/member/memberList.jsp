<%@ include file="../admintop.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="wrap wd668" align="center">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원목록</h2>
		<table border="1" width="1000">
		<tr bgcolor="skyblue">
			<th width="70">회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>친구</th>
			<th>포인트</th>
			<th>가입일</th>
			<th>상세보기</th>
		</tr>
		<c:if test="${empty memberList}">
			<tr>
					<td colspan="11">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${memberList }">
			<tr>
				<td align="center">${dto.memberNum }</td>
				<td>${dto.id }</td>
				<td>${dto.name}</td>
				<td>${dto.gender}</td>
				<td>${dto.getAllBirth() }</td>
				<td>${dto.email }</td>
				<td>${dto.getAllHp() }</td>
				<td>${dto.friendCount }</td>
				<td>${dto.point }</td>
				<td>${dto.regdate }</td>
				<td><a href="memberContent.mem?memberNum=${dto.memberNum }">상세보기</a></td> 
			</tr>
		</c:forEach>
			<tr>
				<td colspan="11" align="center"><a href="insertMember.mem">회원등록</a></td>
			</tr>
		</table>
	</div>
	</div>
	</div>
	<%@ include file="../adminbottom.jsp"%>