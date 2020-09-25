<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : room_book.jsp
	개  발   자 : 김 지 원
	설	   명 : 방 예약페이지
 -->
 <script src="${pageContext.request.contextPath}/resources/jquery-3.5.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <script src="${pageContext.request.contextPath}/resources/datepicker/js/datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datepicker/js/datepicker.ko.js"></script> 
 <script type="text/javascript">
	var newJquery = $.noConflict(true);
	</script>
 
<script type="text/javascript">

var date = new Date();
var minRcd = new Date();
var minRtd = new Date();
minRcd.setDate(minRcd.getDate()+1);
minRtd.setDate(minRtd.getDate()+2);

newJquery(document).ready(function () {
var dp = newJquery('#room_in').datepicker({
    	startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
    	language: 'ko',
    	minDate : minRcd,
    	autoClose: true,
    	onSelect: function (date) {
    	   var endNum = date;
    	   var endDate = new Date(endNum);
    	   endDate.setDate(endDate.getDate()+1);
    	   newJquery('#room_out').datepicker({
    	       minDate: endDate
    	   });
    	}
    }).data('datepicker');

    newJquery('#room_out').datepicker({
    	
    	
    	startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
    	language: 'ko',
    	minDate : minRtd, 
    	autoClose: true,
    	onSelect: function (date) {
  	      var startNum = date;
  	      var startDate = new Date(startNum);
  	      startDate.setDate(startDate.getDate()-1);
  	      newJquery('#room_in').datepicker({
  	          maxDate: startDate
  	      });
  	  }
  	}).data('datepicker');
    
    
});

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
		<table style="width : 1000px ; text-align : center; border-collapse: separate; border-spacing: 0 10px;">
			<tr>
				<td colspan="4"><img src="http://192.168.0.184:8080/img/${roomdto.filename}" width="250"
					height="250">
			</tr>
			<tr>
			<td>방 이름
			<td colspan="3">${roomdto.name}
			</tr>
			<tr>
				<td width="15%">인원
				<td>${roomdto.maxpersons}
				<td width="15%">방 설명
				<td>${roomdto.content}
			</tr>
			<tr>
				<td>주중가
				<td>${roomdto.dayprice}
				<td>주말가
				<td>${roomdto.endprice}
			</tr>
			<tr>
			<tr>
				<td>예약날짜
				<td><input type="date" id="room_in" name="startdate" readOnly>
				<td>퇴실날짜
				<td><input type="date" id="room_out" name="enddate" readOnly>
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