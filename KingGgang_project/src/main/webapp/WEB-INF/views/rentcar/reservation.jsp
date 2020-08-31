<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!--  
	이	   름 : reservation.jsp
	개  발   자 : 정 우 철
	설	   명 : 회원 렌트카 예약 페이지
	-->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
$(function () {
$("#datepicker1").datepicker({
    changeMonth: true, 
    dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
$("#datepicker2").datepicker({
    changeMonth: true, 
    dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
});
</script>
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
<head>
	<script type="text/javascript">
		function check(){
			if (f.receiptday.value==""){
				alert("차량 수령일을 입력 해 주세요!!")
				f.id.focus()
				return
			}
			if (f.price.value==""){
				alert("반납 예정일을 입력 해 주세요!!")
				f.returnday.focus()
				return
			}
			document.f.submit()
		}
	</script>

<title>예 약 페 이 지</title>
</head>
	<body>
		<form name="f" method="post" action="reservation_Ok.rentcar">
		<input type="hidden" name="r_id" value="${rentcar.id}">
		<input type="hidden" name="member_id" value="test">
			<table width="600" align="center" border="1">
  				<tr>
  					<td colspan="2">차량 대여일
  					<input type="text" name="receiptday" placeholder="대여일" id="datepicker1">
					<select name="pickuptime">
  					<option selected value="0">
  					픽업 시간 선택
  					</option>
  					<option value="09:00:00">오전 09시</option>
  					<option value="10:00:00">오전 10시</option>
  					<option value="11:00:00">오전 11시</option>
  					<option value="12:00:00">오전 12시</option>
  					<option value="13:00:00">오후 1시</option>
  					<option value="14:00:00">오후 2시</option>
  					<option value="15:00:00">오후 3시</option>
  					<option value="16:00:00">오후 4시</option>
  					<option value="17:00:00">오후 5시</option>
  					<option value="18:00:00">오후 6시</option>
  					<option value="19:00:00">오후 7시</option>
  					</select>
  					</td>
  					<td>반납 예정일<input type="text" name="returnday" placeholder="반납일" id="datepicker2">
  					</td>
  				</tr>
 
  					<tr>
  					<th>사진</th>
  					<td colspan="2"><img src="http://localhost:8080/img/${rentcar.filename}" style="width:400px; height:300px"></td>
  					</tr>
  				<tr>
  					<th>차량 이름</th>
  					<td colspan="2">${rentcar.name}</td>
  				</tr>
  				<tr>
  					<th>대여료</th>
  					<td colspan="2">${rentcar.price}</td>
  				</tr>
  				<tr>
  					<th>보험 선택</th>
  					<td colspan="2">
  					<select name="insu_id">
  						<c:forEach var="idto" items="${insu}">
  						<option value="${idto.id}">
  						[${idto.company}]	${idto.name}     +${idto.price}원
  						</option>
  						</c:forEach>
  					</select>
  					<input type="hidden" name="price" value="0">
  					</td>
  				</tr>
  				<tr>
  					<th>인수/반납 장소</th>
  					<td colspan="2">${rentcar.pickupplace}</td>
  				</tr>
  				<tr>
  					<th>지도</th>
  					<td>
  					<div id="map" style="width:500px;height:300px;">
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
				</td>
  				</tr>
  				<tr align="center">
  				<td colspan="2">
   					<input type="button" onclick="javascript:showPopupMap()" value="카카오 지도로 보기">
  					<input type="button" onclick="javascript:showPopupTo()" value="길 찾 기">
  				</td>
  				</tr>
  			</table>
  			<div align="center">
			<input type="button" value="예약하기" onclick="javascript:check()">
			</div> 			
		</form>
	</body>