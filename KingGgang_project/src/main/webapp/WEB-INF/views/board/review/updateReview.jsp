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
	<form name="f" action="updateReviewPro.re" method="post" onsubmit="return check()">
		<table class="table">
			<tr>
			<c:choose>
				<c:when test="${getReview.type==1 }">
					<td align="center" colspan="2" bgcolor="#ff880e"><b>호텔 후기 수정</b></td>
				</c:when>
				<c:otherwise>
					<td align="center" colspan="2" bgcolor="#ff880e"><b>렌트카 후기 수정</b></td>
				</c:otherwise>
			</c:choose>
			</tr>
			<tr align="center">
				<th width="20%" bgcolor="#ff880e">제 목</th>
				<td align="left"><input type="text" name="subject" size="60" value="${getReview.subject }"></td>
			</tr>
			<tr align="center">
				<th bgcolor="#ff880e">내 용</th>
				<td align="left"><textarea name="content" rows="10" cols="60" maxlength="2000">${getReview.content }</textarea></td>
			</tr>
			<tr align="center">
				<th bgcolor="#ff880e">만족도</th>
				<td align="left">
				<input type="radio" name="star" value="1" <c:if test="${getReview.star==1 }">checked</c:if>><font color="#ff880e">★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="2" <c:if test="${getReview.star==2 }">checked</c:if>><font color="#ff880e">★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="3" <c:if test="${getReview.star==3 }">checked</c:if>><font color="#ff880e">★★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="4" <c:if test="${getReview.star==4 }">checked</c:if>><font color="#ff880e">★★★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="star" value="5" <c:if test="${getReview.star==5 }">checked</c:if>><font color="#ff880e">★★★★★</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기" class="btn btn-outline-primary btn-sm">
					<input type="reset" value="다시작성" class="btn btn-outline-primary btn-sm">
					<input type="button" value="목록보기" onclick="window.location='listReview.re'" class="btn btn-outline-primary btn-sm">
					<input type="button" value="뒤로가기" onclick="javascript:history.back()" class="btn btn-outline-primary btn-sm">		
					<input type="hidden" name="num" value="${getReview.num }">
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="section layout_padding"></div>
<%@ include file="../boardbottom.jsp" %>