<%@ include file="../admintop.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

 #member_button input{

	 border:1px solid skyblue;

      background-color:rgba(0,0,0,0);

      color:skyblue;

      padding:5px;

      

      border-radius:5px;

 }

 

	#member_button input:hover{

  	color:white;

    background-color:skyblue;

 

 }

 

</style>

	<div class="wrap wd668" align="center">

            <div class="container">

                <div class="form_txtInput">

                    <h2 class="sub_tit_txt">회원목록</h2>

		<table width="900">

		<tr bgcolor="skyblue" align="center">

			<th width="70">회원번호</th>

			<th>아이디</th>

			<th>이름</th>

			<th>성별</th>

			<th>생년월일</th>

			<th>이메일</th>

			<th>연락처</th>

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

			<tr align="center">

				<td>${dto.memberNum }</td>

				<td>${dto.id }</td>

				<td>${dto.name}</td>

				<td>${dto.gender}</td>

				<td>${dto.getAllBirth() }</td>

				<td>${dto.email }</td>

				<td>${dto.getAllHp() }</td>

				<td>${dto.point }</td>

				<td>${dto.regdate }</td>

				<td><a href="memberContent.mem?memberNum=${dto.memberNum }">상세보기</a></td> 

			</tr>

		</c:forEach>

		</table>

		<br><br>

			<a id="member_button" href="insertMember.mem">

				<input type="button" value="회원등록">

			</a>

		<br><br>

			<a href="main.admin">관리자 홈으로 돌아가기</a>

	</div>

	</div>

	</div>

<%@ include file="../adminbottom.jsp"%>