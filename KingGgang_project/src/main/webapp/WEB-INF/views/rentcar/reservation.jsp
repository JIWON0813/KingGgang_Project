<%@ include file="/WEB-INF/views/top.jsp"%><br><br><br><br>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!--  
	이	   름 : reservation.jsp
	개  발   자 : 정 우 철
	설	   명 : 회원 렌트카 예약 페이지
	-->

	<script src="${pageContext.request.contextPath}/resources/jquery-3.5.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
    <link href="${pageContext.request.contextPath}/resources/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- Air datepicker css -->
    <script src="${pageContext.request.contextPath}/resources/datepicker/js/datepicker.js"></script> <!-- Air datepicker js -->
    <script src="${pageContext.request.contextPath}/resources/datepicker/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->


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
        var dp = newJquery('	#datepicker1').datepicker({
            	startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
            	language: 'ko',
            	minDate : minRcd,
            	autoClose: true,
            	onSelect: function (date) {
            	   var endNum = date;
            	   var endDate = new Date(endNum);
            	   endDate.setDate(endDate.getDate()+1);
            	   newJquery('#datepicker2').datepicker({
            	       minDate: endDate
            	   });
            	}
            }).data('datepicker');

            newJquery('#datepicker2').datepicker({
            	
            	
            	startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
            	language: 'ko',
            	minDate : minRtd, 
            	autoClose: true,
            	onSelect: function (date) {
          	      var startNum = date;
          	      var startDate = new Date(startNum);
          	      startDate.setDate(startDate.getDate()-1);
          	      newJquery('#datepicker1').datepicker({
          	          maxDate: startDate
          	      });
          	  }
          	}).data('datepicker');
            
            
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
				f.receiptday.focus()
				return
			}
			if (f.returnday.value==""){
				alert("반납 예정일을 입력 해 주세요!!")
				f.returnday.focus()
				return
			}
			if (f.pickuptime.value==0){
				alert("픽업 시간을 선택 해 주세요!!")
				f.pickuptime.focus()
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
		<!-- session 으로 넘겨받을 값 임의 지정 -->
		<input type="hidden" name="member_id" value="${mbId}">
			<table width="600" align="center" border="1">
  				<tr>
  					<td colspan="2">차량 대여일
  					<input type="text" name="receiptday" value="${dpreceiptday}" id="datepicker1">
					<select name="pickuptime">
  			
  					<option value="0" <c:if test="${dppickuptime eq null}">selected</c:if>>
  					픽업 시간 선택
  					</option>
  					<option value="/09:00" <c:if test="${dppickuptime eq '/09:00'}">selected</c:if>>
  					오전 09시
  					</option>
  					<option value="/10:00" <c:if test="${dppickuptime eq '/10:00'}">selected</c:if>>
  					오전 10시
  					</option>
  					<option value="/11:00" <c:if test="${dppickuptime eq '/11:00'}">selected</c:if>>
  					오전 11시
  					</option>
  					<option value="/12:00" <c:if test="${dppickuptime eq '/12:00'}">selected</c:if>>
  					오전 12시
  					</option>
  					<option value="/13:00" <c:if test="${dppickuptime eq '/13:00'}">selected</c:if>>
  					오후 1시
  					</option>
  					<option value="/14:00" <c:if test="${dppickuptime eq '/14:00'}">selected</c:if>>
  					오후 2시
  					</option>
  					<option value="/15:00" <c:if test="${dppickuptime eq '/15:00'}">selected</c:if>>
  					오후 3시
  					</option>
  					<option value="/16:00" <c:if test="${dppickuptime eq '/16:00'}">selected</c:if>>
  					오후 4시
  					</option>
  					<option value="/17:00" <c:if test="${dppickuptime eq '/17:00'}">selected</c:if>>
  					오후 5시
  					</option>
  					<option value="/18:00" <c:if test="${dppickuptime eq '/18:00'}">selected</c:if>>
  					오후 6시
  					</option>
  					<option value="/19:00" <c:if test="${dppickuptime eq '/19:00'}">selected</c:if>>
  					오후 7시
  					</option>

  					</select>
  					</td>
  					<td>반납 예정일<input type="text" name="returnday" value="${dpreturnday}" id="datepicker2">
  					</td>
  				</tr>
 
  					<tr>
  					<th>사진</th>
  					<td colspan="2"><img src="http://192.168.0.184:8080/img/${rentcar.filename}" style="width:400px; height:300px"></td>
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
<%@ include file="/WEB-INF/views/bottom.jsp"%>