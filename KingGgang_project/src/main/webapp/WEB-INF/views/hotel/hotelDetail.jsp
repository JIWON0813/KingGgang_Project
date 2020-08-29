<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : hotelDetail.jsp
	개  발   자 : 김 지 원
	설	   명 : 숙소 상세페이지
-->
<h1 align="center">숙소 상세 정보</h1>
<div align="center">
	<table width="1200" border="1">
		<tr>
			<td width="15%"><img
				src="http://localhost:9211/img/${dto.filename}" width="auto"
				height="150">
			<td colspan="2">숙소 이름</td>
			<td colspan="3">${dto.name}</td>
		</tr>
		<tr>
			<td width="15%">전화번호</td>
			<td width="15%">${dto.hp}</td>
			<td width="12%">주소</td>
			<td width="28%">${dto.location}</td>
			<td width="10%">분류</td>
			<td width="20%">${dto.category}</td>
		</tr>
		<tr>
		<td width="15%">주차가능여부</td>
		<td width="15%">${dto.parking}</td>
		<td width="12%">체크인 가능시간</td>
		<td width="28%">${dto.checkin}</td>
		<td width="10%">등록 날짜</td>
		<td width="20%">${dto.regdate }</td>
		</tr>
		<tr>
		<td>조회수</td>
		<td>${dto.readcount}
		<td>관심수</td>
		<td></td>
		<td>리뷰</td>
		<td></td>
	</table>
</div>
<div align="center">
<p>방설명</p>
${dto.content}
</div>
<!-- 여기서부터 room -->
<div align="center">
<table>
	<c:if test="${empty roomList}">
		<tr>
			<td colspan="6" align="center">등록된 방이 없습니다.
			</td>
		</tr>
	</c:if>
	<c:if test="${not empty roomList}">
		<h3 align="center">방 목록</h3>
		<c:forEach var="roomdto" items="${roomList}">
			<tr>
				<td><img src="http://localhost:9210/img/${roomdto.filename}" width="100" height="100">
				<td>이름</td>
				<td>${roomdto.name}</td>
				<td>최대수용인원</td>
				<td>${roomdto.maxpersons}</td>
				<td><a href="room_book.hotel?id=${roomdto.id}">예약하기</a>
			</tr>
		</c:forEach>
	</c:if>
</table>
</div>
<div align="center">
	<a href="main.hotel">목록으로</a>
</div>
