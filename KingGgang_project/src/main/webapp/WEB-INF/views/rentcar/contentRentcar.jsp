<%@ include file="/WEB-INF/views/top.jsp"%><br><br><br><br>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  
	이	   름 : contentRentcar.jsp
	개  발   자 : 정 우 철
	설	   명 : 회원 렌트카 상세 페이지
	-->
<script type="text/javascript">
  function showPopupMap(){ 
	  window.open("https://map.kakao.com/link/map/"+"${rentcar.lat}"+","+"${rentcar.lng}", 
			  "카카오지도", "width=1024, height=760, left=100, top=50");
  }
  function showPopupTo(){
	  window.open("https://map.kakao.com/link/to/"+"${rentcar.rentcom}"+","+"${rentcar.lat}"+","+"${rentcar.lng}", 
			  "카카오길찾기", "width=1024, height=760, left=100, top=50");	  
  }
</script>	

<div align="center">
<form method="post" action="reservation.rentcar">
	<table border="1" width="50%" align="center">
		<tr>
			<th width="15%">차량 연료</th>
			<td width="35%" align="center">${rentcar.fuel}</td>
			<th width="15%">차량 분류</th>
			<td width="35%" align="center">${rentcar.type}</td>
		</tr>
		<tr>
			<th width="15%">상품명</th>
			<td width="35%" align="center">${rentcar.name}</td>
			<th width="15%">제조사</th>
			<td width="35%" align="center">${rentcar.company}</td>
		</tr>
		<tr>
			<th width="15%">사진</th>
			<td width="40%" align="center" colspan="3">
				<img src="http://localhost:8080/img/${rentcar.filename}" style="width:450px; height:400px auto;">
			</td>
		</tr>
		<tr>
			<th width="15%">업체명</th>
			<td width="35%" align="center">${rentcar.rentcom}</td>
			<th width="15%">업체 번호</th>
			<td width="35%" align="center">${rentcar.renttel}</td>
		</tr>
		<tr>
			<th width="15%">차량 소개</th>
			<td width="85%" colspan="4">
				<textarea name="contents" rows="4" cols="120" readOnly>${rentcar.contents}
				</textarea>
			</td>
		</tr>
		<tr>
			<th width="15%">24시간 기준 가격</th>
			<td width="35%" align="center">${rentcar.price}원</td>
  			<th width="15%">인수/반납 장소</th>
  			<td width="35%" align="center">${rentcar.pickupplace}</td>
  		</tr>
  		<tr align="center">
  			<th>지도</th>
  			<td colspan="3">
  				<div id="map" style="width:600px;height:300px;">
  				</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6d8d7b7337950ede1d049b71af2cbe5
	&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng("${rentcar.lat}","${rentcar.lng}"),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);
		var markerPosition  = new kakao.maps.LatLng("${rentcar.lat}","${rentcar.lng}");
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>
   				<input type="button" onclick="javascript:showPopupMap()" value="카카오 지도로 보기">
  				<input type="button" onclick="javascript:showPopupTo()" value="길 찾 기">	
			</td>
  		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="돌아가기" 
									onclick="window.history.back()">

				<input type="submit" value="예약하기">
				<input type="hidden" name="id" value="${rentcar.id}">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>