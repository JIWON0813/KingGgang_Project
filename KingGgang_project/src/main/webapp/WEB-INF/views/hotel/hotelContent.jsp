<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : hotelContent.jsp
	개  발   자 : 김 지 원
	설	   명 : 숙소 상세페이지(관리자모드) 
 -->
 <%@ include file="../top.jsp"%>
<script>
 function regiroom(){
	 var regi = document.getElementById("regiroom");
	 if(regi.style.display == 'none'){
		 regi.style.display = 'block';
	 }
	 else if(regi.style.display == 'block'){
		 regi.style.display = 'none';
	 }
 }
 </script>
<h1 align="center">숙소 상세 정보</h1>
<div class="session layout_padding" align="center">
	<table width="1200" border="1">
		<tr>
			<td width="15%"><img
				src="http://localhost:8080/img/${dto.filename}" width="auto"
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
	</table>
</div>
<div align="center">
<table>
	<c:if test="${empty roomList}">
		<tr>
			<td colspan="6" align="center">등록된 방이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty roomList}">
		<h3 align="center">등록되어있는 방 목록</h3>
		<c:forEach var="roomdto" items="${roomList}">
			<tr>
				<td><img src="http://localhost:9211/img/${roomdto.filename}"
					width="100" height="100">
				<td>이름 : </td>
				<td>${roomdto.name}</td>
				<td>최대수용인원 : </td>
				<td>${roomdto.maxpersons}</td>
				<td>주중가 : </td>
				<td>${roomdto.dayprice}</td>
				<td>주말가 : </td>
				<td>${roomdto.endprice}</td>
				<td><a href="updateroom.hotel?id=${roomdto.id}">수정</a> <a
					href="deleteRoom.hotel?id=${roomdto.id}">삭제</a></td>
			</tr>
		</c:forEach>
		<br>		
	</c:if>
	</table>
</div>
<div align="center">
<button onclick="regiroom()">방 등록하기</button>
</div>
<div id="regiroom" style="display: none;" align="center">
	<form action="insertRoom.hotel" method="post" enctype="multipart/form-data">
		<input type="hidden" name="h_id" value="${dto.no}">
		<table>
			<tr>
				<td>이름
				<td><input type="text" name="name">
			<tr>
			<tr>
				<td>인원
				<td><input type="text" name="maxpersons">
			<tr>
			<tr>
				<td>주중가
				<td><input type="text" name="dayprice">
			<tr>
			<tr>
				<td>주말가
				<td><input type="text" name="endprice">
			<tr>
			<tr>
				<td>내용
				<td><textarea name="content" rows="10" cols="50"></textarea>
			<tr>
			<tr>
				<td>이미지 등록
				<td><input type="file" name="file">
			<tr>
			<tr>
				<td><input type="submit" value="방 등록">
				<td><input type="reset" value="초기화하기">
			</tr>
		</table>
	</form>
</div>
<div align="center">
	<a href="hotelList.hotel">목록으로</a>
</div>
<%@ include file="../bottom.jsp"%>