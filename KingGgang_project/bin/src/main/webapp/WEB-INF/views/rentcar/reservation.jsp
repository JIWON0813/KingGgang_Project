<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  					<th>예약 날짜 선택</th>
  					<td>차량 대여일<input type="datetime-local" name="receiptday"></td>
  					<td>반납 예정일<input type="datetime-local" name="returnday">
  					</td>
  				</tr>
 
  					<tr>
  					<th>사진</th>
  					<td colspan="2"><img src="http://localhost:8080/img/${rentcar.filename}" style="width:300px; height:300px"></td>
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
  						<input type="hidden" name="price" value="${rentcar.price + idto.price}">
  						</c:forEach>
  					</select>
  					</td>
  				</tr>
  				<tr>
  					<th>인수/반납 장소</th>
  					<td colspan="2">
  					</td>
  				</tr>
  				<tr>
  					<th>지도</th>
  					<td>
  					<div id="map" style="width:300px;height:300px;">
  					</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6d8d7b7337950ede1d049b71af2cbe5
	&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701,126.570667),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>
  	<script>
  		document.getElementById('receiptday').value = new Date().toISOString().slice(0,16);
  		document.getElementById('returnday').value = new Date().toISOString().slice(0,16);
	</script>
				</td>
				<td>
				  <a href="https://map.kakao.com/link/map/37.402056,127.108212">카카오 지도로 보기</a><br>
                  <a href="https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212">길 찾 기</a>
				</td>
  				</tr>
  			</table>
  			<div align="center">
			<input type="button" value="예약하기" onclick="javascript:check()">
			</div> 			
		</form>
	</body>