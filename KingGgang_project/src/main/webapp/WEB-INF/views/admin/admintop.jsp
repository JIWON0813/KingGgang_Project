<%@ include file="../top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	td.admin {
		
	}
</style>
<div class="section layout_padding"></div>
<%-- <c:if test="${mbId=='admin' }"> --%>
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