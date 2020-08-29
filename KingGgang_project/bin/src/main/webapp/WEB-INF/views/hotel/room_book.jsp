<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : room_book.jsp
	개  발   자 : 김 지 원
	설	   명 : 방 예약페이지
 --> 
 <!-- 달력으로 바꿀예정 -->
<h1 align="center">방 상세정보</h1>
<div align="center">
<form action="show_regiroom.hotel"> 
<input type="hidden" name="id" value="${roomdto.id}"/>
	<table border="1">
				<tr>
					<td colspan="2"><img src="http://localhost:9210/img/${roomdto.filename}"
						width="250" height="250">
					<td>방 이름
					<td>${roomdto.name}
				</tr>
				<tr>
					<td>인원
					<td>${roomdto.maxpersons}
					<td>방 설명
					<td>${roomdto.content}
				</tr>
				<tr>
				<td>예약날짜
				<td><input type="date" name="startdate">
				<td>퇴실날짜
				<td><input type="date" name="enddate">
				</tr>
				<tr>
				<td colspan="4" align="center"><input type="submit" value="예약하기"></td>
				</tr>
	</table>
	</form>
</div>