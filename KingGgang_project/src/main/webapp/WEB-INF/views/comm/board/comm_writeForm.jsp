<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : B4_writeForm.jsp
	개  발   자 : 최 인 아
	설	   명 : 메인 페이지
 -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="section layout_padding">
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

<div class="section layout_padding" align="center">
	<form name="f" action="comm_writePro.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<header>
			<h3>새 게시물</h3>
		</header>
		<table width="600">
			<tr>
				<th width="150">사진명</th>
				<td><input type="file" name="file_name"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" placeholder="내용을 입력하세요.." cols="100" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<th width="150">태그하기</th>
				<td><input type="text" name="tag"></td>
			</tr>
			<tr>
				<th width="150">공개범위</th>
				<td><select name="look">
   					<option value="all" selected>전체공개</option>
    				<option value="member">회원공개</option>
    				<option value="alone">비공개</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">	
					<input type="button" value="뒤로가기" onclick="window.location='comm_myPage.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>