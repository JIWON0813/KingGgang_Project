<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="wrap wd668" align="center">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원목록</h2>
		<table border="1" width="800">
		<tr bgcolor="skyblue">
			<th>이름</th>
			<th>닉네임</th>
			<th>생년월일</th>
			<th>프로필사진</th>
			<th>자기소개</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty comm_memberList}">
			<tr>
					<td colspan="7">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${comm_memberList }">
			<tr>
				<td>${dto.name}</td>
				<td>${dto.comm_nickname}</td>
				<td>${dto.comm_allBirth }</td>
				<td>${dto.comm_profile_name }</td>
				<td>${dto.comm_intro }</td>
				<td><a href="comm_member_edit.do?comm_memberNum=#{comm_memberNum }">수정</a></td> 
				<td><a href="comm_member_delete.do?comm_memberNum=#{comm_memberNum }">삭제</a></td> 
			</tr>
		</c:forEach>
			<tr>
				<td colspan="7" align="center"><a href="comm_insertMember.mem">회원등록</a></td>
			</tr>
		</table>
	</div>
	</div>
	</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>