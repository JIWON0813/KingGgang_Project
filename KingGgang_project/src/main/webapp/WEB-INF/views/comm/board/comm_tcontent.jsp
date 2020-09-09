<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : comm_tcontent.jsp
	개  발   자 : 최 인 아
	설	   명 : 투게더content
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/WEB-INF/views/top.jsp"%>
<div align="center">
	<table width="800">
		<tr align="center" height="30">
			<th bgcolor="skyblue">작 성 자</th>
			<td width="30%">${getTogether.tname}</td>
			<th bgcolor="skyblue">작 성 일</th>
			<td width="30%">${getTogether.tregdate}</td>
		</tr>
		<tr height="30">
			<th bgcolor="skyblue">제 목</th>
			<td width="30%">${getTogether.ttitle}</td>
			<th bgcolor="skyblue">조 회 수</th>
			<td width="30%">${getTogether.treadcount}</td>
		</tr>
		<tr height="30">
			<th bgcolor="skyblue">이 메 일</th>
			<td width="30%">${getTogether.temail}</td>
		</tr>
		<tr height="80">
			<td>${getTogether.tcontent}</td>
		</tr>
	
		<tr>
			<td align="center" colspan="4">
				<input type="button" value="글수정"
				onclick="window.location='comm_tupdateForm.do?togetherNum=${getTogether.togetherNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='comm_tdeletePro.do?togetherNum=${getTogether.togetherNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='comm_togetherList.do'">
			</td>
		</tr>
	</table>
</div>

<%@ include file="/WEB-INF/views/bottom.jsp"%>