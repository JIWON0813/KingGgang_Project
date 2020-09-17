<%@ include file="../top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	td.admin {
		
	}
</style>
<div class="section layout_padding"></div>
<c:if test="${mbId=='admin' }">
<table align="center" width="75%" height="100%">
	<tr>
		<td valign="top" align="left" width="30%" class="admin">
			<ul><a href="memberList.mem">회원 목록</a></ul><br>

			<ul><a href="hotelList.hotel">호텔 목록보기</a></ul><br>
			<ul><a href="listRentcar.admin">렌트카 목록</a></ul><br>
			<ul><a href="listInsu.admin">렌트카_보험 목록</a></ul><br>
			<ul><a href="payList.admin">결제 목록으로 가기</a></ul><br>
			<ul><a href="commadmin.comm">돌하르방</a></ul>

		</td>

		<td>
</c:if>
	
	
	<!-- </tr>
</table> -->
<!-- 
	이	   름 : adminMain.jsp
	개  발   자 : 김 지 원
	설	   명 : 관리자모드 메인 페이지
 -->
<c:if test="${mbId=='admin' }">
<a href="insertHotel.admin">호텔 등록하기</a>
<br>
<a href="hotelList.hotel">호텔 목록보기</a>
<br>
<a href="main.mem">회원관리페이지로가기</a>
<br>
</c:if>
<c:if test="${mbId!='admin' }">
<script>
	alert("관리자만 접근 가능합니다.");
	history.back();
</script>
</c:if>
<%@ include file="../bottom.jsp"%>

