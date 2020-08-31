<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	이	   름 : hotelList.jsp
	개  발   자 : 김 지 원
	설	   명 : 관리자모드 숙소목록페이지
 -->
<div align="center">
	<b>숙 소 목 록</b>
	<table border="1" width="800">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="40%" colspan="2">이름</th>
			<th>구 분</th>
			<th>작성일</th>
			<th>조회수</th>
			<th></th>
		</tr>
		<c:if test="${empty hotelList}">
			<tr>
				<td colspan="6" align="center">등록된 숙소가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty hotelList}">
			<c:forEach var="dto" items="${hotelList}">
				<tr>
					<td>${dto.no}</td>
					<c:if test="${not empty dto.filename}">
						<td width="15%"><img
							src="http://localhost:9211/img/${dto.filename}" width="auto"
							height="100"></td>
					</c:if>
					<c:if test="${empty dto.filename}">
						<td width="15%">이미지가 존재하지 않습니다.</td>
					</c:if>
					<td><a href="hotelContent.hotel?no=${dto.no}"> ${dto.name}
					</a></td>
					<td><c:set var="cate" value="${dto.category}" /> <c:if
							test="${cate eq 'hotel' }">호텔</c:if> <c:if
							test="${cate eq 'motel' }">모텔</c:if> <c:if
							test="${cate eq 'guesthouse' }">게스트하우스</c:if> <c:if
							test="${cate eq 'pension' }">펜션</c:if></td>
					<td>${dto.regdate}</td>
					<td>${dto.readcount}</td>
					<td>
						<button onclick="location.href='updateHotel.hotel?no=${dto.no}'">수정</button>
						<button onclick="location.href='deleteHotel.hotel?no=${dto.no}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div align="center">
		<form action="searchhotelList.hotel">
			<input type="text" name="search" placeholder="검색어입력"> <input
				type="submit" value="검색">
		</form>
	</div>
	<c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
			[<a href="hotelList.hotel?pageNum=${startPage-1}">이전</a>]		
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="hotelList.hotel?pageNum=${i}">${i}</a>]
		</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="hotelList.hotel?pageNum=${endPage+1}">다음</a>]
		</c:if>
	</c:if>
	<br> <a href="main.admin">관리자 목록으로 가기</a>
</div>
