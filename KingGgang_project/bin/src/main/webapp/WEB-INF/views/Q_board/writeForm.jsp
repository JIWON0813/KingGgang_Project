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
<c:if test="${empty a_id}">
	<c:if test="${empty m_id}">		
		<script type="text/javascript">
			alert("로그인을 해주세요")
			location.href="login.member";
		</script>
	</c:if>	
</c:if>

<div align="center">
	${num}<br>
	<form name="f" action="Q_write.board" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="${param.num}"/>	
		<input type="hidden" name="re_step" value="${param.re_step}"/>
		<input type="hidden" name="re_level" value="${param.re_level}"/>
		<input type="hidden" name="re_group" value="${param.re_group}"/>
	<c:if test="${empty a_id}">	
		<input type="hidden" name="m_id" value="${m_id}"/>
	</c:if>
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">글 쓰 기</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">제 목</th>
				<td><input type="text" name="subject" class="box" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">내 용</th>
				<td><textarea name="content" rows="10" cols="40" class="box"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='Q_list.board'">				
				</td>
			</tr>
		</table>
	</form>
</div>











