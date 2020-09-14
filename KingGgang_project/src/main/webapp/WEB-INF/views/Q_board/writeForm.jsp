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
<!-- 사용자 -->
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
	${num}<br>
	<form name="f" action="Q_write.board" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="${param.num}"/>	
		<input type="hidden" name="re_step" value="${param.re_step}"/>
		<input type="hidden" name="re_level" value="${param.re_level}"/>
		<input type="hidden" name="re_group" value="${param.re_group}"/>
		<input type="hidden" name="m_id" value="${mbId}"/>
		<table class="table table-bordered">
			<tr>
				<th align="center" colspan="2">문 의 하 기</td>
			</tr>
			<tr>
				<th width="20%">제 목</th>
				<td><input type="text" name="subject" size="40"></td>
			</tr>
			<tr>
				<th width="20%">내 용</th>
				<td><textarea name="content" rows="10" cols="40"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='Q_list.board'">				
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp" %>










