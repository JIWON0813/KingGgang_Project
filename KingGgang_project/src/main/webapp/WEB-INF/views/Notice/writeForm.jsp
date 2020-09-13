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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<%@ include file="../top.jsp" %>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<form name="f" action="write.notice" method="post" onsubmit="return check()">
		<table class="table table-bordered">
			<tr>
				<td align="center" colspan="2">글 쓰 기</td>
			</tr>
			<tr align="center">
				<th width="20%">제 목</th>
				<td align="left"><input type="text" name="subject" size="60"></td>
			</tr>
			<tr align="center">
				<th>내 용</th>
				<td align="left"><textarea name="content" rows="10" cols="60"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='list.notice'">				
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp" %>
















