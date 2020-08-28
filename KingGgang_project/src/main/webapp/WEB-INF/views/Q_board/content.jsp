<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 비로그인 -->
<c:if test="${empty a_id}">
	<c:if test="${empty m_id}">		
		<script type="text/javascript">
			alert("로그인을 해주세요")
			location.href="login.member";
		</script>
	</c:if>	
</c:if>

<div align="center">
	<b>게 시 글 상 세 보 기</b><br><br>
	<table border="1" width="500">
		<tr height="30">
			<th width="20%" bgcolor="yellow">글번호</th>
			<td align="center" width="30%">${Quest.num}</td>
			<th width="20%" bgcolor="yellow">조회수</th>
			<td align="center" width="30%">${Quest.readcount}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">작성자</th>
			<td align="center" width="30%">${Quest.m_id}</td>
			<th width="20%" bgcolor="yellow">작성일</th>
			<td align="center" width="30%">${Quest.reg_date}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">글제목</th>
			<td align="center" colspan="3">
				${Quest.subject}
			</td>
		</tr>
		<tr height="80">
			<th width="20%" bgcolor="yellow">글내용</th>
			<td colspan="3" >
				${Quest.content}
			</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
		<!-- 사용자 -->
		<c:if test="${empty a_id}">
			<c:if test="${Quest.re_step == 0}">
				<input type="button" value="글수정"
				onclick="window.location='Q_update.board?num=${Quest.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='Q_delete.board?num=${Quest.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
		</c:if>
		<!-- 관리자 -->
		<c:if test="${not empty a_id}">
			<c:if test="${Quest.re_step < 1}">
				<input type="button" value="답글쓰기"
				onclick="window.location='Q_write.board?num=${Quest.num}&re_group=${Quest.re_group}&re_step=${Quest.re_step}&re_level=${Quest.re_level}'">
			</c:if>
				<input type="button" value="글수정"
				onclick="window.location='Q_update.board?num=${Quest.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='Q_delete.board?num=${Quest.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
				<input type="button" value="글목록" onclick="window.location='Q_list.board'">
			</td>
		</tr>
	</table>
</div>











