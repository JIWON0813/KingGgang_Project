<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- login.jsp-->
<%@ include file="../index_top.jsp" %>
<script type="text/javascript">
function searchMember(mode){
	location.href="member_search.do?mode="+mode;
}

	function loginCheck(){
		if (f.id.value==""){
			alert("아이디를 입력해 주세요!!")
			f.id.focus()
			return
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return
		}
		document.f.submit()
	}
</script>
<section id="four" class="wrapper style1 special fade-up">
	<div class="container">
						<header class="major">
							<h2>로그인</h2>
						</header>
		<form name="f" action="loginOk.do" method="post">
			<table width="60%" align="center" height="120">
				<tr>
					<td align="right" width="30%">아이디</td>
					<td width="40%"><c:if test="${value == null}">
							<input type="text" name="id" placeholder="아이디를 입력하세요.">
						</c:if> <c:if test="${value != null }">
							<input type="text" name="id" tabindex="1" value="${value}">
						</c:if></td>
					<td rowspan="2" width="30%" valign="middle"><a
						href="javascript:loginCheck()">로그인 <%-- <img
							src="${pageContext.request.contextPath}/resources/img/login.jpg" width="50" height="50"
							border="0" alt="로그인" tabindex="3"> --%>&nbsp;&nbsp;<br>
					</a>
					</td>
				</tr>
				<tr>
					<td align="right">비밀번호</td>
					<td><input type="password" name="passwd" tabindex="2" placeholder='비밀번호를 입력하세요.'></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<a href="member_input.do">회원가입
					</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:searchMember('search_id')">ID찾기  	
					</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:searchMember('pw')">PW찾기
					</a>
					</td>
				</tr>
			</table>
		</form>
</div>
</section>
<%@ include file="../index_bottom.jsp"%>
		