<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : hotelList.jsp
	개  발   자 : 김 지 원
	설	   명 : 관리자모드 숙소목록페이지
 -->

<div align="center">
	<b>결 제 목 록</b>
	<table border="1" width="1000">
		<tr bgcolor="green">
			<th>결제번호</th>
			<th>상품이름</th>
			<th>상품분류</th>
			<th>전화번호</th>
			<th>회원아이디</th>
			<th>회원닉네임</th>
			<th>회원이메일</th>
			<th>대여날짜</th>
			<th>반납날짜</th>
			<th>가격</th>
			<th>결제날짜</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">등록된 결제가 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${not empty list}">
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.no}</td>
					<td>${dto.p_name}</td>
					<c:if test="${dto.type == 1}">
					<td>숙박</td>
					</c:if>
					<c:if test="${dto.type == 2}">
					<td>렌트</td>
					</c:if>
					<td>${dto.hp}</td>
					<td>${dto.id}</td>
					<td>${dto.m_name}</td>
					<td>${dto.email}</td>
					<td>${dto.startDate}</td>
					<td>${dto.endDate}</td>
					<td>${dto.price}</td>
					<td>${dto.payDate}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div align="center">
		<form action="hotelList.hotel">
			<input type="text" name="search" placeholder="검색어입력"> <input type="submit" value="검색">
		</form>
	</div>
	<c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
			[<a href="hotelList.hotel?pageNum=${startPage-1}&search=${search}">이전</a>]		
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="hotelList.hotel?pageNum=${i}&search=${search}">${i}</a>]
		</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="hotelList.hotel?pageNum=${endPage+1}&search=${search}">다음</a>]
		</c:if>
	</c:if>
	<br> <a href="main.admin">관리자 목록으로 가기</a>
</div>
