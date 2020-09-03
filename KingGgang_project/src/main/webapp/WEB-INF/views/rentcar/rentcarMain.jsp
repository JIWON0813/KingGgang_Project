<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!--  
	이	   름 : rentcarMain.jsp
	개  발   자 : 정 우 철
	설	   명 : 렌트카 메인 페이지
	-->
	
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function () {
$("#receiptday").datepicker();
$("#returnday").datepicker();
});
</script>	
<form method="post" action="main.rentcar?mode=date">
	<input type="text" name="receiptday" id="receiptday" placeholder="예약일"> ~ <input type="text" name="returnday" id="returnday" placeholder="반납일"> 
	<input type="submit" value="조회">
	<br>
	<a	href="main.rentcar">
	전체보기|
	</a>
	<a href="main.rentcar?mode=type&obj=경차">
	경차|
	</a>
	<a href="main.rentcar?mode=type&obj=세단">
	세단|
	</a>
	<a href="main.rentcar?mode=type&obj=SUV">
	SUV|
	</a>
	<a href="main.rentcar?mode=fuel&obj=휘발유">
	휘발유|
	</a>
	<a href="main.rentcar?mode=fuel&obj=경유">
	경유|
	</a>
	<a href="main.rentcar?mode=fuel&obj=LPG">
	LPG|
	</a>
	<a href="main.rentcar?mode=fuel&obj=하이브리드">
	하이브리드|
	</a>
	<a href="main.rentcar?mode=lowPrice">낮은가격순</a>		
<br>
<br>
<table>
<tr>
		<c:forEach var="dto" items="${rentcar}">
		<td>
			<a href="content.rentcar?id=${dto.id}">
			<img src="http://localhost:8080/img/${dto.filename}" width="100px" height="100px">
			</a>
			<br>
			${dto.name}
			<br>
			${dto.price}원
		</td>
		<td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
		</c:forEach>
<tr>
</table>
</form>