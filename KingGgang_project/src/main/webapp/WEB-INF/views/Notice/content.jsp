<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div align="center">
	<b>게 시 글 상 세 보 기</b><br><br>
	<table border="1" width="500">
		<tr height="30">
			<th width="20%" bgcolor="yellow">글번호</th>
			<td align="center" width="30%">${notice.no}</td>
			<th width="20%" bgcolor="yellow">조회수</th>
			<td align="center" width="30%">${notice.readcount}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">작성자</th>
			<td align="center" width="30%">m_id</td>
			<th width="20%" bgcolor="yellow">작성일</th>
			<td align="center" width="30%">${notice.reg_date}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">글제목</th>
			<td align="center" colspan="3">
				${notice.subject}
			</td>
		</tr>
		<tr height="80">
			<th width="20%" bgcolor="yellow">글내용</th>
			<td colspan="3" >
				${notice.content}
			</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
			<c:if test="${not empty a_id}">
				<input type="button" value="글수정"
				onclick="window.location='update.notice?no=${notice.no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='delete.notice?no=${notice.no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
				<input type="button" value="글목록" onclick="window.location='list.notice'">
			</td>
		</tr>
	</table>
</div>















