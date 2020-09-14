<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 사용자 -->
<c:if test="${empty a_id}">
	<c:if test="${m_id != Quest.m_id}">	
		<script type="text/javascript">
		alert("해당 게시물은 삭제할 수 없습니다.")
		location.href="${Q_list.board}"
	</script>	
	</c:if>		
	<c:if test="${m_id == Quest.m_id}">	
		<h3>정말로 삭제하시겠습니까?</h3>
		<form name="f" action="Q_delete.board" method="post">
			<input type="hidden" name="num" value="${param.num}"/>
			<table border="1">
				<tr>
					<td align="center" bgcolor="yellow">
						<input type="submit" value="예">
						<input type="button" value="아니요" onclick="window.location='board_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</c:if>	
</c:if>

<!-- 관리자 -->
<c:if test="${not empty a_id}">
	<h3>정말로 삭제하시겠습니까?</h3>
	<form name="f" action="Q_delete.board" method="post">
		<input type="hidden" name="num" value="${param.num}"/>
		<table border="1">
			<tr>
				<td align="center" bgcolor="yellow">
					<input type="submit" value="예">
					<input type="button" value="아니요" onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</form>
</c:if>	







