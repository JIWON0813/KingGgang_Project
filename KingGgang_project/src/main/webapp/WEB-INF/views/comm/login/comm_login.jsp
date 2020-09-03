<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- login.jsp-->
<%@ include file="../index_top.jsp" %>
<script type="text/javascript">
	function comm_loginCheck(){
		if (f.comm_nickname.value==""){
			alert("닉네임을 입력해 주세요!!")
			f.comm_nickname.focus()
			return
		}
		document.f.submit();
		
	}
</script>
<div>
	<h2>로그인</h2>
	<form name="f" action="comm_loginOk.do" method="post">
	<input type="hidden" name="memberNum" value="${memberNum }"/>
	<%-- <input type="hidden" name="comm_memberNum" value="${comm_memberNum}"> --%>
		<table width="60%" align="center" height="120">
			<tr>
			
				<th>닉네임</th>
				<td><input type="text" name="comm_nickname" placeholder="닉네임을 입력하세요."> </td>
			</tr>		
			<tr>
				<td><input type="button"value="로그인" onclick="javascript:comm_loginCheck()"></td>
				
			</tr>
		</table>
	</form>
</div>
<%@ include file="../index_bottom.jsp"%>
