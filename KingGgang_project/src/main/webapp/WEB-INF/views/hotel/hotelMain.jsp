<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/main/resources/css/hotel.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : hotelMain.jsp
	개  발   자 : 김 지 원
	설	   명 : 숙소 예약 메인페이지
 -->

<div class="subject" align="center">
	<h1>다양한 종류의 숙소</h1>
</div>
<div class="category" align="center">
	<table class="categorytable" width="1000" height="100">
		<tr>
			<td width="20%" class="catetd"><a href="main.hotel?cate=all">전체</a></td>
			<td width="20%" class="catetd"><a href="main.hotel?cate=hotel">호텔</a></td>
			<td width="20%" class="catetd"><a href="main.hotel?cate=motel">모텔</a></td>
			<td width="20%" class="catetd"><a href="main.hotel?cate=guesthouse">게스트하우스</a></td>
			<td width="20%" class="catetd"><a href="main.hotel?cate=pension">펜션</a></td>
		</tr>
	</table>
	<div align="center">
		<form action="main.hotel">
			<input type="text" name="search" placeholder="검색어입력"> <input
				type="submit" value="검색">
		</form>
	</div>
</div>
<div class="content" align="center">
	<p style="font-size: 20px; font-weight: bold">숙소 목록</p>
	<table class="contenttable" width="1000">
		<c:forEach var="dto" items="${hotelList}">
			<tr>
				<c:if test="${not empty dto.filename}">
					<td rowspan="6" width="20%">
					<a href="hotelDetail.hotel?no=${dto.no}">
					<img src="http://localhost:9211/img/${dto.filename}" width="200" height="200">
					</a>
				</c:if>
				<c:if test="${empty dto.filename}">
					<td rowspan="6" width="200"	height="200">이미지가 존재하지 않습니다.</td>
				</c:if>

				<td width="70%">${dto.name}
				<td rowspan="6" width="10%">장바구니
			</tr>
			<tr>
				<td>
<c:set var="catev" value="${dto.category}" />
			<c:if test="${catev eq 'hotel' }">호텔</c:if>
			<c:if test="${catev eq 'motel' }">모텔</c:if>
			<c:if test="${catev eq 'guesthouse' }">게스트하우스</c:if>
			<c:if test="${catev eq 'pension' }">펜션</c:if>
</td>
			</tr>
			<tr>
				<td>주소 : ${dto.location}</td>
			</tr>
			<tr>
				<td>전화번호 : ${dto.hp}</td>
			</tr>
			<tr>
				<td>체크인 시간 : ${dto.checkin}</td>
			</tr>
			<tr>
				<td>조회수 : ${dto.readcount}</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
			[<a href="main.hotel?pageNum=${startPage-1}">이전</a>]		
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="main.hotel?pageNum=${i}">${i}</a>]
		</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="main.hotel?pageNum=${endPage+1}">다음</a>]
		</c:if>
	</c:if>
</div>
