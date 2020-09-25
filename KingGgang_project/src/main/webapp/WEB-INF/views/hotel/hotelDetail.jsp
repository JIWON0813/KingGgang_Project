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
 //관심리스트 원세
function wishlist() {
	
    	var obj = {"no" : $('#btnWish').attr('name')}
     
    	$.ajax({ url: "<c:url value="/insDelwish" />", 
    		type: "POST", 
    		data: JSON.stringify(obj), 
    		dataType: "json", 
    		contentType: "application/json", 
    		
    		success: function(data) { 		
    				var result1 = data
    				if(result1.wstatus == 2){
                       $('img#wishImg').attr('src', './resources/img/empty_heart.PNG');
                    } else {
                       $('img#wishImg').attr('src', './resources/img/heart.png');
                    	}
    				}, 
    		error: function(errorThrown) { alert(errorThrown.statusText); } 
    		}); 
    	} 
   </script>
   
   <style>
		#btnWish{
			border:0;
			background-color:white;
		}
	

		button {
		border:1px solid orange;
		background-color:rgba(0,0,0,0);
		color:orange;
		padding:5px;
		border-radius:5px;
	}
	
		button:hover{
		color:white;
		background-color:orange;
	}


	</style>
<%@ include file="../top.jsp"%>
<h1 align="center">숙소 상세 정보</h1>

<div class="session layout_padding" align="center">
	<table width="1200" style="text-align : center;" >

		<tr>
			<td width="15%" colspan="8"><img
				src="http://192.168.0.184:8080/img/${dto.filename}" width="auto"
				height="300">
				<br><br>
			</td>
				
		</tr>
		<tr>
			<th width="15%" bgcolor="orange">숙소 이름</th>
			<td width="15%">${dto.name}</td>
			<th width="13%" bgcolor="orange">전화번호</th>
			<td width="13%">${dto.hp}</td>
			<th width="12%" bgcolor="orange">주소</th>
			<td width="25%">${dto.location}</td>
			
		</tr>
		<tr>
		<th width="15%" bgcolor="orange">주차가능여부</th>
		<c:if test="${dto.parking == 'ok'}">
		<td width="15%">가능</td>
		</c:if>
		<c:if test="${dto.parking == 'no'}">
		<td width="15%">불가능</td>
		</c:if>
		<th width="12%" bgcolor="orange">체크인 가능시간</th>
		<td width="28%">${dto.checkin}</td>
		<th width="10%" bgcolor="orange">등록 날짜</th>
		<td width="20%" colspan="3">${dto.regdate }</td>
		</tr>
		<tr>
		<th bgcolor="orange">조회수</th>
		<td>${dto.readcount}</td>
		<c:choose>
		<c:when test="${check1==3}">
		</tr>
		</c:when>
		<c:otherwise>
		<th width="15%" bgcolor="orange">분류</th>
		<td width="20%">${dto.category}</td>
		<th bgcolor="orange">관심리스트</th>
		<td colspan="5">
		<button type="button" id="btnWish" name="${dto.no}" onclick="wishlist()">
       			<img src="${ check1 == 1 ? './resources/img/empty_heart.PNG' : './resources/img/heart.png' }" id="wishImg" height="50px" width="50px">
   		</button>
		</td>
		</tr>
		</c:otherwise>
		</c:choose> 
		<tr>
		<td colspan="8">${dto.content}</td>
		</tr>
	</table>
</div>
<br><br><br>
<!-- 여기서부터 room -->
<div align="center">
<table width="600" style="font-size : 17px ; text-align : center;">
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
				<td rowspan="2" width="auto"><img src="http://192.168.0.184:8080/img/${roomdto.filename}" width="150" height="150">
				<td width="10%">이름</td>
				<td width="15%">${roomdto.name}</td>
				<td width="25%">최대수용인원</td>
				<td width="10%">${roomdto.maxpersons}</td>
				<td rowspan="2" width="15%"><a href="room_book.hotel?id=${roomdto.id}"><button >예약하기</button></a>
				</tr>
				<tr>
				<td width="10%">주중가</td>
				<td width="15%">${roomdto.dayprice}</td>
				<td width="25%">주말가</td>
				<td width="10%">${roomdto.endprice}</td>				
			</tr>
		</c:forEach>
	</c:if>
</table>
</div>
<br>
<br>
<br>
<div align="center">
	<a href="main.hotel">목록으로</a>
</div>
<div class="session layout_padding"></div>
<%@ include file="../bottom.jsp"%>