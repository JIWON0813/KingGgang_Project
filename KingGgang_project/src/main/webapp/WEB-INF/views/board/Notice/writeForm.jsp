<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    

<script type="text/javascript">
	function check()
	{
		if (f.subject.value=="")
		{
			alert("제목을 입력하세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value=="")
		{
			alert("내용을 입력하세요!!")
			f.content.focus()
			return false
		}
		return true
	}
</script>
<c:if test="${empty mbId}">		
		<script type="text/javascript">
			alert("관리자만 사용가능합니다.")
			location.href="login.log";
		</script>
</c:if>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<%@ include file="../boardtop.jsp" %>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<form name="f" action="write.notice" method="post" onsubmit="return check()">
		<table class="table">
			<tr bgcolor="#ff880e">
				<td align="center" colspan="2"><b>공 지 사 항 등 록</b></td>
			</tr>
			<tr align="center">
				<th width="20%" bgcolor="#ff880e">제 목</th>
				<td align="left"><input type="text" name="subject" size="60"></td>
			</tr>
			<tr align="center">
				<th bgcolor="#ff880e">내 용</th>
				<td align="left"><textarea name="content" rows="10" cols="60"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기" class="btn btn-outline-primary btn-sm">
					<input type="reset" value="다시작성" class="btn btn-outline-primary btn-sm">
					<input type="button" value="목록보기" onclick="window.location='list.notice'" class="btn btn-outline-primary btn-sm">
					<input type="hidden" name="name" value="${mbId}">				
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="section layout_padding"></div>
<%@ include file="../boardbottom.jsp" %>
















