<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : room_book.jsp
	개  발   자 : 김 지 원
	설	   명 : 방 예약페이지
 --> 
<script type="text/javascript">
	function check(){
	if (f.startdate.value==""){
		alert("입실 시작 날짜를 입력 해 주세요!!")
		return false;
	}
	if (f.enddate.value==""){
		alert("퇴실 시작 날짜를  입력 해 주세요!!")
		return false;
	}
	return true;
}
</script>
<h1 align="center">방 상세정보</h1>
<div align="center">
<form name="f" action="show_regiroom.hotel" method='post' onSubmit='return check();'> 
<input type="hidden" name="id" value="${roomdto.id}"/>
	<table border="1" width="1000">
				<tr>
					<td colspan="2"><img src="http://localhost:8080/img/${roomdto.filename}"
						width="250" height="250">
					<td width="15%">방 이름
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
				<td><input type="date" id="room_in" name="startdate">
				<td>퇴실날짜
				<td><input type="date" id="room_out" name="enddate">
				</tr>
				<tr>
				<td colspan="4" align="center">
				<input type="submit" value="예약하기">
				</td>
				</tr>
	</table>
	</form>
</div>