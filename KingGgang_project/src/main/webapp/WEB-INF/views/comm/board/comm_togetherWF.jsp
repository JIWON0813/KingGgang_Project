<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div align="center">
	<form name="f" action="comm_togetherWP.jsp" method="post" onsubmit="return check()">											
		<table width="70%">
			<tr bgcolor="pink">
				<td align="center" colspan="2"><font color="pink">글</font></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">작 성 자</th>
				<td><input type="text" name="writer" class="box"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">제 목</th>
				<td><input type="text" name="subject" class="box" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">Email</th>
				<td><input type="text" name="email" class="box" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">내 용</th>
				<td><textarea name="content" rows="10" cols="40" class="box"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="pink">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='comm_togetherList.do'">				
				</td>
			</tr>
		</table>
	</form>
</div>