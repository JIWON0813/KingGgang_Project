<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<div align="center">
	<form name="f" action="insert.admin" method="post">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">관리자 등록</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">아이디</th>
				<td><input type="text" name="a_id" class="box" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">비밀번호</th>
				<td><textarea name="a_passwd" rows="10" cols="40" class="box"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="등록">
			
				</td>
			</tr>
		</table>
	</form>
</div>
