<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" /> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp" %>

<script type="text/javascript">
		function check(mode){
			if (!f.name.value){
				alert("이름을 입력해 주세요!!")
				f.name.focus();
				return;
			}
			if (!f.email.value){
				alert("이메일을 입력해 주세요!!");
				f.email.focus();
				return;
			}
			if (mode=="pw" && f.id.value==""){
				alert("아이디를 입력해 주세요!!");
				f.id.focus();
				return;
			}
			 document.f.submit(); 
		}
	</script>
	
<section id="four" class="wrapper style1 special fade-up">
	<div class="container">
	<form name="f" action="member_search_ok.log" method="post" onsubmit="return check('${mode}')">
		<header class="major">
			<c:if test="${requestScope.mode == 'search_id'}">
				<h2>아이디찾기</h2>
				<input type="hidden" name="mode" value="${param.mode }">
			</c:if>
			<c:if test="${requestScope.mode == 'pw'}">
				<h2>비밀번호찾기</h2>
				<input type="hidden" name="mode" value="${param.mode }">
			</c:if>
		</header>
		
			<table width="60%" align="center" height="120">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email"></td>
				</tr>
				<c:if test="${requestScope.mode == 'pw'}">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id"></td>
					</tr>
				</c:if>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="조회"> 
					<input type="button" value="취소" onclick="window.location='login.log'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<%@ include file="../bottom.jsp"%>
