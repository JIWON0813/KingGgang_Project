<%@ include file="../top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	function check()
	{
		if (f.writer.value=="")
		{
			alert("이름을 입력하세요!!")
			f.writer.focus()
			return false
		}
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
		if (f.passwd.value=="")
		{
			alert("비밀번호를 입력하세요!!")
			f.passwd.focus()
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
<div class="section layout_padding"></div>
<div align="center" class="container">
	<form name="f" action="update.notice" method="post" onsubmit="return check()">
		<input type="hidden" name="no" value="${notice.no}"/>
		<input type="hidden" name="name" value="${notice.name }">													
		<table class="table-bordered">
			<tr>
				<td align="center" colspan="2"><b>글 수 정</b></td>
			</tr>
			<tr align="center">
				<th width="20%">제 목</th>
				<td align="left"><input type="text" name="subject" size="40" value="${notice.subject}"></td>
			</tr>
			<tr align="center">
				<th width="20%">내 용</th>
				<td align="left"><textarea name="content" rows="10" cols="40">${notice.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='list.notice'">				
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp"%>
