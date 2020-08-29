<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login.jsp-->
<html>
<head>
<title>관리자로그인</title>
<script type="text/javascript">	
	function loginCheck()
	{
		if (f.id.value=="")
		{
			alert("아이디를 입력해 주세요!!")
			f.id.focus()
			return
		}
		if (f.passwd.value=="")
		{
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return
		}
		document.f.submit()
	}
</script>
</head>
<body>
<div align="center">
<br>
<img src="resources/img/bottom.gif" width=570 height="40" border="0" alt="">
<br>
<p>
<form name="f" action="login.admin" method="post" onsubmit="return loginCheck()">
	<table width="60%" align="center" height="120">
		<tr>
			<td align="right" width="30%">
				<img src="resources/img/id01.gif" width="28" height="11" border="0" alt="아이디">&nbsp;&nbsp;
			</td>
			<td width="40%">
				<input type="text" name="a_id" tabindex="2">
			</td>
			<td rowspan="2" width="30%" valign="middle">
				<input type="submit" value="로그인">
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="resources/img/pwd.gif" width="37" height="11" alt="비밀번호">
			</td>
			<td>
				<input type="password" name="a_passwd" tabindex="2">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<a href="insert.admin">회원가입</a>				
			</td>
		</tr>
	</table>
</form>
</div> 
</body>
</html>








