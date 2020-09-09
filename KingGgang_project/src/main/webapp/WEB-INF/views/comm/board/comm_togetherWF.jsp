<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	이	   름 : comm_togetherWF.jsp
	개  발   자 : 최 인 아
	설	   명 : 투게더글쓰기페이지
-->
<%@ include file="/WEB-INF/views/top.jsp"%> 
<div align="center">
	<form name="f" action="comm_togetherWP.do" method="post" onsubmit="return check()">										
		<table width="600">
			<tr bgcolor="pink">
				<td align="center" colspan="2"><font color="pink">글</font></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">작 성 자</th>
				<td><input type="text" name="tname"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">제 목</th>
				<td><input type="text" name="ttitle" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">이메일</th>
				<td><input type="text" name="temail" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="skyblue">내 용</th>
				<td><textarea name="tcontent" rows="10" cols="40"></textarea></td>
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
<%@ include file="/WEB-INF/views/bottom.jsp"%>