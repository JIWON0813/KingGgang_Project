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
		f.document.submit();
	}
</script>
<c:if test="${empty mbId}">		
		<script type="text/javascript">
			alert("로그인을 해주세요")
			location.href="login.log";
		</script>
</c:if>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<%@ include file="../top.jsp" %>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<form name="f" action="insertReviewPro.re" method="post" onsubmit="return check()">
		<table class="table table-bordered">
			<tr>
			<c:choose>
				<c:when test="${type==1 }">
					<td align="center" colspan="2">호텔 후기</td>
				</c:when>
				<c:otherwise>
					<td align="center" colspan="2">렌트카 후기</td>
				</c:otherwise>
			</c:choose>
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
					<input type="button" value="목록보기" onclick="window.location='listReview.re'">
					<input type="hidden" name="type" value="${type }">
					<input type="hidden" name="t_id" value="${t_id }">
					<input type="hidden" name="name" value="${r_name }">
					<input type="hidden" name="filename" value="${filename }">
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp" %>
















