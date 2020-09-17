<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : room_book.jsp
	개  발   자 : 김 지 원
	설	   명 : 방 예약페이지
 -->
<script type="text/javascript">
	function check() {
		var start = f.startdate.value;
		var end = f.enddate.value;
		var date = new Date();

		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일

		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}

		var today = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)
		if (start == "") {
			alert("입실 시작 날짜를 입력 해 주세요!!")
			return false;
		}
		if (end == "") {
			alert("퇴실 시작 날짜를  입력 해 주세요!!")
			return false;
		}
		if (start >= end) {
			alert("퇴실 날짜를 입실날짜 이후로 지정해주세요!!")
			return false;
		}
		var s = new Date(start);
		var t = new Date(today);
		if (s < t) {
			alert("이전 날짜는 예약할 수 없습니다.")
			return false;
		}
		return true;
	}
</script>
<%@ include file="../top.jsp"%>
<h1 align="center">방 상세정보</h1>
<div class="session layout_padding" align="center">
	<form name="f" action="show_regiroom.hotel" method='post'
		onSubmit='return check();'>
		<input type="hidden" name="id" value="${roomdto.id}" />
		<table border="1" width="1000">
			<tr>
				<td colspan="2"><img src="http://192.168.0.184:8080/img/${roomdto.filename}" width="250"
					height="250">
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
				<td colspan="4" align="center"><input type="submit"
					value="예약하기"></td>
			</tr>
		</table>
	</form>
	<div align="center">
	<button type="button" onclick="location.href='javascript:history.go(-1)'">돌아가기</button>
	</div>
</div>
<%@ include file="../bottom.jsp"%>