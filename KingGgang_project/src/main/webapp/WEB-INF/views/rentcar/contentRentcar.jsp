<%@ include file="/WEB-INF/views/top.jsp"%><br><br><br><br>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  
	이	   름 : contentRentcar.jsp
	개  발   자 : 정 우 철
	설	   명 : 회원 렌트카 상세 페이지
	-->
<div align="center">
<form method="post" action="reservation.rentcar">
	<table border="1" width="50%">
		<caption>차량 상세 보기</caption>
		<tr>
			<th width="15%">차량 번호</th>
			<td width="35%" align="center">${rentcar.id}</td>
			<th width="15%">차량 분류</th>
			<td width="35%" align="center">${rentcar.type}</td>
		</tr>
		<tr>
			<th width="15%">상품명</th>
			<td width="35%" align="center">${rentcar.name}</td>
			<th width="15%">제조회사</th>
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
			<td width="85%" colspan="3">
				<textarea name="contents" rows="5" cols="80" readOnly>${rentcar.contents}
				</textarea>
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