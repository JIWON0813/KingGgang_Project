<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
function check()
{
	if (f.subject.value=="")
	{
		alert("제목을 입력하세요!!")
		f.subject.focus()
		return false
	}
	if (f.name.value=="")
	{
		alert("이름을 입력하세요!!")
		f.name.focus()
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<%@ include file="../boardtop.jsp"%>
<div class="section layout_padding"></div>
<div align="center" class="container">
	<br>
	<form name="f" action="Q_updatepro.board" method="post"
		onsubmit="return check()">
		<input type="hidden" name="num" value="${Quest.num }">
		<table class="table">
			<tr bgcolor="#ff880e">
				<td align="center" colspan="2"><b>문 의 사 항 수 정</b></td>
			</tr>
			<tr>
				<th align="center" width="20%" bgcolor="#ff880e">제 목</th>
				<td>
					<input type="text" name="subject" size="40" value="${Quest.subject }">
				</td>
			</tr>
			<tr>
				<th align="center" bgcolor="#ff880e">작성자</th>
				<td><input type="text" name="name" size="40"
					value="${Quest.name }"></td>
			</tr>
			<tr>
				<th align="center"bgcolor="#ff880e">이메일</th>
				<td><input type="text" name="email" size="40"
					value="${Quest.email }"></td>
			</tr>
			<tr>
				<th align="center" width="20%" bgcolor="#ff880e">내 용</th>
				<td><textarea name="content" rows="10" cols="40">${Quest.content }</textarea></td>
			</tr>
			<tr>
				<th align="center" bgcolor="#ff880e">비밀번호</th>
				<td><input type="password" name="passwd" size="40"
					value="${Quest.passwd }"> <input type="radio" name="closed"
					value="1" checked>공개 <input type="radio" name="closed"
					value="2">비공개</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정하기" class="btn btn-outline-primary"> 
				<input type="reset" value="다시작성" class="btn btn-outline-primary"> 
				<input type="button" value="목록보기" onclick="window.location='Q_list.board'" class="btn btn-outline-primary">
				<input type="button" value="뒤로가기" onclick="javascript:history.back()" class="btn btn-outline-primary">		
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../boardbottom.jsp"%>
