<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false" %> --%>
<!-- 
	이	   름 : home.jsp
	개  발   자 : 
	설	   명 : 메인 페이지
 -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript">
	//날씨 api
	$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=jeju&units=metric&appid=70393e52400da4753a885b68792731f4',
					function(data) {
						var $maxTemp = data.main.temp_max;
						var $minTemp = data.main.temp_min;
						var $cTemp = data.main.temp;
						var $now = new Date($.now());
						var $cDate = $now.getFullYear() + '년'
								+ ($now.getMonth() + 1) + '월' + $now.getDate()
								+ '일';
						var $wIcon = data.weather[0].icon;
						var $wSpeed = data.wind.speed;
						var $wDeg = data.wind.deg;
						var $cFeels_like = data.main.feels_like;
						var $cHumidity = data.main.humidity;
						var $cWeather = data.weather[0].main;

						$('.cweather').append($cWeather);
						$('.chumidity').append($cHumidity + "%");
						$('.clowtemp').append($minTemp + "ºC");
						$('.ctemp').append($cTemp + "ºC");
						$('.chightemp').append($maxTemp + "ºC");
						$('.cfeels_like').append($cFeels_like + "ºC");
						$('.cdate').prepend($cDate);
						$('.cicon').append('<img src="http://openweathermap.org/img/w/'+$wIcon+'.png", width="100", height="100"/>');
						$('.wspeed').append($wSpeed);
						$('.wdeg').append($wDeg);

					});
	//
</script>
<!-- 날씨 api -->
<div align="right">
	<table style="border: double orange;">
		<tr>
			<th colspan="2" class="cdate">제주도 날씨 현황</th>
		</tr>
		<tr>
			<td class="cicon" rowspan="6"></td>
		</tr>
		<tr>
			<td class="cweather"><b>날씨 : </b></td>
		</tr>
		<tr>
			<td class="ctemp"><b>현재 온도 : </b></td>
		</tr>
		<tr>
			<td><b class="cfeels_like">체감 기온 : </b></td>
		</tr>
		<tr>
			<td><b>최고/최저 : </b><b class="chightemp"></b>/<b class="clowtemp"></b></td>
		</tr>
		<tr>
			<td><b class="chumidity">습도 : </b>
		</tr>
	</table>
</div>

<a href="main.admin">관리자모드로 가기</a>
<br>
<a href="main.member">임시회원</a>
<a href="Q_list.board">문의게시판 가기</a>
<a href="list.notice">공지사항 보기</a>
<a href="main.my">마이페이지로 가기</a>
<p>
	<a href="main.mem">멤버 페이지로 가기</a>
<p>
	<a href="main.hotel">호텔 예약하기</a> <a href="listRentcar.admin">렌트카
		목록(어드민)</a> <a href="main.wish">관심리스트등록 페이지로 가기</a>
<p>
	<a href="main.pay">결제 페이지로 가기</a>
<p>
	<%@ include file="/WEB-INF/views/bottom.jsp"%>