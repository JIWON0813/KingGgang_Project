<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : B4_writeForm.jsp
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지
 -->
<%@ include file="../index_top.jsp" %>
<script type="text/javascript">
	function check(){
		if (f.file_name.value==""){
			alert("사진을 등록하세요!!")
			f.file_name.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력하세요!!")
			f.content.focus()
			return false
		}
		return true
	}
</script>

<div align="center">
	<form name="f" action="comm_writePro.do" method="post" 
						onsubmit="return check()" enctype="multipart/form-data">
		<input type="hidden" name="memberNum" value="${param.memberNum}">
			<header class="major">
				<h3>새 게시물</h3>
			</header>
			<table width="600" align="center">
			<tr>
				<th width="150">사진명</th>
				<td><input type="file" name="file_name"></td>
			</tr>
			<tr>
				<td colspan="2">
				<textarea name="content" placeholder="내용을 입력하세요.." cols="100" rows="5"></textarea></td>
			</tr>
			<tr>
				<th width="150">태그하기</th>
				<td><input type="text" name="tag"></td>
			</tr>
			<tr>
				<th width="150">위치표시하기</th>
				<td><input type="text" name="loc"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">	
					<input type="button" value="뒤로가기" onclick="window.location='index.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../index_bottom.jsp"%>