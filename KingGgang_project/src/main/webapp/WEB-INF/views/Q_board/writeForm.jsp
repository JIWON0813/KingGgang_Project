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
	<br>
	<form name="f" action="Q_write.board" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="${param.num}"/>	
		<input type="hidden" name="re_step" value="${param.re_step}"/>
		<input type="hidden" name="re_level" value="${param.re_level}"/>
		<input type="hidden" name="re_group" value="${param.re_group}"/>
		<input type="hidden" name="m_id" value="${mbId}"/>
		<table class="table table-bordered">
			<tr>
				<th width="20%">제 목</th>
				<td>
				<select name="subject">
					<option>호텔 상품 문의</option>
					<option>렌트카 상품 문의</option>
					<option>커뮤니티 관련 문의</option>
					<option>기타 문의</option>
				</select>
				<!-- <input type="text" name="subject" size="40"> -->
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<c:if test="${mbId == null }">
				<td><input type="text" name="name" size="40"></td>
				</c:if>
				<c:if test="${mbId != null }">
				<td><input type="text" name="name" size="40" value="${name}"></td>
				</c:if>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" size="40"></td>
			</tr>
			<tr>
				<th width="20%">내 용</th>
				<td><textarea name="content" rows="10" cols="40"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" size="40">
				<input type="radio" name="closed" value="1" checked>공개
				<input type="radio" name="closed" value="2">비공개
				</td>
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

