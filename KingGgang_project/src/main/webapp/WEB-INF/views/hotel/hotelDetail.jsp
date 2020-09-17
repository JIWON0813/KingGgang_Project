<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : hotelDetail.jsp
	개  발   자 : 김 지 원
	설	   명 : 숙소 상세페이지
-->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script>
 
function wishlist() {
	
    	var obj = {"no" : $('#btnLike').attr('name')}
     
    	$.ajax({ url: "<c:url value="/insDelwish" />", 
    		type: "POST", 
    		data: JSON.stringify(obj), 
    		dataType: "json", 
    		contentType: "application/json", 
    		
    		success: function(data) { 		
    				var result1 = data
    				if(result1.wstatus == 2){
                       $('img#wishImg').attr('src', './resources/img/empty_heart.jpg');
                    } else {
                       $('img#wishImg').attr('src', './resources/img/heart.jpg');
                    	}
    				}, 
    		error: function(errorThrown) { alert(errorThrown.statusText); } 
    		}); 
    	} 
   </script>
<%@ include file="../top.jsp"%>
<h1 align="center">숙소 상세 정보</h1>
<div class="session layout_padding" align="center">
	<table width="1200" border="1">
		<tr>
			<td width="15%"><img
				src="http://192.168.0.184:8080/img/${dto.filename}" width="auto"
				height="150">
			<td colspan="2">숙소 이름</td>
			<td colspan="3">${dto.name}</td>
		</tr>
		<tr>
			<td width="15%">전화번호</td>
			<td width="15%">${dto.hp}</td>
			<td width="12%">주소</td>
			<td width="28%">${dto.location}</td>
			<td width="10%">분류</td>
			<td width="20%">${dto.category}</td>
		</tr>
		<tr>
		<td width="15%">주차가능여부</td>
		<c:if test="${dto.parking == 'ok'}">
		<td width="15%">가능</td>
		</c:if>
		<c:if test="${dto.parking == 'no'}">
		<td width="15%">불가능</td>
		</c:if>
		<td width="12%">체크인 가능시간</td>
		<td width="28%">${dto.checkin}</td>
		<td width="10%">등록 날짜</td>
		<td width="20%">${dto.regdate }</td>
		</tr>
		<tr>
		<td>조회수</td>
		<td>${dto.readcount}
		<td>관심수</td>
		<td></td>
		<td>리뷰</td>
		<td></td>
		</tr>
		<!-- 원세호 관심리스 -->
		<tr>
		<td><p>관심리스트</p></td>
		<td colspan="5">
		<button type="button" id="btnLike" name="${dto.no}" onclick="wishlist()">
       			<img src="${ check1 == 1 ? './resources/img/empty_heart.jpg' : './resources/img/heart.jpg' }" id="wishImg" height="50px" width="50px">
   		</button>
		</td>
		</tr>
	</table>
</div>
<div align="center">
<p>방설명</p>
<table width="1200">
<tr>
<td>
${dto.content}
</td>
</tr>
</table>
</div>
<!-- 여기서부터 room -->
<div align="center">
<table border="1" width="600">
	<c:if test="${empty roomList}">
		<tr>
			<td colspan="6" align="center">등록된 방이 없습니다.
			</td>
		</tr>
	</c:if>
	<c:if test="${not empty roomList}">
		<h3 align="center">방 목록</h3>
		<c:forEach var="roomdto" items="${roomList}">
			<tr>
				<td width="auto"><img src="http://192.168.0.184:8080/img/${roomdto.filename}" width="150" height="150">
				<td width="10%">이름</td>
				<td width="15%">${roomdto.name}</td>
				<td width="25%">최대수용인원</td>
				<td width="10%">${roomdto.maxpersons}</td>
				<td width="15%"><a href="room_book.hotel?id=${roomdto.id}">예약하기</a>
			</tr>
		</c:forEach>
	</c:if>
</table>
</div>
<div align="center">
	<a href="main.hotel">목록으로</a>
</div>
<%@ include file="../bottom.jsp"%>