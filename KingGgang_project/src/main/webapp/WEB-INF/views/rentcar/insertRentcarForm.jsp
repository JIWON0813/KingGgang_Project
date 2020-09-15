<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<br><br><br><br>
	<!--  
	이	   름 : insertRentcarForm
	개  발   자 : 정 우 철
	설	   명 : 관리자 렌트카 등록 페이지
	-->

	<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("차량 이름을 입력 해 주세요!!")
				f.id.focus()
				return
			}
			if (f.price.value==""){
				alert("대여료를 입력 해 주세요!!")
				f.paswd.focus()
				return
			}
			getInfo()
			document.f.submit()
		}
		
	</script>
	<body>
		<form name="f" method="post" action="insertRentcar_Ok.admin"
		enctype="multipart/form-data">
			<table width="600" align="center" border="1">
  				<tr>
					<td colspan="2" align=center>렌트카 등록</td>
 				</tr>
				<tr>
					<td width="150">제조사</td>
					<td class="m3">
						<select name="company">
							<option value="현대" selected="selected">현대</option>
							<option value="기아">기아</option>
							<option value="르노삼성">르노 삼성</option>
							<option value="쉐보레">쉐보레</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="150">차량 분류</td>
					<td>
						<select name="type">
							<option value="경차">경차</option>
							<option value="세단" selected="selected">세단</option>
							<option value="SUV">SUV</option>
						</select>
					</td>
  				</tr>
  				<tr>
					<td width="150">24시간 기준 대여료</td>
					<td class="m3">
						<input type="text" name="price">
					</td>
  				</tr>
  				<tr>
					<td width="150">차량 이름</td>
					<td>
						<input type="text" name="name">
					</td>
  				</tr>
  				<tr>
					<td width="150">연료 종류</td>
					<td>
						<select name="fuel">
							<option value="휘발유">휘발유(가솔린)</option>
							<option value="경유">경유(디젤)</option>
							<option value="LPG">LPG</option>
							<option value="하이브리드">하이브리드</option>
						</select>
					</td>
  				</tr>
  				<tr>
					<th width="20%" bgcolor="orange">차량 사진</th>
					<td><input type="file" name="filename" size="30"></td>
				</tr>
				<tr>
					<th width="20%">상품소개</th>
					<td align="left">
					<textarea name="contents" rows="7" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td width="150">업체명</td>
					<td class="m3">
						<input type="text" name="rentcom">
					</td>
				</tr>
				<tr>
					<td width="150">업체 번호</td>
					<td class="m3">
						<input type="text" name="renthp1" style="width:40px;" maxlength="3">-
						<input type="text" name="renthp2" style="width:40px" maxlength="4">-
						<input type="text" name="renthp3" style="width:40px" maxlength="4">
					</td>
				</tr>
				<tr>
				<td>픽업/반납 장소</td>
				<td><input type="text" name="pickupplace"></td>
				</tr>
				<tr>
				<td>픽업/반납 장소를 클릭해주세요</td>
				<td>
	 			<div id="map" style="width:500px;height:500px;">
  				</div>
  				<input type="hidden" name="lat" id="lat" value="">
  				<input type="hidden" name="lng" id="lng" value="">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6d8d7b7337950ede1d049b71af2cbe5
	&libraries=services,clusterer,drawing"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new kakao.maps.LatLng(33.504533, 126.491883), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);

	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' + 
	                            detailAddr + 
	                        '</div>';

	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);

	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	    });
	});

	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});

	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');

	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	function getInfo(){
	var center = map.getCenter();
	var lat = center.getLat();
	var lng = center.getLng();
	document.getElementById('lat').value = lat;
	document.getElementById('lng').value = lng;
	}
	
	</script>
				</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[전송]</a>
						<a href="listRentcar.admin">[취소]</a>
					</td>
  				</tr>
  			</table>
		</form>
	</body>
<%@ include file="/WEB-INF/views/bottom.jsp"%>