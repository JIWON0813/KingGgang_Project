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
<%@ include file="../boardtop.jsp" %>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<form name="f" action="insertReviewPro.re" method="post" onsubmit="return check()">
		<table class="table">
			<tr bgcolor="#ff880e">
			<c:choose>
				<c:when test="${type==1 }">
					<td align="center" colspan="2"><b>호텔 이용 후기</b>&nbsp;&nbsp;&nbsp;</td>
				</c:when>
				<c:otherwise>
					<td align="center" colspan="2"><b>렌트카 이용 후기</b>&nbsp;&nbsp;&nbsp;</td>
				</c:otherwise>
			</c:choose>
			</tr>
			<tr align="center">
				<th width="20%" bgcolor="#ff880e">제 목</th>
				<td align="left"><input type="text" name="subject" size="60"></td>
			</tr>
			<tr align="center">
				<th bgcolor="#ff880e">내 용</th>
				<td align="left"><textarea name="content" rows="10" cols="60" maxlength="2000"></textarea></td>
			</tr>
			<tr align="center">
				<th bgcolor="#ff880e">만족도</th>
				<td align="left">
				<input type="radio" name="star" value="1"><font color="#ff880e">★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="2"><font color="#ff880e">★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="3"><font color="#ff880e">★★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="4"><font color="#ff880e">★★★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="5" checked><font color="#ff880e">★★★★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기" class="btn btn-outline-primary btn-sm">
					<input type="reset" value="다시작성" class="btn btn-outline-primary btn-sm">
					<input type="button" value="목록보기" onclick="window.location='listReview.re'" class="btn btn-outline-primary btn-sm">
					<input type="hidden" name="type" value="${type }">
					<input type="hidden" name="name" value="${r_name }">
					<input type="hidden" name="filename" value="${filename }">
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="section layout_padding"></div>
<%@ include file="../boardbottom.jsp" %>
